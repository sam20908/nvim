local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'lifepillar/vim-gruvbox8'
  use 'edkolev/tmuxline.vim'

  use 'nvim-treesitter/nvim-treesitter'
  use 'preservim/nerdcommenter'
  use 'jackguo380/vim-lsp-cxx-highlight'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'puremourning/vimspector'
  use { 'ilyachur/cmake4vim', branch = 'master' }
  use 'mhinz/vim-startify'
  use 'tpope/vim-dispatch'

  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  use { 'mg979/vim-visual-multi', branch = 'master' }
  use 'wellle/targets.vim'
end)
