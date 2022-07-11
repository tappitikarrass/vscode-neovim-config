local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
end

vim.cmd [[packadd packer.nvim]] -- packadd packer module

require('packer').init {
  auto_clean = true,
  autoremove = true,
}

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  use 'luukvbaal/stabilize.nvim'
  use 'numToStr/Comment.nvim'
  use 'nacro90/numb.nvim'
  use 'ishan9299/nvim-solarized-lua'
  use 'dhruvasagar/vim-table-mode'
  if packer_bootstrap then
    require('packer').sync()
  end
end)