return {
    'neovim/nvim-lspconfig',
    config = function()
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        local config = require('cmp_nvim_lsp');
        local capabilities = config.default_capabilities();

        local lspconfig = require('lspconfig');

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                  path = vim.split(package.path, ";"),
                },
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = { vim.env.VIMRUNTIME },
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
              },
            },
        });
        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = { "clangd", "--background-index" },  -- This tells clangd to index your project in the background
            filetypes = { "c", "cpp", "objc", "objcpp" },
            root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),  -- Use compile_commands.json for flags
        });
        lspconfig.neocmake.setup({capabilities = capabilities})
        lspconfig.cssls.setup({capabilities = capabilities});
        lspconfig.jdtls.setup({capabilities = capabilities});
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            settings = {
                javascript = {
                    implicitProjectConfig = {
                        checkJs = true
                    }
                }
            },
        });
        lspconfig.csharp_ls.setup({
            root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj");
            capabilities = capabilities;
        });
        lspconfig.rust_analyzer.setup({capabilities = capabilities});
        lspconfig.prismals.setup({capabilities = capabilities});
        lspconfig.svelte.setup({capabilities = capabilities});
        lspconfig.slint_lsp.setup({capabilities = capabilities});
        lspconfig.pyright.setup({capabilities = capabilities});
        lspconfig.lemminx.setup({capabilities = capabilities});
        lspconfig.vala_ls.setup({capabilities = capabilities});

        vim.lsp.config["blueprint_ls"] = {
            cmd = { 'blueprint-compiler', 'lsp' },
            filetypes = { "blp" }
        }
        vim.lsp.enable("blueprint_ls");
        vim.cmd [[ autocmd BufRead,BufNewFile *.blp set filetype=blp ]]

        vim.keymap.set('n', 'K', require('hover').hover, {desc = 'hover.nvim'});
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end;
}
