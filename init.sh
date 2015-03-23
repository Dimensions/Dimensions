#This file is to be run before you do anything

#Copy NMS source to compare for patches later
cp -a mcp/src/minecraft_server/net/ mcp/src/old_nms/net/

echo Done copying NMS source

#Copy Solar API into NMS
cp Solar/indirect/ mcp/src/minecraft_server/

echo Done moving Solar code into NMS

#Copy indirect code into NMS
cp indirect/ mcp/src/minecraft_server/

echo Done moving indirect code into NMS

#Apply the direct patches to NMS
applyPatches.sh
