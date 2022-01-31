local comment_ok, comment = pcall(require, "nvim_comment")
if not comment_ok then
	vim.notify("Failed to require nvim_comment", vim.log.levels.WARN)
	return
end

comment.setup()
