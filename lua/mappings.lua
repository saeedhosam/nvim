-- Add the defnition and declaration stuff

local map = vim.keymap.set

-- movement in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- window switching
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- random
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
local tabufline = require "nvchad.tabufline"
map({ "n", "i" }, "<M-.>", tabufline.next, { desc = "next buffer" })
map({ "n", "i" }, "<M-,>", tabufline.prev, { desc = "previous buffer" })
map({ "n", "i" }, "<C-M-l>", "<cmd>tabnext<CR>", { desc = "previous buffer" })
map({ "n", "i" }, "<C-M-h>", "<cmd>tabprev<CR>", { desc = "previous buffer" })
map("n", "<M-o>", function()
  tabufline.move_buf(1)
end, { desc = "buffer move forward" })
map("n", "<M-i>", function()
  tabufline.move_buf(-1)
end, { desc = "buffer move backward" })
map("n", "<leader>qb", function()
  tabufline.close_buffer()
end, { desc = "close buffer" })
map("n", "<leader>qw", "<cmd>close<CR>", { desc = "close window" })
map("n", "<leader>qa", "<cmd>only<CR>", { desc = "close all other windows" })
map("n", "<leader>qt", "<cmd>tabclose<CR>", { desc = "close current tab" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope
map("n", "<leader>fgm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>fgt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cn", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })
map("n", "<leader>ftt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>fth", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)
map("n", "<leader>fn", function()
  require("telescope.builtin").find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "Search in Neovim config files" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- toggleterm
map("n", "<M-/>", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "terminal new vertical term" })
map("n", "<M-'>", "<cmd>ToggleTerm direction=float<CR>", { desc = "terminal new floating term" })

-- program runner
map("n", "<leader>p", function()
  local ext = vim.fn.expand "%:e"

  if ext == "cpp" then
    vim.cmd "TermExec cmd='c++ % ; ./a.out' direction=horizontal"
  elseif ext == "py" then
    vim.cmd "TermExec cmd='python %' direction=horizontal"
  end
end, { desc = "run run run" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- Normal mode mappings
map("n", ";", ":", { desc = "Enter command mode" })
map("n", ":", "", { desc = "Remove default command mode" })
map("t", "<C-[>", "<C-\\><C-N>", { desc = "Escape termainal mode" })
map("n", "<C-[>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "<leader>x", "<cmd>so % | echom 'File sourced!'<CR>", { desc = "Source file" })
-- map("n", "{", "}") -- idk why these were different than jk, at least I don't know 'yet'
-- map("n", "}", "{")
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true, silent = true })

-- Open Lazy
map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "open Lazy window" })

-- Center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
-- map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Window navigation
map("n", "<C-h>", "<C-W>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-W>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-W>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-W>l", { desc = "Move to right window" })

-- Window repositioning
map("n", "<M-a>", "<C-W>H")
map("n", "<M-s>", "<C-W>J")
map("n", "<M-w>", "<C-W>K")
map("n", "<M-d>", "<C-W>L")

-- Splitting & Resizing
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "split window vertically" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "split window horizontally" })
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "increase window width" })

-- Move lines up/down
map("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- copy full file-path
map("n", "<leader>ca", function()
  local path = vim.fn.expand "%:p"
  vim.fn.setreg("+", path)
  print("file:", path)
end)

-- format file manually
map({ "n", "x" }, "<leader>a", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- Archive
-- -- new terminals
-- map("n", "<leader>/", function()
--   require("nvchad.term").new { pos = "vsp" }
-- end, { desc = "terminal new vertical term" })
-- map("n", "<leader>'", function()
--   require("nvchad.term").new { pos = "float" }
-- end, { desc = "terminal new floating term" })
--
-- -- toggleable
-- map({ "n", "t" }, "<M-/>", function()
--   require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
-- end, { desc = "terminal toggleable vertical term" })
-- map({ "n", "t" }, "<M-'>", function()
--   require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
-- end, { desc = "terminal toggle floating term" })
