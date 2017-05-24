-------------banco de dados------------------
local sqlite3 = require("sqlite3")
local path = system.pathForFile( "quero-aula.db", system.DocumentsDirectory )
local db = sqlite3.open( path )

--local pesq = [[SELECT * TABLE professor WHERE idCrna INTEGER PRIMARY KEY, nome, formacao, especialidade, a_conhecimento, a_atuacao, exp_profissional, eventos);]]
--print( tableLogin )
--db:exec( pesq )

for row in db:nrows("SELECT * FROM professor") do
    local text = row.nome .. " " .. row.formacao
    local t = display.newText( text, 20, 30*row.id, nil, 16 )
    t:setFillColor( 1, 0, 1 )
end