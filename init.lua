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
      "nvim-tree/nvim-web-devicons",
},
    config = function()
      require("nvim-tree").setup({

      view = {
        width = 30,
        side = "left",
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },

      filters = {
        dotfiles = false,
      },

      git = {
        enable = true,
      },

      update_focused_file = {
        enable = true,
        update_cwd = true,
      },

      actions = {
        open_file = {
          resize_window = true,
        },
      },

    })
  end,
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
    end,
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
    end,
  },

  -- 📊 Status line (bottom bar like VS Code)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("lualine").setup()
    end,
  },

  -- 📑 Tabs / open files bar
  {
    "akinsho/bufferline.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    version = "*",
    config = function()
      require("bufferline").setup()
    end,
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
vim.keymap.set("n", "<leader>r", ":%s///g<Left><Left>")

-- 📑 Buffers (tabs)
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>")

-- Insert mode also works
vim.keymap.set("i", "<A-l>", "<Esc>:BufferLineCycleNext<CR>")
vim.keymap.set("i", "<A-h>", "<Esc>:BufferLineCyclePrev<CR>")

-- ❌ Close file
vim.keymap.set("n", "<leader>w", ":bd<CR>")

-- 🆕 New file
vim.keymap.set("n", "<C-n>",  ":enew<CR>")

-- ⚖️ Diff (compare files)
vim.keymap.set("n", "<leader>df", ":diffthis<CR>")
vim.keymap.set("n", "<leader>do", ":diffoff<CR>")

-- TERMINAL KEYMAPS (BETTER CONTROL)

-- Toggle last terminal
vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>")

-- Open specific terminals (FAST switching)
vim.keymap.set("n", "<leader>1", ":ToggleTerm 1<CR>")
vim.keymap.set("n", "<leader>2", ":ToggleTerm 2<CR>")
vim.keymap.set("n", "<leader>3", ":ToggleTerm 3<CR>")
vim.keymap.set("n", "<leader>4", ":ToggleTerm 4<CR>")
vim.keymap.set("n", "<leader>5", ":ToggleTerm 5<CR>")
vim.keymap.set("n", "<leader>6", ":ToggleTerm 6<CR>")

-- Hide ALL terminals (IMPORTANT FIX)
vim.keymap.set("n", "<leader>th", function()
  for i = 1, 6 do
    pcall(vim.cmd, "ToggleTerm " .. i)
  end
end)

-- SAVE
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")

-- SPLITS (safe keys)
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>s", ":split<CR>")

-- MOVE BETWEEN SPLITS
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
