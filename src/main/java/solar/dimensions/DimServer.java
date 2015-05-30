package solar.dimensions;

import java.util.List;
import java.util.UUID;

import solar.dimensions.api.Server;
import solar.dimensions.api.entity.Player;

public class DimServer implements Server {

    private String name;
    private String motd;
    private final String version;

    public DimServer(String name, String motd, String version){
        this.name = name;
        this.motd = motd;
        this.version = version;
    }

    public String getName(){
        return name;
    }

    public String getMotd(){
        return motd;
    }

    public String getVersion(){
        return version;
    }

	@Override
	public int getMaxPlayers() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Player> getOnlinePlayers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Player> getPlayers(String... names) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Player> getPlayers(UUID... uuids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Player getPlayer(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Player getPlayer(UUID uuid) {
		// TODO Auto-generated method stub
		return null;
	}

}
