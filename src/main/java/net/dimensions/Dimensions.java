package net.dimensions;

import java.util.Random;

public class Dimensions {

    private static Random rand;

    public static void init() {
        System.out.println("Initializing Dimensions...");
        rand = new Random();
    }

    public static Random getRandom(){
        return rand;
    }
}
