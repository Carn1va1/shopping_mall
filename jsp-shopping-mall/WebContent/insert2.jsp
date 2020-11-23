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
		<form action="action/action_insert.jsp">
			<p>카테고리 ID</p>
			<select name="category_id">
			<%
			try
			{
			    Class.forName("oracle.jdbc.driver.OracleDriver");
			    Connection con=DriverManager.getConnection(
			    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
			    Statement stmt=con.createStatement();
			    String query = "SELECT ID, NAME FROM CATEGORY ";
			    
			    ResultSet rs=stmt.executeQuery(query);
			    while(rs.next()) {
					%><option value="<%=rs.getInt(1) %>"><%=rs.getString(2)%></option><%
			    }
			    con.close();
			
			}
			catch(Exception e)
			{ 
			    System.out.println(e);
			}
			%>
			</select>
			<p>상품명</p> <input type="text" name="name">
			<p>가격</p> <input type="number" name="price">
			<p>재고</p> <input type="number" name="stock">
			<p>설명</p> <input type="text" name="description">
			<p>원산지</p> <input type="text" name="origin">
			<input type="submit" value="제출">
			<input type="button" value="다시쓰기">	
		</form>
	</body>
</html>