#This applies the direct patches to your local mcp directory
#This uses diff & patch, not git diff

#Because you're never too safe.
mkdir -p mcp/src/orig_nms
cp -a mcp/src/old_nms/net/ mcp/src/orig_nms/

#Change directory to direct, so we can get the patches
mkdir -p direct
cd direct

#Go through all the patch files in the direct folder
for patch in *.patch
do

  #Go to the NMS folder from MCP
  cd ../

  #Apply patches to NMS (Putting them in old_nms for some reason...)
  patch -p0 < direct/$patch

done

echo Patches applied!

#Copy back over
cp -a mcp/src/old_nms/net/ mcp/src/minecraft_server/
cp -a mcp/src/orig_nms/net/ mcp/src/old_nms/
rm -rf mcp/src/orig_nms

echo Files copied over