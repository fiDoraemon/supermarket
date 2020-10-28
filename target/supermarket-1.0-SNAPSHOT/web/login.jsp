<%@ page import="org.aspectj.weaver.ast.Var" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>

<head>
    <base href="<%=basePath%>"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="font/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>

</head>

<body>
<div class="container row">
    <h3 class="text-center">超市订单管理系统</h3>
    <hr>
    <!-- 右边登录表单 -->
    <div class="col-sm-4"></div>
    <div class="Form  col-sm-4">
        <form action="user/login" class="form-horizontal" method="post">
            <h3 class="text-center">登录</h3>
            <hr>
            <div class="form-group">
                <div>
                    <input type="text" class="form-control" placeholder="UserId" name="name">
                </div>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Password" name="password">
            </div>

            <div class="form-group">
                <div class="btns">
                    <input type="submit" id="login" class="btn btn-primary btn-block" value="登录">
                    <%--<button class="btn btn-info btn-block">取消</button>--%>
                </div>
            </div>
            <div>${msg}</div>
        </form>
    </div>
    <div class="col-sm-4"></div>
</div>

</body>
</html>