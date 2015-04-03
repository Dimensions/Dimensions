#Contributing
There are two parts to Dimensions, the *indirect implementation* and the *direct implementation*. The *indirect* is the open Java source code, while the *direct* is a group of Diff patches to NMS. Using this, we are able to completely open source Dimensions without open sourcing Minecraft.

##Requirements
* You're going to need a shell, I suggest [Git Bash](http://git-scm.com/downloads).
* [Java 7](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html), this may change to 8 later.
* ~~Python~~ We use the internal Python shipped with MCP!

##Cloning
* Run `git clone https://github.com/dimensions/dimensions Dimensions`
* You can go into that folder using `cd Dimensions`


##Workspace
###Setup
* Run `dim.sh init` from the root folder
* Wait 5-10 minutes
* Open `mcp/src/minecraft_server/` in your IDE

###Making Changes
####Indirect
* Make changes to `indirect/`
* Commit from the root folder

####Direct
* Go into the NMS files `cd mcp/src/minecraft_server/net/`
This is another git repository (a repo in a repo) which has two branches, `master` and `dimensions`. You don't want to touch the `master` branch, it's used for making patches. 
* Make commits on the `dimensions` branch.
Each of these commits will become a `.patch` file once you `dim.sh build`.

###Export Obfuscated Code
* Run `dim.sh export`
* Get files from `mcp/reobf/minecraft_server/`
* Put files into any vanilla jar!

###Building
* Run `dim.sh build`
* Commit & Push!
