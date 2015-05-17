package solar.dimensions;

import java.util.Random;
import java.lang.IllegalStateException;

import solar.dimensions.api.Game;

public class Dimensions implements Game {

    private static Random rand = null;
    private static Dimensions instance = null;

    private DimServer server;

    private Dimensions() {
        if(instance != null) {
            throw new IllegalStateException("Instance is already defined");
        }
        instance = this;   
    }

    public DimServer getServer() {
        return server;
    }

    public static void init() {
        log("Initializing Dimensions...");
        rand = new Random();
        new Dimensions();
    }

    public static Random getRandom() {
        return rand;
    }

    public static Dimensions getInstance() {
        return instance;
    }

    public static void log(String message) {
        System.out.println("[Dimensions] " + message);
    }

}
