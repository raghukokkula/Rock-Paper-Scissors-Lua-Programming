# Figure 1 Game Screen

For this assignment, We have created the Rock, Paper, Scissor game that featured Alex
Kidd © SEGA. We have implemented the following game components:

1. We have used the Composer library and three images (png,
    alex.png, and enemy.png) and create five different scenes using it. I am providing
    image sheets/frame data/example code snippets for the sprites. Find and use these
    files in the HW3_files folder on our class Canvas.You can check the code for these
    sprites and background image frames.
2. Create five Composer scenes (each scene should be maintained with a separate
    lua file):
    2.1. The Main scene (title screen): Show credits and two buttons: Start and Time
       setting. Specifically, you have to show:
2.1.1. Your name (and all member’s names) should be shown
2.1.2. There is a button; add a ‘Start’ button to move to Level 1.
2.1.3. There is another button to move to the setting scene (2.2).
    2.2. The Setting scene: Allow the player to set specific time duration for selecting
       one of the rock, paper and scissor shapes (See 5 .2 and 5 .3).
2.2.1. The player can set a time/duration (see 5.3) between 1000ms and
10000ms (default:3000ms) using a slider widget (use the Corona SDK


```
widget API). Additionally, the selected time value should be displayed on the
screen.
2.2.2. Add a ‘Return’ button to return to the main menu screen
2.3. Three levels (three scenes):
2.3.1. Level 1 (enemy 1 and background 1)
2.3.2. Level 2 (enemy 2 and background 2)
2.3.3. Level 3 (boss and background 3)
```
3. Ending message: Show an ending message, and allow your player to go back to the
    main scene by tapping a button or the screen.
4. Scene Transition: The transition between each level should not be abrupt. For
    example, after completing Level 1, have a message pop up (perhaps the computer
    character will say something), then allow you to tap “go to next level” before loading
    the next level.

If we kept the basic rock, paper, scissor game, it would become stale very fast. To turn
it into the awesome game that it ought to be, we will make it a bit more challenging by
introducing a timed, sequence-based play.

5. The game rules / mechanics are as follows:
    5.1. As you can see in Figure 1, you can use this basic layout of Alex (Fig. 1A), the
       selection bubble (Fig. 1B), and an opponent (Fig. 1C)
    5.2. Each round/fight begins after a countdown of 3 seconds (e.g.,“three -> two ->
       one”) to the game start, and the characters on the game will then begin their
       initial “shake” animations (check the code, too) which will last for 3000ms (This
       time duration is set with the slider at 2.2).
    5.3. During this shake animation, the player can choose one of the rock, paper, and
       scissor shapes by tapping the selection bubble (Fig. 1C). The player will be able
       to select a shape during between 1000ms to 10000ms, according to your setting
       at 2.2. After this duration set with UI (see 2.2; default: 3 000ms), the last selected
       shape becomes your decision, and the game also decides your opponent’s
       shape based on a random function. Also, the game should show your and the
       opponent’s decisions with outstretched hand sprites simultaneously (see Fig. 1).
    5.4. Using the time bar (Fig. 1D), you need to visualize the progression of time while
       selecting the shape (e.g., the leftmost of the bar indicates 0ms and the rightmost
       indicates 3000ms).
    5.5. Game rule: The game has only three possible outcomes other than a tie: a
       player who decides to play rock will beat another player who has chosen
       scissors ("rock crushes scissors") but will lose to one who has played paper
       ("paper covers rock"); a play of paper will lose to a play of scissors ("scissors cut
       paper"). If both players choose the same shape, the game is tied and is usually
       immediately replayed to break the tie.
    5.6. For each fight, you must show the outcome messages (e.g., 'Victory!', "Draw" or
       “You Lose _”_ )
    5.7. For each level (from L1 to L3), there will be 3 rounds. If you win 2 out of 3
       rounds, you win and get to go to the next level (Lv1 -> Lv2 -> Lv3).
6. You must play wave files in two different situations:


```
6.1. When the user tap the selection bubble: 'select.wav'
6.2. When the rock scissor paper results between you and enemy have been shown:
'result.wav'.
```
7. If you successfully win on Level 3, it should take you to the Ending Scene.
8. For these three levels, you must use different sprites and backgrounds respectively
    (see 2.3).
9. At the top of the game screen (Hide your mobile status bar), there should be a
    display of the followings (Fig. 1):

