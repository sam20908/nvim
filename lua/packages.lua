local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'morhetz/gruvbox'

    use 'nvim-treesitter/nvim-treesitter'
    use 'sbdchd/neoformat'

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'tpope/vim-unimpaired'
    use 'tpope/vim-surround'
    use 'cohama/lexima.vim'
    use 'preservim/nerdcommenter'

    use { 'mg979/vim-visual-multi', branch = 'master' }
    use 'wellle/targets.vim'
end)
