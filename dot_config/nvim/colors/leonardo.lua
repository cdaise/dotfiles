-- Leonardo colorscheme

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "leonardo"

local p = {
	bg        = "#17130e",
	fg        = "#ddd5c4",
	cursor    = "#f2e8d4",
	black     = "#0e0b07",
	red       = "#c25a4a",
	green     = "#8a9a6b",
	yellow    = "#d4a24e",
	blue      = "#7b8fa3",
	magenta   = "#b07a95",
	cyan      = "#7a9e8e",
	white     = "#c8c0b2",
	br_black  = "#4a4339",
	br_red    = "#e07a6a",
	br_green  = "#a8b88a",
	br_yellow = "#e8be6e",
	br_blue   = "#9bb0c4",
	br_mag    = "#cc9ab4",
	br_cyan   = "#9abcab",
	br_white  = "#f2e8d4",
	-- derived
	cursorline = "#1e1914",
	visual     = "#33291e",
	border     = "#2a2318",
	diff_add   = "#1a2218",
	diff_change = "#1e1a14",
	diff_delete = "#221816",
	diff_text  = "#2a2218",
}

local hl = function(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

hl("Normal",         { fg = p.fg, bg = p.bg })
hl("NormalNC",       { fg = p.fg, bg = p.bg })
hl("NormalFloat",    { fg = p.fg, bg = p.black })
hl("FloatBorder",    { fg = p.br_black, bg = p.black })
hl("FloatTitle",     { fg = p.yellow, bg = p.black, bold = true })
hl("Cursor",         { fg = p.bg, bg = p.cursor })
hl("lCursor",        { fg = p.bg, bg = p.cursor })
hl("CursorIM",       { fg = p.bg, bg = p.cursor })
hl("CursorLine",     { bg = p.cursorline })
hl("CursorColumn",   { bg = p.cursorline })
hl("CursorLineNr",   { fg = p.yellow, bold = true })
hl("LineNr",         { fg = p.br_black })
hl("SignColumn",     { bg = p.bg })
hl("FoldColumn",     { fg = p.br_black, bg = p.bg })
hl("Folded",         { fg = p.br_black, bg = "#1a1510" })
hl("Visual",         { bg = p.visual })
hl("VisualNOS",      { bg = p.visual })
hl("Search",         { fg = p.bg, bg = p.yellow })
hl("IncSearch",      { fg = p.bg, bg = p.br_yellow })
hl("CurSearch",      { fg = p.bg, bg = p.br_yellow, bold = true })
hl("Substitute",     { fg = p.bg, bg = p.red })
hl("MatchParen",     { fg = p.br_yellow, bold = true, underline = true })
hl("NonText",        { fg = p.border })
hl("SpecialKey",     { fg = p.border })
hl("Whitespace",     { fg = p.border })
hl("EndOfBuffer",    { fg = p.border })
hl("VertSplit",      { fg = p.border })
hl("WinSeparator",   { fg = p.border })
hl("StatusLine",     { fg = p.fg, bg = p.black })
hl("StatusLineNC",   { fg = p.br_black, bg = p.black })
hl("TabLine",        { fg = p.br_black, bg = p.black })
hl("TabLineSel",     { fg = p.fg, bg = p.bg })
hl("TabLineFill",    { bg = p.black })
hl("WinBar",         { fg = p.fg, bg = p.bg, bold = true })
hl("WinBarNC",       { fg = p.br_black, bg = p.bg })
hl("Pmenu",          { fg = p.fg, bg = p.black })
hl("PmenuSel",       { fg = p.bg, bg = p.blue })
hl("PmenuSbar",      { bg = p.border })
hl("PmenuThumb",     { bg = p.br_black })
hl("WildMenu",       { fg = p.bg, bg = p.yellow })
hl("Directory",      { fg = p.blue })
hl("Title",          { fg = p.yellow, bold = true })
hl("Question",       { fg = p.green })
hl("MoreMsg",        { fg = p.green })
hl("ModeMsg",        { fg = p.fg, bold = true })
hl("WarningMsg",     { fg = p.yellow })
hl("ErrorMsg",       { fg = p.red, bold = true })
hl("ColorColumn",    { bg = p.cursorline })
hl("Conceal",        { fg = p.br_black })
hl("SpellBad",       { sp = p.red, undercurl = true })
hl("SpellCap",       { sp = p.yellow, undercurl = true })
hl("SpellLocal",     { sp = p.cyan, undercurl = true })
hl("SpellRare",      { sp = p.magenta, undercurl = true })

hl("Comment",        { fg = p.br_black, italic = true })
hl("Constant",       { fg = p.br_yellow })
hl("String",         { fg = p.green })
hl("Character",      { fg = p.green })
hl("Number",         { fg = p.br_mag })
hl("Boolean",        { fg = p.br_yellow })
hl("Float",          { fg = p.br_mag })
hl("Identifier",     { fg = p.fg })
hl("Function",       { fg = p.blue })
hl("Statement",      { fg = p.red })
hl("Conditional",    { fg = p.magenta })
hl("Repeat",         { fg = p.magenta })
hl("Label",          { fg = p.cyan })
hl("Operator",       { fg = p.fg })
hl("Keyword",        { fg = p.magenta })
hl("Exception",      { fg = p.red })
hl("PreProc",        { fg = p.cyan })
hl("Include",        { fg = p.cyan })
hl("Define",         { fg = p.magenta })
hl("Macro",          { fg = p.magenta })
hl("PreCondit",      { fg = p.cyan })
hl("Type",           { fg = p.yellow })
hl("StorageClass",   { fg = p.yellow })
hl("Structure",      { fg = p.yellow })
hl("Typedef",        { fg = p.yellow })
hl("Special",        { fg = p.magenta })
hl("SpecialChar",    { fg = p.br_mag })
hl("Tag",            { fg = p.red })
hl("Delimiter",      { fg = p.white })
hl("SpecialComment", { fg = p.br_black, italic = true })
hl("Debug",          { fg = p.red })
hl("Underlined",     { fg = p.blue, underline = true })
hl("Ignore",         { fg = p.br_black })
hl("Error",          { fg = p.red, bold = true })
hl("Todo",           { fg = p.bg, bg = p.yellow, bold = true })
hl("Added",          { fg = p.green })
hl("Changed",        { fg = p.yellow })
hl("Removed",        { fg = p.red })

hl("DiagnosticError",          { fg = p.red })
hl("DiagnosticWarn",           { fg = p.yellow })
hl("DiagnosticInfo",           { fg = p.blue })
hl("DiagnosticHint",           { fg = p.cyan })
hl("DiagnosticOk",             { fg = p.green })
hl("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
hl("DiagnosticUnderlineWarn",  { sp = p.yellow, undercurl = true })
hl("DiagnosticUnderlineInfo",  { sp = p.blue, undercurl = true })
hl("DiagnosticUnderlineHint",  { sp = p.cyan, undercurl = true })
hl("DiagnosticVirtualTextError", { fg = p.red, bg = "#221210" })
hl("DiagnosticVirtualTextWarn",  { fg = p.yellow, bg = "#1e1810" })
hl("DiagnosticVirtualTextInfo",  { fg = p.blue, bg = "#141820" })
hl("DiagnosticVirtualTextHint",  { fg = p.cyan, bg = "#141e1a" })

hl("DiffAdd",        { bg = p.diff_add })
hl("DiffChange",     { bg = p.diff_change })
hl("DiffDelete",     { fg = p.red, bg = p.diff_delete })
hl("DiffText",       { bg = p.diff_text })

hl("@variable",            { fg = p.fg })
hl("@variable.builtin",    { fg = p.red, italic = true })
hl("@variable.parameter",  { fg = p.br_cyan })
hl("@variable.member",     { fg = p.cyan })
hl("@constant",            { fg = p.br_yellow })
hl("@constant.builtin",    { fg = p.br_yellow, italic = true })
hl("@module",              { fg = p.br_blue })
hl("@string",              { fg = p.green })
hl("@string.escape",       { fg = p.br_green })
hl("@string.regex",        { fg = p.br_green })
hl("@character",           { fg = p.green })
hl("@number",              { fg = p.br_mag })
hl("@boolean",             { fg = p.br_yellow })
hl("@float",               { fg = p.br_mag })
hl("@function",            { fg = p.blue })
hl("@function.builtin",    { fg = p.br_blue })
hl("@function.call",       { fg = p.blue })
hl("@function.method",     { fg = p.blue })
hl("@constructor",         { fg = p.yellow })
hl("@keyword",             { fg = p.magenta })
hl("@keyword.function",    { fg = p.magenta })
hl("@keyword.return",      { fg = p.magenta })
hl("@keyword.operator",    { fg = p.fg })
hl("@operator",            { fg = p.fg })
hl("@punctuation",         { fg = p.white })
hl("@punctuation.bracket",  { fg = p.white })
hl("@punctuation.delimiter",{ fg = p.white })
hl("@punctuation.special", { fg = p.magenta })
hl("@type",                { fg = p.yellow })
hl("@type.builtin",        { fg = p.yellow, italic = true })
hl("@type.qualifier",      { fg = p.magenta })
hl("@tag",                 { fg = p.red })
hl("@tag.attribute",       { fg = p.yellow })
hl("@tag.delimiter",       { fg = p.white })
hl("@property",            { fg = p.cyan })
hl("@comment",             { fg = p.br_black, italic = true })
hl("@comment.todo",        { fg = p.bg, bg = p.yellow, bold = true })
hl("@comment.error",       { fg = p.bg, bg = p.red, bold = true })
hl("@comment.warning",     { fg = p.bg, bg = p.yellow })
hl("@comment.note",        { fg = p.bg, bg = p.blue })
hl("@markup.heading",      { fg = p.yellow, bold = true })
hl("@markup.strong",       { bold = true })
hl("@markup.italic",       { italic = true })
hl("@markup.link",         { fg = p.blue, underline = true })
hl("@markup.link.url",     { fg = p.br_blue, underline = true })
hl("@markup.raw",          { fg = p.br_green })

hl("@lsp.type.function",   { fg = p.blue })
hl("@lsp.type.method",     { fg = p.blue })
hl("@lsp.type.parameter",  { fg = p.br_cyan })
hl("@lsp.type.variable",   { fg = p.fg })
hl("@lsp.type.property",   { fg = p.cyan })
hl("@lsp.type.namespace",  { fg = p.br_blue })
hl("@lsp.type.type",       { fg = p.yellow })
hl("@lsp.type.class",      { fg = p.yellow })
hl("@lsp.type.enum",       { fg = p.yellow })
hl("@lsp.type.interface",  { fg = p.br_yellow })
hl("@lsp.type.struct",     { fg = p.yellow })
hl("@lsp.type.decorator",  { fg = p.magenta })
hl("@lsp.mod.deprecated",  { strikethrough = true })

hl("GitSignsAdd",          { fg = p.green })
hl("GitSignsChange",       { fg = p.yellow })
hl("GitSignsDelete",       { fg = p.red })

hl("TelescopeNormal",      { fg = p.fg, bg = p.black })
hl("TelescopeBorder",      { fg = p.br_black, bg = p.black })
hl("TelescopePromptNormal", { fg = p.fg, bg = p.cursorline })
hl("TelescopePromptBorder", { fg = p.br_black, bg = p.cursorline })
hl("TelescopePromptTitle",  { fg = p.yellow, bold = true })
hl("TelescopeResultsTitle", { fg = p.br_black })
hl("TelescopePreviewTitle", { fg = p.green })
hl("TelescopeSelection",    { bg = p.cursorline })
hl("TelescopeMatching",     { fg = p.yellow, bold = true })

hl("IblIndent",            { fg = p.border })
hl("IblScope",             { fg = p.br_black })

vim.g.terminal_color_0  = p.black
vim.g.terminal_color_1  = p.red
vim.g.terminal_color_2  = p.green
vim.g.terminal_color_3  = p.yellow
vim.g.terminal_color_4  = p.blue
vim.g.terminal_color_5  = p.magenta
vim.g.terminal_color_6  = p.cyan
vim.g.terminal_color_7  = p.white
vim.g.terminal_color_8  = p.br_black
vim.g.terminal_color_9  = p.br_red
vim.g.terminal_color_10 = p.br_green
vim.g.terminal_color_11 = p.br_yellow
vim.g.terminal_color_12 = p.br_blue
vim.g.terminal_color_13 = p.br_mag
vim.g.terminal_color_14 = p.br_cyan
vim.g.terminal_color_15 = p.br_white

-- statusline
hl("StlMode",   { fg = p.bg, bg = p.yellow, bold = true })
hl("StlBranch", { fg = p.green, bg = p.border })
hl("StlFile",   { fg = p.fg, bg = p.border })
hl("StlFt",     { fg = p.blue, bg = p.black })
hl("StlPos",    { fg = p.yellow, bg = p.black, bold = true })
