# Special Mentions

NOT WINDOWS FREINDLY (to fix at some point)

Based off Open Source Lan:

https://github.com/OpenSourceLAN/gameservers-docker

Credit to SirSquidness & Piorax for there massive support
# Current Setup

When player connect they are allocated a plot and they can only build in that plot.

I have disabled the use/creation of of egg's and golems due to players spawning mobs to lag out servers
This can be change see Customisation.

Currently show Pax Logo Bottom-left and RFlan logo on the Bottom-right

# Setup / Dynmap

To set up server run the following commands in console, wait till previous has completed before issuing next command:
1. /buildplotworld        // This generates the chuncks for plotworld
2. /buildworld            // This generates the chuncks for world
3. /buildrender           // This renders everything

once rendered Dynmap is on <IP>:8123

# Troubleshooting
  
For players that have issues when logging in, To start building get them to issue the command /start

# Customisation

To edit a live container use, docker exec -it bukkit_X bash (where X is you server no.)

To change Logo background:
 1.  Go to bukkit\plugins\dynmap\web\css
 2.  Edit line 327 change color to desired color 
 3.  Edit like 328 change border to desied setting

To edit what items are banned:
1.  Go to bukkit\plugins\Essentials
2.  Edit config.yml

# List of things to fix

- Make it so plot world is generated on the creation of the server
- Make it so that plot world can be configured to hosts liking
- Find a better way of managing Lag Machines
