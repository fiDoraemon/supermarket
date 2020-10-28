<%@ page import="com.jinggege.domain.Supplier" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%

    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>供应商管理</title>
    <link rel="stylesheet" href="font/bootstrap.min.css">
    <link rel="stylesheet" href="font/css/all.min.css">
    <link rel="stylesheet" href="css/management.css">
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        function selectAllorNo() {
            //获取所有复选框的对象集
            var boxid = document.getElementById("selectAll");
            if (boxid.checked == false) {
                selectAllOrNot(false);
            } else {
                selectAllOrNot(true);
            }
        }

        //实现全选按钮 和 全不选按钮的操作
        function selectAllOrNot(bool) {
            //获取name=love 的对象集  一个name可以对应多个元素  所有没有getElementByName()这个方法
            var loves = document.getElementsByName("select");
            //获取id=boxid 的对象集   一个id只能对应一个元素  所有没有getElementsById()这个方法
            var boxid = document.getElementById("selectAll");
            boxid.checked = bool;
            for (var i = 0; i < loves.length; i++) {
                loves[i].checked = bool;
            }
        }
    </script>
</head>
<body>
<!--  导航条 -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- 头部 -->
        <div class="navbar-header">
            <a class="navbar-brand" href="#">超市管理系统</a>
        </div>
        <!-- 导航链接 -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="./user.html">用户管理 <span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="#">供应商管理</a></li>
                <li><a href="./order.html">订单管理</a></li>
                <li><a href="./index.html">返回主页</a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <span><a href="#"><i class="fas fa-user"></i> ${sessionScope.user.name} </a>您好！</span>
            </ul>
        </div>
    </div>
</nav>
<!-- 大容器container -->
<div class="container ">
    <table class="table table-light table-hover ">
        <tbody>
        <thead>
        <tr>
            <th><input type="checkbox" id="selectAll" onclick="selectAllorNo()"></th>
            <th>id</th>
            <th>公司</th>
            <th>联系人</th>
            <th>地址</th>
            <th colspan="5">电话</th>
        </tr>
        </thead>
        <%
            List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
            int i = 0;
            for (Supplier supplier : suppliers) {
                i++;
        %>
        <tr>
            <th><input type="checkbox" name="select" value=""></th>
            <td><%=i%>
            </td>
            <td><%=supplier.getSupplier()%>
            </td>
            <td><%=supplier.getContacts()%>
            </td>
            <td><%=supplier.getAddress()%>
            </td>
            <td><%=supplier.getPhone()%>
            </td>
            <td><a href="./supplierInfo.html">供应商信息详情</a></td>
        </tr>
        <%}%>
        <form id="addInfo" action="supplier/add">
            <div>
                <tr>
                    <th></th>
                    <td></td>
                    <td><input type="text" placeholder="添加的供应商" name="addSupplier"></td>
                    <td><input type="text" placeholder="添加的供应商联系人" name="addContacts"></td>
                    <td><input type="text" placeholder="添加的供应商地址" name="addAddress"></td>
                    <td><input type="text" placeholder="添加的供应商联系电话" name="addPhone"></td>
                </tr>
            </div>
        </form>
        </tbody>
    </table>
    <div class="btns">
        <a href="./orderInfo.html" class="btn btn-primary ">修改 <i class="fas fa-marker"></i></a>
        <button class="btn btn-danger btn-sm" type="submit" form="addInfo">删除 <i class="fas fa-eraser"></i></button>
        <button class="btn btn-success btn-sm" type="submit" form="addInfo" >添加 <i class="fas fa-plus"></i></button>
    </div>
</div>
</body>
</html>
