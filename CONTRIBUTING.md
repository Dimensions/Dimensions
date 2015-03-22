#Contributing
Since Mojang doesn't allow us to distribute the decompiled source of minecraft, we can only open source the indirect implementation.

##MCP Workspace
###Setup
* Download MCP from http://modcoderpack.com/
* Put in the **CORRECT** version from http://mcversions.net/
* Run `decompile.bat` or `decompile.sh`
* Put in the code from Dimensions into `src/minecraft_server`
* Run `applyPatches.sh`

###Export
* Run `recompile.bat` or recompile.sh`
* Run `reobfuscate.bat` or `reobfuscate.sh`
* Get files from `reobf/minecraft_server`
* Put files into any vanilla jar!
