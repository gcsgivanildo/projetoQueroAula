local class = {}
local dadosProfessor = {}
dadosProfessor[1] = {id=1, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
dadosProfessor[2] = {id=2, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
dadosProfessor[3] = {id=3, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
dadosProfessor[4] = {id=4, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
dadosProfessor[5] = {id=5, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
dadosProfessor[6] = {id=6, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
dadosProfessor[7] = {id=7, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
dadosProfessor[8] = {id=8, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
dadosProfessor[9] = {id=9, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}
dadosProfessor[10] = {id=10, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Matematica"}

	function class.inserirProfessor( nome, usuario, expProfissional, nivelEnsino, formacao )
		
		
		for i=1, #dadosProfessor do 
				if (i == #dadosProfessor) then
					dadosProfessor[#dadosProfessor + 1] = {id=id, nome=nome, usuario=usuario, expProfissional=expProfissional, nivelEnsino=nivelEnsino, formacao=formacao}
				end
				--print(dadosProfessor[i].nome)
		end	 
	end 


	function class.listarProfessor(  )
		--print (dadosProfessor)
		return dadosProfessor
	end

return class     