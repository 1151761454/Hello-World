<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>

</head>

<body>

<div class="nav-top">
	<span>个人管理系统</span>
    <div class="nav-topright">
    	<p id="datetime">
	<script>
        setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000);
    </script>
                登陆IP：192.168.1.1</p>
        <span>您好：${user.name }</span><span><a href="/CMS/login.jsp">注销</a></span>
    </div>
</div>
<div class="nav-down">
	<div class="leftmenu1">
        <div class="menu-oc"><img src="img/menu-all.png" /></div>
    	<ul>
        	<li>
            	<a class="a_list a_list1">用户管理</a>
                <div class="menu_list menu_list_first">
                	<a class="lista_first" href="/CMS/add.html" target=a1>新增用户</a>
                    <a href="/CMS/chaxun.jsp" target=a1>管理用户</a>
                    <a href="/CMS/main2.html"  target=a1>用户设置</a>
                    <a href="/CMS/main2.html" target=a1>系统工具</a>
                </div>
            </li>
            <li>
            	<a class="a_list a_list2">权限管理</a>
                <div class="menu_list">
                	<a href="/CMS/main2.html" target=a1>基本权限</a>
                    <a href="/CMS/main2.html" target=a1>分配权限</a>
                    <a href="/CMS/main2.html" target=a1>权限管理</a>
                    <a href="/CMS/main2.html" target=a1>成员管理</a>
                </div>
            </li>
            <li>
            	<a class="a_list3" href="/CMS/main1.html" target=a1>回到主页</a>
               
            </li>
            
        </ul>
    </div>
    <div class="leftmenu2">
    	<div class="menu-oc1"><img src="img/menu-all.png" /></div>
        <ul>
        	<li>
            	<a class="j_a_list j_a_list1"></a>
                <div class="j_menu_list j_menu_list_first">
                	<span class="sp1"><i></i>用户管理</span>
                	<a class="j_lista_first" href="/CMS/add.html" target=a1>新增用户</a>
                    <a href="/CMS/chaxun.jsp" target=a1>管理用户</a>
                    <a href="/CMS/main2.html" target=a1>用户设置</a>
                    <a href="/CMS/main2.html" target=a1>系统工具</a>
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list2"></a>
                <div class="j_menu_list">
                	<span class="sp2"><i></i>权限管理</span>
                	<a href="/CMS/main2.html" target=a1>基本权限</a>
                    <a href="/CMS/main2.html" target=a1>分配权限</a>
                    <a href="/CMS/main2.html" target=a1>权限管理</a>
                    <a href="/CMS/main2.html" target=a1>成员管理</a>
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list3"></a>
                <div class="j_menu_list">
                	
                    <a href="/CMS/main1.html" target=a1>回到主页</a>
                </div>
            </li>
        </ul>
        
    </div>
    <div  align="center">
     <iframe  width=1300 height=800 frameborder=0 scrolling=auto name=a1 src="/CMS/main1.html"></iframe>
    </div>
</div>

</div>

</body>
</html>
<script type="text/javascript">
	
</script>
