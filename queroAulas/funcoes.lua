local class = {}

--------------dados professor inicio--------------------
local dadosProfessor = {}
dadosProfessor[1] = {id=1, nome="Maria", usuario="maria21", expProfissional="6 anos", nivelEnsino="Mestrados", formacao="Pedagogia"}
dadosProfessor[2] = {id=2, nome="Pedro", usuario="pedro21", expProfissional="Professor, 23 anos", nivelEnsino="Doutorado", formacao="Matematica"}
dadosProfessor[3] = {id=3, nome="Ana", usuario="ana212", expProfissional="Java, 10 anos", nivelEnsino="Mestrados", formacao="Programação"}
dadosProfessor[4] = {id=4, nome="Fernanda", usuario="fernanda32", expProfissional="Professora", nivelEnsino="Mestrados", formacao="Psicologia"}

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

------------dados professor final----------------------

------------dados Aluno inicio-------------------------

local dadosAluno = {}
dadosAluno[1] = {id=1, nome="Maria", usuario="maria21", areaDeInteresse="Matematica", senha="'1234'",}
dadosAluno[2] = {id=2, nome="Pedro", usuario="pedro01", areaDeInteresse="Programacao", senha="1234", }
dadosAluno[3] = {id=3, nome="Joao", usuario="joao32", areaDeInteresse="Português", senha="1234", }

	function class.inserirAluno( nome, usuario, areaDeInteresse, senha )
		
		
		for i=1, #dadosAluno do 
				if (i == #dadosAluno) then
					dadosAluno[#dadosAluno+ 1] = {id=id, nome=nome, usuario=usuario, areaDeInteresse=areaDeInteresse, senha=senha}
				end
				--print(dadosAluno[i].nome)
		end	 
	end 


	function class.listarAluno(  )
		--print (dadosProfessor)
		return dadosAluno
	end

-----------dados Aluno fim----------------------


return class     