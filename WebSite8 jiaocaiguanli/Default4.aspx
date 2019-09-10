<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script language="javascript" type="text/javascript" src="Scripts/jquery-1.7.1.js">
        </script>
        <script language="javascript" type="text/javascript">
    function GetQueryString(data) {
            var reg = new RegExp("(^|&)" + data + "=([^g]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
    }
    $(function () {
        var bh = GetQueryString("data")
        alert(bh);
                       
                }
          
        )
            </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
