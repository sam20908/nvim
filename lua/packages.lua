local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'itchyny/lightline.vim'
  use 'lifepillar/vim-gruvbox8'

  use 'nvim-treesitter/nvim-treesitter'
  use 'preservim/nerdcommenter'
  use 'jackguo380/vim-lsp-cxx-highlight'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'puremourning/vimspector'
  use { 'ilyachur/cmake4vim', branch = 'master' }
  use 'mhinz/vim-startify'

  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'tpope/vim-unimpaired'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'wellle/targets.vim'
end)
