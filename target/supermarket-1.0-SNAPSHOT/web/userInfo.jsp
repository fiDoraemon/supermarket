<%@ page import="java.util.List" %>
<%@ page import="com.jinggege.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理</title>
    <link rel="stylesheet" href="css/supplierInfo.css">
    <link rel="stylesheet" href="font/bootstrap.min.css">
    <link rel="stylesheet" href="font/css/all.min.css">
    <script src="js/userInfo.js"></script>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar navbar-inverse">
    <div class="">
        <h3 class="navbar-text">超市订单管理系统</h3>
        <span><a href="user/logout"><i class="fas fa-user"></i> ${sessionScope.user.name} </a>您好！</span>
    </div>
</nav>
<!-- 内容 -->
<div class="container">
    <table class="table  tb02 ">
        <tbody>
        <tr class="success">
            <td colspan="10">
                <h4>用户具体信息</h4>
            </td>
        </tr>
        <tr>
        </tr>
        <tr class="active">
            <td>
                <input type="checkbox" id="selectAllOrNot" onclick="selectAllorNo()">
            </td>
            <td>编号</td>
            <th>用户名</th>
            <th>密码</th>
            <th>名字</th>
            <th>身份证号码</th>
            <th>权限</th>
        </tr>
            <%
                List<User> userList = (List<User>) request.getAttribute("userList");
                int i = 0;
                String permission = "";
                User loginUser = (User) request.getSession().getAttribute("user");
                for (User user : userList){
                    if (user.getRole() == 0){
                        permission = "boss";
                    }
                    if (user.getRole() == 1){
                        permission = "管理员";
                    }
                    if (user.getRole() == 2){
                        permission = "员工";
                    }
                    i++;
            %>
        <form id="deleteUser" method="post" action="user/remove">
            <tr>
            <%if (loginUser.getRole() < user.getRole()){%>
                <td>
                    <input type="checkbox" name="select[]" value="<%=user.getUsername()%>">
                </td>
                <%}else {%>
                <td></td>
                <%}%>
                <td><%=i%>
                </td>
                <td><%=user.getUsername()%>
                </td>
                <td><%=user.getPassword()%>
                </td>
                <td><%=user.getName()%>
                </td>
                <td><%=user.getIdentity_id()%>
                </td>
                <td><%=permission%>
                </td>
            </tr>
            <%}%>
        </form>
        <form action="user/add" id="addUser" method="post">
            <tr>
                <td></td>
                <td></td>
                <td><input type="text" name="username"></td>
                <td><input type="password" name="password"></td>
                <td><input type="text" name="name"></td>
                <td><input type="text" name="identity_id"></td>
                <%
                if(loginUser.getRole()==0){
                %>
                <td><select name="role">
                    <option value="1">管理员</option>
                    <option value="2">员工</option>
                </select></td>
                <%}else {%>
                <td>员工</td>
                <%}%>
            </tr>
        </form>
        </tbody>
    </table>
    <button href="./user.html" class="btn btn-default">修改</button>
    <button class="btn btn-default" type="submit" form="addUser">增加</button>
    <button class="btn btn-default" type="text" form="deleteUser" onclick="checkBoxid()">删除</button>
    <a href="web/info" class="btn btn-default">返回上一页</a>
</div>
</body>
</html>
