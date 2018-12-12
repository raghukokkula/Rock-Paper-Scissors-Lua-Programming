local composer = require( "composer" )
local scene = composer.newScene()

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view

   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
   local background = display.newImage(sceneGroup, "img.jpg", 150, 240,220,200)
    local text=display.newText(sceneGroup, "Rock,Paper,Scissors ", 160, 150,native.systemFont, 25 );

-- diplayiny text if alex complete all the levels 

    text:setFillColor( 1, 1, 0 );
    local text2=display.newText(sceneGroup, "ALEX YOU WIN!! ", 160, 200,native.systemFont, 40 );
    text2:setFillColor(1,0,0);
    local end_text=display.newText(sceneGroup, "END ", 160, 250,native.systemFont, 40 );
    text2:setFillColor(1,0,0);
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

      menu_button = display.newRoundedRect(155,460,160,50,10)
      menu_button:setFillColor(1,0.3,0)
      menu_button_text = display.newText("Go Home",155,460,native.systemFont,25)   --adding the go home button
      sceneGroup:insert(menu_button)
      sceneGroup:insert(menu_button_text)

      function return_menu( event ) --adding event listener for the go home button
          -- body
          if event.phase == "ended" then

          -- removes the displayed messages and sprites on the screen 
              display.remove(win_message)
              display.remove(janken)
              display.remove(bubble)
              display.remove(alex)
              display.remove( bg )
              display.remove(hand)
              composer.removeScene("level1")
              composer.gotoScene("menu",{effect="fade",time=300})


          end
      end
      menu_button:addEventListener("touch",return_menu)

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
