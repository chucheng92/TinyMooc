package com.tinymooc.util;

import java.util.UUID;

public class UUIDGenerator {
	
	public static String randomUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");	
	}
}
