<%@ Page Language="C#" AutoEventWireup="true" CodeFile="管理员权限.aspx.cs" Inherits="管理员权限" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理员</title>
  <script language="javascript" type="text/javascript" src="Scripts/jquery-1.7.1.js" >
        
        </script>
    <script>
        function GetQueryString(bh) {
            var reg = new RegExp("(^|&)" + bh + "=([^g]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
        $(function () {
            var bh = GetQueryString("bh")
            $.ajax({
                url: "管理员后台.aspx",
                dataType: "text",
                data: "key='a','" + bh + "'",
                type: "post",
                success: function (result) {
                    if (result != null) {//后台传回来的select选项
                        var data1 = new Array();
                        data1 = result.split('|');
                        var data2 = new Array();
                        data2 = data1[1].split(',');
                        BB.text = "欢迎您:" + data2[1] + "老师！";
                       
                    }
                }
            })
            $("#a0").click(function () {
                var bh = GetQueryString("bh")
                $.ajax({
                    url: "管理员后台.aspx",
                    dataType: "text",
                    data: "key='b','" + bh + "'",
                    type: "post",
                    success: function (result) {
                        if (result != null) {//后台传回来的select选项
                            var data1 = new Array();
                            data1 = result.split('|');
                            var data2 = new Array();
                            data2 = data1[1].split(',');

                            //var data3 = new Array();
                            //data3 = data2[4];
                            //var data4 = new Array();
                            //data4 = data3.split('/');

                            $("#Text1").val(data2[0]);
                            $("#Text2").val(data2[1]);
                            if (data2[2].trim().toString() == "男") $("#Radio1").attr("checked", "checked");//性别
                            else $("#Radio2").attr("checked", true);
                            //$("#Select1").options.add(data4[0]);//年
                            //$("#Select2").options.add(data4[1]);//月
                            //$("#Select3").options.add(data4[2]);//日
                            $("#Text3").val(data2[3] + '/' + data2[4] + '/' + data2[5]);
                            $("#Text4").val(data2[6]);
                            $("#Text5").val(data2[7]);
                        }

                    }

                })

            })
            $("#Button1").click(function () {
                //修改数据
                var bh = $("#Text1").val();
                var xm = $("#Text2").val();
                var xb1 = $("#Radio1:Checked").val();
                var xb2 = $("#Radio2:Checked").val();
                var xb;
                if (xb1 == "on") xb = "男";
                else xb = "女";
                var csrq = $("#Text3").val();
                var jtzz = $("#Text4").val();
                var mm = $("#Text5").val();
                var se = confirm("是否修改个人信息?")
                if (se == true) {
                    $.ajax({
                        url: "管理员后台.aspx",
                        dataType: "text",
                        data: "key='c','" + bh + "','" + xm + "','" + xb + "','" + csrq + "','" + jtzz + "','" + mm + "'",
                        type: "post",
                        success: function (result) {
                            //$("#Text4").val(result);//测试一下数据是否返回
                            alert(result);
                        }
                    })
                }

            })
            $("#Button2").click(function () {
                var se=confirm("是否添加该课程信息?")
                var kch = $("#Text6").val();
                var kcmc = $("#Text7").val();
                var syjc = $("#Text8").val();
                var kkxq = $("#Select1").val();
                var xf = $("#Text9").val();

                if (se == true) {
                    $.ajax({
                        type: "post",
                        url: "管理员后台.aspx",
                        datatype: "text",
                        data: "key='d','" + kch + "','" + kcmc + "','" + syjc + "','" + kkxq + "','" + xf + "'",
                        success: function (result) {
                            alert(result);

                        }
                    })
                }
            })
            $("#Button3").click(function () {
                var kkxq = $("#Select2").val();
                $.ajax({
                    type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                    url: "管理员后台.aspx", //接收参数的后台程序
                    datatype: "text",  //注意：从后台返回参数是文本形式
                    data: "key='f','" + kkxq + "'",
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
            $("#Button4").click(function () {
                var kch = $("#Select3").val();
                $.ajax({
                    url: "管理员后台.aspx",
                    dataType: "text",
                    data: "key='g','" + kch + "'",
                    type: "post",
                    success: function (result) {
                        if (result != null) {//后台传回来的select选项
                            var data1 = new Array();
                            data1 = result.split('|');
                            var data2 = new Array();
                            data2 = data1[1].split(',');

                            $("#Text10").val(data2[0]);
                            $("#Text11").val(data2[1]);
                            $("#Text12").val(data2[2]);  
                            $("#Text13").val(data2[3]);
                            $("#Text14").val(data2[4]);
                           
                        }

                    }

                })

            })
            $("#Button5").click(function () {
                //修改数据
                var kch = $("#Text10").val();
                var kcmc = $("#Text11").val();
                var syjc = $("#Text12").val();
                var kkxq = $("#Text13").val();
                var xf = $("#Text14").val();
                var se = confirm("是否修改该课程信息?")
                if (se == true) {
                    $.ajax({
                        url: "管理员后台.aspx",
                        dataType: "text",
                        data: "key='h','" + kch + "','" + kcmc + "','" + syjc + "','" + kkxq + "','" + xf + "'",
                        type: "post",
                        success: function (result) {
                            alert(result);
                        }
                    })
                }

            })
            $("#Button6").click(function () {
                var kch = $("#Text10").val();
                var se = confirm("是否删除该课程信息?")
                if (se == true) {
                    $.ajax({
                        url: "管理员后台.aspx",
                        dataType: "text",
                        data: "key='i','" + kch + "'",
                        type: "post",
                        success: function (result) {

                            alert(result);
                            $("#Text10").val("");
                            $("#Text11").val("");
                            $("#Text12").val("");
                            $("#Text13").val("");
                            $("#Text14").val("");
                           
                        }
                    })
                }

            })
            $("#Button7").click(function () {
                var se = confirm("是否添加该教师信息?")
                var jsbh = $("#Text15").val();
                var xm = $("#Text16").val();
                var xb1 = $("#Radio3:Checked").val();
                var xb2 = $("#Radio4:Checked").val();
                var xb;
                if (xb1 == "on") xb = "男";
                else xb = "女";
                var ssxy = $("#Text17").val();
                var sskc = $("#Text18").val();
                var mm = $("#Text19").val();

                if (se == true) {
                    $.ajax({
                        type: "post",
                        url: "管理员后台.aspx",
                        datatype: "text",
                        data: "key='j','" + jsbh + "','" + xm + "','" + xb + "','" + ssxy + "','" + sskc + "','" + mm + "'",
                        success: function (result) {
                            alert(result);

                        }
                    })
                }
            })
            $("#Button8").click(function () {
                var xm = $("#Select4").val();
                $.ajax({
                    url: "管理员后台.aspx",
                    dataType: "text",
                    data: "key='l','" + xm + "'",
                    type: "post",
                    success: function (result) {
                        if (result != null) {//后台传回来的select选项
                            var data1 = new Array();
                            data1 = result.split('|');
                            var data2 = new Array();
                            data2 = data1[1].split(',');

                            $("#Text20").val(data2[0]);
                            $("#Text21").val(data2[1]);
                            if (data2[2].trim().toString() == "男") $("#Radio5").attr("checked", "checked");//性别
                            else $("#Radio6").attr("checked", true);
                            $("#Text22").val(data2[3]);
                            $("#Text23").val(data2[4]);
                            $("#Text24").val(data2[5]);

                        }

                    }

                })

            })
            $("#Button9").click(function () {
                var jsbh = $("#Select5").val();
                $.ajax({
                    url: "管理员后台.aspx",
                    dataType: "text",
                    data: "key='n','" + jsbh + "'",
                    type: "post",
                    success: function (result) {
                        if (result != null) {//后台传回来的select选项
                            var data1 = new Array();
                            data1 = result.split('|');
                            var data2 = new Array();
                            data2 = data1[1].split(',');

                            $("#Text25").val(data2[0]);
                            $("#Text26").val(data2[1]);
                            if (data2[2].trim().toString() == "男") $("#Radio7").attr("checked", "checked");//性别
                            else $("#Radio8").attr("checked", true);
                            $("#Text27").val(data2[3]);
                            $("#Text28").val(data2[4]);
                            $("#Text29").val(data2[5]);

                        }

                    }

                })

            })
            $("#Button10").click(function () {
                //修改数据
                var jsbh = $("#Text25").val();
                var xm = $("#Text26").val();
                var xb1 = $("#Radio7:Checked").val();
                var xb2 = $("#Radio8:Checked").val();
                var xb;
                if (xb1 == "on") xb = "男";
                else xb = "女";
                var ssxy = $("#Text27").val();
                var sskc = $("#Text28").val();
                var mm = $("#Text29").val();
                var se = confirm("是否修改该教师信息?")
                if (se == true) {
                    $.ajax({
                        url: "管理员后台.aspx",
                        dataType: "text",
                        data: "key='o','" + jsbh + "','" + xm + "','" + xb + "','" + ssxy + "','" + sskc + "','" + mm + "'",
                        type: "post",
                        success: function (result) {
                            //$("#Text4").val(result);//测试一下数据是否返回
                            alert(result);
                        }
                    })
                }

            })
            $("#Button11").click(function () {
                var jsbh = $("#Text25").val();
                var se = confirm("是否删除该教师信息?")
                if (se == true) {
                    $.ajax({
                        url: "管理员后台.aspx",
                        dataType: "text",
                        data: "key='p','" + jsbh + "'",
                        type: "post",
                        success: function (result) {

                            alert(result);
                            $("#Text25").val("");
                            $("#Text26").val("");
                            $("#Radio7").attr("checked", false);//性别
                            $("#Radio8").attr("checked", false);
                            $("#Text27").val("");
                            $("#Text28").val("");
                            $("#Text29").val("");

                        }
                    })
                }

            })
            $("#a1").click(function () {

                $.ajax({
                    type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                    url: "教师后台.aspx", //接收参数的后台程序
                    datatype: "text",  //注意：从后台返回参数是文本形式
                    data: "key='k'",
                    success: function (result) {
                        //$("#Text4").val(result);//测试一下数据是否返回
                        //下在把数据拆开动态生成一个html表格 显示
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空div1为输出数据准备
                        $("#cont10").empty();
                        var table1 = $("<table id='table1' border='1px' width='75%' >");
                        $("#cont10").append(table1);
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
                            $("#cont10").append("</table>");
                        }
                    }
                })

            })
            $("#a2").click(function () {

                $.ajax({
                    type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                    url: "管理员后台.aspx", //接收参数的后台程序
                    datatype: "text",  //注意：从后台返回参数是文本形式
                    data: "key='q'",
                    success: function (result) {
                        //$("#Text4").val(result);//测试一下数据是否返回
                        //下在把数据拆开动态生成一个html表格 显示
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空div1为输出数据准备
                        $("#cont11").empty();
                        var table1 = $("<table id='table1' border='1px' width='75%' >");
                        $("#cont11").append(table1);
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
                            $("#cont11").append("</table>");
                        }
                    }
                })

            })
            $("#Button12").click(function () {
                aa1.style.display = "none";
                var se = confirm("是否入库?")
                var jcbh = $("#Select6").val();
                var mc = $("#Text30").val();
                var kc = $("#Text31").val();

                if (se == true) {
                    $.ajax({
                        type: "post",
                        url: "管理员后台.aspx",
                        datatype: "text",
                        data: "key='s','" + jcbh + "','" + mc + "','" + kc + "'",
                        success: function (result) {
                            alert(result);

                        }
                    })
                }
            })
            $("#Button13").click(function () {
                var jsbh = $("#Select6").val();
                $.ajax({
                    url: "管理员后台.aspx",
                    dataType: "text",
                    data: "key='t','" + jsbh + "'",
                    type: "post",
                    success: function (result) {
                        if (result != null) {//后台传回来的select选项
                            var data1 = new Array();
                            data1 = result.split('|');
                            var data2 = new Array();
                            data2 = data1[1].split(',');

                            $("#Text30").val(data2[0]);
                            
                        }

                    }

                })

            })
        })
       
        $(document).ready(function () {
            $("#c1").click(function () {
            $.ajax({//填充课程号
                url: "管理员后台.aspx",
                dataType: "text",
                data: "key='e'",
                type: "post",
                success: function (result) {
                    if (result != null) {//后台传回来的select选项
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空Select1为输出数据准备
                        $("#Select3").empty();
                        for (var i = 0; i < data1.length ; i++) {
                            document.getElementById("Select3").options.add(new Option(data1[i]));
                        }
                    }
                },
            })
            })
            $("#c2").click(function () {
            $.ajax({//填充教师姓名
                url: "管理员后台.aspx",
                dataType: "text",
                data: "key='k'",
                type: "post",
                success: function (result) {
                    if (result != null) {//后台传回来的select选项
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空Select1为输出数据准备
                        $("#Select4").empty();
                        for (var i = 0; i < data1.length ; i++) {
                            document.getElementById("Select4").options.add(new Option(data1[i]));
                        }
                    }
                },
            })
            })
            $("#c3").click(function () {
            $.ajax({//填充教师编号
                url: "管理员后台.aspx",
                dataType: "text",
                data: "key='m'",
                type: "post",
                success: function (result) {
                    if (result != null) {//后台传回来的select选项
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空Select1为输出数据准备
                        $("#Select5").empty();
                        for (var i = 0; i < data1.length ; i++) {
                            document.getElementById("Select5").options.add(new Option(data1[i]));
                        }
                    }
                },
            })
            })
            $.ajax({//填充教材编号
                url: "管理员后台.aspx",
                dataType: "text",
                data: "key='r'",
                type: "post",
                success: function (result) {
                    if (result != null) {//后台传回来的select选项
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空Select1为输出数据准备
                        $("#Select6").empty();
                        for (var i = 0; i < data1.length ; i++) {
                            document.getElementById("Select6").options.add(new Option(data1[i]));
                        }
                    }
                },
            })
        })

    </script>
        <style type="text/css">
         /**
*在Position属性值为absolute的同时，
*如果有一级父对象（无论是父对象还是祖父对象，或者再高的辈分，一样）
*的Position属性值为Relative时，则上述的相对浏览器窗口定位将会变成相对父对象定位，
*这对精确定位是很有帮助的。
*/
*{
    margin: 0;
    padding: 0;
	list-style-type:none;
}
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
/*nav-main*/
ul.nav-main{
    width: 100%;
    height: 100%;
    list-style-type: none;
}
ul.nav-main span{
    display: inline-block;
    margin-left: 18px;
    width: 7px;
    height: 7px;
    background: url('../img/down-icon.png') no-repeat;
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
/*隐藏盒子设置*/
div.hidden-box{
    width: 118px;
    border: 1px solid #643519;
    border-top: 0;
    position: absolute;
    display:none;
	background:#fff;
    top: 36px;
}
.hidden-box>ul{
    list-style-type: none;
    color: #643519;
    cursor: pointer;
}
.hidden-box li:hover{
    background: #99CCFF;
    color: #62ab00;
}
/*隐藏盒子位置设置*/
.hidden-loc-index{
    left: 121px;
}
.hidden-loc-us{
    left: 242px;
}
.hidden-loc-info{
    left: 363px;
}
.box04{
	left:484px;
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
		<span class="title_con">教材管理系统(管理员)</span></div><br />
     <a id="BB" style="font-family:宋体;font-weight:bold;color:#62ab00;font-style:italic"></a>
        <div style="float:right;font-family:宋体;font-weight:bold;color:#62ab00;font-style:italic"><a href="Default2.aspx">退出系统</a></div>
	
               <br/>
        <div style="float:left;text-align:center;height:5px;width:100%;background-color: #39A631"></div>
        <div style="text-align:center;height:20px;color:#f00;" id="aa1" >记得入库教材！</div>
<div class="nav">
	<!--导航条-->
	<ul class="nav-main">
        <li>
            <a href="#" onclick="document.getElementById('cont0').style.display='block';
                                 document.getElementById('cont1').style.display='none';
                                 document.getElementById('cont2').style.display='none';
                                 document.getElementById('cont3').style.display='none';
                                 document.getElementById('cont4').style.display='none';
                                 document.getElementById('cont6').style.display='none';
                                 document.getElementById('cont7').style.display='none';
                                 document.getElementById('cont8').style.display='none';
                                 document.getElementById('cont10').style.display='none';
                                 document.getElementById('cont11').style.display='none';
                                 document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
            首页</a>
                </li>
		<li >
            <a href="#" id="a0" onclick="document.getElementById('cont1').style.display='block';
                                         document.getElementById('cont0').style.display='none';
                                         document.getElementById('cont2').style.display='none';
                                         document.getElementById('cont3').style.display='none';
                                         document.getElementById('cont4').style.display='none';
                                         document.getElementById('cont6').style.display='none';
                                         document.getElementById('cont7').style.display='none';
                                         document.getElementById('cont8').style.display='none';
                                         document.getElementById('cont10').style.display='none';
                                         document.getElementById('cont11').style.display='none';
                                         document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
                个人信息</a> 
		</li>
		<li id="li-1"> <a href="#" style="text-decoration:none;">
            课程管理<span></span></a></li>
        <li id="li-2"> <a href="#" style="text-decoration:none;">
            教师管理<span></span></a></li>
		<li id="li-3"><a href="#" style="text-decoration:none;">
            教材统计</a><span></span></li>
		
	</ul>
	<!--隐藏盒子-->
            <div id="box-1" class="hidden-box hidden-loc-us">
		<ul>
			<li>
                <a href="#" onclick="document.getElementById('cont2').style.display='block';
                                     document.getElementById('cont0').style.display='none';
                                     document.getElementById('cont1').style.display='none';
                                     document.getElementById('cont3').style.display='none';
                                     document.getElementById('cont4').style.display='none';
                                     document.getElementById('cont6').style.display='none';
                                     document.getElementById('cont7').style.display='none';
                                     document.getElementById('cont8').style.display='none';
                                     document.getElementById('cont10').style.display='none';
                                     document.getElementById('cont11').style.display='none';
                                     document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
                    增加课程</a>              </li>
			<li>
                <a href="#" onclick="document.getElementById('cont3').style.display='block';
                                     document.getElementById('cont0').style.display='none';
                                     document.getElementById('cont1').style.display='none';
                                     document.getElementById('cont2').style.display='none';
                                     document.getElementById('cont4').style.display='none';
                                     document.getElementById('cont6').style.display='none';
                                     document.getElementById('cont7').style.display='none';
                                     document.getElementById('cont8').style.display='none';
                                     document.getElementById('cont10').style.display='none';
                                     document.getElementById('cont11').style.display='none';
                                     document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
                查询课程</a>
                    </li>
            <li>
                <a href="#" id="c1" onclick="document.getElementById('cont4').style.display='block';
                                             document.getElementById('cont0').style.display='none';
                                             document.getElementById('cont1').style.display='none';
                                             document.getElementById('cont2').style.display='none';
                                             document.getElementById('cont3').style.display='none';
                                             document.getElementById('cont6').style.display='none';
                                             document.getElementById('cont7').style.display='none';
                                             document.getElementById('cont8').style.display='none';
                                             document.getElementById('cont10').style.display='none';
                                             document.getElementById('cont11').style.display='none';
                                             document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
                修改与删除</a>
                    </li>
           
		</ul>
	</div>
            <div id="box-2" class="hidden-box hidden-loc-info">
		<ul>
			<li>
                <a href="#"  onclick="document.getElementById('cont6').style.display='block';
                                      document.getElementById('cont0').style.display='none';
                                      document.getElementById('cont1').style.display='none';
                                      document.getElementById('cont2').style.display='none';
                                      document.getElementById('cont3').style.display='none';
                                      document.getElementById('cont4').style.display='none';
                                      document.getElementById('cont7').style.display='none';
                                      document.getElementById('cont8').style.display='none';
                                      document.getElementById('cont10').style.display='none';
                                      document.getElementById('cont11').style.display='none';
                                      document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
                增加教师信息</a></li>
			<li>
                <a href="#" id="c2" onclick="document.getElementById('cont7').style.display='block'; 
                                             document.getElementById('cont0').style.display='none';
                                             document.getElementById('cont1').style.display='none';
                                             document.getElementById('cont2').style.display='none';
                                             document.getElementById('cont3').style.display='none';
                                             document.getElementById('cont4').style.display='none';
                                             document.getElementById('cont6').style.display='none';
                                             document.getElementById('cont8').style.display='none';
                                             document.getElementById('cont10').style.display='none';
                                             document.getElementById('cont11').style.display='none';
                                             document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
                    查询教师</a></li>
            <li>
            <a href="#" id="c3" onclick="document.getElementById('cont8').style.display='block';
                                         document.getElementById('cont0').style.display='none';
                                         document.getElementById('cont1').style.display='none';
                                         document.getElementById('cont2').style.display='none';
                                         document.getElementById('cont3').style.display='none';
                                         document.getElementById('cont4').style.display='none';
                                         document.getElementById('cont6').style.display='none';
                                         document.getElementById('cont7').style.display='none';
                                         document.getElementById('cont10').style.display='none';
                                         document.getElementById('cont11').style.display='none';
                                         document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
                    修改与删除</a></li>
          
		</ul>
	</div>
            <div id="box-3" class="hidden-box hidden-loc-info box04">
		<ul>
			<li>
                <a href="#" id="a1" onclick="document.getElementById('cont10').style.display='block';
                                             document.getElementById('cont0').style.display='none';
                                             document.getElementById('cont1').style.display='none';
                                             document.getElementById('cont2').style.display='none';
                                             document.getElementById('cont3').style.display='none';
                                             document.getElementById('cont4').style.display='none';
                                             document.getElementById('cont7').style.display='none';
                                             document.getElementById('cont8').style.display='none';
                                             document.getElementById('cont6').style.display='none';
                                             document.getElementById('cont11').style.display='none';
                                             document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
                教材目录查询</a></li>
            <li>
                <a href="#" id="a3" onclick="document.getElementById('cont12').style.display='block';
                                             document.getElementById('cont0').style.display='none';
                                             document.getElementById('cont1').style.display='none';
                                             document.getElementById('cont2').style.display='none';
                                             document.getElementById('cont3').style.display='none';
                                             document.getElementById('cont4').style.display='none';
                                             document.getElementById('cont7').style.display='none';
                                             document.getElementById('cont8').style.display='none';
                                             document.getElementById('cont6').style.display='none';
                                             document.getElementById('cont11').style.display='none';
                                             document.getElementById('cont10').style.display='none';" style="text-decoration:none;">
                教材入库</a></li>
			<li>
                <a href="#" id="a2" onclick="document.getElementById('cont11').style.display='block';
                                             document.getElementById('cont0').style.display='none';
                                             document.getElementById('cont1').style.display='none';
                                             document.getElementById('cont2').style.display='none';
                                             document.getElementById('cont3').style.display='none';
                                             document.getElementById('cont4').style.display='none';
                                             document.getElementById('cont6').style.display='none';
                                             document.getElementById('cont8').style.display='none';
                                             document.getElementById('cont10').style.display='none';
                                             document.getElementById('cont7').style.display='none';
                                             document.getElementById('cont12').style.display='none';" style="text-decoration:none;">
                    教材登记查询</a></li>
		</ul>
	</div>
</div>
<script type="text/javascript" src="Scripts/main.js"></script>
        <center>
       <div class="con">   

<div id="cont0" >
      <br /> <br /> <br /> <br /> <br /><br /><br />
   <a style="font-size:400%;font-family:KaiTi;color:#162578;font-style:italic;" >欢迎来到教材管理系统</a>
 

</div>
<div id="cont1"style="display:none" ><br />
   <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">管理员编号： </td>  <td height="30px"><input id="Text1" type="text"class="c1"style="height:20px;" readOnly="true"/></td></tr>
 <tr><td align="right" height="30px">姓名： </td>  <td height="30px"><input id="Text2" type="text" class="c1"style="height:20px;"/></td></tr>
  <tr><td align="right" height="30px"> 性别：</td>  <td height="30px"><input id="Radio1"name="r2" type="radio"class="c1"" />男 &nbsp;&nbsp;
<input id="Radio2" name="r2" type="radio"/>女</td></tr>
    <tr><td align="right" height="30px">出生日期：</td>  <td height="30px"><input id="Text3" type="text" class="c1"style="height:20px;"/></td></tr>
    <tr><td align="right" height="30px">家庭住址：</td>  <td height="30px"><input id="Text4" type="text" class="c1"style="height:20px;"/></td></tr>
    <tr><td align="right" height="30px">密码：</td>  <td height="30px"><input id="Text5" type="text"class="c1" style="height:20px;"/></td></tr>
    
 </table><br />
        <input id="Button1" type="button" value="确认修改"class="submit-btn" />
         </div>
</div>
<div id="cont2"style="display:none" ><br />
     <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">课程号： </td>  <td  height="30px"><input id="Text6" type="text"class="c1"style="height:20px;" /></td></tr>
 <tr><td align="right" height="30px" >课程名称： </td>  <td  height="30px"><input id="Text7" type="text" class="c1"style="height:20px;"/></td></tr>
 <tr><td align="right"  height="30px">所用教材：</td>  <td  height="30px"><input id="Text8" type="text" class="c1"style="height:20px;"/></td></tr>
    <tr><td align="right"  height="30px">开课学期：</td>   <td  height="30px"><select id="Select1" name="xl">
            <option value="大一上学期" selected="selected">大一上学期</option>
            <option value="大一下学期" >                   大一下学期</option>
            <option value="大二上学期">                    大二上学期</option>
            <option value="大二下学期">                    大二下学期</option>
            <option value="大三上学期">                    大三上学期</option>
            <option value="大三下学期">                    大三下学期</option>
            <option value="大四上学期">                    大四上学期</option>
            <option value="大四下学期">                    大四下学期</option>
                                </select>                </td>
    <tr><td align="right"  height="30px">学分：</td>  <td  height="30px"><input id="Text9" type="text" class="c1"style="height:20px;"/></td></tr>
    
 </table><br />
            <input id="Button2" type="button" value="添加"class="submit-btn" />
</div>
</div>
<div id="cont3" style="display:none" align='center'><br />
  根据开课学期查询（请选择）：<select id="Select2" name="xl">
            <option value="大一上学期" selected="selected">大一上学期</option>
            <option value="大一下学期" >                   大一下学期</option>
            <option value="大二上学期">                    大二上学期</option>
            <option value="大二下学期">                    大二下学期</option>
            <option value="大三上学期">                    大三上学期</option>
            <option value="大三下学期">                    大三下学期</option>
            <option value="大四上学期">                    大四上学期</option>
            <option value="大四下学期">                    大四下学期</option>
                                </select>              
        <input id="Button3" type="button" value="查询" class="submit-btn"/><br /><br /><br />
    <div id="div0"></div>

    
</div>
<div id="cont4"style="display:none" ><br />
    请选择课程编号：<select id="Select3" name="D1">
            <option>请选择</option>
        </select>&nbsp;
        <input id="Button4" type="button" value="查询" class="submit-btn"/><br /><br /><br />
    <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right"  height="30px">课程号： </td>  <td  height="30px"><input id="Text10" type="text"class="c1"style="height:20px;" readonly="true" /></td></tr>
 <tr><td align="right"  height="30px">课程名称： </td>  <td  height="30px"><input id="Text11" type="text" class="c1"style="height:20px;"/></td></tr>
 <tr><td align="right"  height="30px">所用教材：</td>  <td  height="30px"><input id="Text12" type="text" class="c1"style="height:20px;"/></td></tr>
    <tr><td align="right"  height="30px">开课学期： </td>  <td  height="30px"><input id="Text13" type="text" class="c1"style="height:20px;" /></td></tr>
    <tr><td align="right"  height="30px">学分：</td>  <td  height="30px"><input id="Text14" type="text" class="c1"style="height:20px;"/></td></tr>
  
 </table><br />
   <input id="Button5" type="button" value="修改" class="submit-btn"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Button6" type="button" value="删除" class="submit-btn"/><br />
      </div>      

</div>

            <div id="cont6"style="display:none" ><br />
   <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">教师编号： </td>  <td  height="30px"><input id="Text15" type="text"class="c1"style="height:20px;" /></td></tr>
 <tr><td align="right"  height="30px">姓名： </td>  <td  height="30px"><input id="Text16" type="text" class="c1"style="height:20px;"/></td></tr>
  <tr><td align="right" height="30px" > 性别：</td>  <td  height="30px"><input id="Radio3"name="r2" type="radio"class="c1"" />男 &nbsp;&nbsp;
<input id="Radio4" name="r2" type="radio"/>女</td></tr>
    <tr><td align="right"  height="30px">所属学院：</td>  <td  height="30px"><input id="Text17" type="text" class="c1"style="height:20px;"/></td></tr>
    <tr><td align="right"  height="30px">所上课程：</td>  <td  height="30px"><input id="Text18" type="text" class="c1"style="height:20px;"/></td></tr>
    <tr><td align="right"  height="30px">密码：</td>  <td  height="30px"><input id="Text19" type="text"class="c1" style="height:20px;"/></td></tr>
    
 </table><br /><input id="Button7" type="button" value="添加"class="submit-btn" />
         </div>
</div>
            <div id="cont7"style="display:none" ><br />
  根据教师姓名查询（请选择教师姓名）：<select id="Select4" name="D1">
            <option>请选择</option>
        </select>&nbsp;
        <input id="Button8" type="button" value="查询" class="submit-btn"/><br /><br /><br />

     <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">教师编号： </td>  <td height="30px"><input id="Text20" type="text"class="c1"style="height:20px;" readonly="true" /></td></tr>
 <tr><td align="right" height="30px">姓名： </td>  <td height="30px"><input id="Text21" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
  <tr><td align="right" height="30px">性别：</td>  <td height="30px"><input id="Radio5"name="r2" type="radio"class="c1"style="height:20px;" />男 &nbsp;&nbsp;
<input id="Radio6" name="r2" type="radio"style="height:20px;"/>女</td></tr>
    <tr><td align="right" height="30px">所属学院： </td>  <td height="30px"><input id="Text22" type="text" class="c1"style="height:20px;" readonly="true"/></td></tr>
    <tr><td align="right" height="30px">所上课程：</td>  <td height="30px"><input id="Text23" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
    <tr><td align="right" height="30px">密码：</td>  <td height="30px"><input id="Text24" type="text"class="c1" style="height:20px;"readonly="true"/></td></tr>
    
 </table><br />
   
      </div>      

</div>
            <div id="cont8" style="display:none"><br />
   请选择教师编号：<select id="Select5" name="D1">
            <option>请选择</option>
        </select>&nbsp;
        <input id="Button9" type="button" value="查询" class="submit-btn"/><br /><br /><br />
    <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right"  height="30px">教师编号： </td>  <td  height="30px"><input id="Text25" type="text"class="c1"style="height:20px;" readonly="true" /></td></tr>
 <tr><td align="right"  height="30px">姓名： </td>      <td  height="30px"><input id="Text26" type="text" class="c1"style="height:20px;"/></td></tr>
  <tr><td align="right"  height="30px">性别：</td>      <td  height="30px"><input id="Radio7"name="r2" type="radio"class="c1"style="height:20px;" />男 &nbsp;&nbsp;
<input id="Radio8" name="r2" type="radio"style="height:20px;"/>女</td></tr>
    <tr><td align="right"  height="30px">所属学院：</td>  <td  height="30px"><input id="Text27" type="text" class="c1"style="height:20px;"/></td></tr>
    <tr><td align="right"  height="30px">所上课程： </td>  <td  height="30px"><input id="Text28" type="text" class="c1"style="height:20px;" /></td></tr>
    <tr><td align="right"  height="30px">密码：</td>  <td  height="30px"><input id="Text29" type="text" class="c1"style="height:20px;"/></td></tr>
  
 </table><br />
   <input id="Button10" type="button" value="修改" class="submit-btn"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Button11" type="button" value="删除" class="submit-btn"/><br />
      </div>      

</div>
            <div id="cont10" style="display:none" align='center'>
  

</div>
            <div id="cont11" style="display:none" align='center'>
   

</div>
           <div id="cont12" style="display:none" align='center'><br />
               <div align="center">
     <table height="50%" border="0"  >
    请选择教材编号：<select id="Select6" name="D1">
            <option>请选择</option>
        </select>  &nbsp;&nbsp;&nbsp; &nbsp;<input id="Button13" type="button" value="查询" class="submit-btn"/><br /><br /><br />
 <tr><td align="right"  height="30px">教材名称： </td>  <td  height="30px"><input id="Text30" type="text"class="c1"style="height:20px;" readonly="true"/></td></tr>
 <tr><td align="right"  height="30px">总库存： </td>      <td  height="30px"><input id="Text31" type="text" class="c1"style="height:20px;"/></td></tr>
         </table><br />
                    <input id="Button12" type="button" value="教材入库" class="submit-btn"/>
</div>
       </div>
  
	</center>


    </form>
   <p>
   </p>
</body>
</html>
