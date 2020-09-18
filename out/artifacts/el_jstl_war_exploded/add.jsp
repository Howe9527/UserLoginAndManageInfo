<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 2020/9/16
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Add</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style>
        .col-center-block {
            float: none;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header col-center-block">
        <h1>添加用户信息 </h1>
    </div>
    <form action="${pageContext.request.contextPath}/addServlet" method="post">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
        </div>
        <div class="form-group">
            <label>性别:</label>
            <input type="radio" name="gender" value="男" id="boy" checked="checked"><label for="boy">男</label>
            <input type="radio" name="gender" value="nv" id="girl"><label for="girl">女</label>
        </div>
        <div class="form-group">
            <label for="age">年龄:</label>
            <input type="text" class="form-control" id="age" name="age" placeholder="请输入年龄">
        </div>
        <div class="form-group">
            <label for="address">籍贯:</label>
            <input type="text" class="form-control" id="address" name="address" placeholder="请输入籍贯">
        </div>
        <div class="form-group">
            <label for="qq">QQ:</label>
            <input type="text" class="form-control" id="qq" name="qq" placeholder="QQ">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
        </div>
        <div class="col-center-block">
            <button type="submit" class="btn btn-primary" name="submit">提交</button>
            <button type="submit" class="btn btn-default" name="reset">重置</button>
            <button type="submit" class="btn btn-default" name="back">返回</button>
        </div>

    </form>
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>

