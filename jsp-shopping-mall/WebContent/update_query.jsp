<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>update_query Example</title>
	</head>
	<body>
			<%
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
				
				Statement select_stmt=con.createStatement();
				Statement update_stmt=con.createStatement();
				Statement insert_stmt=con.createStatement();
				
				String select_query = "SELECT ID, A, B FROM EXAMPLE WHERE C IS NULL";
				ResultSet rs = select_stmt.executeQuery(select_query);
				while(rs.next()) {
					int A = rs.getInt("A");
					int B = rs.getInt("B");
					int ID = rs.getInt("ID");
					
					String update_query = "UPDATE EXAMPLE SET C = %d WHERE ID = %d";
					
					System.out.println(String.format(update_query, A + B, ID));
					
					update_stmt.executeQuery(String.format(update_query, A + B, ID));
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