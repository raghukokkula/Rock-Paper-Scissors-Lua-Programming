local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")
local result_sound = audio.loadSound( "result.wav" ) -- sound for the results
local janken_points = 0  -- alex points initialization
local alex_points = 0 -- alex points initialization

function scene:create( event )

   local sceneGroup = self.view
    local params = event.params   -- passing the values of the time from time setting scence
   local time11 = params.time1


   local background = display.newImage(sceneGroup, "img.jpg", 150, 240,220,200)
   local a_win_msg = display.newText("Alex : 0",60,90,native.systemFont,30)
    sceneGroup:insert(a_win_msg)  ---- text to display Alex values 
    local e_win_msg = display.newText("Enemy : 0",240,90,native.systemFont,30)
    sceneGroup:insert(e_win_msg)  --text to display Enemy values
   --#################################################################################################
   -----------------------------background--------------------------------
    local options =
    {
       frames = {
          { x = 0, y = 0, width = 256, height = 192}, --bg1
          { x = 0, y = 192, width = 256, height = 192}, -- bg2
          { x = 256, y = 192, width = 256, height = 192}, -- bg3

       }
    };


    local sheet = graphics.newImageSheet( "bg.png", options );
    local bg = display.newImage (sheet, 2);
    bg.x = display.contentWidth / 2;
    bg.y= display.contentHeight / 2;





     ---------- ALEX KIDD ---------------------------------
     local options =
     {
      frames = {
        { x = 1, y = 2, width = 16, height = 25}, --frame 1
        { x = 18, y = 2, width = 16, height = 25}, --frame 2
        { x = 35, y = 2, width = 16, height = 25}, --frame 3
        { x = 52, y = 2, width = 16, height = 25}, --frame 4
        { x = 1, y = 54, width = 16, height = 24}, --ready1
        { x = 19, y = 54, width = 16, height = 24}, --ready2
        { x = 37, y = 54, width = 29, height = 24}, -- rock
        { x = 67, y = 54, width = 33, height = 24}, -- scissor
        { x = 101, y = 54, width = 33, height = 24}, -- paper
        { x = 1, y = 79, width= 32, height= 32}, -- bubblerock
        { x = 35, y = 79, width= 32, height= 32}, -- bubblescissor
        { x = 69, y = 79, width= 32, height= 32}, -- bubblepaper
      }
     };
     local sheet = graphics.newImageSheet( "alex.png", options );

     ---- Create  sequence for animation
     local seqData = {
      {name = "alex_normal", start=1 , count = 4, time = 800},
      {name = "alex_faster", frames={1,2,3,4}, time = 400},
      {name = "alex_shake", frames={5,6}, time = 500},
      {name = "alex_rock", frames={7}},
      {name = "alex_paper", frames={9}},
      {name = "alex_scissor", frames={8}},

     }



     local alex = display.newSprite (sheet, seqData);
     alex.x = display.contentCenterX-80;
     alex.y = display.contentCenterY+66;
     alex.anchorX = 0;
     alex.anchorY = 1;
     alex:setSequence("alex_shake");
     alex:play();

--create the bubble scene sequence 
     local bubbleSeqData = {
      {name = "bubble_rock", frames={10}},
      {name = "bubble_scissor", frames={11}},
      {name = "bubble_paper", frames={12}},
     }

      -- display the bubble sequnce in the screen and play the sequence 

     local bubble = display.newSprite (sheet, bubbleSeqData);
     bubble.x = display.contentCenterX-90;
     bubble.y = display.contentCenterY+26;
     bubble.anchorX = 0;
     bubble.anchorY = 1;
     bubble.xScale = 1.2
     bubble.yScale = 1.2
     bubble:setSequence("bubble_paper");





     ---------- JANKEN ---------------------------------
     local jankenOpt =
     {
      frames = {

        {x= 154, y= 13, width= 39, height= 48 }, -- 1. boss_shake1
        {x= 195, y= 13, width= 39, height= 48 }, -- 2. boss_shake2
        {x= 236, y= 13, width= 32, height= 48 }, -- 3. boss_set
        {x= 305, y= 13, width= 15, height= 48 }, -- 4. boss_rock
        {x= 270, y= 13, width= 16, height= 48 }, -- 5. boss_paper
        {x= 287, y= 13, width= 16, height= 48 }, -- 6. boss_scissor

        {x= 153, y= 62, width= 23, height= 31 }, -- 7. enemy1_shake1
        {x= 178, y= 62, width= 23, height= 31 }, -- 8. enemy1_shake2
        {x= 236, y= 62, width= 15, height= 31 }, -- 9. enemy1_set
        {x= 270, y= 62, width= 16, height= 31 }, -- 10. enemy1_rock
        {x= 287, y= 62, width= 16, height= 31 }, -- 11. enemy1_paper
        {x= 304, y= 62, width= 16, height= 31 }, -- 12. enemy1_scissor


        {x= 153, y= 96, width= 23, height= 31 }, -- 13. enemy2_shake1
        {x= 178, y= 96, width= 23, height= 31 }, -- 14. enemy2_shake2
        {x= 236, y= 96, width= 15, height= 31 }, -- 15. enemy2_set
        {x= 270, y= 96, width= 16, height= 31 }, -- 16. enemy2_rock
        {x= 287, y= 96, width= 16, height= 31 }, -- 17. enemy2_paper
        {x= 304, y= 96, width= 16, height= 31 }, -- 18. enemy2_scissor

      }
     };
     local jankenSheet = graphics.newImageSheet( "enemy.png", jankenOpt );

     -- Create animation sequence janken
     local seqDataJanken = {
      --{name = "boss_flap", frames={7,8}, time = 500},
      {name = "boss_shake", frames={1,2}, time = 500},
      {name = "boss_set", frames={3}, time = 10, loopCount=1},
      {name = "boss_rock", frames={4}, time = 10, loopCount=1},
      {name = "boss_paper", frames={5}, time = 10, loopCount=1},
      {name = "boss_scissor", frames={6}, time = 10, loopCount=1},

      --{name = "enemy1_flap", frames={7,8}, time = 500},
      {name = "enemy1_shaking", frames={7,8}, time = 500},
      {name = "enemy1_set", frames={9}, time = 10, loopCount=1},
      {name = "enemy1_rock", frames={10}, time = 10, loopCount=1},
      {name = "enemy1_scissor", frames={11}, time = 10, loopCount=1},
      {name = "enemy1_paper", frames={12}, time = 10, loopCount=1},

      --{name = "enemy2_flap", frames={7,8}, time = 500},
      {name = "enemy2_shake", frames={13,14}, time = 500},
      {name = "enemy2_set", frames={15}, time = 10, loopCount=1},
      {name = "enemy2_rock", frames={16}, time = 10, loopCount=1},
      {name = "enemy2_scissor", frames={17}, time = 10, loopCount=1},
      {name = "enemy2_paper", frames={18}, time = 10, loopCount=1},
     }

         -- displaying the sprite in the scence with postion

     local janken = display.newSprite (jankenSheet, seqDataJanken);
     janken.x = display.contentCenterX+80;
     janken.y = display.contentCenterY+66;
     janken.anchorX = 1;
     janken.anchorY = 1;



-- function to play the sequence 
     local function play ()

        alex:setSequence ("alex_shake");
        alex:play();

        janken:setSequence("enemy2_shake");
        janken:play();


     end
       -- sound for selecting the symbol
    local select_wav = audio.loadSound("select.wav")
    local x =1
    local alex_sign_num = 1

-- bubble listener to play the sequence and sound  and assining values for each selection
    function bubble_listener(event)

       if event.phase == "began" and x == 2 then
         bubble:setSequence("bubble_scissor")
         audio.play(select_wav)
         x= 3

       elseif event.phase == "began" and x == 1 then
         bubble:setSequence("bubble_rock")
         audio.play(select_wav)
         x = 2

       elseif event.phase == "began" and x == 3 then
         bubble:setSequence("bubble_paper")
         audio.play(select_wav)
         x = 1
       end
     end

-- touch action for the bubble listener
     bubble:addEventListener("touch",bubble_listener)
     local alex_sign_num
     local design

-- initializing the random action for the enemy
   local function shoot ()
       design = 10 + math.random(0,2)
       print(design)
       janken:setSequence("enemy2_set");
       hand = display.newImage (jankenSheet, design, -- boss_rock
       display.contentCenterX+57,
       display.contentCenterY+49);

-- listener removal after completing the action
       bubble:removeEventListener("touch",bubble_listener)
        print(x)
        if (x == 1) then
          alex:setSequence("alex_paper"); -- show the paper bubble
        elseif(x==2) then
          alex:setSequence("alex_rock"); --  show the rock bubble
        elseif(x==3) then
          alex:setSequence("alex_scissor"); -- show the scissor bubble
        end


        if (x ==1 and design ==12)  then --checking the winning conditions for every fight between alex and enemy

                  display.remove(win_message)
                  win_message=display.newText("Draw Match!!",155,395,native.systemFont,30) --display the win message as to who has won
                  win_message:setFillColor(1,1,0)
                  audio.play(result_sound)   --play the audio sound for winning the round

        elseif (x ==2 and design ==10)  then --checking the winning conditions for every fight between alex and enemy
                  display.remove(win_message)
                  win_message=display.newText("Draw Match!!",155,395,native.systemFont,30) --display the win message as to who has won
                  win_message:setFillColor(1,1,0)
                  audio.play(result_sound)   --play the audio sound for winning the round

        elseif (x ==3 and design ==11)  then --checking the winning conditions for every fight between alex and enemy
                  display.remove(win_message)
                  win_message=display.newText("Draw Match!!",155,395,native.systemFont,30) --display the win message as to who has won
                  win_message:setFillColor(1,1,0)
                  audio.play(result_sound)   --play the audio sound for winning the round

        elseif (x ==3 and design ==10)  then --checking the winning conditions for every fight between alex and enemy
                  janken_points = janken_points + 1
                  print ("enemy"..janken_points)
                  display.remove(e_win_msg)
                  e_win_msg = display.newText("Enemy : "..janken_points,240,90,native.systemFont,30)
                  sceneGroup:insert(e_win_msg)

                  display.remove(win_message)
                  win_message=display.newText("Enemy Won!!",155,395,native.systemFont,30)
                  win_message:setFillColor(1,1,0)
                  audio.play(result_sound)

        elseif (x ==2 and design ==12)  then --checking the winning conditions for every fight between alex and enemy
                  janken_points = janken_points + 1
                  print ("enemy"..janken_points)
                  display.remove(e_win_msg)
                  e_win_msg = display.newText("Enemy : "..janken_points,240,90,native.systemFont,30)
                  sceneGroup:insert(e_win_msg)

                  display.remove(win_message)
                  win_message=display.newText("Enemy Won!!",155,395,native.systemFont,30)
                  win_message:setFillColor(1,1,0)
                  audio.play(result_sound)
        elseif (x ==1 and design ==11)  then --checking the winning conditions for every fight between alex and enemy
                  janken_points = janken_points + 1
                  print ("enemy"..janken_points)
                  display.remove(e_win_msg)
                  e_win_msg = display.newText("Enemy : "..janken_points,240,90,native.systemFont,30)
                  sceneGroup:insert(e_win_msg)

                  display.remove(win_message)
                  win_message=display.newText("Enemy Won!!",155,395,native.systemFont,30)
                  win_message:setFillColor(1,1,0)
                  audio.play(result_sound)

        elseif (x ==3 and design ==12)  then --checking the winning conditions for every fight between alex and enemy
                  alex_points = alex_points + 1
                  print ("alex"..alex_points)
                  display.remove(a_win_msg)
                  a_win_msg = display.newText("Alex : "..alex_points,60,90,native.systemFont,30)
                  sceneGroup:insert(a_win_msg)

                  display.remove(win_message)
                  win_message=display.newText("Alex Won!!",155,395,native.systemFont,30)
                  win_message:setFillColor(1,1,0)
                  audio.play(result_sound)
        elseif (x ==1 and design ==10)  then --checking the winning conditions for every fight between alex and enemy
                  alex_points = alex_points + 1
                  print ("alex"..alex_points)
                  display.remove(a_win_msg)
                  a_win_msg = display.newText("Alex : "..alex_points,60,90,native.systemFont,30)
                  sceneGroup:insert(a_win_msg)

                  display.remove(win_message)
                  win_message=display.newText("Alex Won!!",155,395,native.systemFont,30)
                  win_message:setFillColor(1,1,0)
                  audio.play(result_sound)
        elseif (x ==2 and design ==11)  then --checking the winning conditions for every fight between alex and enemy
                  alex_points = alex_points + 1
                  print ("alex"..alex_points)
                  display.remove(a_win_msg)
                  a_win_msg = display.newText("Alex : "..alex_points,60,90,native.systemFont,30)
                  sceneGroup:insert(a_win_msg)

                  display.remove(win_message)
                  win_message=display.newText("Alex Won!!",155,395,native.systemFont,30)
                  win_message:setFillColor(1,1,0)
                  audio.play(result_sound)

        end



        if (( alex_points + janken_points)<3) then   --checking if 3 rounds of games have been played between two charecters

                continueButton = display.newRoundedRect(155,460,190,50,10)
                continueButton:setFillColor(1,0,0)
                continueText = display.newText("Next Game",155,460,native.systemFont,25)
                function continueGame( event )  --adding the event listener to the continue button once touched
                    -- body

                    if event.phase=="ended" then


                        bubble:addEventListener("touch",bubble_listener)
                        display.remove(win_message)

                        display.remove(continueButton)
                        display.remove(continueText)
                        display.remove(hand)

                        -- function play_shoot()
                        --#######################
                            -- Create variables for the width, height, and corners of our loading bar
                            local loadingWidth, loadingHeight, loadingCorners = 310, 40, 5
                            -- Create the loading bar background. This background is white and placed on the center of the screen.
                            local loadingBarBackground = display.newRoundedRect(0,0,loadingWidth,loadingHeight,loadingCorners)
                            loadingBarBackground.x, loadingBarBackground.y = 160,-24
                            -- Create the actual loading bar that will move. We'll make this loading bar a bit smaller than the background so the user can see the progress a bit easier. The xScale is set to 0.001 so it's hidden when it first loads.
                            local loadingBar = display.newRoundedRect(0,0,loadingWidth*0.975,loadingHeight*0.925,loadingCorners)
                            sceneGroup:insert(loadingBarBackground)
                            sceneGroup:insert(loadingBar)
                            loadingBar.anchorX = 0
                            loadingBar.x, loadingBar.y = loadingBarBackground.x - (loadingWidth * 0.4875), loadingBarBackground.y
                            loadingBar:setFillColor(190/255, 33/255, 33/255)
                            loadingBar.xScale = 0.001
                            -- This function will update based on a percentage. Pass in values like 10, 40, or 50 to update the percentage to 10%, 40%, or 50% respectively.
                            local function updateLoading(percent)
                             loadingBar.xScale = percent / 100
                            end




                            local counter = 0 -- Create a counter
                            local function doSomething() -- create the function
                                updateLoading(counter) -- pass in the counter to updateLoading()
                                counter = counter + 1 -- increase counter by 1
                            end


                            timer.performWithDelay(time11*10, doSomething, 100) -- run the timer every second 100 times to reach 100%

                        --#######################
                            play();


                          -- shoot();
                        -- end

                        -- local r = timer.performWithDelay (3000, play_shoot, 1);
                        local r = timer.performWithDelay (time11*1000, shoot, 1);


                    end
                end
                continueButton:addEventListener("touch",continueGame)   --once the continue button is clicked the game has to reload

        end

        if (( alex_points + janken_points) == 3) then

          -- if (alex_points > janken_points) then
          -- end



          if (alex_points < janken_points) then

            menu_button = display.newRoundedRect(155,460,160,50,10)
            menu_button:setFillColor(1,0.3,0)
            menu_button_text = display.newText("Go Home",155,460,native.systemFont,25)   --adding the go home button
            sceneGroup:insert(menu_button)
            sceneGroup:insert(menu_button_text)

            function return_menu( event ) --adding event listener for the go home button
                -- body
                if event.phase == "ended" then
                    display.remove(win_message)
                    display.remove(janken)
                    display.remove(bubble)
                    display.remove(alex)
                    display.remove( bg )
                    display.remove(hand)
                    composer.removeScene("level2")
                    composer.gotoScene("menu",{effect="fade",time=300})


                end
            end
            menu_button:addEventListener("touch",return_menu)

          elseif(alex_points > janken_points) then
            level3_button = display.newRoundedRect(155,460,160,50,10)
            level3_button:setFillColor(1,0.3,0)
            level3_button_text = display.newText("Level3",155,460,native.systemFont,25)   --adding the go home button
            sceneGroup:insert(level3_button)
            sceneGroup:insert(level3_button_text)

            function level3( event ) --adding event listener for the go home button 
                  if event.phase == "ended" then

                  -- removes the messages and sprites displayed on the screen
                    display.remove(win_message)
                    display.remove(janken)
                    display.remove(bubble)
                    display.remove(alex)
                    display.remove( bg )
                    display.remove(hand)
                    composer.removeScene("level2")
                    local options = {
                        effect = "fade",
                        time = 500,
                        params = {
                        time1 = time11,
                         }
                     }
                    composer.gotoScene("level3",options)



                end
            end
            level3_button:addEventListener("touch",level3)
          end
        end



      end



     local t = timer.performWithDelay (time11*1000, shoot, 1)

     --#######################
         -- Create variables for the width, height, and corners of our loading bar
         local loadingWidth, loadingHeight, loadingCorners = 310, 40, 5
         -- Create the loading bar background. This background is white and placed on the center of the screen.
         local loadingBarBackground = display.newRoundedRect(0,0,loadingWidth,loadingHeight,loadingCorners)
         loadingBarBackground.x, loadingBarBackground.y = 160,-24
         -- Create the actual loading bar that will move. We'll make this loading bar a bit smaller than the background so the user can see the progress a bit easier. The xScale is set to 0.001 so it's hidden when it first loads.
         local loadingBar = display.newRoundedRect(0,0,loadingWidth*0.975,loadingHeight*0.925,loadingCorners)
         loadingBar.anchorX = 0
         sceneGroup:insert(loadingBarBackground)
         sceneGroup:insert(loadingBar)
         loadingBar.x, loadingBar.y = loadingBarBackground.x - (loadingWidth * 0.4875), loadingBarBackground.y
         loadingBar:setFillColor(190/255, 33/255, 33/255)
         loadingBar.xScale = 0.001
         -- This function will update based on a percentage. Pass in values like 10, 40, or 50 to update the percentage to 10%, 40%, or 50% respectively.
         local function updateLoading(percent)
          loadingBar.xScale = percent / 100
         end




         local counter = 0 -- Create a counter
         local function doSomething() -- create the function
             updateLoading(counter) -- pass in the counter to updateLoading()
             counter = counter + 1 -- increase counter by 1
         end

         print(time11)
         timer.performWithDelay(time11*10, doSomething, 100) -- run the timer every second 100 times to reach 100%

     --#######################






     --Shake for a while before revealing the hand
   -- ###########################









    -- -- Goes to time setting if this button is pressed
    -- local function return_menu(event)
    --
    --   composer.gotoScene( "menu" )
    --
    -- end
    --
    -- local button1 = widget.newButton(
    --     {
    --         label = "button",
    --         onEvent = return_menu,
    --         emboss = false,
    --         -- Properties for a circle button
    --         shape = "rectangle",
    --         width = 200,
    --         height = 40,
    --         cornerRadius = 2,
    --         fillColor = { default={0.8,0.6,0.8,1}, over={1,0.1,0.7,0.4} },
    --         strokeColor = { default={0.8,0.3,0,3}, over={0.8,0.8,1,1} },
    --         strokeWidth = 4
    --     }
    -- )
    --
    --
    --
    -- -- Center the button
    -- button1.x = display.contentCenterX
    -- button1.y = display.contentCenterY + 150
    --
    -- -- Change the button's label text
    -- button1:setLabel( "Return Menu" )
    -- sceneGroup:insert(button1)


    --##############################





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
