
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
local homeTxt = display.newText("Home", display.contentCenterX/3, display.contentCenterY /2.9, native.systemFont, 18 )
homeTxt:setFillColor( 0, 0, 255 )

local function chamarlogin( event )
	if (event.phase == "ended") then
	local composer = require("composer")
composer.gotoScene( "login" )
end
end

local cadastro = widget.newButton( {
	x = display.contentWidth  /1.25,
	y = display.contentHeight/18,
	label = "Faze Login",	
	id = "entrar",
	fontSize =18,
	width = 100, height = 30,
	labelColor = {default={1,1,1}, over={0,0,0, 0.9}},
	shape = "roundedrect", 
	fillColor = {default = {0, 0, 255}, over = {255, 255, 255, .8}},
	onEvent = chamarlogin 
	}  )