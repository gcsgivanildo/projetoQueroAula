-----------composer------------------
local composer = require("composer")
local dadosProf = require("funcoes")

local scene = composer.newScene()
composer.removeScene( "home" )
composer.removeScene( "cadastrarProfessor" )



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


local lblnome = display.newText("Nome", display.contentCenterX/4.6, display.contentCenterY /1.9, native.systemFont, 18 )
local lblusuario = display.newText("Usuário", display.contentCenterX/4, display.contentCenterY /1.16, native.systemFont, 18 )
lblusuario:setFillColor( 1, 1, 1 )
local lblexpProfissional = display.newText("Experiência Profissional", display.contentCenterX /1.5, display.contentCenterY /0.85, native.systemFont, 18 )
local lblnivelEnsino = display.newText("Nível de Ensino", display.contentCenterX/2.2, display.contentCenterY /0.67, native.systemFont, 18 )
local lblformacao = display.newText("Formação", display.contentCenterX/3.1, display.contentCenterY * 1.8, native.systemFont, 18 )


-------newTextField-----------
local nomeTf = native.newTextField( display.contentCenterX/1.1 , display.contentCenterY/1.5, display.contentWidth -50, display.contentHeight/15 )
local usuarioTf = native.newTextField( display.contentCenterX/1.1 , display.contentCenterY, display.contentWidth -50, display.contentHeight/15 )
local expProfissionalTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY *1.3, display.contentWidth -50, display.contentHeight/15 )
local nivelEnsinoTf = native.newTextField( display.contentCenterX / 1.1 , display.contentCenterY *1.64, display.contentWidth -50, display.contentHeight/15 )
local formacaoTf = native.newTextField( display.contentCenterX / 1.1 , display.contentCenterY *1.95, display.contentWidth -50, display.contentHeight/15 )

local cadastrar = widget.newButton( {
	x = display.contentWidth /5.2,
	y = display.contentHeight *1.05,
	label = "Cadastrar",	
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


local grpFormCadastro = display.newGroup()
		--
		grpFormCadastro:insert(lblnome)
		grpFormCadastro:insert(lblusuario)
		grpFormCadastro:insert(lblexpProfissional)
		grpFormCadastro:insert(lblnivelEnsino)
		grpFormCadastro:insert(lblformacao)
		--
		grpFormCadastro:insert(nomeTf)
		grpFormCadastro:insert(usuarioTf)
		grpFormCadastro:insert(expProfissionalTf)
		grpFormCadastro:insert(nivelEnsinoTf)
		grpFormCadastro:insert(formacaoTf)
		--
		grpFormCadastro:insert(cadastrar)



local meuGroup = display.newGroup()
	meuGroup:insert( retLogo )
	meuGroup:insert( ret )
	meuGroup:insert( linha )
	meuGroup:insert( logo )
	meuGroup:insert( logotxt )
	meuGroup:insert( localizacaoTxt )
 

---------------funções-----------------
function ConcluirCadastroProfessor( event )
	if(event.phase == "ended") then		
		dadosProf.inserirProfessor(nomeTf.text, usuarioTf.text, expProfissionalTf.text, nivelEnsinoTf.text, formacaoTf.text)			  	
	end
end


local function chamartelaHome( event )
	if (event.phase == "ended") then	
	composer.gotoScene( "home" )
	end
end


-------newButton-----------
local inicio = widget.newButton( {
	x = display.contentWidth/1.25,
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



--local visitanteTxt = display.newText("Acessar como visitante", display.contentCenterX, display.contentCenterY*2.1, native.systemFont, 18 )
--visitanteTxt:setFillColor( 1, 1, 1, .7 )




-- destroy()
function scene:destroy( event )
        local group = self.view
 		group:insert(grpFormCadastro)
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



