-----------composer------------------
local composer = require( "composer" )
 
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
local path = system.pathForFile( "quero-aulas.db", system.DocumentsDirectory )
local db = sqlite3.open( path )

local tableLogin = [[CREATE TABLE IF NOT EXISTS login (id INTEGER PRIMARY KEY autoincrement, usuario, senha);]]
print( tableLogin )
db:exec( tableLogin )

local usuariot = "givanildo"
local senhat = "cordeiro"

local insertLogin = [[INSERT INTO login VALUES (NULL, ']]..usuariot..[[',']]..senhat..[['); ]]
db:exec(insertLogin)



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
local localizacaoTxt = display.newText("Fazer Login", display.contentCenterX/3, display.contentCenterY /2.9, native.systemFont, 18 )
localizacaoTxt:setFillColor( 0, 0, 255 )
local usuarioTxt = display.newText("Usuário", display.contentCenterX/4, display.contentCenterY /1.9, native.systemFont, 18 )
usuarioTxt:setFillColor( 1, 1, 1 )
local senhaTxt = display.newText("Senha", display.contentCenterX/4.4, display.contentCenterY /1.16, native.systemFont, 18 )
--senhaTxt:setFillColor( 1, 1, 1 )
local visitanteTxt = display.newText("Acessar como visitante", display.contentCenterX, display.contentCenterY*2, native.systemFont, 18 )
visitanteTxt:setFillColor( 1, 1, 1, .7 )



local meuGroup = display.newGroup()
	meuGroup:insert( retLogo )
	meuGroup:insert( ret )
	meuGroup:insert( linha )
	meuGroup:insert( logo )
	meuGroup:insert( logotxt )
	meuGroup:insert( localizacaoTxt )
	meuGroup:insert( visitanteTxt )

-------newTextField-----------
local usuarioTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY/1.5, display.contentWidth -50, display.contentHeight/15 )
local senhaTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY, display.contentWidth -50, display.contentHeight/15 )

--------funcoes-------------
function entrarLogin( event )
	if(event.phase == "ended") then
		--visitanteTxt.text = "Usuario: " ..usuarioTf.text.." Senha: "..senhaTf.text
		for row in db:nrows("SELECT * FROM login") do
			if(row.usuario == usuarioTf.text and row.senha == senhaTf.text) then
			    local texto = "Usuario: "..row.usuario.."".." - senha: "..row.senha
			    visitanteTxt.text= texto
			else 
				visitanteTxt.text = "Usuario ou Senha incorreto(os)"
		    end
		end

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

local logar = widget.newButton( {
	x = display.contentWidth /5.2,
	y = display.contentHeight /1.63,
	label = "Entrar",	
	id = "logar",
	fontSize =18,
	width = 100, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	strokeColor = {default={0.9,0.9,0.9,1}, over={0.8,0.8,0.8, 1}},
    strokeWidth = 1,
    onEvent = entrarLogin 
	}  )

	
	
-- destroy()
function scene:destroy( event )
        local group = self.view
 		group:insert(logar)
 		group:insert(usuarioTf)
 		group:insert(senhaTf)
 		group:insert(senhaTxt)
 		group:insert(usuarioTxt)
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
