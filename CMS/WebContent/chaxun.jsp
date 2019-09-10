<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--禁止缩放-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title></title>
		<!--引入CSS文件-->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Optional theme -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="js/bootstrap.min.js"></script>
</head>
<body background="img/1.jpg">
<div align="center">

<table border="1" cellspacing="0" width="400" class="table table-striped">
     <tr>
         <th style="text-align: center">编号</th>
         <th style="text-align: center">用户名</th>
         <th style="text-align: center">年龄</th>
         <th style="text-align: center">身高</th>
         <th style="text-align: center">家庭住址</th>
         <th style="text-align: center">操作</th>
     </tr>
      <c:forEach items="${sessionScope.all }" var="user" >
	<tr>
		<th style="text-align: center">${user.id }</th>
		<th style="text-align: center">${user.name }</th>
		<th style="text-align: center">${user.age }</th>
		<th style="text-align: center">${user.stature }</th>
		<th style="text-align: center">${user.address }</th>
		<th style="text-align: center">
			<a href="/CMS/QueryOne?id=${user.id }">修改</a>&emsp;|&emsp;
			<a href="/CMS/Del?id=${user.id }">删除</a>
		</th>
	</tr>
	
</c:forEach>
</table>
</div>
</body>
</html>