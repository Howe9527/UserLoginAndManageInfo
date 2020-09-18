<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2020/9/14
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        function refreshCode() {
            var vcode = document.getElementById("vcode");

            vcode.src = "${pageContext.request.contextPath}/checkCodeServlet?time="+new Date().getTime();
        }
    </script>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>管理员登录</h1>
    </div>
    <div>
        <form action="${pageContext.request.contextPath}/loginServlet" method="post">
            <div class="form-group">
                <label for="adminName">用户名</label>
                <input type="name" class="form-control" id="adminName" name="adminName" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
            </div>
            <div class="form-inline">
                <label for="vcode">验证码</label><br>
                <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码"/>
                <a href="javascript:refreshCode();"><img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清点击刷新" id="vcode"></a>
            </div>
            <div class="form-group" style="margin-top: 1.25rem;">
                <button type="submit" class="btn btn-primary">提交</button>
            </div>
        </form>
    </div>
    <div class="alert alert-warning alert-dismissable" role="alert">
        <button type="button" class="close" data-dismiss="alert">
            <span>x</span>
        </button>
        <strong>${login_error} </strong>
    </div>
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
