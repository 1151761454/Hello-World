package cn.xihua.web.servlet;

import java.io.IOException;
//import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import cn.xihua.domain.User;
import cn.xihua.service.UserService;
import cn.xihua.service.Impl.UserServiceImpl;



/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/Add")
public class AddServlet extends HttpServlet {
	@Override
	protected void service (HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
      try {
		 /**
          * 需求：接受页面数据，添加到数据库，跳转展示
          */
	    req.setCharacterEncoding("UTF-8");
	    Map<String, String[]> map=req.getParameterMap();
	    //将Map的数据封装到user对象中
	    User user =new User();
	    BeanUtils.populate(user,map);
	
	    System.out.println(user);
	
	    //调用Servie中的add方法
	    UserService service=new UserServiceImpl();
	    service.add(user);
	    
	  //跳转查询
		resp.sendRedirect("/CMS/Query");
	    
      } catch (Exception e) {
		// TODO: handle exception
    	  e.printStackTrace();
	}
	
	}
}
