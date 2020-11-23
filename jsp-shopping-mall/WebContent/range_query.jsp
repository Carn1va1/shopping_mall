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
			    <td>상품명</td>
			    <td>가격</td>
			    <td>재고</td>
			    <td>설명</td>
			    <td>원산지</td>
			</tr>
			<%
			String price_greater = request.getParameter("price_greater");
			String price_less = request.getParameter("price_less");
			String stock_greater = request.getParameter("stock_greater");
			String stock_less = request.getParameter("stock_less");
			
			
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
			    				" WHERE " +
			    				" 1 = 1 ";
			    
			    if(price_greater != null && price_greater.length() != 0) {
			    	query += "AND PRICE >= " + price_greater;
			    }
			    if(price_less != null && price_less.length() != 0) {
			    	query += "AND PRICE <= " + price_less;
			    }
			    if(stock_greater != null && stock_greater.length() != 0) {
			    	query += "AND STOCK >= " + stock_greater;
			    }
			    if(stock_less != null && stock_less.length() != 0) {
			    	query += "AND STOCK <= " + stock_less;
			    }
			    
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
			<input type="text" id="price_greater" placeholder='이상 조건'>
			<input type="text" id="price_less" placeholder='이하 조건'>
			
			<p>재고를 작성해 주세요</p>
			<input type="text" id="stock_greater" placeholder='이상 조건'>
			<input type="text" id="stock_less" placeholder='이하 조건'>
			<input type="button" onclick="click_search()" value="SEARCH">
			
		<script>
			   function click_search() {
				   const price_greater = document.getElementById("price_greater").value;
				   const price_less = document.getElementById("price_less").value;
				   const stock_greater = document.getElementById("stock_greater").value;
				   const stock_less = document.getElementById("stock_less").value;
				  			
				   redirect_with_get_params(price_greater,price_less,stock_greater,stock_less);
			   }
			
			   function redirect_with_get_params(product_price, product_stock, stock_greater, stock_less) {
				   const query_parameter = "range_query.jsp?price_greater=" + stock_less +
						   				   "&price_less=" + product_stock + "&stock_greater=" +
						   				   stock_greater + "&stock_less=" + stock_less;
				   window.location.href = query_parameter;
			   }
		</script>
	</body>
</html>