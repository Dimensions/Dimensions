package dimensions;

import java.util.Random;

import dimensions.solar.Game;

public class Dimensions extends Game {

    private static Random rand;

    public static void init() {
        System.out.println("Initializing Dimensions...");
        rand = new Random();
    }

    public static Random getRandom(){
        return rand;
    }
}
