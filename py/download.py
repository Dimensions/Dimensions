import os
import urllib
import zipfile

def getUnzipped(theurl, thedir):
  name = os.path.join(thedir, 'temp.zip')
  try:
    name, hdrs = urllib.urlretrieve(theurl, name)
  except IOError, e:
    print "Can't retrieve %r to %r: %s" % (theurl, thedir, e)
    return
  try:
    z = zipfile.ZipFile(name)
  except zipfile.error, e:
    print "Bad zipfile (from %r): %s" % (theurl, e)
    return
  for n in z.namelist():
    dest = os.path.join(thedir, n)
    destdir = os.path.dirname(dest)
    if not os.path.isdir(destdir):
      os.makedirs(destdir)
    data = z.read(n)
    f = open(dest, 'w')
    f.write(data)
    f.close()
  z.close()
  os.unlink(name)

def main():
  print "> Downloading MCP..."
  getUnzipped("http://www.modcoderpack.com/website/sites/default/files/releases/mcp910.zip", "mcp")
  print "> Downloading Minecraft 1.8..."
  mc18= urllib.URLopener()
  mc18.retrieve("https://s3.amazonaws.com/Minecraft.Download/versions/1.8/minecraft_server.1.8.jar", "mcp/jars/minecraft_server.jar")

if __name__ == "__main__":
    main()
