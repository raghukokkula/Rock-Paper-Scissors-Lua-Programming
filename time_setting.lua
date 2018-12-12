local widget = require("widget")  -- inlcudes widgets used in the code
local composer = require("composer") 
local scene = composer.newScene()  -- to create new scene

function scene:create(event)

  local sceneGroup = self.view --Assigning "self.view" to local variable "sceneGroup" for reference
  local background = display.newImage(sceneGroup, "img.jpg", 120,400);
  local text4=display.newText(sceneGroup, "Set your desired time", 160, 150, native.systemFont, 25 );
  text4:setFillColor( 1, 0, 0 );

  local slider_value = 30  -- Slider listener default value
  
  local function sliderListener( event )  -- listener for the time slider


      print( "Slider at " .. event.value .. "%" )
      slider_value = event.value
  end

-- Create the widget slider   
  local slider = widget.newSlider(
      {
          x = display.contentCenterX,
          y = display.contentCenterY,
          width = 200,
          value = 30,  -- Start slider at 10% (optional)
          listener = sliderListener
      }
  )

  -- postion of  the slider 
  slider.x = display.contentCenterX-100
  slider.y = display.contentCenterY

  --insert slider into scene group
  sceneGroup:insert(slider)
  -- ##################
  local function display_time(event) -- display time by selecting the slider 

    if ("ended" == event.phase) then

      display.remove(text5)
      print("removing")
      time = slider_value/10
      text5 = display.newText( "The selected time is "..time.." seconds ", 160, 270, native.systemFont, 20 );
      text5:setFillColor(0,1,1)
      sceneGroup:insert(text5)
      print("The time is set to", time)
      composer.setVariable( "time_value", time )  --0 setting the variable in composer to use it in  other scenes
    end


  end

-- Properties for a circle button 
  local button = widget.newButton(
      {
          label = "button",
          onEvent = display_time,
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

  -- postion of  the button
  button.x = display.contentCenterX
  button.y = display.contentCenterY + 100
  button:setLabel( "Display Time" )    -- label if the button 
  sceneGroup:insert(button)


  local function return_menu(event) --Return menu to move from time setting scene to main scene
    composer.gotoScene( "menu" )

  end

-- return menu widget properties
  local button1 = widget.newButton(
      {
          label = "button",
          onEvent = return_menu,
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

 -- position  the button
  button1.x = display.contentCenterX
  button1.y = display.contentCenterY + 150
  button1:setLabel( "Return Menu" )
  sceneGroup:insert(button1)
end




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


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene
