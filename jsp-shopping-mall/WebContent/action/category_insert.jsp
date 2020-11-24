<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>

<%
String name = request.getParameter("name");

String query = "INSERT INTO CATEGORY(ID, NAME) " +
			   "VALUES(SEQ_CATEGORY.NEXTVAL, '%s')";

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  

	stmt.executeQuery(String.format(query, name));

	con.commit();
	con.close();
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>