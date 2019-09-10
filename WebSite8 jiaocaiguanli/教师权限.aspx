<%@ Page Language="C#" AutoEventWireup="true" CodeFile="教师权限.aspx.cs" Inherits="教师权限" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <script language="javascript" type="text/javascript" src="Scripts/jquery-1.7.1.js">
        </script>
        <script language="javascript" type="text/javascript">
     var d0 = new Date();
        var y = d0.getFullYear();
        function setup() {
            var year = document.getElementById("year");
            year.options.add(new Option("-年-", 0));
            for (var i = y; i >= y - 50; i--)
            {
                year.options.add(new Option(i, i));
            }
            var month = document.getElementById("month");
            month.options.add(new Option("-月-", 0));
            for (var i = 1; i <=12; i++) {
                month.options[i]=new Option(i,i);
            }
        }
        function getDay() {
            var year = document.getElementById("year").value;
            var month = document.getElementById("month").value;
            var day = document.getElementById("day");
            var d = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
            if (((year % 4) == 0) && ((year % 100) != 0) || ((year % 400) == 0))
            {
                if (month == 2)
                {
                    d[month - 1]++;
                }
                
            }
            for (var i = 1; i <= d[month - 1]; i++)
            {
                day.options.add(new Option(i,i));
            }
        }

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
                url: "教师后台.aspx",
                dataType: "text",
                data: "key='l','" + bh + "'",
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
                url: "教师后台.aspx",
                dataType: "text",
                data: "key='l','" + bh + "'",
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

                        $("#Text18").val(data2[0]);
                        $("#Text19").val(data2[1]);
                        if (data2[2].trim().toString() == "男") $("#Radio7").attr("checked", "checked");//性别
                        else $("#Radio8").attr("checked", true);
                        //$("#Select1").options.add(data4[0]);//年
                        //$("#Select2").options.add(data4[1]);//月
                        //$("#Select3").options.add(data4[2]);//日
                        $("#Text20").val(data2[3]);
                        $("#Text21").val(data2[4]);
                        $("#Text22").val(data2[5]);
                    }

                }

            })

        })
        })
        $(document).ready(function () {
            $("#c1").click(function () {
            $.ajax({//填充学号
                url: "教师后台.aspx",
                dataType: "text",
                data: "key='c'",
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
            $("#c2").click(function () {
            $.ajax({//填充姓名
                url: "教师后台.aspx",
                dataType: "text",
                data: "key='d'",
                type: "post",
                success: function (result) {

                    if (result != null) {//后台传回来的select选项
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空Select1为输出数据准备
                        $("#Select1").empty();
                        for (var i = 0; i < data1.length ; i++) {
                            document.getElementById("Select1").options.add(new Option(data1[i]));
                           
                        }
                    }
                },
            })
            })
            $("#c3").click(function () {
            $.ajax({//填充姓名
                url: "教师后台.aspx",
                dataType: "text",
                data: "key='d'",
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
            $.ajax({//填充教材名称
                url: "教师后台.aspx",
                type: "post",
                dataType: "text",
                data: "key='e'",
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
            $("#L1").click(function () {
            $.ajax({//填充学号
                url: "教师后台.aspx",
                dataType: "text",
                data: "key='c'",
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
            $("#L1").click(function () {
            $.ajax({//填充教材编号
                url: "教师后台.aspx",
                dataType: "text",
                data: "key='m'",
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
        })

           

        $(function () {
            //$("#Text1").focusout(function () {
            //    if ($("#Text1").val().trim().length!=6) {
            //        alert("学号应为6位");
            //        $("#Text1").val("");
            //    }
               
            //})

            $("#Button1").click(function () {
                var se=confirm("是否添加该学生信息?")
                var xh = $("#Text1").val();
                var xm = $("#Text2").val();
                var zym = $("#Text3").val();
                var xb1 = $("#Radio1:Checked").val();
                var xb2 = $("#Radio2:Checked").val();
                var xb;
                if (xb1 == "on") xb = "男";
                else xb = "女";
                var n1 = $("#year").val();
                var n2 = $("#month").val();
                var n3 = $("#day").val();
                var n = n1 + "/" + n2 + "/" + n3;
                var cj = $("#Text4").val();
                var bz = $("#TextArea1").val();
                var csmm = $("#Text6").val();
                if (se == true) {
                    $.ajax({
                        type: "post",
                        url: "教师后台.aspx",
                        datatype: "text",
                        data: "key='a','" + xh + "','" + xm + "','" + zym + "','" + xb + "','" + n + "','" + cj + "','" + bz + "','" + csmm + "'",
                        success: function (result) {
                            alert(result);

                        }
                    })
                }
            })
            $("#Button2").click(function () {
                var xh = $("#Select4").val();
                $.ajax({
                    url: "教师后台.aspx",
                    dataType: "text",
                    data: "key='f','" + xh + "'",
                    type: "post",
                    success: function (result) {
                        if (result != null) {//后台传回来的select选项
                            var data1 = new Array();
                            data1 = result.split('|');
                            var data2 = new Array();
                            data2 = data1[1].split(',');

                            
                            $("#Text5").val(data2[0]);//学号
                            $("#Text7").val(data2[1]);//姓名
                            $("#Text8").val(data2[2]);//专业名
                            if (data2[3].trim().toString() == "男") $("#Radio3").attr("checked", "checked");//性别
                            else $("#Radio4").attr("checked", true);
                            //$("#Select1").options.add(data4[0]);//年
                            //$("#Select2").options.add(data4[1]);//月
                            //$("#Select3").options.add(data4[2]);//日
                            $("#Text11").val(data2[4] + '/' + data2[5] + '/' + data2[6]);
                            $("#Text9").val(data2[7]);
                            $("#TextArea2").val(data2[8]);
                            $("#Text10").val(data2[9]);
                        }

                    }

                })

            })
            $("#Button3").click(function () {
                var xm = $("#Select1").val();
                $.ajax({
                    url: "教师后台.aspx",
                    dataType: "text",
                    data: "key='g','" + xm + "'",
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

                            $("#Text12").val(data2[0]);//学号
                            $("#Text13").val(data2[1]);//姓名
                            $("#Text14").val(data2[2]);//专业名
                            if (data2[3].trim().toString() == "男") $("#Radio5").attr("checked", "checked");//性别
                            else $("#Radio6").attr("checked", true);
                           
                            
                            //Select1.text = data2[4];
                            //Select2.text = data2[5];
                            //Select3.text = data2[6];
                            $("#Text15").val(data2[4] +'/'+ data2[5]+'/' + data2[6]);
                            $("#Text16").val(data2[7]);
                            $("#TextArea3").val(data2[8]);
                            $("#Text17").val(data2[9]);
                        }

                    }

                })

            })
            $("#Button5").click(function () {
                var xm = $("#Select2").val();
                $.ajax({
                    url: "教师后台.aspx",
                    dataType: "text",
                    data: "key='g','" + xm + "'",
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

                            $("#Text23").val(data2[0]);//学号
                            $("#Text24").val(data2[1]);//姓名
                            $("#Text25").val(data2[2]);//专业名
                            if (data2[3].trim().toString() == "男") $("#Radio9").attr("checked", "checked");//性别
                            else $("#Radio10").attr("checked", true);


                            //Select1.text = data2[4];
                            //Select2.text = data2[5];
                            //Select3.text = data2[6];
                            $("#Text26").val(data2[4] + '/' + data2[5] + '/' + data2[6]);
                            $("#Text27").val(data2[7]);
                            $("#TextArea4").val(data2[8]);
                            $("#Text28").val(data2[9]);
                        }

                    }

                })

            })
            $("#Button4").click(function () {
                //修改数据
                var xh = $("#Text12").val();
                var xm = $("#Text13").val();
                var zym = $("#Text14").val();
                var xb1 = $("#Radio5:Checked").val();
                var xb2 = $("#Radio6:Checked").val();
                var xb;
                if (xb1 == "on") xb = "男";
                else xb = "女";
                var csrq = $("#Text15").val();
                var cj = $("#Text16").val();
                var bz = $("#TextArea3").val();
                var csmm = $("#Text17").val();
                var se = confirm("是否修改该学生信息?")
                if (se == true) {
                    $.ajax({
                        url: "教师后台.aspx",
                        dataType: "text",
                        data: "key='h','"+xh+"','" + xm + "','" + zym + "','" + xb + "','" + csrq + "','" + cj + "','" + bz + "','" + csmm + "'",
                        type: "post",
                        success: function (result) {
                            //$("#Text4").val(result);//测试一下数据是否返回
                            alert(result);
                        }
                    })
                }

            })
            $("#Button6").click(function () {
                var xh = $("#Text23").val();
                var se = confirm("是否删除该学生信息?")
                if (se == true) {
                    $.ajax({
                        url: "教师后台.aspx",
                        dataType: "text",
                        data: "key='i','" + xh + "'",
                        type: "post",
                        success: function (result) {

                            alert(result);
                            $("#Text23").val("");//学号
                            $("#Text24").val("");//姓名
                            $("#Text25").val("");//专业名
                            $("#Radio9").attr("checked", false);//性别
                            $("#Radio10").attr("checked", false);
                            //Select1.text = data2[4];
                            //Select2.text = data2[5];
                            //Select3.text = data2[6];
                           $("#Text26").val("");
                           $("#Text27").val("");
                           $("#TextArea4").val("");
                           $("#Text28").val("");

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
                        $("#cont6").empty();
                        var table1 = $("<table id='table1' border='1px' width='75%' >");
                        $("#cont6").append(table1);
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
                            $("#cont6").append("</table>");
                        }
                    }
                })

            })
            $("#Button7").click(function () {
                var jcmc = $("#Select3").val();
                $.ajax({
                    url: "教师后台.aspx",
                    dataType: "text",
                    data: "key='j','" + jcmc + "'",
                    type: "post",
                    success: function (result) {
                       
                        if (result != null) {//后台传回来的select选项
                            var data1 = new Array();
                            data1 = result.split('|');
                            var data2 = new Array();
                            data2 = data1[1].split(',');

                            
                            $("#Text29").val(data2[0]);
                            $("#Text30").val(data2[1]);
                            $("#Text31").val(data2[2]);
                            $("#Text32").val(data2[3]);
                            $("#Text33").val(data2[4]);
                        }

                    }

                })
            })
            $("#Button8").click(function () {
                aa1.style.display = "none";
                var se = confirm("是否领取该教材?")
                var jcmc = $("#Select3").val();
                var xm = $("#Text32").val();
                var sl = $("#Text33").val();
               
                if (se == true) {
                    $.ajax({
                        type: "post",
                        url: "教师后台.aspx",
                        datatype: "text",
                        data: "key='b','" + xm + "','" + sl + "','"+jcmc+"'",
                        success: function (result) {
                            alert(result);

                        }
                    })
                }
            })
            $("#Button9").click(function () {
                var xh = $("#Select5").val();
                $.ajax({
                    type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                    url: "教师后台.aspx", //接收参数的后台程序
                    datatype: "text",  //注意：从后台返回参数是文本形式
                    data: "key='n','" + xh + "'",
                    success: function (result) {
                        //$("#Text4").val(result);//测试一下数据是否返回
                        //下在把数据拆开动态生成一个html表格 显示
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空div1为输出数据准备
                        $("#div1").empty();
                        var table1 = $("<table id='table1' border='1px' width='75%' >");
                        $("#div1").append(table1);
                        for (var i = 0; i < data1.length ; i++) {
                            var data2 = data1[i].split(',');
                            var tr = $("<tr>");  //最好使用$，否则可能后面引用时出问题
                            var trend = $("</tr>");
                            tr.appendTo(table1);
                            for (var j = 0; j < 2; j++) {
                                var td = $("<td width=50% style='color:#10237d' align='center'>" + data2[j] + "</td>");
                                td.appendTo(tr);
                            }
                            trend.append(table1);
                            $("#div1").append("</table>");
                        }
                    }
                })

            })
            $("#Button10").click(function () {
                var bh = $("#Select6").val();
                $.ajax({
                    type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                    url: "教师后台.aspx", //接收参数的后台程序
                    datatype: "text",  //注意：从后台返回参数是文本形式
                    data: "key='o','" + bh + "'",
                    success: function (result) {
                        //$("#Text4").val(result);//测试一下数据是否返回
                        //下在把数据拆开动态生成一个html表格 显示
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空div1为输出数据准备
                        $("#div1").empty();
                        var table1 = $("<table id='table1' border='1px' width='75%' >");
                        $("#div1").append(table1);
                        for (var i = 0; i < data1.length ; i++) {
                            var data2 = data1[i].split(',');
                            var tr = $("<tr>");  //最好使用$，否则可能后面引用时出问题
                            var trend = $("</tr>");
                            tr.appendTo(table1);
                            for (var j = 0; j < 2; j++) {
                                var td = $("<td width=50% style='color:#10237d' align='center'>" + data2[j] + "</td>");
                                td.appendTo(tr);
                            }
                            trend.append(table1);
                            $("#div1").append("</table>");
                        }
                    }
                })

            })
            $("#L2").click(function () {

                $.ajax({
                    type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                    url: "教师后台.aspx", //接收参数的后台程序
                    datatype: "text",  //注意：从后台返回参数是文本形式
                    data: "key='p'",
                    success: function (result) {
                        //$("#Text4").val(result);//测试一下数据是否返回
                        //下在把数据拆开动态生成一个html表格 显示
                        var data1 = new Array();
                        data1 = result.split('|');
                        //清空div1为输出数据准备
                        $("#cont9").empty();
                        var table1 = $("<table id='table1' border='1px' width='75%' >");
                        $("#cont9").append(table1);
                        for (var i = 0; i < data1.length ; i++) {
                            var data2 = data1[i].split(',');
                            var tr = $("<tr>");  //最好使用$，否则可能后面引用时出问题
                            var trend = $("</tr>");
                            tr.appendTo(table1);
                            for (var j = 0; j < 2; j++) {
                                var td = $("<td style='color:#10237d' align='center'>" + data2[j] + "</td>");
                                td.appendTo(tr);
                            }
                            trend.append(table1);
                            $("#cont9").append("</table>");
                        }
                    }
                })

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
	left:485px;
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
<body  onload="setup()" background="img\00.jpg" style="background-repeat:no-repeat;
    background-size:100% 100%;
    background-attachment:fixed;">
    <form id="form1" runat="server">
        <div class="header_title">
		<span class="title_con">教材管理系统(教师)</span></div><br />
     <a id="BB" style="font-family:宋体;font-weight:bold;color:#62ab00;font-style:italic"></a>
        <div style="float:right;font-family:宋体;font-weight:bold;color:#62ab00;font-style:italic"><a href="Default2.aspx">退出系统</a></div>
	
               <br/>
        <div style="float:left;text-align:center;height:5px;width:100%;background-color: #39A631"></div>
        <!--nav-->
        <div style="text-align:center;height:20px;color:#f00;" id="aa1" >请先领取教材！</div>
<div class="nav">
	<!--导航条-->
	<ul class="nav-main">
        <li>
            <a href="#" onclick="document.getElementById('cont0').style.display='block';
                                 document.getElementById('cont1').style.display='none';
                                 document.getElementById('cont2').style.display='none';
                                 document.getElementById('cont3').style.display='none';
                                 document.getElementById('cont4').style.display='none';
                                 document.getElementById('cont5').style.display='none';
                                 document.getElementById('cont6').style.display='none';
                                 document.getElementById('cont7').style.display='none';
                                 document.getElementById('cont8').style.display='none';
                                 document.getElementById('cont9').style.display='none';" style="text-decoration:none;">
            首页</a>
                </li>
		<li >
            <a href="#" id="a0" onclick="document.getElementById('cont1').style.display='block';
                                         document.getElementById('cont0').style.display='none';
                                         document.getElementById('cont2').style.display='none';
                                         document.getElementById('cont3').style.display='none';
                                         document.getElementById('cont4').style.display='none';
                                         document.getElementById('cont5').style.display='none';
                                         document.getElementById('cont6').style.display='none';
                                         document.getElementById('cont7').style.display='none';
                                         document.getElementById('cont8').style.display='none';
                                         document.getElementById('cont9').style.display='none';" style="text-decoration:none;">
                个人信息</a> 
		</li>
		<li id="li-2"> <a href="#" style="text-decoration:none;">
            学生管理<span></span></a></li>
		<li id="li-3"><a href="#" style="text-decoration:none;">
            教材管理</a><span></span></li>
        <li>
            <a href="#" id="L1" onclick="document.getElementById('cont8').style.display='block';
                                         document.getElementById('cont0').style.display='none';
                                         document.getElementById('cont1').style.display='none';
                                         document.getElementById('cont2').style.display='none';
                                         document.getElementById('cont3').style.display='none';
                                         document.getElementById('cont4').style.display='none';
                                         document.getElementById('cont5').style.display='none';
                                         document.getElementById('cont6').style.display='none';
                                         document.getElementById('cont7').style.display='none';
                                         document.getElementById('cont9').style.display='none';" style="text-decoration:none;">
            学生领取情况</a>
                </li>
        <li>
            <a href="#" id="L2" onclick="document.getElementById('cont9').style.display='block';
                                         document.getElementById('cont0').style.display='none';
                                         document.getElementById('cont1').style.display='none';
                                         document.getElementById('cont2').style.display='none';
                                         document.getElementById('cont3').style.display='none';
                                         document.getElementById('cont4').style.display='none';
                                         document.getElementById('cont5').style.display='none';
                                         document.getElementById('cont6').style.display='none';
                                         document.getElementById('cont7').style.display='none';
                                         document.getElementById('cont8').style.display='none';" style="text-decoration:none;">
            领取人数统计</a>
                </li>
		
	</ul>
	<!--隐藏盒子-->

	<div id="box-2" class="hidden-box hidden-loc-us">
		<ul>
			<li>
                <a href="#" onclick="document.getElementById('cont2').style.display='block';
                                     document.getElementById('cont0').style.display='none';
                                     document.getElementById('cont1').style.display='none';
                                     document.getElementById('cont3').style.display='none';
                                     document.getElementById('cont4').style.display='none';
                                     document.getElementById('cont5').style.display='none';
                                     document.getElementById('cont6').style.display='none';
                                     document.getElementById('cont7').style.display='none';
                                     document.getElementById('cont8').style.display='none';
                                     document.getElementById('cont9').style.display='none';" style="text-decoration:none;">
                    增加学生信息</a>              </li>
			<li>
                <a href="#" id="c1" onclick="document.getElementById('cont3').style.display='block';
                                             document.getElementById('cont0').style.display='none';
                                             document.getElementById('cont1').style.display='none';
                                             document.getElementById('cont2').style.display='none';
                                             document.getElementById('cont4').style.display='none';
                                             document.getElementById('cont5').style.display='none';
                                             document.getElementById('cont6').style.display='none';
                                             document.getElementById('cont7').style.display='none';
                                             document.getElementById('cont8').style.display='none';
                                             document.getElementById('cont9').style.display='none';" style="text-decoration:none;">
                学生信息查询</a>
                    </li>
            <li>
                <a href="#" id="c2" onclick="document.getElementById('cont4').style.display='block';
                                             document.getElementById('cont0').style.display='none';
                                             document.getElementById('cont1').style.display='none';
                                             document.getElementById('cont2').style.display='none';
                                             document.getElementById('cont3').style.display='none';
                                             document.getElementById('cont5').style.display='none';
                                             document.getElementById('cont6').style.display='none';
                                             document.getElementById('cont7').style.display='none';
                                             document.getElementById('cont8').style.display='none';
                                             document.getElementById('cont9').style.display='none';" style="text-decoration:none;">
                学生信息修改</a>
                    </li>
            <li>
                <a href="#" id="c3" onclick="document.getElementById('cont5').style.display='block';
                                             document.getElementById('cont0').style.display='none';
                                             document.getElementById('cont1').style.display='none';
                                             document.getElementById('cont2').style.display='none';
                                             document.getElementById('cont3').style.display='none';
                                             document.getElementById('cont4').style.display='none';
                                             document.getElementById('cont6').style.display='none';
                                             document.getElementById('cont7').style.display='none';
                                             document.getElementById('cont8').style.display='none';
                                             document.getElementById('cont9').style.display='none';" style="text-decoration:none;">
                学生信息删除</a>
                    </li>
		</ul>
	</div>
	<div id="box-3" class="hidden-box hidden-loc-info">
		<ul>
			<li>
                <a href="#" id="a1" onclick="document.getElementById('cont6').style.display='block';
                                             document.getElementById('cont0').style.display='none';
                                             document.getElementById('cont1').style.display='none';
                                             document.getElementById('cont2').style.display='none';
                                             document.getElementById('cont3').style.display='none';
                                             document.getElementById('cont4').style.display='none';
                                             document.getElementById('cont5').style.display='none';
                                             document.getElementById('cont7').style.display='none';
                                             document.getElementById('cont8').style.display='none';
                                             document.getElementById('cont9').style.display='none';" style="text-decoration:none;">
                教材目录查询</a></li>
			<li>
                <a href="#" onclick="document.getElementById('cont7').style.display='block';
                                     document.getElementById('cont0').style.display='none';
                                     document.getElementById('cont1').style.display='none';
                                     document.getElementById('cont2').style.display='none';
                                     document.getElementById('cont3').style.display='none';
                                     document.getElementById('cont4').style.display='none';
                                     document.getElementById('cont5').style.display='none';
                                     document.getElementById('cont6').style.display='none';
                                     document.getElementById('cont8').style.display='none';
                                     document.getElementById('cont9').style.display='none';" style="text-decoration:none;">
                    领取教材</a></li>
			
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

<div id="cont1" style="display:none"><br />
     <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">教师编号： </td>  <td height="30px"><input id="Text18" type="text"class="c1"style="height:20px;" readonly="true" /></td></tr>
 <tr><td align="right" height="30px">姓名： </td>  <td height="30px"><input id="Text19" type="text" class="c1"style="height:20px;" readonly="true"/></td></tr>
  <tr><td align="right" height="30px"> 性别：</td>  <td height="30px"><input id="Radio7"name="r2" type="radio"class="c1"" />男 &nbsp;&nbsp;
<input id="Radio8" name="r2" type="radio"/>女</td></tr>
    <tr><td align="right" height="30px">所属学院：</td>  <td height="30px"><input id="Text20" type="text" class="c1"style="height:20px;" readonly="true"/></td></tr>
    <tr><td align="right" height="30px">所上课程：</td>  <td height="30px"><input id="Text21" type="text" class="c1"style="height:20px;" readonly="true"/></td></tr>
    <tr><td align="right" height="30px">密码：</td>  <td height="30px"><input id="Text22" type="text"class="c1" style="height:20px;" readonly="true"/></td></tr>
    
 </table><br />
         </div>
</div>
<div id="cont2" style="display:none"><br />
       <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">学号： </td>  <td height="30px"><input id="Text1" type="text"class="c1"style="height:20px;" /></td></tr>
 <tr><td align="right" height="30px">姓名： </td>  <td height="30px"><input id="Text2" type="text" class="c1"style="height:20px;"/></td></tr>
 <tr><td align="right" height="30px">专业名：</td>  <td height="30px"><input id="Text3" type="text" class="c1"style="height:20px;"/></td></tr>
  <tr><td align="right" height="30px"> 性别：</td>  <td height="30px"><input id="Radio1"name="r1" type="radio"class="c1"style="height:20px;" checked="checked"/>男 &nbsp;&nbsp;
<input id="Radio2" name="r1" type="radio"style="height:20px;" />女</td></tr>
    <tr><td align="right" height="30px">出生日期：</td>  <td height="30px"><select name="year" id="year" onchange="getDay()"class="c1"style="height:20px;" ></select>年 &nbsp;&nbsp;
                                <select name="month" id="month"onchange="getDay()"class="c1"style="height:20px;"></select>月 &nbsp;&nbsp;
                                <select name="day" id="day"class="c1"style="height:20px;"></select>日</td></tr>

    <tr><td align="right" height="30px">入校成绩：</td>  <td height="30px"><input id="Text4" type="text" class="c1"style="height:20px;"/></td></tr>
    <tr><td align="right" height="30px">备注：</td>  <td height="30px"><textarea id="TextArea1"class="c1"style="height:50px;"></textarea></td></tr>
    <tr><td align="right" height="30px">初始密码：</td>  <td height="30px"><input id="Text6" type="text"class="c1" style="height:20px;"/></td></tr>
    
 </table><br />
            <input id="Button1" type="button" value="添加"class="submit-btn" />
</div>
</div>
<div id="cont3" style="display:none"><br />
    根据学号查询（请选择学号）：<select id="Select4" name="D1">
            <option>请选择</option>
        </select>&nbsp;
        <input id="Button2" type="button" value="查询" class="submit-btn"/><br /><br />

     <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">学号： </td>  <td height="30px"><input id="Text5" type="text"class="c1"style="height:20px;" readonly="true" /></td></tr>
 <tr><td align="right" height="30px">姓名： </td>  <td height="30px"><input id="Text7" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
 <tr><td align="right" height="30px">专业名：</td>  <td height="30px"><input id="Text8" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
  <tr><td align="right" height="30px">性别：</td>  <td height="30px"><input id="Radio3"name="r2" type="radio"class="c1"style="height:20px;" />男 &nbsp;&nbsp;
<input id="Radio4" name="r2" type="radio"style="height:20px;"/>女</td></tr>
<%--    <tr><td align="right" >出生日期：</td>  <td ><select name="year" id="Select1" class="c1"style="height:20px;" ></select>年 &nbsp;&nbsp;
                                <select name="month" id="Select2"class="c1"style="height:20px;"></select>月 &nbsp;&nbsp;
                                <select name="day" id="Select3"class="c1"style="height:20px;"></select>日</td></tr>--%>
    <tr><td align="right" height="30px">出生日期： </td>  <td height="30px"><input id="Text11" type="text" class="c1"style="height:20px;" readonly="true"/></td></tr>
    <tr><td align="right" height="30px">入校成绩：</td>  <td height="30px"><input id="Text9" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
    <tr><td align="right" height="30px">备注：</td>  <td height="30px"><textarea id="TextArea2"class="c1"style="height:50px;"readonly="true"></textarea></td></tr>
    <tr><td align="right" height="30px">初始密码：</td>  <td height="30px"><input id="Text10" type="text"class="c1" style="height:20px;"readonly="true"/></td></tr>
    
 </table><br />
   
      </div>      
    </div>
<div id="cont4" style="display:none"><br />
    根据姓名查询（请选择姓名）：<select id="Select1" name="D1">
            <option>请选择</option>
        </select>&nbsp;
        <input id="Button3" type="button" value="查询" class="submit-btn"/><br /><br />

     <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">学号： </td>  <td height="30px"><input id="Text12" type="text"class="c1"style="height:20px;" readonly="true" /></td></tr>
 <tr><td align="right" height="30px">姓名： </td>  <td height="30px"><input id="Text13" type="text" class="c1"style="height:20px;"/></td></tr>
 <tr><td align="right" height="30px">专业名：</td>  <td height="30px"><input id="Text14" type="text" class="c1"style="height:20px;"/></td></tr>
  <tr><td align="right" height="30px">性别：</td>  <td height="30px"><input id="Radio5"name="r2" type="radio"class="c1"style="height:20px;" />男 &nbsp;&nbsp;
<input id="Radio6" name="r2" type="radio"style="height:20px;"/>女</td></tr>
    <%--<tr><td align="right" >出生日期：</td>  <td ><select name="year" id="Select1" class="c1"style="height:20px;" ></select>年 &nbsp;&nbsp;
                                <select name="month" id="Select2"class="c1"style="height:20px;"></select>月 &nbsp;&nbsp;
                                <select name="day" id="Select3"class="c1"style="height:20px;"></select>日</td></tr>--%>
    <tr><td align="right" height="30px">出生日期： </td>  <td height="30px"><input id="Text15" type="text"class="c1"style="height:20px;" /></td></tr>
    <tr><td align="right" height="30px">入校成绩：</td>  <td height="30px"><input id="Text16" type="text" class="c1"style="height:20px;"/></td></tr>
    <tr><td align="right" height="30px">备注：</td>  <td height="30px"><textarea id="TextArea3"class="c1"style="height:50px;"></textarea></td></tr>
    <tr><td align="right" height="30px">初始密码：</td>  <td height="30px"><input id="Text17" type="text"class="c1" style="height:20px;"/></td></tr>
    
 </table><br />
   <input id="Button4" type="button" value="确认修改"class="submit-btn" />
      </div>      
        
    

    </div>
 <div id="cont5" style="display:none"><br />
   根据姓名查询（请选择姓名）：<select id="Select2" name="D1">
            <option>请选择</option>
        </select>&nbsp;
        <input id="Button5" type="button" value="查询" class="submit-btn"/><br /><br />

     <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" height="30px">学号： </td>  <td height="30px"><input id="Text23" type="text"class="c1"style="height:20px;" readonly="true" /></td></tr>
 <tr><td align="right" height="30px">姓名： </td>  <td height="30px"><input id="Text24" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
 <tr><td align="right" height="30px">专业名：</td>  <td height="30px"><input id="Text25" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
  <tr><td align="right" height="30px">性别：</td>  <td height="30px"><input id="Radio9"name="r2" type="radio"class="c1"style="height:20px;"readonly="true" />男 &nbsp;&nbsp;
<input id="Radio10" name="r2" type="radio"style="height:20px;"/>女</td></tr>
    
    <tr><td align="right" height="30px">出生日期： </td>  <td height="30px"><input id="Text26" type="text"class="c1"style="height:20px;" readonly="true"/></td></tr>
    <tr><td align="right" height="30px">入校成绩：</td>  <td height="30px"><input id="Text27" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
    <tr><td align="right" height="30px">备注：</td>  <td height="30px"><textarea id="TextArea4"class="c1"style="height:50px;"readonly="true"></textarea></td></tr>
    <tr><td align="right" height="30px">初始密码：</td>  <td height="30px"><input id="Text28" type="text"class="c1" style="height:20px;"readonly="true"/></td></tr>
    
 </table><br />
   <input id="Button6" type="button" value="删除此人"class="submit-btn" />
     </div></div>
<div id="cont6" style="display:none" align='center'>
   
</div>
    <div id="cont7" style="display:none"><br />
   请选择教材名称：<select id="Select3" name="D1">
            <option>请选择</option>
        </select>&nbsp;
        <input id="Button7" type="button" value="查询" class="submit-btn"/><br /><br /><br />
        <div align="center">
     <table height="50%" border="0"  >
 <tr><td align="right" >教材编号： </td>  <td ><input id="Text29" type="text"class="c1"style="height:20px;" readonly="true" /></td></tr>
 <tr><td align="right" >教材名称： </td>  <td ><input id="Text30" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
 <tr><td align="right" >总库存：</td>  <td ><input id="Text31" type="text" class="c1"style="height:20px;"readonly="true"/></td></tr>
    <tr><td align="right" >领取人姓名： </td>  <td ><input id="Text32" type="text"class="c1"style="height:20px;" /></td></tr>
    <tr><td align="right" >领取数量：</td>  <td ><input id="Text33" type="text" class="c1"style="height:20px;"/></td></tr>
    
 </table><br />
   <input id="Button8" type="button" value="领取"class="submit-btn" />
     </div>
</div>
           <div id="cont8" style="display:none" align='center'><br />
  请选择学号：<select id="Select5" name="D1">
            <option>请选择</option>
        </select>&nbsp;
        <input id="Button9" type="button" value="查询" class="submit-btn"/>
  请选择教材编号：<select id="Select6" name="D1">
            <option>请选择</option>
        </select>&nbsp;
        <input id="Button10" type="button" value="查询" class="submit-btn"/><br /><br /><br />
               <div id="div1"></div>

</div>
           <div id="cont9" style="display:none" align='center'>
   
</div>
  
	</div></center>
    </form>
</body>
</html>
