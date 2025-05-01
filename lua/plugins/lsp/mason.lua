return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end;
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'clangd',
                    'cssls',
                    'jdtls',
                    'ts_ls',
                    'emmet_language_server',
                    'csharp_ls',
                    'rust_analyzer',
                    'prismals',
                    'neocmake',
                    'svelte',
                    'slint_lsp',
                    'lemminx',
                    'pyright',
                    'vala_ls'
                }
            })
        end;
    }
}
