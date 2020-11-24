<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<h3>카테고리 등록</h3>

<form action="action/category_insert.jsp">
	<table border="1">
		<tr>
			<td><p>카테고리명</p></td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="제출">
				<input type="button" value="다시쓰기">
			</td>
		</tr>
	</table>
</form>