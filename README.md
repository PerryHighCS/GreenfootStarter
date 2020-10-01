# Instructions

Use this as a starter to create Greenfoot magic.

Import this project into repl.it and you will have a starting point for making games. Just add code!

`MyWorld.jav`a is the starting point and a simple sample world. If you want to start in a different world,
change the `main.class` in `settings/standalone.properties`. The game's title can be changed in that file
as well.

If you want to change the speed of the game, it can be adjusted in `settings/project.greenfoot`. The
`simulation.speed` can be anything from 0 (paused) to 100 (lookout!).

One difference from the Greenfoot IDE is that all worlds and actors need to specify their image in code.
In the constructor for each actor, add a `setImage()` call and pass in the path to the image 
(`"/images/..."`). Worlds should have a call to `setBackground()` with the path to the background
image for the world.
