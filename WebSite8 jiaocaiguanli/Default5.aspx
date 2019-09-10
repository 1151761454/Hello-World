<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.7.1.js"></script>
    <script>
        $(function () {
            $.ajax({
                type: "post",   // post常用，get安全性较差。注意：这里不是分号，是逗号，不是语句，是多个参数
                url: "Default6.aspx", //接收参数的后台程序
                datatype: "text",  //注意：从后台返回参数是文本形式
                data: "key=",
                success: function (result) {
                    //$("#Text4").val(result);//测试一下数据是否返回
                    //下在把数据拆开动态生成一个html表格 显示
                    var data1 = new Array();
                    data1 = result.split('|');
                    //清空div1为输出数据准备
                    $("#cont6").empty();
                    var table1 = $("<table id='table1' border='1px' width='75%' >");
                    $("#cont6").append(table1);
                   
                        var data2 = data1[0].split(',');
                        var tr = $("<tr>");  
                        var trend = $("</tr>");
                        tr.appendTo(table1);
                        for (var j = 0; j < 5; j++) {
                            var td = $("<td style='color:#10237d' align='center'>" + data2[j] + "</td>");
                            td.appendTo(tr);
                        }
                        var td1 = $("<td style='color:#10237d' align='center'>" + "排名" + "</td>");
                        td1.appendTo(tr);

                        trend.append(table1);
                   

                    for (var i = 1; i < data1.length ; i++) {
                        var data2 = data1[i].split(',');
                        var tr = $("<tr>");  //最好使用$，否则可能后面引用时出问题
                        var trend = $("</tr>");
                        tr.appendTo(table1);
                        for (var j = 0; j < 5; j++) {
                            var td0 = $("<td style='color:#10237d' align='center'>" + data2[j] + "</td>");
                            td0.appendTo(tr);
                        }
                        
                            var td2 = $("<td style='color:#10237d' align='center'>" +i + "</td>");
                            td2.appendTo(tr);
                       
                        trend.append(table1);   
                    }
                   
                    $("#cont6").append("</table>");
                }
            })
        })


            </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="cont6"></div>
    </div>
    </form>
</body>
</html>
