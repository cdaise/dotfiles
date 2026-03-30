-- statusline
local function git_branch()
	local branch = vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " branch --show-current 2>nul")
	branch = branch:gsub("\n", "")
	if branch == "" then return "" end
	return " " .. branch .. " "
end

local branch_cache = ""
local branch_timer = vim.loop.new_timer()
branch_timer:start(0, 3000, vim.schedule_wrap(function()
	branch_cache = git_branch()
end))

local function statusline()
	local mode_map = {
		["n"]  = "NOR",
		["i"]  = "INS",
		["v"]  = "VIS",
		["V"]  = "V-L",
		["\22"] = "V-B",
		["c"]  = "CMD",
		["R"]  = "REP",
		["t"]  = "TER",
	}

	local mode = mode_map[vim.fn.mode()] or vim.fn.mode()
	local file = vim.fn.expand("%:t")
	if file == "" then file = "[No Name]" end
	local modified = vim.bo.modified and " [+]" or ""
	local readonly = vim.bo.readonly and " [-]" or ""
	local filetype = vim.bo.filetype ~= "" and vim.bo.filetype or "none"
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	local total = vim.fn.line("$")

	return table.concat({
		"%#StlMode# " .. mode .. " ",
		"%#StlBranch#" .. branch_cache,
		"%#StlFile# " .. file .. modified .. readonly .. " ",
		"%=",
		"%#StlFt# " .. filetype .. " ",
		"%#StlPos# " .. line .. ":" .. col .. " / " .. total .. " ",
	})
end

_G.Statusline = statusline
vim.o.statusline = "%!v:lua.Statusline()"

-- statusline highlights (Leonardo palette)
local stl_hl = {
	StlMode   = { fg = "#17130e", bg = "#d4a24e", bold = true },
	StlBranch = { fg = "#8a9a6b", bg = "#1e1914" },
	StlFile   = { fg = "#ddd5c4", bg = "#1e1914" },
	StlFt     = { fg = "#4a4339", bg = "#0e0b07" },
	StlPos    = { fg = "#ddd5c4", bg = "#1e1914" },
}

for group, opts in pairs(stl_hl) do
	vim.api.nvim_set_hl(0, group, opts)
end
