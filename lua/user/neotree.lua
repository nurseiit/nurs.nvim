local M = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = true
  end,
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>e"] = { "<cmd>Neotree toggle<CR>", "Toggle Explorer" },
    ["<leader>o"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      "Toggle Explorer Focus",
    },
  }

  local icons = require "user.icons"

  require("neo-tree").setup {
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    sources = { "filesystem", "buffers", "git_status" },
    source_selector = {
      winbar = true,
      content_layout = "center",
      sources = {
        { source = "filesystem", display_name = icons.ui.Folder .. "File" },
        { source = "buffers", display_name = icons.ui.List .. "Bufs" },
      },
    },
    default_component_configs = {
      indent = { padding = 0 },
      icon = {
        folder_closed = icons.ui.Folder,
        folder_open = icons.ui.FolderOpen,
        folder_empty = icons.ui.EmptyFolder,
        folder_empty_open = icons.ui.EmptyFolderOpen,
        default = icons.ui.Folder,
      },
      modified = { symbol = icons.git.LineModified },
      git_status = {
        symbols = {
          unstaged = icons.git.FileUnstaged,
          staged = icons.git.FileStaged,
          unmerged = icons.git.FileUnmerged,
          renamed = icons.git.FileRenamed,
          untracked = icons.git.FileUntracked,
          deleted = icons.git.FileDeleted,
          ignored = icons.git.FileIgnored,
          added = icons.git.LineAdded,
          modified = icons.git.LineModified,
          conflict = icons.ui.Note,
        },
      },
    },
    commands = {
      system_open = function(state)
        vim.ui.open(state.tree:get_node():get_id())
      end,
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
      copy_selector = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local vals = {
          ["BASENAME"] = modify(filename, ":r"),
          ["EXTENSION"] = modify(filename, ":e"),
          ["FILENAME"] = filename,
          ["PATH (CWD)"] = modify(filepath, ":."),
          ["PATH (HOME)"] = modify(filepath, ":~"),
          ["PATH"] = filepath,
          ["URI"] = vim.uri_from_fname(filepath),
        }

        local options = vim.tbl_filter(function(val)
          return vals[val] ~= ""
        end, vim.tbl_keys(vals))
        if vim.tbl_isempty(options) then
          vim.notify("No values to copy", vim.log.levels.WARN)
          return
        end
        table.sort(options)
        vim.ui.select(options, {
          prompt = "Choose to copy to clipboard:",
          format_item = function(item)
            return ("%s: %s"):format(item, vals[item])
          end,
        }, function(choice)
          local result = vals[choice]
          if result then
            vim.notify(("Copied: `%s`"):format(result))
            vim.fn.setreg("+", result)
          end
        end)
      end,
      find_in_dir = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require("telescope.builtin").find_files {
          cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
        }
      end,
    },
    window = {
      width = 30,
      mappings = {
        ["<space>"] = false, -- disable space until we figure out which-key disabling
        ["[b"] = "prev_source",
        ["]b"] = "next_source",
        F = "find_in_dir",
        O = "system_open",
        Y = "copy_selector",
        h = "parent_or_close",
        l = "child_or_open",
        o = "open",
      },
      fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
        ["<C-j>"] = "move_cursor_down",
        ["<C-k>"] = "move_cursor_up",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = vim.fn.has "win32" ~= 1,
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(_)
          vim.opt_local.signcolumn = "auto"
        end,
      },
    },
  }
end

return M
