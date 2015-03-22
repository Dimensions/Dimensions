#Contributing
There are two parts to Dimensions, the *indirect implementation* and the *direct implementation*. The *indirect* is the open Java source code, while the *direct* is a group of Diff patches to NMS. Using this, we are able to completely open source Dimensions without open sourcing Minecraft.

##Pulling
You're going to need a shell, I suggest [Git Bash](http://git-scm.com/downloads).
* Go into a folder
* Initialize Git: `git init`
* Add the remote: `git remote add dim https://github.com/dimensions/dimensions`
* Pull: `git pull dim master`


##MCP Workspace
###Setup
* Download 1.8 MCP from http://modcoderpack.com/
* Unzip the files and put them in a new folder called `mcp/`
* Download a 1.8 jar from http://mcversions.net
* Name the jar to `minecraft_server.jar` and put it in `mcp/jars`
* Run `mcp/decompile.sh`
* Run `init.sh` from the root folder
* Open `mcp/src/minecraft_server` in your IDE
* Edit code

###Export Obfuscated Code
* Run `mcp/recompile.sh`
* Run `mcp/reobfuscate.sh`
* Get files from `mcp/reobf/minecraft_server`
* Put files into any vanilla jar!

##Building
* Run `build.sh`
* Commit & Push!
