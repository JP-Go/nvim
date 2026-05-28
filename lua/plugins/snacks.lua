-- Snacks
Core.add_plugin({ Core.gh('folke/snacks.nvim') })

-- Snacks
require('snacks').setup({
    bufdelete = { enabled = true },
    bigfile = { enabled = true },
    dashboard = {
        sections = {
            { section = 'header' },
            { section = 'keys', gap = 1, padding = 1 },
            { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
            { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
            {
                pane = 2,
                icon = ' ',
                title = 'Git Status',
                section = 'terminal',
                enabled = function()
                    return Snacks.git.get_root() ~= nil
                end,
                cmd = 'git status --short --branch --renames',
                height = 5,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
            },
        },
    },
    explorer = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    git = { enabled = true },
    github = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    terminal = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
})

-- Top Pickers & Explorer
Core.add_keymap('n', '<leader><space>', function()
    Snacks.picker.smart()
end, { desc = 'Smart Find Files' })
Core.add_keymap('n', '<leader>n', function()
    Snacks.picker.notifications()
end, { desc = 'Notification History' })
Core.add_keymap('n', '<leader>e', function()
    Snacks.explorer()
end, { desc = 'File Explorer' })
Core.add_keymap('n', '<leader>bc', function()
    Snacks.bufdelete()
end, { desc = 'Delete current buffer' })
Core.add_keymap('n', '<C-/>', function()
    Snacks.terminal()
end, { desc = 'Terminal' })
-- find
Core.add_keymap('n', '<leader>fb', function()
    Snacks.picker.buffers()
end, { desc = 'Buffers' })
Core.add_keymap('n', '<leader>ff', function()
    Snacks.picker.files()
end, { desc = 'Find Files' })
Core.add_keymap('n', '<leader>fg', function()
    Snacks.picker.git_files()
end, { desc = 'Find Git Files' })
Core.add_keymap('n', '<leader>fp', function()
    Snacks.picker.projects()
end, { desc = 'Projects' })
Core.add_keymap('n', '<leader>fr', function()
    Snacks.picker.recent()
end, { desc = 'Recent' })
Core.add_keymap('n', '<leader>fw', function()
    Snacks.picker.grep_word()
end, { desc = 'Find word' })
-- git
Core.add_keymap('n', '<leader>gb', function()
    Snacks.picker.git_branches()
end, { desc = 'Git Branches' })
Core.add_keymap('n', '<leader>gl', function()
    Snacks.picker.git_log()
end, { desc = 'Git Log' })
Core.add_keymap('n', '<leader>gL', function()
    Snacks.picker.git_log_line()
end, { desc = 'Git Log Line' })
Core.add_keymap('n', '<leader>gs', function()
    Snacks.picker.git_status()
end, { desc = 'Git Status' })
Core.add_keymap('n', '<leader>gS', function()
    Snacks.picker.git_stash()
end, { desc = 'Git Stash' })
Core.add_keymap('n', '<leader>gd', function()
    Snacks.picker.git_diff()
end, { desc = 'Git Diff (Hunks)' })
Core.add_keymap('n', '<leader>gf', function()
    Snacks.picker.git_log_file()
end, { desc = 'Git Log File' })
-- gh
Core.add_keymap('n', '<leader>gi', function()
    Snacks.picker.gh_issue()
end, { desc = 'GitHub Issues (open)' })
Core.add_keymap('n', '<leader>gI', function()
    Snacks.picker.gh_issue({ state = 'all' })
end, { desc = 'GitHub Issues (all)' })
Core.add_keymap('n', '<leader>gp', function()
    Snacks.picker.gh_pr()
end, { desc = 'GitHub Pull Requests (open)' })
Core.add_keymap('n', '<leader>gP', function()
    Snacks.picker.gh_pr({ state = 'all' })
end, { desc = 'GitHub Pull Requests (all)' })
-- Grep
Core.add_keymap('n', '<leader>sb', function()
    Snacks.picker.lines()
end, { desc = 'Buffer Lines' })
Core.add_keymap('n', '<leader>sB', function()
    Snacks.picker.grep_buffers()
end, { desc = 'Grep Open Buffers' })
Core.add_keymap('n', '<leader>sg', function()
    Snacks.picker.grep()
end, { desc = 'Grep' })
Core.add_keymap({ 'n', 'x' }, '<leader>sw', function()
    Snacks.picker.grep_word()
end, { desc = 'Visual selection or word' })
-- LSP
Core.add_keymap('n', 'gd', function()
    Snacks.picker.lsp_definitions()
end, { desc = 'Goto Definition' })
Core.add_keymap('n', 'gD', function()
    Snacks.picker.lsp_declarations()
end, { desc = 'Goto Declaration' })
Core.add_keymap('n', 'gr', function()
    Snacks.picker.lsp_references()
end, { nowait = true, desc = 'References' })
Core.add_keymap('n', 'gI', function()
    Snacks.picker.lsp_implementations()
end, { desc = 'Goto Implementation' })
Core.add_keymap('n', 'gy', function()
    Snacks.picker.lsp_type_definitions()
end, { desc = 'Goto T[y]pe Definition' })
Core.add_keymap('n', 'gai', function()
    Snacks.picker.lsp_incoming_calls()
end, { desc = 'C[a]lls Incoming' })
Core.add_keymap('n', 'gao', function()
    Snacks.picker.lsp_outgoing_calls()
end, { desc = 'C[a]lls Outgoing' })
Core.add_keymap('n', '<leader>ss', function()
    Snacks.picker.lsp_symbols()
end, { desc = 'LSP Symbols' })
Core.add_keymap('n', '<leader>sS', function()
    Snacks.picker.lsp_workspace_symbols()
end, { desc = 'LSP Workspace Symbols' })
