-- ref https://simondalvai.org/blog/godot-neovim/ with https://mb-izzo.github.io/nvim-godot-solution/ modifcations
local godot_host_addr = "127.0.0.1:55432"

local paths_to_check = { "/", "/../" }
local is_godot_project = false
local godot_project_path = ""
local cwd = vim.fn.getcwd()

for _, value in ipairs(paths_to_check) do
  if vim.uv.fs_stat(cwd .. value .. "project.godot") then
    is_godot_project = true
    godot_project_path = cwd .. value
    break
  end
end

local function is_server_running(addr)
  for _, server in ipairs(vim.fn.serverlist()) do
    if server == addr then
      return true
    end
  end
  return false
end

if is_godot_project and not is_server_running(godot_host_addr) then
  vim.fn.serverstart(godot_host_addr)
end

-- ----------------------
-- Godot debug config
-- ----------------------
-- write breakpoint to new line
vim.api.nvim_create_user_command('GodotBreakpoint', function()
    vim.cmd('normal! obreakpoint #gdbp' )
    vim.cmd('write' )
end, {})
vim.keymap.set('n', '<leader>dm', ':GodotBreakpoint<CR>')

-- delete all breakpoints in current file
vim.api.nvim_create_user_command('GodotDeleteBreakpoints', function()
    vim.cmd('g/breakpoint #gdbp/d')
end, {})
vim.keymap.set('n', '<leader>dd', ':GodotDeleteBreakpoints<CR>')

-- search all breakpoints in project
vim.api.nvim_create_user_command('GodotFindBreakpoints', function()
    vim.cmd(':grep "breakpoint #gdbp" | copen')
end, {})
vim.keymap.set('n', '<leader>df', ':GodotFindBreakpoints<CR>')

-- ----------------------
-- GDScript format on save
-- ----------------------
if is_godot_project then
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.gd",
    callback = function()
      local filepath = vim.fn.expand("%:p")
      -- format in place, --safe prevents destructive changes
      vim.fn.system({ "gdscript-formatter", 
                      "--safe", "--use-spaces", "--reorder-code", filepath })
      if vim.v.shell_error == 0 then
        -- reload the buffer to pick up in-place changes
        vim.cmd("silent edit!")
      end
    end,
  })
end
