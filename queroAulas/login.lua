local composer = require("composer")

local scene = composer.newScene()





function scene:create( event )
	local sceneGroup = self.view



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

-------newTextField-----------
local usuarioTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY/1.5, display.contentWidth -50, display.contentHeight/15 )
local usuarioTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY, display.contentWidth -50, display.contentHeight/15 )

-------newButton-----------
local cadastro = widget.newButton( {
	x = display.contentWidth  /1.25,
	y = display.contentHeight/18,
	label = "Cadastre-se",	
	id = "cadastro",
	fontSize =18,
	width = 100, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}}
	
    --onEvent = evento 
	}  )
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
    strokeWidth = 1
    --onEvent = evento 
	}  )

	--sceneGroup:insert(logar)
	
end
scene:addEventListener("create", scene)
return scene

