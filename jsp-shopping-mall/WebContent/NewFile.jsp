<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border = "1">
			<tr>
				<td>ID</td>
				<td>가격</td>
				<td>개수</td>
			</tr>
		<%
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
				
				Statement select_stmt=con.createStatement();
				Statement update_stmt=con.createStatement();
				Statement insert_stmt=con.createStatement();
				
				String select_query = "SELECT ID, LOG FROM PURCHASE_LOG WHERE ";
				ResultSet rs = select_stmt.executeQuery(select_query);
				
				while(rs.next()) {
					int ID = rs.getInt("ID");
					String LOG = rs.getString("LOG");
									
					String update_query = "UPDATE PURCHASE_LOG SET ID = %d WHERE ID = %d";
					System.out.println(String.format(update_query, ID));
					
					//update_stmt.executeQuery(String.format(ID, ID));
					}
				
			  	
				con.close();
				}
	
				catch(Exception e) {
					System.out.println(e);
				}
			%>
		</table>	
	</body>
</html>