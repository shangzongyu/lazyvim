return {
    -- DAP UI: graphical panels for variables, call stack, breakpoints
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
            { "<leader>du", function() require("dapui").toggle() end,                      desc = "DAP UI Toggle" },
            { "<leader>de", function() require("dapui").eval() end,                        desc = "DAP Eval",     mode = { "n", "v" } },
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            -- Auto-open/close UI on debug events
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end,
    },

    -- Inline variable values while debugging
    {
        "theHamsta/nvim-dap-virtual-text",
        opts = { commented = true },
    },

    -- Core DAP keymaps + codelldb adapter (C/C++ and Rust)
    {
        "mfussenegger/nvim-dap",
        -- stylua: ignore
        keys = {
            { "<F5>",        function() require("dap").continue() end,                                                     desc = "Debug: Continue" },
            { "<F10>",       function() require("dap").step_over() end,                                                    desc = "Debug: Step Over" },
            { "<F11>",       function() require("dap").step_into() end,                                                    desc = "Debug: Step Into" },
            { "<F12>",       function() require("dap").step_out() end,                                                     desc = "Debug: Step Out" },
            { "<leader>db",  function() require("dap").toggle_breakpoint() end,                                            desc = "Toggle Breakpoint" },
            { "<leader>dB",  function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,         desc = "Conditional Breakpoint" },
            { "<leader>dr",  function() require("dap").repl.open() end,                                                    desc = "Open REPL" },
            { "<leader>dl",  function() require("dap").run_last() end,                                                     desc = "Run Last" },
            { "<leader>dx",  function() require("dap").terminate() end,                                                    desc = "Terminate" },
        },
        config = function()
            local dap = require("dap")

            -- codelldb adapter — shared by C, C++, and Rust
            dap.adapters["codelldb"] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            -- C / C++ launch configs
            for _, lang in ipairs({ "c", "cpp" }) do
                dap.configurations[lang] = {
                    {
                        type = "codelldb",
                        request = "launch",
                        name = "Launch file",
                        program = function()
                            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                        end,
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "codelldb",
                        request = "attach",
                        name = "Attach to process",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                }
            end

            -- Rust launch configs (default path points to cargo debug output)
            dap.configurations["rust"] = {
                {
                    type = "codelldb",
                    request = "launch",
                    name = "Launch Rust program",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "codelldb",
                    request = "attach",
                    name = "Attach to Rust process",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                },
            }
        end,
    },

    -- Go debugging via delve
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = { "mfussenegger/nvim-dap" },
        -- stylua: ignore
        keys = {
            { "<leader>td", function() require("dap-go").debug_test() end,      desc = "Debug Nearest Test (Go)" },
            { "<leader>tD", function() require("dap-go").debug_last_test() end, desc = "Debug Last Test (Go)" },
        },
        opts = {
            dap_configurations = {
                {
                    type = "go",
                    name = "Attach remote",
                    mode = "remote",
                    request = "attach",
                },
            },
            delve = {
                -- required on macOS/Linux to avoid zombie processes
                detached = vim.fn.has("win32") == 0,
            },
        },
    },

    -- Python debugging via debugpy
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap" },
        -- stylua: ignore
        keys = {
            { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug Method (Python)", ft = "python" },
            { "<leader>dPc", function() require("dap-python").test_class() end,  desc = "Debug Class (Python)",  ft = "python" },
        },
        config = function()
            require("dap-python").setup("debugpy-adapter")
        end,
    },

    -- Mason: auto-install all required debug adapters
    {
        "mason-org/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "codelldb", "debugpy", "delve" })
        end,
    },
}
