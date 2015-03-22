#This file is to be run before you do anything

#Copy NMS source to compare for patches later
cp -a mcp/src/minecraft_server/ mcp/src/old_nms

#Copy indirect code into NMS
cp indirect/ mcp/src/minecraft_server/

#Apply the direct patches to NMS
applyPatches.sh
