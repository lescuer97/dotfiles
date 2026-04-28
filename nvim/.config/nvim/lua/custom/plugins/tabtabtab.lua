return {
	dir = "/home/leo/Programar/trabajo/open_source/tabtabtab",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local tabtabtab = require("tabtabtab")
		tabtabtab.setup({
			key = "sk-S1622H5JI8wOoP0hX4tckg",
			provider = "ppq",
		})
	end,
}
