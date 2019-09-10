package cn.xihua.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.xihua.domain.User;
import cn.xihua.service.UserService;
import cn.xihua.service.Impl.UserServiceImpl;


@WebServlet("/Query")
public class QueryServlet extends HttpServlet {
       @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	/**
    	 * 需求：先查询数据，将数据存储到域对象中，跳转到页面展示
    	 */
    	   UserService service=new UserServiceImpl();
    	   List<User> list=service.findAll();
    	   
    	   //后台遍历List
   		   for (User user : list) {
   		    	System.out.println(user);
   	    	}
   		
   		  //使用session对象
   		  //获取session对象:浏览器不要禁用cookie信息
   		  HttpSession session = req.getSession();
   		  //将查询的数据存储到List集合
   		  session.setAttribute("all", list);
   		
   		  //跳转到main.jsp页面展示数据
   		  resp.sendRedirect("/CMS/chaxun.jsp");	
    	   
    }
}
