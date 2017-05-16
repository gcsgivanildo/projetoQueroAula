
local widget = require ("widget")
-------------
retLogo = display.newRect(0, 22, display.contentWidth * 2, display.contentHeight * 0.18)
retLogo:setFillColor( 0, 0, 250 )
ret = display.newRect(0, 84, display.contentWidth * 2, display.contentHeight * 0.08)
ret:setFillColor( 1, 1, 1 )
linha = display.newRect(200, 25, display.contentWidth * .008, display.contentHeight * 0.1)
linha:setFillColor( 1, 1, 1, .7 )
local logo = display.newImageRect( "icones/chapeu.png", 80, 80 )
logo.x = display.contentCenterX / 3.5
logo.y = display.contentCenterY / 10
local logotxt = display.newText("Quero Aulas", 140, 25, native.systemFont, 18 ) 
local localizacao = display.newText("Fazer Login", 60, 85, native.systemFont, 18 )
localizacao:setFillColor( 0, 0, 255 )

local logar = widget.newButton( {
	x = display.contentWidth  /1.25,
	y = display.contentHeight/20,
	label = "Logar",	
	id = "logar",
	fontSize =18,
	width = 100, height = 50,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}}
	
    --onEvent = evento 
	}  )
