# Special Mentions

NOT WINDOWS FREINDLY (to fix at some point)

Based off Open Source Lan:

https://github.com/OpenSourceLAN/gameservers-docker

Credit to SirSquidness & Piorax for there massive support

# Current Setup

Set up to Work With Minecraft Version 1.17 this can be changed via editing files. 

When player connect they are allocated a plot and they can only build in that plot.

I have disabled the use and creation of  egg's, golem's, minecart's and weither's due to players spawning mobs to lag out servers
This can be change see Customisation.

# ChatControlRed and PlotSquared

As the above moved from being free to a paid version you will need to download the file's yourself.

This means that you will need to manually bash in to the container and downlaod the file's

I have left the config files in place so you will only need to downlaod the pulgins

They can be found at the below links :

ChatControlRed:  https://www.mc-market.org/resources/18217/  
PlotSquared v5:  https://www.spigotmc.org/resources/plotsquared-v5.77506/ 

# Setup / Dynmap

To set up server run the following commands in console, wait till previous has completed before issuing next command:
1. /buildplotworld        // This generates the chuncks for plotworld
2. /buildworld            // This generates the chuncks for world
3. /buildrender           // This renders everything

once rendered Dynmap is on ServerIP:8123

Currently show's Pax AUS Logo Bottom-left and RFlan and LanSLIDE logo on the Bottom-right

# Troubleshooting
  
For players that have issues when logging in, To start building get them to issue the command /start,

If player marks polt as done /plot continue will allow them to continue,

To run a minecraft server command run : /minecraft:command,


# Customisation

To edit a live container use, docker exec -it bukkit_X bash (where X is you server no.)

To change Logo background:
 1.  Go to bukkit\plugins\dynmap\web\css\leaflet.css
 2.  Edit line 327 change color to desired color 
 3.  Edit like 328 change border to desied setting

To edit what items are banned:
1.  Go to bukkit\plugins\Essentials
2.  Edit config.yml

# List of things to fix

- Make it so that plot world can be configured to hosts liking
- Find a better way of managing Lag Machines
