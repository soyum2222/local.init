return {

	'nvim-treesitter/nvim-treesitter',

	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = "all", -- 安装所有语言解析器
			highlight = {
				enable = true,
				disable = { "help" }, -- 禁用对 help 文件类型的语法高亮
			},
		}
	end,
}
