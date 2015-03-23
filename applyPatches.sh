#This applies the direct patches to your local mcp directory
#This uses diff & patch, not git diff

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
  echo Applied $patch

done

echo Patches applied! 

#Go back to the source folder
cd ../../../
