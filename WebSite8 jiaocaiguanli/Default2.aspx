<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <title>用户登录-教材管理系统</title>

    <script language="javascript" type="text/javascript"src="Scripts/jquery-1.7.1.js">

        </script>
    <script>
     $(function () {

            $("#Button1").click(function () {
                var bh = $("#Text1").val();
                var mm = $("#Text2").val();
                var qx1 = $("#Radio1:Checked").val();
                var qx2 = $("#Radio2:Checked").val();
                var qx3 = $("#Radio3:Checked").val();
                var qx;
                if (qx1 == "on") qx = "管理员";
                else if (qx2 == "on") qx = "教师";
                else qx = "学生";
               
        
                $.ajax({
                    type:"post",
                    url:"Default3.aspx",
                    dataType:"text",
                    data: "key='"+ bh +"','" + mm + "','" + qx +"'",
                    success: function (result) {
                       
                        if (result == '1')
                            window.location.href = "管理员权限.aspx?bh="+bh;

                        else if (result == '2')
                            window.location.href = "教师权限.aspx?bh=" + bh;
                        else if (result == '3')
                            window.location.href = "学生权限.aspx?bh=" + bh;

                            
                       else
                            alert(result);

                    }
                })

            })
     })
         </script>
     <style type="text/css">
    body{padding: 0px;margin: 0px;}
#header{width: auto;min-height: 70px;line-height: 70px;}
#header{border-bottom: medium solid #39A631;}
span.title_con{font-family:"微软雅黑";font-style: normal;font-size: 2em;font-weight:800 ;color: #39A631;padding-left: 1em;}
#footer{width: auto;min-height: 60px;line-height:60px;}
#footer{border-top: thin solid #39A631;}
.con{width: 35%;height: 20em;margin-top:4em;}
.con{border: thin solid #8EC172;}
.con_title{background-color: #8EC172;width: auto;height: 3.5em;line-height: 3.5em;text-align: center;}
.con_title_sp{font-family: "微软雅黑";font-size: 1.5em;font-weight: 800;color: #FFF;}
.con_input{margin: 2em 0 1em 0;}
.submit-btn{width: 8em;height: 2em;background-color: #62ab00;border-radius: 4px;border: 0px;color: #fff;font-family:"微软雅黑";font-size: 1em;font-weight: bold;}
.con_input span{font-family: "微软雅黑";font-size: 1em;font-weight: bold;color: #333;}
.con_input input{width: 15em;padding: 0.5em 1em;border: 1px solid #bbb;}
.submit-btn{margin: 1em 0 1em 0;}
.con_select{margin-left: 2em;font-family:"微软雅黑";font-size: 1em;color: #333;}
         </style>
</head>
<body background="img\00.jpg" style="background-repeat:no-repeat;
    background-size:100% 100%;
    background-attachment:fixed;">
    <form id="form1" runat="server">
        <div id="header">
	<div class="header_title">
		<span class="title_con">教材管理系统</span>
	</div>
</div>
<div id="content">
	<center>
		<div class="con">
		<div class="con_title">
			<span class="con_title_sp">欢迎登录教材管理系统</span>
		</div>
            <div class="con_panel">
			<div class="con_input">
      <span>用户名：</span>  <input id="Text1" type="text" placeholder="管理员编号/教师编号/学号"/>
                </div>
			<div class="con_input">
        <span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input id="Text2" type="password"   placeholder="密码"/>
                </div>

   
   <div class="con_select">
        <input id="Radio1"  name="R" type="radio"  />管理员
        <input id="Radio2"  name="R" type="radio"  />教师
        <input id="Radio3"  name="R" type="radio" checked="true" />学生
   	</div>
        <input id="Button1" type="button" value="登   录" class="submit-btn"/>
    </div>
	</div>
	</center>
</div>
         </form>

</body>
</html>
