function setup()
	utils = require('p/utils')
	utils.map("n", "<leader>ff", [[<cmd>Telescope find_files<cr>]])
	utils.map("n", "<leader><leader>", [[<cmd>Telescope find_files<cr>]])
	utils.map("n", "<leader>bb", [[<cmd>Telescope buffers<cr>]])
end

return {setup=setup}
