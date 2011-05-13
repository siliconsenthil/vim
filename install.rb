#!/usr/bin/env ruby
require 'fileutils'
home_directory = File.expand_path("~")
FileUtils.mv(File.join(home_directory, ".vimrc"), File.join(".vimrc_backed_up_by_vundle"), :force => true, :verbose => true) rescue nil
FileUtils.mv(File.join(home_directory, ".gvimrc"), File.join(".gvimrc_backed_up_by_vundle"), :force => true, :verbose => true) rescue nil
FileUtils.ln_s(File.join(Dir.pwd, "vimrc"), File.join(home_directory, ".vimrc"), :force => true, :verbose => true)
FileUtils.ln_s(File.join(Dir.pwd, "gvimrc"), File.join(home_directory, ".gvimrc"), :force => true, :verbose => true)
FileUtils.rm_rf(File.join(home_directory, ".vim", "vundle"), :verbose => true)
FileUtils.mkdir_p(File.join(home_directory, ".vim", "vundle"), :verbose => true)
exec "git clone https://github.com/gmarik/vundle.git #{home_directory}/.vim/vundle"
puts "Now open vim and run :BundleInstall"

