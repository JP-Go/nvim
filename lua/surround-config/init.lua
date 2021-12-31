local surround_ok,surround = pcall(require,"surround")
if not surround_ok then
    vim.notify("Failed to require surround",vim.log.levels.WARN)
    return
end

surround.setup({ mappings_style = 'surround' })
