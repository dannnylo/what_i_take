# Uninstall hook code here
require "fileutils"

puts "Removendo aquivo...what_i_take_shortcut.js"
caminho=File.join(File.dirname(__FILE__) + "/../../../", "public/javascripts", "what_i_take_shortcut.js")
if(File.exist?(caminho))
	FileUtils.rm_r(caminho)
	puts "Removido..."
else
	puts "Arquivo não encontrado"	
end
