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
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_buffer.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_calc.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_emoji.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_luasnip.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lsp.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_nvim_lua.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_omni.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_path.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_snippets_nvim.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_spell.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_tags.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_treesitter.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_ultisnips.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsc.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vim_lsp.vim", "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe_vsnip.vim" },
    config = { "\27LJ\2\n‡\3\0\0\a\1\15\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0015\0\6\0-\1\0\0009\1\a\1'\3\b\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\1-\1\0\0009\1\a\1'\3\b\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\1-\1\0\0009\1\a\1'\3\b\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\1K\0\1\0\0À\25compe#close('<c-e>')\n<c-e>\26compe#confirm('<cr>')\t<cr>\21compe#complete()\n<c-c>\6i\bmap\1\0\3\texpr\2\fnoremap\2\vsilent\2\vsource\1\0\5\rnvim_lua\2\rnvim_lsp\2\tpath\2\vbuffer\2\nvsnip\1\1\0\6\fenabled\2\ndebug\1\14preselect\valways\15min_length\3\1\18documentation\2\17autocomplete\2\nsetup\ncompe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n¡\1\0\0\v\0\a\0\0176\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0\18\4\1\0B\2\2\4X\5\6€8\a\6\0009\a\4\a5\t\5\0006\n\6\0=\n\6\tB\a\2\1E\5\3\3R\5øK\0\1\0\14on_attach\1\0\0\nsetup\vipairs\1\5\0\0\vclangd\18rust_analyzer\fpyright\rtsserver\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.vim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme onedark\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/packer.nvim"
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
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/annguyen/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time("Defining packer_plugins", false)
-- Setup for: vim-fugitive
time("Setup for vim-fugitive", true)
try_loadstring("\27LJ\2\nÕ\2\0\0\6\0\16\0\"6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0'\5\5\0B\1\4\0019\1\2\0'\3\3\0'\4\6\0'\5\a\0B\1\4\0019\1\2\0'\3\3\0'\4\b\0'\5\t\0B\1\4\0019\1\2\0'\3\3\0'\4\n\0'\5\v\0B\1\4\0019\1\2\0'\3\3\0'\4\f\0'\5\r\0B\1\4\0019\1\2\0'\3\3\0'\4\14\0'\5\15\0B\1\4\1K\0\1\0\25<cmd>diffget //2<cr>\15<leader>g2\25<cmd>diffget //3<cr>\15<leader>g3\22<cmd>Git push<cr>\15<leader>gP\23<cmd>Git fetch<cr>\15<leader>gf\22<cmd>Git pull<cr>\15<leader>gp\17<cmd>Git<cr>\15<leader>gg\6n\bmap\fp/utils\frequire\0", "setup", "vim-fugitive")
time("Setup for vim-fugitive", false)
-- Setup for: telescope.nvim
time("Setup for telescope.nvim", true)
try_loadstring("\27LJ\2\nò\2\0\0\5\0\14\0#6\0\0\0'\2\1\0B\0\2\0027\0\2\0006\0\2\0009\0\3\0'\2\4\0'\3\5\0'\4\6\0B\0\4\0016\0\2\0009\0\3\0'\2\4\0'\3\a\0'\4\b\0B\0\4\0016\0\2\0009\0\3\0'\2\4\0'\3\t\0'\4\n\0B\0\4\0016\0\2\0009\0\3\0'\2\4\0'\3\v\0'\4\6\0B\0\4\0016\0\2\0009\0\3\0'\2\4\0'\3\f\0'\4\r\0B\0\4\1K\0\1\0\31<cmd>Telescope buffers<cr>\15<leader>bb\21<leader><leader>!<cmd>Telescope live_grep<cr>\15<leader>fg4<cmd>lua require('p/telescope').find_dots()<cr>\15<leader>fd\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\bmap\nutils\fp/utils\frequire\0", "setup", "telescope.nvim")
time("Setup for telescope.nvim", false)
time("packadd for telescope.nvim", true)
vim.cmd [[packadd telescope.nvim]]
time("packadd for telescope.nvim", false)
-- Setup for: nvim-compe
time("Setup for nvim-compe", true)
try_loadstring("\27LJ\2\nš\2\0\0\2\0\t\0\0296\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0006\0\0\0009\0\1\0+\1\2\0=\1\5\0006\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\0\0009\0\1\0+\1\2\0=\1\a\0006\0\0\0009\0\1\0+\1\2\0=\1\b\0K\0\1\0\25loaded_compe_vim_lsp\25loaded_compe_vim_lsc\27loaded_compe_ultisnips\22loaded_compe_tags\23loaded_compe_spell\31loaded_compe_snippets_nvim\28loaded_compe_treesitter\6g\bvim\0", "setup", "nvim-compe")
time("Setup for nvim-compe", false)
-- Config for: onedark.vim
time("Config for onedark.vim", true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme onedark\bcmd\bvim\0", "config", "onedark.vim")
time("Config for onedark.vim", false)
-- Config for: which-key.nvim
time("Config for which-key.nvim", true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time("Config for which-key.nvim", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\n¡\1\0\0\v\0\a\0\0176\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0\18\4\1\0B\2\2\4X\5\6€8\a\6\0009\a\4\a5\t\5\0006\n\6\0=\n\6\tB\a\2\1E\5\3\3R\5øK\0\1\0\14on_attach\1\0\0\nsetup\vipairs\1\5\0\0\vclangd\18rust_analyzer\fpyright\rtsserver\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Gblame lua require("packer.load")({'vim-fugitive'}, { cmd = "Gblame", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gpush lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpush", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gpull lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpull", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
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
