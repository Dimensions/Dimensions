package net.dimensions;

import net.dimensions.api.Game;

import java.util.Random;

public class Dimensions implements Game {

	private static Random rand;

	public static void init() {
		System.out.println("Initializing Dimensions...");
		rand = new Random();
	}

	public static Random getRandom() {
		return rand;
	}
}
