Game Controls & Files
•	Left key to push the plane right
•	Right key to push the plane left
•	C key to turn the turret right
•	Z key to turn the turret left
•	Space key to fire
•	ENTER key to start the game
•	R key to restart the game
•	TANK_WARS is the main file.
•	HighScoreFile is a Txt file which saves the high score.
•	images folder has all the Images for the game.
Code Screenshots & Explanation
When I started building the game, I initially used an if-else statement to navigate different game modes. However, after looking into switch cases, I found that this approach was better. 
One of the hardest tasks was to turn the turret of the tank. I used resources from Moodle and YouTube to find the solution, but I still had to do a lot of tinkering to get it right.
 
When a key is pressed, the value of rotationmove (5) is added to or subtracted from swing, which determines the rotation angle of the turret. Before passing swing to the rotate function, it needs to be converted to radians, as the rotate function requires the angle in radians to correct ly adjust the turret's direction.
 
During the development of my game, I encountered issues with the bullet mechanics. Specifically, the bullets were not aligning with the direction of the tank's gun and exhibited errors after being fired. To resolve these problems, I adjusted the bullet instantiation within the Tankplayer class, directly passing in the appropriate angle values. This ensured that the bullets correctly followed the gun's orientation and moved as intended. By refining the bullet's direction and updating the mechanism, I was able to achieve accurate and consistent projectile behaviour, improving the overall gameplay experience.  
 
Another major issue was related to restarting the game. Initially, the game would not restart properly because I was checking if the game was over by checking the player's lives. If the ArrayList is empty the player has gone through all his life the game is over.  
 

However, when the game is restarted the ArrayList was still empty and all the variables still had the previous values in them, causing the game to malfunction. To fix this, I implemented a solution where, if the player clicks "r" and the lifeImages ArrayList is empty, the score, level, and other relevant data are reset.
 
Additionally, a function from the UI is called to reset the ArrayList by adding back three lives for the player. 
 
I also had difficulties with the spawning of enemies, so I used the millis() function in Processing to keep track of time. 
And I also created two new variables: lastAddedTime and addInterval. lastAddedTime tracks when the last enemy was added, while addInterval specifies the interval between each enemy spawn. The code calculates the difference between the current time, using millis(), and lastAddedTime. If this difference is greater than or equal to addInterval, a new enemy is spawned, and lastAddedTime is updated to the current time. This mechanism ensures that enemies are generated at regular intervals, with the spawning frequency adjusted according to the game level. The levels are managed by another function called levelUp, which selects different cases to reduce the spawn interval as the player progresses.
 
Another small bug occurred when the player's Caps Lock was on, causing the keys to not work because I only used lowercase. I fixed this with an 'or' statement to ensure that both capital and lowercase letters function properly.
