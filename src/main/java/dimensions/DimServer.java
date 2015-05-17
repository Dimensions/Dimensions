package dimensions;

import net.dimensions.api.Server;

public class DimServer implements Server {

	private final String name;
	private final String motd;
	private final String version;

	public DimServer(String name, String motd, String version) {
		this.name = name;
		this.motd = motd;
		this.version = version;
	}

	public String getName() {
		return name;
	}

	public String getMotd() {
		return motd;
	}

	public String getVersion() {
		return version;
	}

}
