<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2020/9/14
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Login</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function delUser(id) {
            if (confirm("确定删除吗？")){

                location.href= "${pageContext.request.contextPath}/delUserServlet?id="+id;
            }
        }

        window.onload = function (){
            document.getElementById("delSelected").onclick = function () {
                if (confirm("确定删除选中条目吗？")){
                    var flag = false;

                    var cbs = document.getElementsByName("uid");

                    for (var i = 0; i < cbs.length; i++){
                        if (cbs[i].checked){
                            flag = true;
                            break;
                        }
                    }

                    if (flag){

                        document.getElementById("selected").submit();
                    }
                }
            }

            document.getElementById("firstCB").onclick = function () {
                var cbs = document.getElementsByName("uid");

                for (var i = 0; i < cbs.length; i++){
                    cbs[i].checked = this.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1><a href="${pageContext.request.contextPath}/userListServlet">用户信息列表</a></h1>
    </div>
    <div style="float: left;">
        <form class="form-inline" action="${pageContext.request.contextPath}/findUserByPageServlet">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" class="form-control" id="exampleInputName2" name="name" value="${condition.name[0]}" placeholder="姓氏">
            </div>
            <div class="form-group">
                <label for="exampleInputName3">籍贯</label>
                <input type="text" class="form-control" id="exampleInputName3" name="address" value="${condition.address[0]}" placeholder="籍贯所在地">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">邮箱</label>
                <input type="email" class="form-control" id="exampleInputEmail2" name="email" value="${condition.email[0]}" placeholder="例：12345678@163.com">
            </div>
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
    </div>
    <div style="float: right; margin: 0.3125rem;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加联系人</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
    </div>
    <form id="selected" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="firstCB"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>籍贯</th>
                <th>QQ</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pb.pageList}" var="user" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="uid" value="${user.id}"></td>
                    <td>${s.count}</td>
                    <td>${user.name}</td>
                    <td>${user.gender}</td>
                    <td>${user.age}</td>
                    <td>${user.address}</td>
                    <td>${user.qq}</td>
                    <td>${user.email}</td>
                    <td>
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">修改</a>
                        <a class="btn btn-default" href="javascript:delUser(${user.id});">删除 </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>

    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pb.currentPage == 1}">
                    <li class="disabled">
                </c:if>
                <c:if test="${pb.currentPage != 1}">
                    <li>
                </c:if>
                        <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage - 1}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                    <c:if test="${pb.currentPage == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${pb.currentPage == pb.totalPage}">
                    <li class="disabled">
                </c:if>
                <c:if test="${pb.currentPage != pb.totalPage}">
                    <li>
                </c:if>
                    <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage + 1}&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 1.5625rem; margin-left: 0.3125rem; padding-top: 0.3125rem;">共有${pb.totalCount}条记录，共${pb.totalPage}页</span>
            </ul>
        </nav>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
