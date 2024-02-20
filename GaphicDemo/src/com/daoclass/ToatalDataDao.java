package com.daoclass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.beanclass.AllDataTable;
import com.beanclass.StokeYear;
import com.graphicconnection.DBConnection;

public class ToatalDataDao {

	
	 public ArrayList<AllDataTable> showAllCases() {
	        ArrayList<AllDataTable> ccode2 = new ArrayList<>();
	        try {
	            Connection con = DBConnection.getcon();
	            if (con == null) {
	                System.out.println("Failed to obtain a database connection.");
	                return ccode2; // Return empty list or handle error accordingly
	            }
	            PreparedStatement ps = con.prepareStatement(" select left(diagOfStroke, 4) as Year,count(*) as 'Active Cases' from hbsr_coreform where left(diagOfStroke, 4) not in('0202','1801','9999','') group by left(diagOfStroke, 4) ;");
	            ResultSet rs = ps.executeQuery();
	            System.out.println("Executing query...");

	            while (rs.next()) {
//	                String centerCodeValue = rs.getString("Year");
//	                if (centerCodeValue != null) {
//	                 AllDataTable adt=new AllDataTable();
//	                   adt.setYear(centerCodeValue);
//	                   adt.setActivecase(activecase);
//	                    ccode2.add(adt);
//	                } else {
//	                    System.out.println("Encountered a null value for center code.");
//	                    // Decide how to handle null values, e.g., skip or log
//	                }
	            	   AllDataTable adt=new AllDataTable();
	            	   adt.setYear(rs.getString(1));
	            	   adt.setActivecase(rs.getString(2));
	            	   ccode2.add(adt);
	            }

	            //con.close(); // Close the connection after use

	            System.out.println("Query executed successfully.");
	            return ccode2;
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("An error occurred while processing the query: " + e.getMessage());
	            return ccode2; // Ensure to return ccode in case of exception
	        }
	    }

	
}
