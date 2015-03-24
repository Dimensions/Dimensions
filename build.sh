#Run when you want to get your code ready to commit

mkdir -p indirect/dimensions/solar

#Copy indirect files from NMS into indirect/
cp -a mcp/src/minecraft_server/dimensions/ indirect/

echo Indirect code moved into indirect folder

#Copy Solar code into Solar
cp -a indirect/dimensions/solar/ Solar/src/dimensions/
#Remove everything from old solar folder
rm -rf indirect/dimensions/solar/

echo Solar code moved into Solar/src/dimensions/solar/

#Build patches into direct/
buildPatches.sh
