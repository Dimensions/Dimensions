#This file is to be run before you do anything

echo This is the initialization script for Dimensions.

#Copy NMS source to compare for patches later
mkdir -p mcp/src/old_nms
cp -a mcp/src/minecraft_server/net/ mcp/src/old_nms/net/

echo Done copying NMS source

#Set up Solar submodule
cd Solar
git submodule init
git submodule update
cd ..

echo Solar set up

#Copy Solar API into NMS
cp -a Solar/indirect/dimensions mcp/src/minecraft_server/

echo Done moving Solar code into NMS

#Copy indirect code into NMS
mkdir -p indirect/dimensions
cp -a indirect/dimensions/ mcp/src/minecraft_server/

echo Done moving indirect code into NMS

#Apply the direct patches to NMS
#applyPatches.sh
