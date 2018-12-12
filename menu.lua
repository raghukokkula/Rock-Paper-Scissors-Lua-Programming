local widget = require("widget") -- inlcudes widgets used in the code

local composer = require("composer")

local scene = composer.newScene()  -- to create new scene


composer.setVariable( "time_value", 3 )  -- setting default value for the time 



-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   -- Initialize the scene here.
   -- displaying new image game name and project executor names 
   local background = display.newImage(sceneGroup, "img.jpg", 150, 240,220,200)
    local text=display.newText(sceneGroup, "Rock,Paper,Scissors", 160, 150,native.systemFont, 25 );
    text:setFillColor( 1, 1, 0 );
    local text1=display.newText(sceneGroup, "Vani_Kokkula", 60,-20, native.systemFont, 20 );
    text1:setFillColor( 1, 0, 0 );
    local text2=display.newText(sceneGroup, "Gopinath_P", 55,10, native.systemFont, 20 );
    text2:setFillColor( 1, 0, 0 );


 -- start function to go to first scene and play the game 
    local function start( event )

      if ( "began" == event.phase ) then
          print( "Button was pressed and released and start button" )
      end
      composer.removeScene("menu",true)   ---- removes the menu scence to avoid overlapping
      time_value = composer.getVariable( "time_value" )   -- get the time variable to correalte with progressive view
      local options = {  --- options to move to other scence 
          effect = "slideRight",
          time = 500,
          params = {
          time1 = time_value,
           }
       }
       composer.gotoScene( "level1", options )  --used to composer to go to next scence "level"
    end

 
 ---  start button widget 
    local button1 = widget.newButton(
        {
            label = "button",
            onEvent = start,
            emboss = false,
            shape = "rectangle",
            width = 200,
            height = 40,
            cornerRadius = 2,
            fillColor = { default={0.8,0.6,0.8,1}, over={1,0.1,0.7,0.4} },
            strokeColor = { default={0.8,0.3,0,3}, over={0.8,0.8,1,1} },
            strokeWidth = 4
        }
    )

 --- position of the button 
    button1.x = display.contentCenterX
    button1.y = display.contentCenterY
    button1:setLabel( "Start" )
    sceneGroup:insert(button1)


    --move to  time setting scence  using this functions
    local function time_setting( event )

      if ( "began" == event.phase ) then
          print( "Button was pressed and released and start button" )
      end
      composer.removeScene("menu",true)
      composer.gotoScene("time_setting") -- composer to go to time setting scene
    end

-- properties of the time setting button
    local button2 = widget.newButton(
        {
            label = "button",
            onEvent = time_setting,
            emboss = false,
            shape = "rectangle",
            width = 200,
            height = 40,
            cornerRadius = 2,
            fillColor = { default={0.8,0.6,0.8,1}, over={1,0.1,0.7,0.4} },
            strokeColor = { default={0.8,0.3,0,3}, over={0.8,0.8,1,1} },
            strokeWidth = 4
        }
    )

    -- Position of  the button
    button2.x = display.contentCenterX
    button2.y = display.contentCenterY+50
    button2:setLabel( "Time Setting" ) -- labelling th timesetting button
    sceneGroup:insert(button2)
  end

-- "scene:show()"
function scene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end

-- "scene:hide()"
function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.

   end
end

-- "scene:destroy()"
function scene:destroy( event )

   local sceneGroup = self.view

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene
