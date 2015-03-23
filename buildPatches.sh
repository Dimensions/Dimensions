#Build patch files from edited NMS source code

mkdir -p direct
diff -rupNd mcp/src/old_nms/net/ mcp/src/minecraft_server/net/ > direct/nms.patch
#TODO: Find a way to have patches for each file

echo Patches created in direct/nms.patch
