require "vimrunner"
require "vimrunner/rspec"

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = :documentation
end

Vimrunner::RSpec.configure do |config|
  plugin_path = File.expand_path("..", File.dirname(__FILE__))

  config.reuse_server = false
  config.start_vim do
    vim = Vimrunner.start
    vim.prepend_runtimepath(plugin_path)
    vim.command "let g:markdown_include_jekyll_support = 1"
    vim.command "runtime ftdetect/markdown.vim"
    vim.command "runtime ftplugin/markdown.vim"
    vim.command "set nospell"
    vim.command "set nofoldenable"
    vim
  end
end
