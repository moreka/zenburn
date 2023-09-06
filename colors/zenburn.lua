if vim.g.colors_name then
	vim.cmd("hi clear")
end
vim.g.colors_name = "zenburn"

local c = {
	["fg-1"] = "#656555",
	["fg-05"] = "#989890",
	["fg"] = "#DCDCCC",
	["fg+1"] = "#FFFFEF",
	["fg+2"] = "#FFFFFD",
	["bg-2"] = "#000000",
	["bg-1"] = "#2B2B2B",
	["bg-08"] = "#303030",
	["bg-05"] = "#383838",
	["bg"] = "#3F3F3F",
	["bg+05"] = "#494949",
	["bg+1"] = "#4F4F4F",
	["bg+2"] = "#5F5F5F",
	["bg+3"] = "#6F6F6F",
	["red-6"] = "#6C3333",
	["red-5"] = "#7C4343",
	["red-4"] = "#8C5353",
	["red-3"] = "#9C6363",
	["red-2"] = "#AC7373",
	["red-1"] = "#BC8383",
	["red"] = "#CC9393",
	["red+1"] = "#DCA3A3",
	["red+2"] = "#ECB3B3",
	["orange"] = "#DFAF8F",
	["yellow-2"] = "#D0BF8F",
	["yellow-1"] = "#E0CF9F",
	["yellow"] = "#F0DFAF",
	["green-5"] = "#2F4F2F",
	["green-4"] = "#3F5F3F",
	["green-3"] = "#4F6F4F",
	["green-2"] = "#5F7F5F",
	["green-1"] = "#6F8F6F",
	["green"] = "#7F9F7F",
	["green+1"] = "#8FB28F",
	["green+2"] = "#9FC59F",
	["green+3"] = "#AFD8AF",
	["green+4"] = "#BFEBBF",
	["cyan"] = "#93E0E3",
	["blue+3"] = "#BDE0F3",
	["blue+2"] = "#ACE0E3",
	["blue+1"] = "#94BFF3",
	["blue"] = "#8CD0D3",
	["blue-1"] = "#7CB8BB",
	["blue-2"] = "#6CA0A3",
	["blue-3"] = "#5C888B",
	["blue-4"] = "#4C7073",
	["blue-5"] = "#366060",
	["magenta"] = "#DC8CC3",
}

local highlights = {
	Normal = { fg = c["fg"], bg = c["bg"] },
	Cursor = { fg = c["fg"], bg = c["fg+1"] },
	Comment = { fg = c["green"] },
	Delimiter = { fg = c["green-2"] },
	Function = { fg = c["cyan"] },

	NonText = { fg = c["bg+2"] },

	Constant = { fg = c["green+4"] },
	String = { fg = c["red"] },
	Character = { link = "String" },

	-- Number		a number constant: 234, 0xff
	-- Boolean	a boolean constant: TRUE, false
	-- Float		a floating point constant: 2.3e10

	Identifier = { fg = c["orange"] },

	Statement = { fg = c["yellow"], bold = true },
	-- Conditional	if, then, else, endif, switch, etc.
	-- Repeat		for, do, while, etc.
	-- Label		case, default, etc.
	-- Operator	"sizeof", "+", "*", etc.
	Keyword = { fg = c["yellow"], bold = true },
	-- Exception	try, catch, throw

	PreProc = { fg = c["blue+1"] },
	Include = { link = "PreProc" },
	Define = { link = "PreProc" },
	Macro = { link = "PreProc" },
	PreCondit = { link = "PreProc" },

	Type = { fg = c["blue-1"] },
	-- StorageClass	static, register, volatile, etc.
	-- Structure	struct, union, enum, etc.
	-- Typedef	A typedef

	-- Special	any special symbol
	-- SpecialChar	special character in a constant
	-- Tag		you can use CTRL-] on this
	-- SpecialComment	special things inside a comment
	-- Debug		debugging statements

	-- Underlined	text that stands out, HTML links

	-- Ignore		left blank, hidden  |hl-Ignore|

	Error = { fg = c["red-1"] },

	Todo = { fg = c["yellow"], bold = true },
	-- keywords TODO FIXME and XXX

	Title = { fg = c["orange"], bold = true },

	Doc = { fg = c["green+2"] },

	LineNr = { fg = c["bg+3"], bg = c["bg-05"] },
	CursorLineNr = { fg = c["yellow-2"], bg = c["bg-05"] },

	StatusLine = { bg = c["bg-1"], fg = c["yellow"], bold = true },
	StatusLineNC = { bg = c["bg-05"], fg = c["green+1"] },
	Visual = { bg = c["bg-1"] },
	SignColumn = { link = "LineNr" },
	NormalNC = { link = "Normal" },

	Pmenu = { fg = c["fg"], bg = c["bg+1"] },
	PmenuSel = { fg = c["fg"], bg = c["bg+2"] },

	TabLine = { fg = c["fg"], bg = c["bg-05"] },
	TabLineFill = { bg = c["bg-05"] },
	TabLineSel = { fg = c["fg"], bg = c["bg+1"], bold = true },

	CmpItemAbbrMatch = { fg = c["yellow"] },

	texArg = { link = "Function" },
	texPartArgTitle = { fg = c["red+2"], bold = true },

	DiagnosticUnnecessary = { fg = c["fg-05"], undercurl = true },

	["@text.quote.markdown"] = { link = "Doc" },
	["@text.strong"] = { bold = true },
	["@text.emphasis"] = { italic = true },

	["@variable.builtin"] = { fg = c["yellow"] },
	["@function.builtin"] = { fg = c["fg"], bold = true },
	["@constant.builtin"] = { link = "Constant" },
	["@punctuation.bracket"] = { link = "Normal" },
	["@punctuation.delimiter.python"] = { link = "Normal" },
	["@operator"] = { link = "Normal" },
	["@parameter"] = { link = "Normal" },

	["@string.documentation"] = { link = "Comment" },

	["@neorg.todo_items.undone.norg"] = { fg = c["red-1"] },
	["@neorg.links.file.norg"] = { fg = c["blue"] },
	["@neorg.headings.1.title.norg"] = { fg = c["fg+1"], bold = true },
}

for g, h in pairs(highlights) do
	vim.api.nvim_set_hl(0, g, h)
end
