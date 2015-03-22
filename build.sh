#Run when you want to get your code ready to commit

#Copy indirect files from NMS into indirect/
cp -a mcp/src/minecraft_server/dimensions indirect/dimensions
    #Should we keep the directory as "dimensions"?

echo Indirect code moved into indirect folder

#Build patches into direct/
buildPatches.sh
