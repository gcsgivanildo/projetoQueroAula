-------------banco de dados------------------
local sqlite3 = require("sqlite3")
local path = system.pathForFile( "quero-aula.db", system.DocumentsDirectory )
local db = sqlite3.open( path )

local tblProfessor = [[CREATE TABLE IF NOT EXISTS professor (id INTEGER PRIMARY KEY, nome, formacao, especialidade, a_conhecimento, a_atuacao, exp_profissional, eventos);]]
--print( tableLogin )
db:exec( tblProfessor )

---Dados Iniciais só pra compor o BD e poder fazer a busca
local nProf = "Julya"
local form = "Superior"
local espcd = "Historia do Brasil"
local a_cnhc = "Historia"
local a_at = "Historia do Brasil e Historia Geral"
local exp_pr = "5 anos"
local evnt = "Cong. Bras. de Hist. do Brasil"

local insertProf = [[INSERT INTO login VALUES (NULL, ']]..nProf..[[',']]..form..[[',']]..espcd..[[',']]..a_cnhc..[[',']]..a_at..[[',']]..exp_pr..[[',']]..evnt..[['); ]] 
--db:exec(insertProf)