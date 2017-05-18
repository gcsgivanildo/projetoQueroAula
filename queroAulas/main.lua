local sqlite3 = require( "sqlite3" )
 
-- Open "data.db". If the file doesn't exist, it will be created
local path = system.pathForFile( "teste.db", system.DocumentsDirectory )
local dbt = sqlite3.open( path )   

local tableSet = [[CREATE TABLE IF NOT EXISTS professor (id INTEGER PRIMARY KEY, nome, formacao);]]
print( tableSet )
dbt:exec( tableSet )

local profDados = {}

profDados.nome1 =  "Sofi"
profDados.formacao1 = "Eng. Agrimensura"


local insrt1 = [[INSERT INTO professor VALUES (NULL, ']]..profDados.nome1..[[',']]..profDados.formacao1..[['); ]]
--local insrt2 = [[INSERT INTO professor VALUES (NULL, ']]..profDados.nome2..[[',']]..profDados.formacao2..[['); ]]


--dbt:exec(insrt1)
--db:exec(insrt2)

for row in dbt:nrows("SELECT * FROM professor") do
    local textNome = "Nome individuo: "..row.nome.."".." - formacao dele: "..row.formacao
    --local textFormac = row.formacao
    local t = display.newText(textNome, 150, 30*row.id, nil, 16)
    t:setFillColor( 1, 0, 1 )
    print(row.id ,row.nome)
    print(row.id, row.formacao)
end