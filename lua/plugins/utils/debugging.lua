return {
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        opts = {}
    },
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim"
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dap.listeners.before.attach.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
              dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
              dapui.close()
            end

            -- C++ and C debugging configurations

            dap.adapters.gdb = {
                id = 'gdb',
                type = 'executable',
                command = 'gdb',
                args = { '--quiet', '--interpreter=dap' },
            }

            dap.configurations.c = {
                {
                    name = 'Run executable (GDB)',
                    type = 'gdb',
                    request = 'launch',

                    program = function()
                        local path = vim.fn.input({
                            prompt = 'Path to executable: ',
                            default = vim.fn.getcwd() .. '/',
                            completion = 'file',
                        })
                        return (path and path ~= '') and path or dap.ABORT
                    end,
                },
                {
                    name = 'Run executable with arguments (GDB)',
                    type = 'gdb',
                    request = 'launch',
                    program = function()
                        local path = vim.fn.input({
                            prompt = 'Path to executable: ',
                            default = vim.fn.getcwd() .. '/',
                            completion = 'file',
                        })

                        return (path and path ~= '') and path or dap.ABORT
                    end,
                    args = function()
                        local args_str = vim.fn.input({
                            prompt = 'Arguments: ',
                        })
                        return vim.split(args_str, ' +')
                    end,
                },
                {
                    name = 'Attach to process (GDB)',
                    type = 'gdb',
                    request = 'attach',
                    processId = require('dap.utils').pick_process,
                },
            }

            dap.configurations.cpp = dap.configurations.c
            dap.configurations.rs = dap.configurations.c

            -- C# debugging configuration

            dap.adapters.coreclr = {
                type = 'executable',
                command = '/usr/bin/netcoredbg',
                args = {'--interpreter=vscode'}
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                    end,
                },
            }
        end
    }
}
