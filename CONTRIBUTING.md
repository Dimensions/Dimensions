#Contributing
Since Mojang doesn't allow us to distribute the decompiled source of minecraft, we can only open source the indirect implementation.

There are two parts to Dimensions, the *indirect implementation* and the *direct implementation*. The *indirect* is the open Java source code, while the *direct* is a group of Diff patches to NMS. Using this, we are able to completely open source Dimensions without open sourcing Minecraft.

##Pulling
You're going to need a shell, I suggest [Git Bash](http://git-scm.com/downloads).
* Go into a folder
* Initialize Git: `git init`
* Add the remote: `git remote add dim https://github.com/dimensions/dimensions`
* Pull: `git pull dim master`


##MCP Workspace
###Setup
* Download MCP from http://modcoderpack.com/
* Unzip the files and put them in a new folder called `mcp/`
* Download a 1.8 jar from http://mcversions.net
* Name the jar to `minecraft_server.jar` and put it in `mcp/jars`
* Run `decompile.bat` or `decompile.sh`
* Put in the code from Dimensions into `src/minecraft_server`
* Run `applyPatches.sh`

###Export
* Run `recompile.bat` or recompile.sh`
* Run `reobfuscate.bat` or `reobfuscate.sh`
* Get files from `reobf/minecraft_server`
* Put files into any vanilla jar!
