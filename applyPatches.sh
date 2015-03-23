#This applys the direct patches to your local mcp directory
#This uses diff & patch, not git diff

#Change directory to direct, so we can get the patches
mkdir -p direct
cd direct

#Go through all the patch files in the direct folder
for patch in *.patch
do

  #Go to the NMS folder from MCP
  cd ../mcp/src/minecraft_server/net/

  #Apply patches to NMS (Will this work it it's not in the same directory?)
  patch -p6 < patch
  echo Applied $patch

done

echo Patches applied! 

#Go back to the source folder
cd ../../../
