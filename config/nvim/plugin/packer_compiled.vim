" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/annguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/annguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/annguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/annguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/annguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["base16-vim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0$colorscheme base16-atelier-dune\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightline.vim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/lightline.vim"
  },
  nerdcommenter = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nerdcommenter"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_buffer.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_calc.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_emoji.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_luasnip.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lsp.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lua.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_omni.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_path.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_snippets_nvim.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_spell.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_tags.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_treesitter.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_ultisnips.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsc.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsp.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vsnip.vim" },
    config = { "\27LJ\2\nÀ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\5\nvsnip\1\rnvim_lua\2\rnvim_lsp\2\vbuffer\2\tpath\2\1\0\6\15min_length\3\1\18documentation\2\17autocomplete\2\fenabled\2\ndebug\1\14preselect\valways\nsetup\ncompe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nï\t\0\0\f\0\22\00006\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0'\5\5\0B\1\4\0016\1\6\0009\1\a\1'\3\b\0B\1\2\0019\1\2\0'\3\3\0'\4\t\0'\5\n\0B\1\4\0019\1\2\0'\3\3\0'\4\v\0'\5\f\0B\1\4\0019\1\2\0'\3\3\0'\4\r\0'\5\14\0B\1\4\0016\1\0\0'\3\15\0B\1\2\0025\2\16\0006\3\17\0\18\5\2\0B\3\2\4X\6\6€8\b\a\0019\b\18\b5\n\19\0006\v\20\0=\v\20\nB\b\2\1E\6\3\3R\6ø6\3\6\0009\3\a\3'\5\21\0B\3\2\1K\0\1\0º\5 \n\t\t\" Show diagnostic popup on cursor hold\n\t\tnnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>\n\t\t\" Code navigation shortcuts\n\t\tnnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>\n\t\tnnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>\n\t\tnnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>\n\t\tnnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>\n\t\tnnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>\n\t\tnnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>\n\t\tnnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>\n\t\tnnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>\n\t\techom \"remapXXXX\"\n\t\14on_attach\1\0\0\nsetup\vipairs\1\6\0\0\vclangd\18rust_analyzer\fpyright\rtsserver\vsvelte\14lspconfig*<cmd>lua vim.lsp.buf.definition()<CR>\bc-]0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\ag]0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\ag[Hautocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()\bcmd\bvim+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ga\6n\bmap\fp/utils\frequire\0" },
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pears.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\npears\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/pears.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Gwrite", "Gstatus", "Gblame", "Gpush", "Gpull" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-rooter"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/vim-rooter"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-svelte"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-svelte"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
-- Setup for: vim-rooter
time("Setup for vim-rooter", true)
try_loadstring("\27LJ\2\nC\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\t.git\rMakefile\20rooter_patterns\6g\bvim\0", "setup", "vim-rooter")
time("Setup for vim-rooter", false)
time("packadd for vim-rooter", true)
vim.cmd [[packadd vim-rooter]]
time("packadd for vim-rooter", false)
-- Setup for: lightline.vim
time("Setup for lightline.vim", true)
try_loadstring("\27LJ\2\nA\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\16colorscheme\vwombat\14lightline\6g\bvim\0", "setup", "lightline.vim")
time("Setup for lightline.vim", false)
time("packadd for lightline.vim", true)
vim.cmd [[packadd lightline.vim]]
time("packadd for lightline.vim", false)
-- Setup for: nerdcommenter
time("Setup for nerdcommenter", true)
try_loadstring("\27LJ\2\n\0\0\2\0\5\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0K\0\1\0\24NERDCompactSexyComs\20NERDSpaceDelims\30NERDCreateDefaultMappings\6g\bvim\0", "setup", "nerdcommenter")
time("Setup for nerdcommenter", false)
time("packadd for nerdcommenter", true)
vim.cmd [[packadd nerdcommenter]]
time("packadd for nerdcommenter", false)
-- Setup for: pears.nvim
time("Setup for pears.nvim", true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "setup", "pears.nvim")
time("Setup for pears.nvim", false)
time("packadd for pears.nvim", true)
vim.cmd [[packadd pears.nvim]]
time("packadd for pears.nvim", false)
-- Setup for: vim-fugitive
time("Setup for vim-fugitive", true)
try_loadstring("\27LJ\2\nž\3\0\0\6\0\19\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0'\5\5\0B\1\4\0019\1\2\0'\3\3\0'\4\6\0'\5\5\0B\1\4\0019\1\2\0'\3\3\0'\4\a\0'\5\b\0B\1\4\0019\1\2\0'\3\3\0'\4\t\0'\5\n\0B\1\4\0019\1\2\0'\3\3\0'\4\v\0'\5\f\0B\1\4\0019\1\2\0'\3\3\0'\4\r\0'\5\14\0B\1\4\0019\1\2\0'\3\3\0'\4\15\0'\5\16\0B\1\4\0019\1\2\0'\3\3\0'\4\17\0'\5\18\0B\1\4\1K\0\1\0\25<cmd>diffget //2<cr>\15<leader>g2\25<cmd>diffget //3<cr>\15<leader>g3\22<cmd>Git push<cr>\15<leader>gP\23<cmd>Git fetch<cr>\15<leader>gf\22<cmd>Git pull<cr>\15<leader>gp\16<cmd>Gw<cr>\15<leader>gg\15<leader>gs\17<cmd>Git<cr>\14<leader>G\6n\bmap\fp/utils\frequire\0", "setup", "vim-fugitive")
time("Setup for vim-fugitive", false)
-- Setup for: nvim-compe
time("Setup for nvim-compe", true)
try_loadstring("\27LJ\2\nF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim£\1\0\0\6\0\b\2\0306\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\16€6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\15\0\1\0X\2\3€+\1\2\0L\1\2\0X\1\2€+\1\1\0L\1\2\0K\0\1\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0ý\1\0\0\4\2\n\1#6\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4€-\0\0\0'\2\3\0D\0\2\0X\0\24€6\0\0\0009\0\1\0009\0\4\0'\2\5\0005\3\6\0B\0\3\2\t\0\0\0X\0\4€-\0\0\0'\2\a\0D\0\2\0X\0\f€-\0\1\0B\0\1\2\15\0\0\0X\1\4€-\0\0\0'\2\b\0D\0\2\0X\0\4€6\0\0\0009\0\1\0009\0\t\0D\0\1\0K\0\1\0\0À\1À\19compe#complete\n<Tab>!<Plug>(vsnip-expand-or-jump)\1\2\0\0\3\1\20vsnip#available\tcall\n<C-n>\15pumvisible\afn\bvim\2È\1\0\0\4\1\t\1\0266\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4€-\0\0\0'\2\3\0D\0\2\0X\0\15€6\0\0\0009\0\1\0009\0\4\0'\2\5\0005\3\6\0B\0\3\2\t\0\0\0X\0\4€-\0\0\0'\2\a\0D\0\2\0X\0\3€-\0\0\0'\2\b\0D\0\2\0K\0\1\0\0À\f<S-Tab>\28<Plug>(vsnip-jump-prev)\1\2\0\0\3ÿÿÿÿ\15\19vsnip#jumpable\tcall\n<C-p>\15pumvisible\afn\bvim\2š\a\1\0\b\0\30\0J6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0006\0\0\0009\0\t\0'\2\n\0B\0\2\0013\0\v\0003\1\f\0006\2\r\0003\3\15\0=\3\14\0026\2\r\0003\3\17\0=\3\16\0026\2\0\0009\2\18\0029\2\19\2'\4\20\0'\5\21\0'\6\22\0005\a\23\0B\2\5\0016\2\0\0009\2\18\0029\2\19\2'\4\24\0'\5\21\0'\6\22\0005\a\25\0B\2\5\0016\2\0\0009\2\18\0029\2\19\2'\4\20\0'\5\26\0'\6\27\0005\a\28\0B\2\5\0016\2\0\0009\2\18\0029\2\19\2'\4\24\0'\5\26\0'\6\27\0005\a\29\0B\2\5\0012\0\0€K\0\1\0\1\0\1\texpr\2\1\0\1\texpr\2\27v:lua.s_tab_complete()\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2\25v:lua.tab_complete()\n<Tab>\6i\20nvim_set_keymap\bapi\0\19s_tab_complete\0\17tab_complete\a_G\0\0²\2\t\tinoremap <silent><expr> <C-Space> compe#complete()\n\t\tinoremap <silent><expr> <CR>      compe#confirm('<CR>')\n\t\tinoremap <silent><expr> <C-e>     compe#close('<C-e>')\n\t\tinoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })\n\t\tinoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })\n\t\bcmd\25loaded_compe_vim_lsp\25loaded_compe_vim_lsc\27loaded_compe_ultisnips\22loaded_compe_tags\23loaded_compe_spell\31loaded_compe_snippets_nvim\28loaded_compe_treesitter\6g\bvim\0", "setup", "nvim-compe")
time("Setup for nvim-compe", false)
-- Setup for: telescope.nvim
time("Setup for telescope.nvim", true)
try_loadstring("\27LJ\2\nú\3\0\0\6\0\18\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0'\5\5\0B\1\4\0019\1\2\0'\3\3\0'\4\6\0'\5\a\0B\1\4\0019\1\2\0'\3\3\0'\4\b\0'\5\t\0B\1\4\0019\1\2\0'\3\3\0'\4\n\0'\5\v\0B\1\4\0019\1\2\0'\3\3\0'\4\f\0'\5\r\0B\1\4\0019\1\2\0'\3\3\0'\4\14\0'\5\5\0B\1\4\0019\1\2\0'\3\3\0'\4\15\0'\5\16\0B\1\4\0019\1\2\0'\3\3\0'\4\17\0'\5\16\0B\1\4\1K\0\1\0\15<leader>fb\31<cmd>Telescope buffers<cr>\14<leader>,\21<leader><leader>1<cmd>Telescope current_buffer_fuzzy_find<cr>\15<leader>fs!<cmd>Telescope live_grep<cr>\15<leader>fg4<cmd>lua require('p/telescope').find_dots()<cr>\15<leader>fd!<cmd>Telescope registers<cr>\15<leader>fr\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\bmap\fp/utils\frequire\0", "setup", "telescope.nvim")
time("Setup for telescope.nvim", false)
time("packadd for telescope.nvim", true)
vim.cmd [[packadd telescope.nvim]]
time("packadd for telescope.nvim", false)
-- Config for: base16-vim
time("Config for base16-vim", true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0$colorscheme base16-atelier-dune\bcmd\bvim\0", "config", "base16-vim")
time("Config for base16-vim", false)
-- Config for: lightline.vim
time("Config for lightline.vim", true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "lightline.vim")
time("Config for lightline.vim", false)
-- Config for: pears.nvim
time("Config for pears.nvim", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\npears\frequire\0", "config", "pears.nvim")
time("Config for pears.nvim", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\nï\t\0\0\f\0\22\00006\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0'\5\5\0B\1\4\0016\1\6\0009\1\a\1'\3\b\0B\1\2\0019\1\2\0'\3\3\0'\4\t\0'\5\n\0B\1\4\0019\1\2\0'\3\3\0'\4\v\0'\5\f\0B\1\4\0019\1\2\0'\3\3\0'\4\r\0'\5\14\0B\1\4\0016\1\0\0'\3\15\0B\1\2\0025\2\16\0006\3\17\0\18\5\2\0B\3\2\4X\6\6€8\b\a\0019\b\18\b5\n\19\0006\v\20\0=\v\20\nB\b\2\1E\6\3\3R\6ø6\3\6\0009\3\a\3'\5\21\0B\3\2\1K\0\1\0º\5 \n\t\t\" Show diagnostic popup on cursor hold\n\t\tnnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>\n\t\t\" Code navigation shortcuts\n\t\tnnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>\n\t\tnnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>\n\t\tnnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>\n\t\tnnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>\n\t\tnnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>\n\t\tnnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>\n\t\tnnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>\n\t\tnnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>\n\t\techom \"remapXXXX\"\n\t\14on_attach\1\0\0\nsetup\vipairs\1\6\0\0\vclangd\18rust_analyzer\fpyright\rtsserver\vsvelte\14lspconfig*<cmd>lua vim.lsp.buf.definition()<CR>\bc-]0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\ag]0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\ag[Hautocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()\bcmd\bvim+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ga\6n\bmap\fp/utils\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gpush lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpush", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gpull lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpull", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gblame lua require("packer.load")({'vim-fugitive'}, { cmd = "Gblame", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gwrite lua require("packer.load")({'vim-fugitive'}, { cmd = "Gwrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gstatus lua require("packer.load")({'vim-fugitive'}, { cmd = "Gstatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time("Defining lazy-load event autocommands", true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time("Defining lazy-load event autocommands", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
