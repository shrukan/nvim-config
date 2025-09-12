vim.g.mapleader = " "

local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.relativenumber = true

opt.spell = true
opt.spelllang = "en_us"

opt.termguicolors = true

vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
	},
})

vim.diagnostic.config({
	float = {
		source = "if_many",
	},
})
