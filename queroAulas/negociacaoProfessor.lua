
local composer = require("composer")
local dadosProf = require("funcoes")
local widget = require ("widget")

--seta todos objetos display para anchorX e anchorY na posição desejada
--display.setDefault("anchorX", 0)
--display.setDefault("anchorY", 0)
--display.setDefault("background", 0,0,0)

local scene = composer.newScene()
--composer.removeScene( "home" )
composer.removeScene("respostaProfessor")

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


local function chamartelaHome( event )
	if (event.phase == "ended") then	

	composer.gotoScene( "home" )
	end
end

local function chamartelaAceitar( event )
	if (event.phase == "ended") then	

	composer.gotoScene( "aceiteProfessor" )
	end
end

local function chamartelaConfirmaProposta( event )
	if (event.phase == "ended") then	

	composer.gotoScene( "confirmaPropostaAluno" )
	end
end


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
local localizacaoTxt = display.newText("Painel de Negociação > Professor", display.contentCenterX/1.6, display.contentCenterY /2.9, native.systemFont, 12 )
localizacaoTxt:setFillColor( 0, 0, 255 )


local meuGroup = display.newGroup()
	meuGroup:insert( retLogo )
	meuGroup:insert( ret )
	meuGroup:insert( linha )
	meuGroup:insert( logo )
	meuGroup:insert( logotxt )
	meuGroup:insert( localizacaoTxt )

local lblValor = display.newText("Valor: ", display.contentCenterX/4.5, display.contentCenterY /1.90, native.systemFont, 14 )
local lblQntHoras = display.newText("Qnts Horas?: ", display.contentCenterX + 35, display.contentCenterY /1.90, native.systemFont, 14 )
local lblDisp = display.newText("Horários Disponíveis: ", display.contentCenterX/2.1, display.contentCenterY/1.3, native.systemFont, 14 )
local lblDtDisp = display.newText("Datas Disponíveis: ", display.contentCenterX/2.4, display.contentCenterY/0.90, native.systemFont, 14 )

local txtFldValor = native.newTextField( display.contentCenterX/2.4, display.contentCenterY/1.5555, display.contentWidth-200, display.contentHeight/15 )
local txtFldQntHoras = native.newTextField( display.contentCenterX + 55, display.contentCenterY/1.5555, display.contentWidth-200, display.contentHeight/15 )
local txtFldDisp = native.newTextField( display.contentCenterX/1.1 , display.contentCenterY/1.1, display.contentWidth-40, display.contentHeight/15 )
local txtFldDtDisp = native.newTextField( display.contentCenterX/1.1 , display.contentCenterY/0.80, display.contentWidth-40, display.contentHeight/15 )

local btnEnviar = widget.newButton( {
	x = display.contentWidth/2,
	y = display.contentHeight/1.3,
	label = "Enviar",	
	id = "enviar",
	fontSize =18,
	width = 250, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},	
    --onEvent = chamartelaAceitar
	} )

local grpFormRespProf = display.newGroup()
grpFormRespProf:insert(lblValor)
grpFormRespProf:insert(lblQntHoras)
grpFormRespProf:insert(lblDisp)
grpFormRespProf:insert(lblDtDisp)
--
grpFormRespProf:insert(txtFldValor)
grpFormRespProf:insert(txtFldQntHoras)
grpFormRespProf:insert(txtFldDisp)
grpFormRespProf:insert(txtFldDtDisp)
--
grpFormRespProf:insert(btnEnviar)

grpFormRespProf.anchorX = 0
grpFormRespProf.anchorY = 0

--grpFormRespProf.x = display.contentCenterX/2
--grpFormRespProf.y = display.contentCenterY/2
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

------Professor escolhido
local rtlProf = display.newText("Professor(a): Maria", 10, 70, native.systemFont, 9)

--local linha = display.newLine (2, display.contentCenterY/2, display.contentWidth, display.contentCenterY/2)


--local visitanteTxt = display.newText("Acessar como visitante", display.contentCenterX, display.contentCenterY*2.1, native.systemFont, 18 )
--visitanteTxt:setFillColor( 1, 1, 1, .7 )




-- destroy()
function scene:destroy( event )
       local group = self.view
 		group:insert(grpFormRespProf)
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



