local class = {}
local dadosProfessor = {}
dadosProfessor[1] = {nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
		
	function class.inserirProfessor( nome, usuario, expProfissional, nivelEnsino, formacao )
		
		
		for i=1, #dadosProfessor do 
				if (i == #dadosProfessor) then
					dadosProfessor[#dadosProfessor + 1] = {nome=nome, usuario=usuario, expProfissional=expProfissional, nivelEnsino=nivelEnsino, formacao=formacao}
				end
				--print(dadosProfessor[i].nome)
		end	 
	end 


	function class.listarProfessor(  )
		--print (dadosProfessor)
		return dadosProfessor
	end

return class  