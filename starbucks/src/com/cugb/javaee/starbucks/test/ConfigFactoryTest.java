package com.cugb.javaee.starbucks.test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;

import com.cugb.javaee.starbucks.utils.ConfigFactory;

class ConfigFactoryTest {

	@BeforeEach
	void setUp() throws Exception {
	}
	
	@Test
	void test() {
		assertEquals("root", ConfigFactory.readProperty("username"));
	}

}
