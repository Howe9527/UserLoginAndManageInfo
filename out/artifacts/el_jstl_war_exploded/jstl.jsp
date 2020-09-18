<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.howe.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2020/9/11
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>jstl</title>
</head>
<body>
    <%
        List list = new ArrayList();
        request.setAttribute("list",list);
    %>

<table>
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>密码</th>
    </tr>
    <c:forEach items="${list}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
