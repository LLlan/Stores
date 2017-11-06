package com.yizhan.test;

import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class Test {

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		Thumbnails.of("e:/abc/111.jpg").size(375,220).outputQuality(0.5f).toFile("e:/abc/222.jpg");
	}

}
