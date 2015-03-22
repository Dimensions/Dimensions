#This applys the direct patches to your local mcp directory
#This uses diff & patch, not git diff

#Change directory to direct, so we can get the patches
cd direct

#Go through all the patch files in the directory
for patch in *.patch; do

  #Go back to the NMS source from MCP
  cd ../mcp/src/minecraft_server

  #Apply patches to NMS (Will this work it it's not in the same directory?)
  patch -p4 < patch

;done