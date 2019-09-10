<%@ Page Language="C#" AutoEventWireup="true" CodeFile="学生权限.aspx.cs" Inherits="学生权限" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

<script type="text/javascript" src="Scripts/jquery-1.7.1.js"></script>

<script >
    function GetQueryString(bh) {
        var reg = new RegExp("(^|&)" + bh + "=([^g]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
    $(function () {
        var xh = GetQueryString("bh")
        $.ajax({
            url: "学生后台.aspx",
            dataType: "text",
            data: "key='c','" + xh + "'",
            type: "post",
            success: function (result) {
                if (result != null) {//后台传回来的select选项
                    var data1 = new Array();
                    data1 = result.split('|');
                    var data2 = new Array();
                    data2 = data1[1].split(',');
                    BB.text = "欢迎您:" + data2[1] + "同学！";

                }
            }
        })
        $("#a3").click(function () {
            $.ajax({
                type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                url: "学生后台.aspx", //接收参数的后台程序
                datatype: "text",  //注意：从后台返回参数是文本形式
                data: "key='a'",
                success: function (result) {
                    //$("#Text4").val(result);//测试一下数据是否返回
                    //下在把数据拆开动态生成一个html表格 显示
                    var data1 = new Array();
                    data1 = result.split('|');
                    //清空div1为输出数据准备
                    $("#div2").empty();
                    var table1 = $("<table id='table1' border='1px' width='75%' >");
                    $("#div2").append(table1);
             
                    for (var i = 0; i < data1.length ; i++) {
                        var data2 = data1[i].split(',');
                        var tr = $("<tr>");  //最好使用$，否则可能后面引用时出问题
                        var trend = $("</tr>");
                        tr.appendTo(table1);
                        for (var j = 0; j < 3; j++) {
                            var td = $("<td style='color:#10237d' align='center'>" + data2[j] + "</td>");
                            td.appendTo(tr);   
                        }                   
                        //var td2 = $("<td>" + "<a href='#' id='a1' name='name'>"+"领取" +"</a>"+ "</td>");
                        //td2.appendTo(tr);
                        trend.append(table1);
                        $("#div2").append("</table>");
                    }
                }
            })
        })
        $("#a1").click(function () {
            var xh = GetQueryString("bh")
            $.ajax({
                url: "学生后台.aspx",
                dataType: "text",
                data: "key='c','" + xh + "'",
                type: "post",
                success: function (result) {
                    if (result != null) {//后台传回来的select选项
                        var data1 = new Array();
                        data1 = result.split('|');
                        var data2 = new Array();
                        data2 = data1[1].split(',');

   
                        $("#Text1").val(data2[0]);
                        $("#Text2").val(data2[1]);
                        $("#Text3").val(data2[2]);
                        if (data2[3].trim().toString() == "男") $("#Radio1").attr("checked", "checked");//性别
                        else $("#Radio2").attr("checked", true);
                        $("#Text4").val(data2[4] + '/' + data2[5] + '/' + data2[6]);
                        $("#Text5").val(data2[7]);
                        $("#TextArea1").val(data2[8]);
                        $("#Text6").val(data2[9]);
                    }

                }

            })

        })
        $("#a2").click(function () {
            var xh = GetQueryString("bh")
            $.ajax({
                type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                url: "学生后台.aspx", //接收参数的后台程序
                datatype: "text",  //注意：从后台返回参数是文本形式
                data: "key='e','"+xh+"'",
                success: function (result) {
                    //$("#Text4").val(result);//测试一下数据是否返回
                    //下在把数据拆开动态生成一个html表格 显示
                    var data1 = new Array();
                    data1 = result.split('|');
                    //清空div1为输出数据准备
                    $("#div3").empty();
                    var table1 = $("<table id='table1' border='1px' width='75%' >");
                    $("#div3").append(table1);

                    for (var i = 0; i < data1.length ; i++) {
                        var data2 = data1[i].split(',');
                        var tr = $("<tr>");  //最好使用$，否则可能后面引用时出问题
                        var trend = $("</tr>");
                        tr.appendTo(table1);
                        for (var j = 0; j < 2; j++) {
                            var td = $("<td style='color:#10237d' align='center' width=50%>" + data2[j] + "</td>");
                            td.appendTo(tr);
                        }
                        //var td2 = $("<td>" + "<a href='#' id='a1' name='name'>"+"领取" +"</a>"+ "</td>");
                        //td2.appendTo(tr);
                        trend.append(table1);
                        $("#div3").append("</table>");
                    }
                }
            })
        })
        $("#Button2").click(function () {
            var kkxq = $("#Select1").val();
            $.ajax({
                type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                url: "学生后台.aspx", //接收参数的后台程序
                datatype: "text",  //注意：从后台返回参数是文本形式
                data: "key='d','" + kkxq + "'",
                success: function (result) {
                    //$("#Text4").val(result);//测试一下数据是否返回
                    //下在把数据拆开动态生成一个html表格 显示
                    var data1 = new Array();
                    data1 = result.split('|');
                    //清空div1为输出数据准备
                    $("#div0").empty();
                    var table1 = $("<table id='table1' border='1px' width='75%' >");
                    $("#div0").append(table1);
                    for (var i = 0; i < data1.length ; i++) {
                        var data2 = data1[i].split(',');
                        var tr = $("<tr>");  //最好使用$，否则可能后面引用时出问题
                        var trend = $("</tr>");
                        tr.appendTo(table1);
                        for (var j = 0; j < 5; j++) {
                            var td = $("<td style='color:#10237d' align='center'>" + data2[j] + "</td>");
                            td.appendTo(tr);
                        }
                        trend.append(table1);
                        $("#div0").append("</table>");
                    }
                }
            })

        })
        $("#Button1").click(function () {
            var xh = GetQueryString("bh")
            var s = "";
            var rad = $("input[name='cs']:checked");//注意这是取的值，不是控件对象
            for (var i = 0; i < rad.length; i++) {
                s = s + rad[i].value + ",";
            }
            //alert(s);
            var data1 = new Array();
            data1 = s.split(',');
            
            var a1 = "";
            for (var i = 0; i < data1.length-1; i++) {
                a1 = a1 + "'"+data1[i]+"',";
            }
            
                $.ajax({
                    type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                    url: "学生后台.aspx", //接收参数的后台程序
                    datatype: "text",  //注意：从后台返回参数是文本形式
                    data: "key='b','" + xh + "',"+a1+"",
                    success: function (result) {
                        alert(result);
                    }

                })
           
        })
        $("#Button3").click(function () {
            var xh = GetQueryString("bh")
            var jcbh = $("#Select2").val();
            var se = confirm("是否退换该教材?")
            if (se == true) {
                $.ajax({
                    url: "学生后台.aspx",
                    dataType: "text",
                    data: "key='g','" + xh + "','"+jcbh+"'",
                    type: "post",
                    success: function (result) {

                        alert(result);

                    }
                })
            }

        })
    })
    $(document).ready(function () {
        var xh = GetQueryString("bh")
        $("#a4").click(function () {
        $.ajax({//填充教材编号
            url: "学生后台.aspx",
            dataType: "text",
            data: "key='f','"+xh+"'",
            type: "post",
            success: function (result) {
                if (result != null) {//后台传回来的select选项
                    var data1 = new Array();
                    data1 = result.split('|');
                    //清空Select1为输出数据准备
                    $("#Select2").empty();
                    for (var i = 0; i < data1.length ; i++) {
                        document.getElementById("Select2").options.add(new Option(data1[i]));
                    }
                }
            },
        })
        })
    })
</script>
          <style type="text/css">


/*nav导航盒子*/
div.nav{
    width: 800px;
    height:36px;
    line-height: 36px;
    text-align: center;
    font-size: 1em;
    position:relative;
    background: #62ab00;
	margin:30px auto 0 auto;
}


/*导航条设置*/
ul.nav-main>li{
    width: 120px;
    height: 100%;
    display: block;
    float: left;
    background: #62ab00;
    color: #fff;
    margin-right: 1px;
    cursor: pointer;
}
ul.nav-main>li:hover{
    background:#99CCFF;
}


 .c1 {
   background-color:#f2f4bf;
          }
  .submit-btn{width: 6em;height: 2em;background-color: #62ab00;border-radius: 4px;border: 0px;color: #fff;font-family:"微软雅黑";font-size: 1em;font-weight: bold;}
  span.title_con{font-family:"宋体";font-style: normal;font-size: 2em;font-weight:700 ;color: #39A631;padding-left: 1em;}
  .con{width: 45%;height: 30em;margin-top:2em; text-align: center;}
   .con{border: thin solid #8EC172;}

         </style>
</head>
<body background="img\00.jpg" style="background-repeat:no-repeat;
    background-size:100% 100%;
    background-attachment:fixed;">
    <form id="form1" runat="server">
        <div class="header_title">
		<span class="title_con">教材管理系统(学生)</span></div><br />
     <a id="BB" style="font-family:宋体;font-weight:bold;color:#62ab00;font-style:italic"></a>
        <div style="float:right;font-family:宋体;font-weight:bold;color:#62ab00;font-style:italic"><a href="Default2.aspx">退出系统</a></div>
	
               <br/>
        <div style="float:left;text-align:center;height:5px;width:100%;background-color: #39A631"></div>
<div class="nav">
	<!--导航条-->
	<ul class="nav-main">
        <li>
            <a href="#" onclick="document.getElementById('cont0').style.display='block';
                                 document.getElementById('cont1').style.display='none';
                                 document.getElementById('cont2').style.display='none';
                                 document.getElementById('cont3').style.display='none';
                                 document.getElementById('cont4').style.display='none';" style="text-decoration:none;">
            首页</a>
                </li>
		<li >
            <a href="#" id="a1" onclick="document.getElementById('cont1').style.display='block';
                                         document.getElementById('cont0').style.display='none';
                                         document.getElementById('cont2').style.display='none';
                                         document.getElementById('cont3').style.display='none';
                                         document.getElementById('cont4').style.display='none'; " style="text-decoration:none;">
                个人信息</a> 
		</li>
        <li >
            <a href="#"  onclick="document.getElementById('cont2').style.display='block';
                                  document.getElementById('cont0').style.display='none';
                                  document.getElementById('cont1').style.display='none';
                                  document.getElementById('cont3').style.display='none';
                                  document.getElementById('cont4').style.display='none';" style="text-decoration:none;">
                查看课程</a> 
		</li>
        <li >
            <a href="#" id="a3" onclick="document.getElementById('cont3').style.display='block';
                                         document.getElementById('cont0').style.display='none';
                                         document.getElementById('cont1').style.display='none';
                                         document.getElementById('cont2').style.display='none';
                                         document.getElementById('cont4').style.display='none'; " style="text-decoration:none;">
                领取教材</a> 
		</li>
         <li >
            <a href="#" id="a2" onclick="document.getElementById('cont4').style.display='block';
                                         document.getElementById('cont0').style.display='none';
                                         document.getElementById('cont1').style.display='none';
                                         document.getElementById('cont2').style.display='none';
                                         document.getElementById('cont3').style.display='none';
                                         document.getElementById('d1').style.display='none';" style="text-decoration:none;">
                查看已领取教材</a> 
		</li>
		
		
		
	</ul>
	
     
       
</div>
<script type="text/javascript" src="Scripts/main.js"></script>
        <center>
       <div class="con">   
           <div id="cont0" align="center">
              <br /> <br /> <br /> <br /> <br /><br /><br />
   <a style="font-size:400%;font-family:KaiTi;color:#162578;font-style:italic;" >欢迎来到教材管理系统</a>
 
 

</div>
           <div id="cont1"style="display:none" ><br />
   <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">学号： </td>  <td height="30px"><input id="Text1" type="text"class="c1"style="height:20px;" readonly="true"/></td></tr>
 <tr><td align="right" height="30px">姓名： </td>  <td height="30px"><input id="Text2" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
 <tr><td align="right" height="30px">专业名：</td>  <td height="30px"><input id="Text3" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
  <tr><td align="right" height="30px"> 性别：</td>  <td height="30px"><input id="Radio1"name="r1" type="radio"class="c1"style="height:20px;" checked="checked"/>男 &nbsp;&nbsp;
<input id="Radio2" name="r1" type="radio"style="height:20px;" />女</td></tr>
    <tr><td align="right" height="30px">出生日期：</td>  <td height="30px"><input id="Text4" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
    <tr><td align="right" height="30px">入校成绩：</td>  <td height="30px"><input id="Text5" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
    <tr><td align="right" height="30px">备注：</td>  <td height="30px"><textarea id="TextArea1"class="c1"style="height:50px;"readonly="true"></textarea></td></tr>
    <tr><td align="right" height="30px">初始密码：</td>  <td height="30px"><input id="Text6" type="text"class="c1" style="height:20px;"readonly="true"/></td></tr>
    
 </table></div>

</div>
           <div id="cont2" style="display:none" align='center'><br />
               根据开课学期查询（请选择）：<select id="Select1" name="xl">
            <option value="大一上学期" selected="selected">大一上学期</option>
            <option value="大一下学期" >                   大一下学期</option>
            <option value="大二上学期">                    大二上学期</option>
            <option value="大二下学期">                    大二下学期</option>
            <option value="大三上学期">                    大三上学期</option>
            <option value="大三下学期">                    大三下学期</option>
            <option value="大四上学期">                    大四上学期</option>
            <option value="大四下学期">                    大四下学期</option>
                                </select>              
        <input id="Button2" type="button" value="查询" class="submit-btn"/><br /><br /><br />
    <div id="div0" ></div>

</div>
           <div id="cont3" style="display:none;"align="center">
  <div id="div2"></div><br />
               <input id="Button1" type="button" value="确认领取"class="submit-btn" />

</div>
            <div id="cont4" style="display:none;"align="center">
                <div id="div3"></div><br /><br />
                <a href="#" id="a4" onclick="document.getElementById('d1').style.display='block';">退还教材</a><br /><br />
                <div id="d1" style="display:none">
                    教材编号：<select id="Select2" >
<option></option>

</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input id="Button3" type="button" value="确认退还"class="submit-btn" /> 
                </div>
</div>
           </div>
            </center>
      
       
        
    </form>
</body>
</html>
