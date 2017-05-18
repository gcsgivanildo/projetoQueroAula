-----------------------------------------------------------------------------------------
--
local login = require("login")
local p 	= require("professor")
local sqlite3 	= require("sqlite3")


p.nome = "mucio"
p.formacao = "sup"
print("Nome do Fêssor "..p.nome.." com formacao "..p.formacao)

print("versao ", sqlite3.version())
