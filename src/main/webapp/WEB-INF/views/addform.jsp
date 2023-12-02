<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="org.springframework.web.context.support.SpringBeanAutowiringSupport" %>

<%
    SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
%>

<%@ page import="com.example.BoardService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.example.BoardVO" %>
<%@ page import="java.util.List" %>

<%@ page import="com.example.BoardService" %>
<%@ page import="com.example.BoardServiceImpl" %>
<%@ page import="static com.example.BoardServiceImpl.*" %>

<jsp:useBean id="u" class="com.example.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<%
    BoardServiceImpl boardService = new BoardServiceImpl();
    int i = boardService.insertBoard(u);
    String msg = "데이터 추가 성공 !";
    if(i == 0) msg = "[에러] 데이터 추가 ";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<h1>Add New Post</h1>
<form>
    <table>
        <tr><td>Title:</td><td><input type="text" name="title"/></td></tr>
        <tr><td>Writer:</td><td><input type="text" name="writer"/></td></tr>
        <tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"></textarea></td></tr>
        <tr><td><a href="posts.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>
    </table>
</form>

</body>

<script>
    alert('<%=msg%>');
    location.href='posts.jsp';
</script>
</html>
