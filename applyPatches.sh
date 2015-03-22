#This applys the direct patches to your local mcp directory
#This uses diff & patch, not git diff

#Change directory to direct, so we can get the patches
cd direct

#Go through all the patch files in the direct folder
for patch in *.patch; do

  #Go to the NMS folder from MCP
  cd ../mcp/src/minecraft_server

  #Apply patches to NMS (Will this work it it's not in the same directory?)
  patch -p4 < patch
  #-p4 because we want to go net>minecraft>server>XYZ>code.java

;done

#Go back to the source folder
cd ../../../
