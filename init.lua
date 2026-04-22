-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git","clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- 🌳 File Explorer (with icons)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  git = {
    enable = true,
  },
})    end
  },

  -- 🔍 Telescope (search like VS Code)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- 🖥️ Better Terminal (multiple terminals + UI)
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<c-\>]],
        direction = "horizontal",
        shade_terminals = true,
        persist_size = true,
      })
    end
  },

  -- 🔽 Folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {"kevinhwang91/promise-async"},
    config = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldenable = true
      require("ufo").setup()
    end
  },

  -- 📊 Status line (bottom bar like VS Code)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("lualine").setup()
    end
  },

  -- 📑 Tabs / open files bar
  {
    "akinsho/bufferline.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    version = "*",
    config = function()
      require("bufferline").setup()
    end
  },

  -- 🧠 Better editing (surround, repeat, etc.)
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },

  -- ✨ Comment toggle
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

})

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Clipboard (IMPORTANT FIX)
vim.opt.clipboard = "unnamedplus"

-- Undo persistent
vim.opt.undofile = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- 🌳 File tree
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")

-- 🔍 Search
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>")

-- 🔁 Replace word
vim.keymap.set("n", "<C-h>", ":%s///g<Left><Left>")

-- 📑 Buffers (tabs)
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")

-- ❌ Close file
vim.keymap.set("n", "<leader>w", ":bd<CR>")

-- 🆕 New file
vim.keymap.set("n", "<C-n>",  ":enew<CR>")

-- ⚖️ Diff (compare files)
vim.keymap.set("n", "<leader>df", ":diffthis<CR>")
vim.keymap.set("n", "<leader>do", ":diffoff<CR>")