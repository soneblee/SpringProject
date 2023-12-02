<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.BoardVO, com.example.BoardService"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<jsp:useBean id="u" class="com.example.BoardVO" scope="request"/>
<jsp:setProperty property="*" name="u"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Form</title>
</head>
<body>
<%--@elvariable id="u" type=""--%>
<form:form modelAttribute="u" method="POST" action="../editok">
	<h1>Edit Form</h1>
	<input type="hidden" name="seq" value="${u.seq}"/>
	<table>
		<tr>
			<td>Title:</td>
			<td><input type="text" name="title" value="${u.title}"/></td>
		</tr>
		<tr>
			<td>Writer:</td>
			<td><input type="text" name="writer" value="${u.writer}" /></td>
		</tr>
		<tr>
			<td>Content:</td>
			<td><textarea cols="50" rows="5" name="content">${u.content}</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Edit Post"/>
				<input type="button" value="Cancel" onclick="history.back()"/>
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>
