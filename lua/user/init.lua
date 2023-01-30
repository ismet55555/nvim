--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "default_theme",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
      colorcolumn = { 100 }, -- Add visible column barrier
      foldenable = true, -- Enable code folding
      foldlevel = 99, -- Ensure all folds are open
      ruler = true, -- Show line and column number of the cursor on right side of statusline
      timeoutlen = 400, -- Length of time to wait for a mapped sequence
      visualbell = true, -- Blink cursor on error instead of beeping
      ttyfast = true, -- Fast scrolling
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = false, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    "██      ███████ ████████ ███████ ",
    "██      ██         ██    ██      ",
    "██      █████      ██    ███████ ",
    "██      ██         ██         ██ ",
    "███████ ███████    ██    ███████ ",
    "                                 ",
    "     ██████   ██████  ██         ",
    "    ██       ██    ██ ██         ",
    "    ██   ███ ██    ██ ██         ",
    "    ██    ██ ██    ██            ",
    "     ██████   ██████  ██         ",
  },


  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      cmp = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      treesitter = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
        ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Search/Replace in Workspace" },
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- NORMAL
      -- Move text up and down
      ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "Move single line up" },
      ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "Move single line down" },

      -- Select all in current file
      ["<leader>a"] = { "ggVG", desc = "Select all text in file" },

      -- Enter blank line without leaving NORMAL mode
      ["<CR>"] = { "o<Esc>", desc = "Return down in normal mode" },

      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

      -- Diffview for Git
      ["<leader>do"] = { "<cmd>DiffviewOpen<CR>", desc = "Git DiffView open" },
      ["<leader>dc"] = { "<cmd>DiffviewClose<CR>", desc = "Git DiffView close" },

      -- Cheat.sh
      ["<leader>ch"] = { "<cmd>Cheat<CR>", desc = "Open Cheat.sh input" },

      -- hop.nvim
      ["s"] = { "<cmd>HopChar1<CR>", desc = "Hop to specific character" },

      -- Spectre - Search and Replace
      ["<leader>rg"] = { "<cmd>lua require('spectre').open()<CR>", desc = "Search/Replace in Workspace" },
      ["<leader>rf"] = { "<cmd>lua require('spectre').open_file_search()<CR>", desc = "Search/Replace in File" },

      -- Rename
      -- ["<leader>rn"] = { "<cmd>lua vim.lsp.buf.renmame()<CR>", desc = "Search/Replace in Workspace" },
    },
    v = {
      -- VISUAL
    },
    x = {
      -- VISUAL BLOCK
      ["<A-j>"] = { ":move '>+1<CR>gv-gv", desc = "Move lines down" },
      ["<A-k>"] = { ":move '<-2<CR>gv-gv", desc = "Move lines up" },
    },
    t = {
      -- TERMINAL
    },
    c = {
      -- COMMAND
    },
  },

  -- Configure plugins
  plugins = {
    init = {
      -- -- Colorscheme: Blueish color scheme
      -- ["cocopon/iceberg.vim"] = {},
      --
      -- -- Colorscheme: Blueish color scheme
      -- ["EdenEast/nightfox.nvim"] = {},

      -- -- Move to specific position on screen fast
      -- ["phaazon/hop.nvim"] = {
      --   branch = "v2",
      --   config = function() require("hop").setup { keys = "etovxqpdygfblzhckisuran" } end,
      -- },

      -- Distraction free writing (Zen Mode)
      ["folke/zen-mode.nvim"] = {
        config = function() require("zen-mode").setup {} end,
      },

      -- Git Diff viewer
      ["sindrets/diffview.nvim"] = {
        requires = {"nvim-lua/plenary.nvim"},
        after = "plenary.nvim",
      },

      -- Cheat.sh Code Snippets and Answers (Open with :Cheat)
      ["RishabhRD/popfix"] = {},
      ["RishabhRD/nvim-cheat.sh"] = {},

      -- Keyboard shortcuts for common VIM operations
      ["tpope/vim-unimpaired"] = {},

      -- Easy and smart search and replace
      ["brooth/far.vim"] = {},

      -- Smart code folding
      ["pseewald/vim-anyfold"] = {},

      -- Smart code folding
      ["windwp/nvim-spectre"] = {},

      -- Wild menu for commands and searches
      ["gelguy/wilder.nvim"] = {
--         run = "UpdateRemotePlugins",
        config = function()
          local wilder = require "wilder"
          wilder.setup {
            modes = {":", "/", "?"},
          }
--           wilder.set_option('renderer', wilder.wildmenu_renderer({
--             highlighter = wilder.basic_highlighter(),
--           }))
          wilder.set_option('renderer', wilder.popupmenu_renderer({
            pumblend = 20,
          }))
          wilder.set_option('renderer', wilder.popupmenu_renderer(
            wilder.popupmenu_border_theme({
              highlights = {
                border = 'Normal', -- highlight to use for the border
              },
              border = 'rounded',
            })
          ))
        end,
      },

    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup function call
      local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      }
      
      -- set up null-ls's on_attach function
      -- NOTE: You can remove this on attach function to disable format on save
--       config.on_attach = function(client)
--         if client.resolved_capabilities.document_formatting then
--           vim.api.nvim_create_autocmd("BufWritePre", {
--             desc = "Auto format before save",
--             pattern = "<buffer>",
--             callback = vim.lsp.buf.formatting_sync,
--           })
--         end
--       end

      return config -- return final config table
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      ensure_installed = { "lua" },
    },
    
    telescope = {
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--iglob",
            "!.git|!.env|!.venv",
          },
        },
      },
    },

    ["neo-tree"] = {
      window = {
        width = 30,
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },

    
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = {
        "sumneko_lua",
        "bashls",
        "yamlls",
        "sqls",
        "pyright",
        "jsonls",
        "html"
      },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      ensure_installed = {
        "prettier",
        "yamllint",
        "pylint",
        "mypy",
        "markdownlint",
        "jsonlint",
        "curlylint",
        "flake8",
        "codespell",
        "shellcheck",
        "shellharden",
        "xmlformatter",
        "yapf",
        "sql-formatter",
        "isort",
        "black",
        "beautysh",
        "autopep8"
      },
    },
    ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
      -- ensure_installed = { "python" },
    },
  },

  
  -- LuaSnip Options
  luasnip = {
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
    -- Configure luasnip loaders (vscode, lua, and/or snipmate)
    vscode = {
      -- Add paths for including more VS Code style snippets in luasnip
      paths = {},
    },
  },
  

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Customize Heirline options
  heirline = {
    -- -- Customize different separators between sections
    -- separators = {
    --   tab = { "", "" },
    -- },
    -- -- Customize colors for each element each element has a `_fg` and a `_bg`
    -- colors = function(colors)
    --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
    --   return colors
    -- end,
    -- -- Customize attributes of highlighting in Heirline components
    -- attributes = {
    --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
    --   git_branch = { bold = true }, -- bold the git branch statusline component
    -- },
    -- -- Customize if icons should be highlighted
    -- icon_highlights = {
    --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
    --   file_icon = {
    --     winbar = false, -- Filetype icon in the winbar inactive windows
    --     statusline = true, -- Filetype icon in the statusline
    --   },
    -- },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    
    vim.api.nvim_create_augroup("buf_check", { clear = true })
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      desc = "Enable code folding",
      group = "buf_check",
      pattern = "*",
      command = "AnyFoldActivate",
    })
    vim.api.nvim_create_autocmd({ "TextYankPost" }, {
      desc = "Highlight yanked/copied text",
      group = "buf_check",
      pattern = "*",
      callback = function() vim.highlight.on_yank { timeout = 500 } end,
    })

    ---------------------------------------------------------------------------------

    -- Set up custom filetypes
    vim.filetype.add {
      -- extension = {
      --   foo = "fooscript",
      -- },
      -- filename = {
      --   ["Blahfile"] = "yaml",
      --   ["Yofile"] = "yaml",
      -- },
      pattern = {
        ["credentials"] = "toml",
        ["*Gearsfile*"] = "yaml",
        ["*Bogiefile*"] = "yaml",
        ["*Jenkinsfile*"] = "groovy",
      },
    }
 
    
  end,
}

return config
