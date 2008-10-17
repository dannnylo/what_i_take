# WhatITake
module WhatITake
	#Tecla atalho para exebição da janela
	TECLA_ATALHO="CTRL+ALT+d"
	
	def var_dump(var)
		html="<div style='padding-left:10px;'>"
		begin
			html<< "#{h(var.to_yaml).gsub("  ", "&nbsp; ").gsub("\n\n", "<br/>" ).gsub("\n", "<br/>" ).gsub("---", "" )}"
		rescue Object => e
			html << " #{h(var.inspect)}"
		end
		html << "</div>"
		return html
	end
	
	def what_i_take
		info=""
		info << "Modo: #{RAILS_ENV}  <br/>"
		info <<	"Controller: #{params[:controller]} <br/>"
		info <<	"Classe do Controller: #{@controller.class.name} <br/>"
		info << "Action: #{params[:action]}<br/>"
		info << "Congelado: #{@controller.frozen?.to_s}<br/>"

		return info
	end
	
	def what_i_take?
			css_link="color:#999;font-weight:bold;font-size:15px;"
			
			x =""
			x << javascript_include_tag("what_i_take_shortcut.js")
			x << "\n" 
			x << File.read(File.dirname(__FILE__)+"/./template.html")
			
			x.gsub!('#LINK_TO_INDEX#',
			link_to_function("What I take?","view_what_i_take('index');",:style=>css_link ))
			x.gsub!('#LINK_TO_PARAMS#',
				link_to_function("Params","view_what_i_take('params');",:style=>css_link ))
			x.gsub!('#LINK_TO_SESSION#',
				link_to_function("Session","view_what_i_take('session');",:style=>css_link ))
				
			x.gsub!('#TECLA_ATALHO#',TECLA_ATALHO)
			x.gsub!('#INDEX#',what_i_take)
			x.gsub!('#PARAMS#',"Params: <br/>  #{var_dump(@controller.params)}")
			
			if(@controller.session)
				x.gsub!('#SESSION#',"Session: #{var_dump(@controller.session.instance_variable_get("@data"))}")
			else	
				x.gsub!('#SESSION#',"Session: <br/>")
			end
			
			return x
	end
end
