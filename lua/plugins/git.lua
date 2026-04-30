return {
    -- Enhanced diff viewer and file history
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
        -- stylua: ignore
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>",           desc = "Diff View (index)" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>",  desc = "File History (current)" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<cr>",    desc = "File History (repo)" },
            { "<leader>gc", "<cmd>DiffviewClose<cr>",          desc = "Close Diff View" },
        },
        opts = {},
    },
}
