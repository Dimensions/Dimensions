#!/bin/bash

#Shell script for Dimensions
#Licensed under the MIT License

dim_help() {
    echo "Usage: $0 <command>"
    echo "Available commands:"
    command -v column >/dev/null 2>&1 && cmd="column -t -s -" || cmd=cat
    $cmd <<<'
  help - Show this help page.
  init - Copy direct & indirect into mcp and setup Solar.
  update - Update from the repo.
  build - Make files ready to commit.
  export - Export the obfuscated code to put into a jar.' #' <- fix GitHub syntax highlighting
}

dim_export(){
    cd mcp/temp
    echo "Faking client look to fix MCP derp."
    echo "" > client_meta.log
    cd ..
    echo "Recompiling NMS..."
    runtime/bin/python/python_mcp runtime/recompile.py --server #Only need to recompile the server.
    echo "Reobfuscating NMS..."
    runtime/bin/python/python_mcp runtime/reobfuscate.py --server #Only need to ReObf the server.
	cd ..
    echo "Moving files..."
    mkdir -p out
    mkdir -p extraction/src/
    cp -a mcp/reobf/minecraft_server out
    cd out
    zip -r dimensions.zip *
    
    echo "Extracting Jar..."
    cd ../
    cp mcp/jars/minecraft_server.jar extraction/mc-s.jar
    cd out
    jar xf mc-s.jar
    rm mc-s.jar
    cd ..
    cp -a mcp/reobf/minecraft_server extraction/src
    cd extraction
    zip -r dimensions.zip *
    cd ..
    mv extraction/dimensions.zip out/dimensions.jar
    rm -rf extraction

    echo "The available jar is in out/dimensions.jar."
    echo "> This includes the Minecraft Server, so   "
    echo "> you can double-click it to run it.       "
}

dim_init(){

    echo "Downloading necessary files..."
    mkdir mcp/
    cd mcp
    echo "> Downloading MCP..."
    curl -sS http://www.modcoderpack.com/website/sites/default/files/releases/mcp910.zip > mcp.zip
    unzip mcp.zip
    rm mcp.zip
    cd jars
    echo "> Downloading Minecraft Server Jar..."
    curl -sS http://s3.amazonaws.com/Minecraft.Download/versions/1.8/minecraft_server.1.8.jar > minecraft_server.jar
    cd ../../mcp
    echo "> Decompiling NMS..."
    runtime/bin/python/python_mcp runtime/decompile.py --server #Only need the server decompiled.

    echo "Initilaizing the Dimensions server..."
    cd ..
	
    echo "> Making a local copy of the NMS source..."
    mkdir -p mcp/src/dev_nms
    cp -a mcp/src/minecraft_server/net/ mcp/src/dev_nms/net/

    echo "> Setting up Solar..."
    git submodule update --init

    echo "> Moving Solar into NMS..."
    cp -a Solar/src/dimensions mcp/src/minecraft_server/

    echo "> Copying indirect code into NMS..."
    mkdir -p indirect/dimensions
    cp -a indirect/dimensions/ mcp/src/minecraft_server/
    
    echo "> Initializing NMS..."
    cd mcp/src/minecraft_server/net/
    git init
	git add -A 
	git commit -m "Initial Commit"
    git checkout -b dimensions
    cd ../../../../

    update
}

dim_apply() {
    mkdir -p mcp/src/minecraft_server/net/direct/
    cp -a direct/ mcp/src/minecraft_server/net/
    cd mcp/src/minecraft_server/net/
    git am direct/*.patch
    cd ../../../../
}

update() {
    cp -a mcp/src/dev_nms/net/ mcp/src/minecraft_server/net/
    echo ">> Updating Solar..."
    git submodule update --init
	cp -a Solar/src/dimensions mcp/src/minecraft_server/
	echo ">> Updating indirect code..."
    cp -a indirect/dimensions/ mcp/src/minecraft_server/
    echo ">> Applying patches to MCP..."
    dim_apply
}

dim_update(){
    git pull https://github.com/Dimensions/Dimensions master
    update
}

dim_build(){
    #Run when you want to get your code ready to commit

    echo "Moving indirect code..."
    mkdir -p indirect/dimensions/solar

    #Copy indirect files from NMS into indirect/
    cp -a mcp/src/minecraft_server/dimensions/ indirect/

    #Copy Solar code into Solar
    echo "Moving Solar code into Solar/src/dimensions/solar/"
    cp -a indirect/dimensions/solar/ Solar/src/dimensions/
    #Remove everything from old solar folder
    rm -rf indirect/dimensions/solar/
    
    #Build patches into direct/
    echo "Recreating patches for MCP..."
    cd mcp/src/minecraft_server/net/
    git format-patch --root -o direct
	rm direct/0001-Initial-Commit.patch #We don't need this one
    cd ../../../../
    cp -a mcp/src/minecraft_server/net/direct/ ./
	rm -rf mcp/src/minecraft_server/net/direct/
}

dim_setup-eclipse(){
    echo "Moving files into eclipse/Server/..."
    mkdir -p mcp/eclipse/Server/src
    cp -a mcp/src/minecraft_server/net mcp/eclipse/Server/src
    cp -a mcp/src/minecraft_server/dimensions mcp/eclipse/Server/src
    cp -a mcp/jars mcp/eclipse/Server
}

if [ -z $* ]
then
    dim_help
elif [ "$(type -t "dim_$1")" = "function" ]
then
    "dim_$@"
elif [ "$(type -t "dim_$1_$2")" = "function" ]
then
    "dim_$1_$2"
else
    dim_help
fi 