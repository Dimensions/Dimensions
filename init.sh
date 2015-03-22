#This file is to be run before you do anything

#Copy NMS source to compare for patches later
cp -a mcp/src/minecraft_server/ mcp/src/old_nms

echo Done copying NMS source

#Copy indirect code into NMS
cp indirect/ mcp/src/minecraft_server/

echo Done moving indirect code into NMS

#Apply the direct patches to NMS
applyPatches.sh
