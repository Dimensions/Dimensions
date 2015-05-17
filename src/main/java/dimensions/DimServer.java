package dimensions;

import dimensions.solar.Server;

public class DimServer implements Server {

    private final String name;
    private final String motd;
    private final String version;

    public Server(String name, String motd, String version){
        this.name = name;
        this.motd = motd;
        this.version = version;
    }

    public String getName(){
        return name;
    }

    public String getMOTD(){
        return motd;
    }

    public String getVersion(){
        return version;
    }

}
