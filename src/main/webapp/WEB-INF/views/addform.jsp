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

<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="org.springframework.web.context.support.SpringBeanAutowiringSupport" %>

<%
    SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
%>

<%@ page import="com.example.BoardService" %>

<jsp:useBean id="u" class="com.example.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<%
    // Autowired로 주입된 boardService 사용
    int i = boardService.insertBoard(u);
    String msg = "데이터 추가 성공 !";
    if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
    alert('<%=msg%>');
    location.href='posts.jsp';
</script>
