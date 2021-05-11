local M = {}

M.find_dots = function()
	require('telescope.builtin').find_files {
		prompt_title = "~ dotfiles ~",
		shorten_path = false,
		cwd = "~/dotfiles",
	}
end

M.setup = function ()
	local utils = require('p/utils')
	utils.map("n", "<leader>ff", [[<cmd>Telescope find_files<cr>]])
	utils.map("n", "<leader>fr", [[<cmd>Telescope registers<cr>]])
	utils.map("n", "<leader>fd", [[<cmd>lua require('p/telescope').find_dots()<cr>]])
	utils.map("n", "<leader>fg", [[<cmd>Telescope live_grep<cr>]])
	utils.map("n", "<leader>fs", [[<cmd>Telescope current_buffer_fuzzy_find<cr>]])
	utils.map("n", "<leader><leader>", [[<cmd>Telescope find_files<cr>]])
	utils.map("n", "<leader>,", [[<cmd>Telescope buffers<cr>]])
	utils.map("n", "<leader>fb", [[<cmd>Telescope buffers<cr>]])
end

return M
