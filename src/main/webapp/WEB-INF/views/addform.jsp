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

<jsp:useBean id="u" class="com.example.BoardVO" scope="request"/>
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
<form:form modelAttribute="u" method="POST" action="../addok">
<h1>Add New Post</h1>
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
                <input type="submit" value="Add Post"/>
                <input type="button" value="Cancel" onclick="history.back()"/>
            </td>
        </tr>
    </table>
</form:form>

</body>

<script>
    alert('<%=msg%>');
    location.href='posts.jsp';
</script>
</html>
