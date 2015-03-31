#Contributing
There are two parts to Dimensions, the *indirect implementation* and the *direct implementation*. The *indirect* is the open Java source code, while the *direct* is a group of Diff patches to NMS. Using this, we are able to completely open source Dimensions without open sourcing Minecraft.

You're going to need a shell, I suggest [Git Bash](http://git-scm.com/downloads).

##Cloning
* Run `git clone https://github.com/dimensions/dimensions Dimensions`
* You can go into that folder using `cd Dimensions`


##Workspace
###Setup
* Run `dim.sh init` from the root folder
* Open `mcp/src/minecraft_server/` in your IDE
* Edit code

###Export Obfuscated Code
* Run `dim.sh export`
* Get files from `mcp/reobf/minecraft_server/`
* Put files into any vanilla jar!

###Building
* Run `dim.sh build`
* Commit & Push!
