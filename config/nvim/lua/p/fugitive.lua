function setup()
  local utils = require('p/utils')
  utils.map('n', '<leader>gg', [[<cmd>Git<cr>]])
  utils.map('n', '<leader>gp', [[<cmd>Git pull<cr>]])
  utils.map('n', '<leader>gf', [[<cmd>Git fetch<cr>]])
  utils.map('n', '<leader>gP', [[<cmd>Git push<cr>]])
  utils.map('n', '<leader>g3', [[<cmd>diffget //3<cr>]])
  utils.map('n', '<leader>g2', [[<cmd>diffget //2<cr>]])
end
return {
	setup=setup
}
