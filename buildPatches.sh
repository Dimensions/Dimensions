#Build patch files from edited NMS source code

diff -rupN mcp/src/old_nms mcp/src/minecraft_server/ > direct/nms.patch
#TODO: Find a way to have patches for each file

echo Patches created in direct/nms.patch
