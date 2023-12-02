<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.BoardVO, com.example.BoardService"%>

<%@ page import="java.io.IOException"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.ServletContext"%>
<jsp:useBean id="u" class="com.example.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<%
	ServletContext context = request.getServletContext();
	BoardService boardService = (BoardService) context.getAttribute("boardService");
	int i = boardService.updateBoard(u);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>
<form: form commandName="boardVO" method="POST" action="../editok"></form:>
<form action="editok" method="post">

<h1>Edit Form</h1>

<input type="hidden" name="seq" value="${u.seq}"/>
<table>
<tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
<tr><td>Writer:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>
<tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>

</form>
</body>
</html>

