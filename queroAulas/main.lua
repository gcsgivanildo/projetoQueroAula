-----------composer------------------
local composer = require("composer")

local scene = composer.newScene()

composer.removeScene( "cadastroProfessor" )
composer.removeScene( "login")
composer.removeScene( "home")
composer.removeScene( "pesquisarProfessor")



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

-----------funcao--------
local function chamarlogin( event )
	if (event.phase == "ended") then
		local composer = require("composer")
		composer.gotoScene( "login" )
	end
end


local widget = require ("widget")

----------newImageRect-------------
local imagehome = display.newImage("imagens/homeQA3.jpg")
imagehome.x = display.contentWidth/2
imagehome.y = display.contentHeight/2
imagehome.width = display.contentWidth*1.2
imagehome.height = display.contentHeight*1.2

----------newRect-------------
--retLogo = display.newRect(display.contentCenterX, 22, display.contentWidth * 2, display.contentHeight * 0.18)
--retLogo:setFillColor( 0, 0, 250 )
--ret = display.newRect(display.contentCenterX, 84, display.contentWidth * 2, display.contentHeight * 0.08)
--ret:setFillColor( 1, 1, 1 )
--linha = display.newRect(display.contentCenterX*1.25, 25, display.contentWidth * .008, display.contentHeight * 0.1)
--linha:setFillColor( 1, 1, 1, .7 )
local linha = display.newLine (1, display.contentCenterY/10, display.contentWidth, display.contentCenterY/10)
local logo = display.newImageRect( "imagens/logo.png", 80, 80)
logo.x = display.contentCenterX
logo.y = display.contentCenterY/1.5
logo.width = display.contentWidth/1.5
logo.height = display.contentHeight/5

--------newText------------
local bemVindo = display.newText("Bem Vindo", display.contentCenterX, display.contentCenterY/100, native.systemFont, 25 )


local meuGroup = display.newGroup()
	meuGroup:insert( imagehome )
	meuGroup:insert( linha)
	meuGroup:insert( bemVindo)
	meuGroup:insert( logo )


-----------funcao--------
local function chamarHome( event )
	if (event.phase == "ended") then
		local composer = require("composer")
		composer.gotoScene( "home" )
	end
end

local function chamarCadastro( event )
if(event.phase == "ended") then
local composer = require("composer")
composer.gotoScene( "cadastro")
	end
end

--------------botao----------------
local entrar = widget.newButton( {
	x = display.contentWidth /2,
	y = display.contentHeight/2,
	id = "entrar",
	defaultFile = "botoes/entrar.png",
	overFile = "botoes/entrarover.png",
	width = 100,
	height = 40,
	onEvent = chamarlogin
	}  )

	local cadastrar = widget.newButton( {
	x = display.contentCenterX,
	y = display.contentCenterY*1.2,
	id = "cadastrar",
	label = "Cadastra-se",
	width = 100,
	height = 40,
	labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
	onEvent = chamarCadastro
	}
	)

	local visitante = widget.newButton( {
	x = display.contentCenterX,
	y = display.contentCenterY*2,
	id = "visitante",
	label = "Acessar como Visitante",
	width = 100,
	height = 40,
	labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } },
	onEvent = chamarHome
	}
	)


-- destroy()
function scene:destroy( event )
        local group = self.view
 		group:insert(entrar)
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

--]]
