# GrappleGun2D in Godot(just a demo)
This is a simple demo of a Grapple Gun 2D i made in Godot.  
*At first it had some problems with tilemaps but finally i fixed it(somehow)*

btw **feel free to copy scripts and use it in your project :)**

I made it using a node(built in Godot) called : **"DampedSpringJoint2D"** (i named it Grapple Gun in the project)
  
## How it works?  
I actually made a StaticBody2D(i named it **Cursor** in the project) and assigned it as Node_B in the DampedSpringJoint2D  
And i just made a RigidBody2D(i named it **Box** in the project) and assigned it as Node_A in the DampedSpringJoint2D  
## Why it works?  
Actually when mouse clicked and if the ray is colliding then i just changed the position of the Cursor to the collision point of our Raycast  
And also to make it work i had to change the rotation and fix the positions of the DampedSpringJoint2D  

**Note: i also added a bit of post processing (not much) and also a bit of particles :)**  

This is **not an addon(*not yet*)** so you might need to download and figure out a way to use these code in your game manually  


if you are interested and got a bit of time, feel free to check out [my channel](https://www.youtube.com/channel/UC7muK7PXkSGUoRtTZxwOh4Q)  
i normally upload **GameDev** related stuff and also **Music(sometimes)**  

this project is also an *updated* version of on of my video : [Grappling Gun 2D in Godot [in 2 minute]](https://youtu.be/XhaCuXV99ds)  
