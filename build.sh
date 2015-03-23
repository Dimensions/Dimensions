#Run when you want to get your code ready to commit

#Copy indirect files from NMS into indirect/
cp -a mcp/src/minecraft_server/dimensions/ indirect/dimensions/
    #Should we keep the directory as "dimensions"?

echo Indirect code moved into indirect folder

#Copy Solar code into Solar
cp -a indirect/dimensions/solar/ Solar/indirect/dimensions/solar/
#Remove everything from old solar folder
rm -rf indirect/dimensions/solar/

echo Solar code moved into Solar/indirect/dimensions/solar/

#Build patches into direct/
buildPatches.sh
