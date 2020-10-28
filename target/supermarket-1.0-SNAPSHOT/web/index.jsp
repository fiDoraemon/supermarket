<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%

    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>超市订单管理系统</title>
    <link rel="stylesheet" href="font/bootstrap.min.css">
    <link rel="stylesheet" href="font/css/all.min.css">
    <link rel="stylesheet" href="css/index.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#userController").click(function () {
                var role = ${sessionScope.user.role};
                if(role == 2){
                    alert("您无权限进行此操作！");
                }else {
                    window.location.href="user/info";
                }

            })

        })
    </script>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar navbar-default">
    <div class="">
        <h3 class="navbar-text">超市订单管理系统</h3>
        <span><a href="user/logout"><i class="fas fa-user"></i>${sessionScope.user.name}</a>，您好！</span>
    </div>
</nav>
<!-- 内容区 container -->
<div class="container">
    <div class="work">
        <h2 class="text-center">登录成功</h2>
        <br>
        <div class="panel panel-primary">
            <div class="panel-heading"><h4>请选择您要进行的操作：</h4></div>
            <div class="panel-body">
                <a id="userController" href="javascript:;" class="btn-group btn-group-justified" role="group" >用户管理</a>
                <br>
                <a href="supplier/info" class="btn-group btn-group-justified" role="group">供应商管理</a>
                <br>
                <a href="./order.html" class="btn-group btn-group-justified" role="group">订单管理</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>