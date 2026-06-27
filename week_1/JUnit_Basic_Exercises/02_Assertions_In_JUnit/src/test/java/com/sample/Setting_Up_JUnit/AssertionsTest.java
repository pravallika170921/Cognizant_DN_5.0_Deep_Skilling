package com.sample.Setting_Up_JUnit;

import static org.junit.Assert.*;
import org.junit.Test;

public class AssertionsTest {

    @Test
    public void testAssertions() {

        assertEquals(30, 15 + 15);     // expected, actual

        assertTrue(6 > 3);             // true condition

        assertFalse(1 > 7);            // false condition

        String name = null;
        assertNull(name);              // should be null

        String course = "JUnit_Test";
        assertNotNull(course);         // should not be null
        
        //fail test for understanding
        assertEquals(15, 3+5);
    }
}