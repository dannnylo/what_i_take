# Install hook code here
require "fileutils"

puts "Instalando..."
FileUtils.cp_r(File.join(File.dirname(__FILE__) , "lib","shortcut.js"), File.join(File.dirname(__FILE__) + "/../../../", "public/javascripts", "what_i_take_shortcut.js"))
puts "Copiando arquivo what_i_take_shortcut para public/javascripts"
puts "Instalado..."
