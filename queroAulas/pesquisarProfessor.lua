-----------composer------------------
local composer = require( "composer" )
local dadosProf = require("funcoes")
-----------require------------------
local widget = require ("widget")
 
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

----------CABEÇALHO-------------
----Background
retLogo = display.newRect(display.contentCenterX, 22, display.contentWidth * 2, display.contentHeight * 0.18)
retLogo:setFillColor( 0, 0, 250 )

ret = display.newRect(display.contentCenterX, 84, display.contentWidth * 2, display.contentHeight * 0.08)
ret:setFillColor( 1, 1, 1 )

----Linha Divisoria
linha = display.newRect(display.contentCenterX*1.25, 25, display.contentWidth * .008, display.contentHeight * 0.1)
linha:setFillColor( 1, 1, 1, .7 )

----Logomarca
local logo = display.newImageRect( "icones/chapeu.png", 80, 80 )
logo.x = display.contentCenterX / 3.5
logo.y = display.contentCenterY / 10

----Texto Logomarca
local logotxt = display.newText("Quero Aulas", display.contentCenterX/1.1, display.contentCenterY/9, native.systemFont, 18 ) 
local localizacaoTxt = display.newText("Pesquisar Professor", display.contentCenterX/1.8, display.contentCenterY /2.9, native.systemFont, 18 )
localizacaoTxt:setFillColor( 0, 0, 255 )

--local usuarioTxt = display.newText("Usuário", display.contentCenterX/4, display.contentCenterY /1.9, native.systemFont, 18 )
--usuarioTxt:setFillColor( 1, 1, 1 )

--local senhaTxt = display.newText("Senha", display.contentCenterX/4.4, display.contentCenterY /1.16, native.systemFont, 18 )
--senhaTxt:setFillColor( 1, 1, 1 )
local function chamartelaHome( event )
	if (event.phase == "ended") then	
		composer.gotoScene( "home" )
			function scene:destroy(event)
			local group = self.view
			group:remove(pesquisarProfessorNome)
		end
	end
end

---------------=========aqui efetuar testes
local function chamartelaPropostaAluno( event )
	if (event.phase == "ended") then	
		composer.gotoScene( "propostaAluno" )
			function scene:hide(event)
			local group = self.view
			group:insert(pesquisarProfessorNome)
		end
	end
end
	

local meuGroup = display.newGroup()
	meuGroup:insert( retLogo )
	meuGroup:insert( ret )
	meuGroup:insert( linha )
	meuGroup:insert( logo )
	meuGroup:insert( logotxt )
	meuGroup:insert( localizacaoTxt )

-------newTextField-----------
--local usuarioTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY/1.5, display.contentWidth -50, display.contentHeight/15 )
--local senhaTf = native.newTextField( display.contentCenterX /1.1 , display.contentCenterY, display.contentWidth -50, display.contentHeight/15 )

--------funcoes-------------
function pesquisarProfessorNome( event )
	if(event.phase == "ended") then
		local function onRowRender(event)
	
			row = event.row
			
			local font = native.systemFont
			local fontSize = 12
			local rowHeight = row.height/2

			----display.newText options-----
			local rowHeight = row.contentHeight
		    local rowWidth = row.contentWidth
		 

		    local rowTitle = display.newText(row, listaProf, 0, 0, nil, 14 )
		    rowTitle:setFillColor( 0 )
		 
		    -- Align the label left and vertically centered
		    rowTitle.anchorX = 0
		    rowTitle.x = 20
		    rowTitle.y = rowHeight * 0.5

		    row.b = widget.newButton{
		 		left= 135,
		    	top = 15, 
		    	label = "Negociar",
		    	id = idProf,
				-- Properties for a rounded rectangle button
		        shape = "roundedRect",
		        width = 100,
		        height = 40,
		        cornerRadius = 2,
		        fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
		        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
		        strokeWidth = 3,
		        onEvent = chamartelaPropostaAluno
		    }
		    row.b.anchorX = 0
		    row.b.anchorY = 0
			
			row:insert(row.b)
		--print("testando se a id está sendo atribuida"..row.b.id)
	end

		 tableView = widget.newTableView({
			left = 10,
		    top = 160,
		    height = 350,
		    width = 300,
			onRowRender = onRowRender,
			onRowTouch = onRowTouch,
			listener = scrollListener
		})
				
		for row=1, #dadosProf.listarProfessor() do
			listaProf = "Id: "..dadosProf.listarProfessor()[row].id.."\nProfessor: " ..dadosProf.listarProfessor()[row].nome.." \nUsuario: "..dadosProf.listarProfessor()[row].usuario.." \nExp Prof: "..dadosProf.listarProfessor()[row].expProfissional.." \nNivel Ensino: "..dadosProf.listarProfessor()[row].nivelEnsino.." \nFormacao: "..dadosProf.listarProfessor()[row].formacao
			
			idProf = dadosProf.listarProfessor()[row].id
			--print ("gagagaga "..idProf)
			tableView:insertRow({
				rowHeight = 120,
				rowColor = { default={ 0.8, 0.8, 0.8, 0.8 }},
       			lineColor = { 1, 0, 0 },
       			 
       		})

		end
	end  
end

--[[teste = 10
print (teste)--]]
--print (pesquisarProfessorNome()[i].row.b)
--print ("id".. dadosProf.listarProfessor()[row].nome)


-----------------------------

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

local btnPesqProfNome = widget.newButton( {
	x = display.contentWidth /2,
	y = display.contentHeight / 3.5,
	label = "Listar Professor por nome",	
	id = "listarProfessorNome",
	fontSize =18,
	width = 300, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	strokeColor = {default={0.9,0.9,0.9,1}, over={0.8,0.8,0.8, 1}},
    strokeWidth = 1,
    onEvent = pesquisarProfessorNome
	}  )


-- destroy()
function scene:destroy( event )
        local group = self.view
 		group:insert(btnPesqProfNome)
 		group:insert(inicio)
 		--group:insert(senhaTf)
 		--group:insert(senhaTxt)
 		--group:insert(usuarioTxt)
 		group:insert(meuGroup)
 		group:insert(tableView)

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
 
