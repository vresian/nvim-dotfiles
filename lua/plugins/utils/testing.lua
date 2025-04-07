return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",


            "Issafalcon/neotest-dotnet",
            "nvim-neotest/neotest-plenary"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-dotnet")({
                      custom_attributes = {
                        xunit = { "MyCustomFactAttribute" },
                        nunit = { "MyCustomTestAttribute" },
                        mstest = { "MyCustomTestMethodAttribute" }
                      },
                      dotnet_additional_args = {
                        "--verbosity detailed"
                      },
                      discovery_root = "project"
                    }),
                    require("neotest-plenary")
                },
            })
        end
    }
}
