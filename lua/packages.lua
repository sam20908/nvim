local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'lifepillar/vim-gruvbox8'
    use 'edkolev/tmuxline.vim'

    use 'nvim-treesitter/nvim-treesitter'
    use 'preservim/nerdcommenter'
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'glepnir/lspsaga.nvim'
    use 'hrsh7th/nvim-compe'
    use 'cohama/lexima.vim'
    use 'm-pilia/vim-ccls'
    use 'puremourning/vimspector'
    use { 'ilyachur/cmake4vim', branch = 'master' }
    use 'mhinz/vim-startify'
    use 'tpope/vim-dispatch'

    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'preservim/nerdtree'

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
