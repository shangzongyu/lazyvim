return {
    -- Quick-jump between marked files
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        -- stylua: ignore
        keys = function()
            local harpoon = require("harpoon")
            return {
                { "<leader>ha", function() harpoon:list():add() end,                        desc = "Harpoon Add File" },
                { "<leader>H",  function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Menu" },
                { "<leader>h1", function() harpoon:list():select(1) end,                    desc = "Harpoon File 1" },
                { "<leader>h2", function() harpoon:list():select(2) end,                    desc = "Harpoon File 2" },
                { "<leader>h3", function() harpoon:list():select(3) end,                    desc = "Harpoon File 3" },
                { "<leader>h4", function() harpoon:list():select(4) end,                    desc = "Harpoon File 4" },
            }
        end,
        config = function()
            require("harpoon"):setup()
        end,
    },
}
