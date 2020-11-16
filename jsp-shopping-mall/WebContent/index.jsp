<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
		<%for (int i=0; i <= 5; i++) {
			%><br><%
			for(int j=0; j <= i; j++){
				%><a>*</a><%
			}
		}
		%><br><%
		%>
		<% String a = "나는 스트링입니다!!!"; %>
		<a> A는 무슨 글자일까요?? 정답은 : <%=a %> </a>
		<br>
		<% int A = 1; %>
		<% int B = 1; %>
		<%
		while(true){
    		int temp = A + B;
    		A = B;
    		B = temp;
    		temp = A + B;
    	%>
    		<%= temp %>
    	<%
    	if(temp > 100){
        		break;
    		}
		}
		%>
		<table border="1">
		<%
			for(int i=0; i<=10; i++){
				%><tr><%
				for(int j=9; j<= 10; j++){
					%><td><%
				}
				%><tr><%
			}
		%>
		</table>
		<br>
		<table border="1">
		<%
			for(int i=1; i <= 9; i++){
				%><tr><%
				for(int j = 1; j <= 9; j++){
					%><td><%=i%> X <%=j %> = <%= i*j %></td><%
				}
				%><tr><%
			}
		%>
		</table>
		<br>
		<table border="1">
		<%
			for(int i=1; i <= 5; i++){
				%><tr><%
				for(int j = 5; j >= 1; j--){
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
			for(int i=1; i <= 5; i++){
				%><tr><%
				for(int j = 1; j <= 5; j++){
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
			for(int i=5; i >= 1; i--){
				%><tr><%
				for(int j = 1; j <= 5; j++){
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
			for(int i=1; i <= 5; i++){
				%><tr><%
				for(int j = 1; j <= 5; j++){
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
			for(int i=3; i <= 5; i++){
				%><tr><%
				for(int j = i; j >= 1; j--){
					%><td><%
					if(i<=j){
						%>*<%
					}
					%><td><%
				}
			}
		%>
		</table>
		
	</body>
</html>