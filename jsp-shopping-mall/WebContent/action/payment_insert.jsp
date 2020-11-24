<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
int product_id = Integer.parseInt(request.getParameter("product_id"));
int member_id = Integer.parseInt(request.getParameter("member_id"));
String order_date = request.getParameter("order_date");
String order_status = request.getParameter("order_status");
int order_count = Integer.parseInt(request.getParameter("order_count"));
String address = request.getParameter("address");

String insert_query = "INSERT INTO PAYMENT_HISTORY(ID, ORDER_DATE, ORDER_STATUS, ORDER_COUNT, ORDER_PRICE, PRODUCT_ID, MEMBER_ID, ADDRESS) " +
			   "VALUES(SEQ_PAYMENT_HISTORY.NEXTVAL, '%s', '%s', %d, %d, %d, %d, '%s')";
String select_query = "SELECT PRICE FROM PRODUCT WHERE ID = " + product_id;

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  

	ResultSet rs = stmt.executeQuery(select_query);
	rs.next();
	int product_price = rs.getInt("PRICE");
		
	System.out.println(String.format(insert_query, 
			order_date, order_status, order_count, product_price * order_count, product_id, member_id, address));
	stmt.executeQuery(String.format(insert_query, 
			order_date, order_status, order_count, product_price * order_count, product_id, member_id, address));

	con.commit();
	con.close();
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
