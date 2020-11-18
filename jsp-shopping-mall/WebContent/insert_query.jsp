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
				
				
				//랜덤 값 넣기
				  	//for(int i=0; i<100; i++) {
					//int COL1 = (int)(Math.random() * 100);
					//int COL2 = (int)(Math.random() * 100);
					//int COL3 = (int)(Math.random() * 100);
					//int COL4 = (int)(Math.random() * 100);
					
					//String insert_query = "INSERT INTO MORUGATSUYO(ID, COL1, COL2, COL3, COL4) VALUES(" + i + "," + COL1 + "," + COL2 + "," + COL3 + "," + COL4 + ")";
					//System.out.println(insert_query);
					
					//insert_stmt.executeQuery(insert_query);
					
				//}
				
				  	
				// 평균
				String select_query = "SELECT ID, COL1, COL2, COL3, COL4 FROM MORUGATSUYO WHERE AVG_COL IS NULL";
				ResultSet rs = select_stmt.executeQuery(select_query);
				
				while(rs.next()) {
					int COL1 = rs.getInt("COL1");
					int COL2 = rs.getInt("COL2");
					int COL3 = rs.getInt("COL3");
					int COL4 = rs.getInt("COL4");
					int ID = rs.getInt("ID");
					
					String update_query = "UPDATE MORUGATSUYO SET AVG_COL = %d WHERE ID = %d";
					
					System.out.println(String.format(update_query, (COL1 + COL2 + COL3 + COL4) / 4, ID));
					
					update_stmt.executeQuery(String.format(update_query, (COL1 + COL2 + COL3 + COL4) / 4, ID));
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