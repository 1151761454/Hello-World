<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!-- 重置文件 -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/style1.css">
  <title></title>
</head>
<body>
  <div class="reg_div">
    <p>修改数据</p>
    <form action="/CMS/Upd" method="post">
    <input type="hidden" name="id" value="${sessionScope.one.id }" >
    <ul class="reg_ul">
      <li>
          <span>用户名：</span>
          <input type="text" name="name" value="${sessionScope.one.name }" class="reg_user">
          <span class="tip user_hint"></span>
      </li>
      <li>
          <span>密码：</span>
          <input type="text" name="password" value="${sessionScope.one.password }" class="reg_password">
          <span class="tip password_hint"></span>
      </li>
      <li>
          <span>年龄：</span>
          <input type="text" name="age" value="${sessionScope.one.age }" class="reg_confirm">
          <span class="tip confirm_hint"></span>
      </li>
      <li>
          <span>身高：</span>
          <input type="text" name="stature" value="${sessionScope.one.stature }" class="reg_email">
          <span class="tip email_hint"></span>
      </li>
      <li>
          <span>家庭住址：</span>
          <input type="text" name="address" value="${sessionScope.one.address }" class="reg_mobile">
          <span class="tip mobile_hint"></span>
      </li>
      <li>
       <button type="submit" name="button" class="red_button">修改数据</button>
      </li>
    </ul>
    </form>
  </div>
  


</body>
</html>
