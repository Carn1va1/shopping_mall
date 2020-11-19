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
			    <td>이름</td>
			    <td>가격</td>
			    <td>재고</td>
			    <td>설명</td>
			    <td>원산지</td>
			</tr>
			<%
			String product_price = request.getParameter("product_price");
			String product_stock = request.getParameter("product_stock");
			
			try
			{
			    Class.forName("oracle.jdbc.driver.OracleDriver");
			    Connection con=DriverManager.getConnection(
			    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
			    Statement stmt=con.createStatement();
			    String query = " SELECT " +
									" PRODUCT.NAME, PRODUCT.PRICE, PRODUCT.STOCK, PRODUCT.DESCRIPTION, PRODUCT.ORIGIN " +
								" FROM " +
									" PRODUCT " +
			    				" WHERE ";
			    
			    /* if(product_price != null) {
			    	query += " PRODUCT.PRICE like '%" + product_price + "'";
			    }
			    
			    if(product_stock != null) {
			    	query += " AND PRODUCT.STOCK like '%" + product_stock + "'";
			    } */
			    
			    %> <%=query%> <%
			    
			    ResultSet rs=stmt.executeQuery(query);
			    
			    while(rs.next()) {
			        %><tr><%
			            %><td><%=rs.getString("NAME")%></td><%
			            %><td><%=rs.getInt("PRICE")%></td><%
			            %><td><%=rs.getInt("STOCK")%></td><%
			            %><td><%=rs.getString("DESCRIPTION")%></td><%
			            %><td><%=rs.getString("ORIGIN")%></td><%
			        %><tr><%
			    }
			
			    con.commit();
			    con.close();
			
			}
			catch(Exception e)
			{ 
			    System.out.println(e);
			}
			%>
		</table>
			
			<p>가격을 작성해 주세요</p>
			<input type="text" id="product_greater" placeholder='이상 조건'>
			<input type="text" id="product_less" placeholder='이하 조건'>
			
			<p>재고를 작성해 주세요</p>
			<input type="text" id="product_greater" placeholder='이상 조건'>
			<input type="text" id="product_less" placeholder='이하 조건'>
			<input type="button" onclick="click_search()" value="SEARCH">
			
		<script>
			   function click_search() {
				   const product_price = document.getElementById("product_price").value;
				   const product_stock = document.getElementById("product_stock").value;
				   
				  			
			       redirect_with_get_params(product_price, product_stock);
			   }
			
			   function redirect_with_get_params(product_price, product_stock) {
			       window.location.href = 'NewFile1.jsp?product_price=' + product_price + '&product_stock=' + product_stock;
			   }
		</script>
	</body>
</html>