<%@page import="java.util.Properties"%>
<%@page import="com.sun.xml.internal.bind.v2.model.core.ID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>JSP</title>
	</head>
	<body>
		
		<%for (int i=0; i <= 5; i++) {
			%><br><%
			for(int j=0; j <= i; j++) {
				%><a>*</a><%
			}
		}
		%><br><%
		%>
		
		<% String a = "나는 스트링입니다!!!"; %>
		
		<a> A는 무슨 글자일까요?? 정답은 : <%=a %> </a>
		
		<table border="1">
		<%
		int A = 1;
		int B = 1;
		int temp = A + B;
		
		for(int i=0; i<1; i++) {
    		for(int j=0; j<11; j++) {
    			%><tr><%
        		for(int k=0; k<3; k++) {        			
		    		A = B;
		    		B = temp;
		    		temp = A + B;
    				%><td><%= temp %></td><%
        		}
    		}
		}
    	%>
		</table>
		
		<table border="1">
		<%
			for(int i=0; i<=10; i++) {
				%><tr><%
				for(int j=9; j<= 10; j++) {
					%><td><%
				}
				%><tr><%
			}
		%>
		</table>
		
		<table border="1">
		<%
			for(int i=1; i <= 9; i++) {
				%><tr><%
				for(int j = 1; j <= 9; j++) {
					%><td><%=i%> X <%=j %> = <%= i*j %></td><%
				}
				%><tr><%
			}
		%>
		</table>
		
		<table border="1">
		<%
			for(int i=1; i <= 5; i++) {
				%><tr><%
				for(int j = 5; j >= 1; j--) {
					%><td><%
					if(i>=j){
						%>*<%
					}
					%><td><%
				}
			}
		%>
		</table>
		
		<table border="1">
		<%
			for(int i=1; i <= 5; i++) {
				%><tr><%
				for(int j = 1; j <= 5; j++) {
					%><td><%
					if(i>=j){
						%>*<%
					}
					%><td><%
				}
			}
		%>
		</table>
		
		<table border="1">
		<%
			for(int i=5; i >= 1; i--) {
				%><tr><%
				for(int j = 1; j <= 5; j++) {
					%><td><%
					if(i>=j){
						%>*<%
					}
					%><td><%
				}
			}
		%>
		</table>
		
		<table border="1">
		<%
			for(int i=1; i <= 5; i++) {
				%><tr><%
				for(int j = 1; j <= 5; j++) {
					%><td><%
					if(i<=j){
						%>*<%
					}
					%><td><%
				}
			}
		%>
		</table>
		
		<table border="1">
		<%
			for(int i=3; i <= 5; i++) {
				%><tr><%
				for(int j = i; j >= 1; j--) {
					%><td><%
					if(i<=j){
						%>*<%
					}
					%><td><%
				}
			}
		%>
		</table>
		
		<table border = "1">
			<tr>
				<td>ID</td>
				<td>카테고리ID</td>
				<td>이름</td>
				<td>가격</td>
				<td>재고</td>
				<td>설명</td>
				<td>원산지</td>
			</tr>
		<%
			try {
				//step1 load the driver class
				Class.forName("oracle.jdbc.driver.OracleDriver");
	
				//step2 create  the connection object
				Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
	
				//step3 create the statement object
				Statement stmt=con.createStatement();
	
				//step4 execute query
				String query = "SELECT " +
									"PRODUCT.ID, CATEGORY.NAME AS CATEGORY_NAME, PRODUCT.NAME AS PRODUCT_NAME, PRODUCT.PRICE, PRODUCT.STOCK, PRODUCT.DESCRIPTION, PRODUCT.ORIGIN " +
								"FROM " +
									"PRODUCT, CATEGORY " +
								"WHERE " +
									"PRODUCT.CATEGORY_ID = CATEGORY.ID";
	
				ResultSet rs=stmt.executeQuery(query);  
				while(rs.next()) {
					%><tr><%
						%><td><%=rs.getInt("ID")%></td><%
						%><td><%=rs.getString("CATEGORY_NAME")%></td><%
						%><td><%=rs.getString("PRODUCT_NAME")%></td><%
						%><td><%=rs.getInt("PRICE")%></td><%
						%><td><%=rs.getInt("STOCK")%></td><%
						%><td><%=rs.getString("DESCRIPTION")%></td><%
						%><td><%=rs.getString("ORIGIN")%></td><%
					%><tr><%
				}
	
				//step5 close the connection object
				con.close();
				}
	
				catch(Exception e) {
					System.out.println(e);
				}
			%>
			</table>
			
			<table border = "1">
				<tr>
					<td>ID</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>이메일</td>
					<td>전화번호</td>
					<td>주소</td>
					<td>나이</td>
				</tr>
			<%
				try {
					//step1 load the driver class
					Class.forName("oracle.jdbc.driver.OracleDriver");
		
					//step2 create  the connection object
					Connection con=DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
		
					//step3 create the statement object
					Statement stmt=con.createStatement();
		
					//step4 execute query
					String query = "SELECT " +
										"MEMBER.ID, MEMBER.PASSWORD, MEMBER.NAME, MEMBER.EMAIL, MEMBER.PHONE, MEMBER.ADDRESS, AGE " +
									"FROM " +
										"MEMBER ";
		
					ResultSet rs=stmt.executeQuery(query);  
					while(rs.next()) {
						%><tr><%
							%><td><%=rs.getInt("ID")%></td><%
							%><td><%=rs.getString("PASSWORD")%></td><%
							%><td><%=rs.getString("NAME")%></td><%
							%><td><%=rs.getString("EMAIL")%></td><%
							%><td><%=rs.getString("PHONE")%></td><%
							%><td><%=rs.getString("ADDRESS")%></td><%
							%><td><%=rs.getInt("AGE")%></td><%
						%><tr><%
					}
		
					//step5 close the connection object
					con.close();
					}
		
					catch(Exception e) {
						System.out.println(e);
					}
					%>
			</table>
		
		<table border = "1">
			<tr>
				<td>ID</td>
				<td>가격</td>
				<td>개수</td>
			</tr>
		<%
			try {
				//step1 load the driver class
				Class.forName("oracle.jdbc.driver.OracleDriver");
	
				//step2 create  the connection object
				Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
	
				//step3 create the statement object
				Statement stmt=con.createStatement();
	
				//step4 execute query
				String query = "SELECT " +
									"PRODUCT.ID, PRODUCT.PRICE, PAYMENT_HISTORY.ORDER_COUNT " +
								"FROM " +
									"PRODUCT, PAYMENT_HISTORY " +
								"WHERE " +
									"PRODUCT.ID = PAYMENT_HISTORY.ID ";
								
				ResultSet rs=stmt.executeQuery(query);
				
				while(rs.next()) {
					%><tr><%
						%><td><%=rs.getInt("ID")%></td><%
						%><td><%=rs.getInt("PRICE")%></td><%
						%><td><%=rs.getInt("ORDER_COUNT")%></td><%
					%></tr><%
				}
				
				//step5 close the connection object
				con.close();
				}
	
				catch(Exception e) {
					System.out.println(e);
				}
					%>
		</table>	
			
	</body>
</html>