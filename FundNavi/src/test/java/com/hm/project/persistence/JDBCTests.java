package com.hm.project.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

   static {
      try {
         Class.forName("oracle.jdbc.OracleDriver");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   @Test
   public void testConnection() {
      
      try (Connection con = DriverManager.getConnection("jdbc:log4jdbc:oracle:thin:@localhost:1521:MYORACLE", "sub",
            "sub")) {

         log.info(con);
      } catch (Exception e) {
         fail(e.getMessage());
      }
   }

}