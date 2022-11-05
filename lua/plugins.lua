local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({'git', 
		   'clone', 
		   '--depth', 
		   '1', 
		   'https://github.com/wbthomason/packer.nvim', 
		   install_path})
	vim.cmd [[packadd packer.nvim]]
	print "installing packer... Exit neovim"
end


vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

--Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


-- Get config of package
local function get_config(package)
    return string.format('require("config/%s")', package)
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- Nord
  use 'arcticicestudio/nord-vim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = { get_config('lualine') }
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- luarocks
  use_rocks { 'luasocket' }
  use_rocks { 'json-lua' }
  use_rocks { 'inspect' }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
