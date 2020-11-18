<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>query Example</title>
	</head>
	<body>
			<%
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
				
				Statement stmt=con.createStatement();
				
				int first_number = 1;
				int second_number = 1;
				
				for(int i=0; i<20; i++) {	
					String query = "INSERT INTO EXAMPLE(ID, A, B) VALUES("+ i + ", " + first_number + ", " + second_number + ")";
					System.out.println(query);
					
					stmt.executeQuery(query);
					
					int temp = first_number + second_number;
					first_number = second_number;
					second_number = temp;	
				}
				
				con.commit();
				con.close();
			}
			catch(Exception e){
				System.out.println(e);
			}
			%>
		
	</body>
</html>