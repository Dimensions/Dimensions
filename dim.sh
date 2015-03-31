#!/bin/bash

dim_help() {
    echo "Usage: $0 <command>"
    echo "Available commands:"
    command -v column >/dev/null 2>&1 && cmd="column -t -s -" || cmd=cat
    $cmd <<<'
  help - Show this help page.
  init - Copy direct & indirect into mcp and setup Solar.
  update - Update from the repo.
  build - Make files ready to commit.
  export - Export the obfuscated code to put into a jar.'
}

dim_export(){
    #Recompile NMS
    mcp/recompile.sh

    #Reobfuscate NMS
    mcp/reobfuscate.sh	

    echo Grab the files in mcp/reobf/minecraft_server/ and put them into any vanilla jar!
}

dim_init(){

    echo "Downloading necessary files..."
    mkdir mcp/
    cd mcp
    curl -sS http://www.modcoderpack.com/website/sites/default/files/releases/mcp910.zip > mcp.zip
    unzip mcp.zip
    rm mcp.zip
    cd jars
    curl -sS http://s3.amazonaws.com/Minecraft.Download/versions/1.8/minecraft_server.1.8.jar > minecraft_server.jar
    cd ../../
    
    echo "Decompiling NMS..."
    mcp/decompile.sh

    echo "Initilaizing the Dimensions server..."

    echo "Making a local copy of the NMS source..."
    mkdir -p mcp/src/old_nms
    cp -a mcp/src/minecraft_server/net/ mcp/src/old_nms/net/

    echo "Setting up Solar..."
    cd Solar
    git submodule init
    git submodule update
    cd ..

    echo "Moving Solar into NMS..."
    cp -a Solar/src/dimensions mcp/src/minecraft_server/

    echo "Copying indirect code into NMS..."
    mkdir -p indirect/dimensions
    cp -a indirect/dimensions/ mcp/src/minecraft_server/
    
    echo "Initializing NMS..."
    cd mcp/src/minecraft_server/net/
    git init
    git checkout -b dimensions
    cd ../../../../

    update
}

apply_patches() {
    mkdir -p mcp/src/minecraft_server/net/direct-patches/
    cp -a direct/ mcp/src/minecraft_server/net/direct-patches/
    cd mcp/src/minecraft_server/net/
    git am direct-patches
    cd ../../../../
}

update() {
    echo "> Updating Solar..."
    git submodule update --init
    echo "> Applying patches to MCP..."
    apply_patches
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
    echo Moving Solar code into Solar/src/dimensions/solar/
    cp -a indirect/dimensions/solar/ Solar/src/dimensions/
    #Remove everything from old solar folder
    rm -rf indirect/dimensions/solar/
    
    #Build patches into direct/
    echo "> Recreating patches for MCP..."
    cd mcp/src/minecraft_server/net/
    git format-patch -o direct-patches master
    cd ../../../../
    cp -a mcp/src/minecraft_server/net/direct-patches/ direct/
    rm -rf mcp/src/minecraft_server/net/direct-patches/
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