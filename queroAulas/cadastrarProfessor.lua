

-----------composer------------------
local composer = require("composer")

local scene = composer.newScene()
composer.removeScene( "home" )



-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 

-------------banco de dados------------------
local sqlite3 = require("sqlite3")
local path = system.pathForFile( "quero-aula.db", system.DocumentsDirectory )
local db = sqlite3.open( path )

local tableProfessor = [[CREATE TABLE IF NOT EXISTS professor (id INTEGER PRIMARY KEY, nome, usuario, senha, nivel-ensino, formacao);]]
db:exec( tableProfessor )



-------require-----------------
local widget = require ("widget")



----------newRect-------------
retLogo = display.newRect(display.contentCenterX, 22, display.contentWidth * 2, display.contentHeight * 0.18)
retLogo:setFillColor( 0, 0, 250 )
ret = display.newRect(display.contentCenterX, 84, display.contentWidth * 2, display.contentHeight * 0.08)
ret:setFillColor( 1, 1, 1 )
linha = display.newRect(display.contentCenterX*1.25, 25, display.contentWidth * .008, display.contentHeight * 0.1)
linha:setFillColor( 1, 1, 1, .7 )
local logo = display.newImageRect( "icones/chapeu.png", 80, 80 )
logo.x = display.contentCenterX / 3.5
logo.y = display.contentCenterY / 10

--------newText------------
local logotxt = display.newText("Quero Aulas", display.contentCenterX/1.1, display.contentCenterY/9, native.systemFont, 18 ) 
local localizacaoTxt = display.newText("Cadastro de Professor", display.contentCenterX/1.6, display.contentCenterY /2.9, native.systemFont, 18 )
localizacaoTxt:setFillColor( 0, 0, 255 )


local nomeTxt = display.newText("Nome", display.contentCenterX/1.2, display.contentCenterY /1.9, native.systemFont, 18 )
--nomeTxt:setFillColor( 1, 1, 1 )

local usuarioTxt = display.newText("Usuário", display.contentCenterX/4, display.contentCenterY /1.16, native.systemFont, 18 )
usuarioTxt:setFillColor( 1, 1, 1 )
local senhaTxt = display.newText("Senha", display.contentCenterX/4.4, display.contentCenterY /0.85, native.systemFont, 18 )
local nivelEnsinoTxt = display.newText("Nível de Ensino", display.contentCenterX/2.2, display.contentCenterY /0.67, native.systemFont, 18 )
local formacaoTxt = display.newText("Formação", display.contentCenterX/3.1, display.contentCenterY * 1.8, native.systemFont, 18 )


-------newTextField-----------
local nomeTf = native.newTextField( display.contentCenterX*1.3 , display.contentCenterY/1.5, display.contentWidth -100, display.contentHeight/15 )
local usuarioTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY, display.contentWidth -50, display.contentHeight/15 )
local senhaTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY *1.3, display.contentWidth -50, display.contentHeight/15 )
local nivelEnsinoTf = native.newTextField( display.contentCenterX / 1.1 , display.contentCenterY *1.64, display.contentWidth -50, display.contentHeight/15 )
local formacaoTf = native.newTextField( display.contentCenterX / 1.1 , display.contentCenterY *1.95, display.contentWidth -50, display.contentHeight/15 )

local meuGroup = display.newGroup()
	meuGroup:insert( retLogo )
	meuGroup:insert( ret )
	meuGroup:insert( linha )
	meuGroup:insert( logo )
	meuGroup:insert( logotxt )
	meuGroup:insert( localizacaoTxt )



local nome = nomeTf.text
local usuario = usuarioTf.text
local senha = senhaTf.text
local nivelEnsino = nivelEnsinoTf.text
local formacao = formacaoTf.text

---------------funções-----------------
function ConcluirCadastroProfessor( event )
	if(event.phase == "ended") then
		
		local insertProfessor = [[INSERT INTO professor VALUES (NULL, ']]..nome..[[',']]..usuario..[[',']]..senha..[[',']]..nivelEnsino..[[',']]..formacao..[['); ]]
		db:exec(insertProfessor)		
	end
end


local function chamartelaHome( event )
	if (event.phase == "ended") then	

	composer.gotoScene( "home" )
	end
end


-------newButton-----------
local inicio = widget.newButton( {
	x = display.contentWidth  /1.25,
	y = display.contentHeight/18,
	label = "Início",	
	id = "inicio",
	fontSize =18,
	width = 100, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},	
    onEvent = chamartelaHome
	} )

local cadastrar = widget.newButton( {
	x = display.contentWidth /5.2,
	y = display.contentHeight *1.05,
	label = "cadastar",	
	id = "cadastrar",
	fontSize =18,
	width = 100, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	strokeColor = {default={0.9,0.9,0.9,1}, over={0.8,0.8,0.8, 1}},
    strokeWidth = 1,
    onEvent = ConcluirCadastroProfessor 
	}  )



--local visitanteTxt = display.newText("Acessar como visitante", display.contentCenterX, display.contentCenterY*2.1, native.systemFont, 18 )
--visitanteTxt:setFillColor( 1, 1, 1, .7 )




-- destroy()
function scene:destroy( event )
        local group = self.view
 		group:insert(nomeTxt)
 		group:insert(nomeTf)
 		group:insert(usuarioTxt)
 		group:insert(usuarioTf)
 		group:insert(senhaTxt)
 		group:insert(senhaTf)
 		group:insert(nivelEnsinoTxt)
 		group:insert(nivelEnsinoTf)
 		group:insert(formacaoTxt)
 		group:insert(formacaoTf)
 		group:insert(cadastrar)
 		group:insert(inicio)
 		group:insert(meuGroup)

    end
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene



