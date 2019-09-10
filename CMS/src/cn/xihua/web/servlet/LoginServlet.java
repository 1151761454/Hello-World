package cn.xihua.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import cn.xihua.domain.User;
import cn.xihua.service.UserService;
import cn.xihua.service.Impl.UserServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		try {
			/**
			 * 需求：接收前台数据，封装对象，执行修改，跳转页面展示数据
			 */
			req.setCharacterEncoding("UTF-8");
			User u=new User();
			Map<String, String[]> map = req.getParameterMap();
			BeanUtils.populate(u, map);
			//调用service
			UserService service=new UserServiceImpl();
			User user= service.login(u);
			
		
			HttpSession session=req.getSession();
			//执行登录判断
			if(user==null)
			{
				//用户名或者密码错误
				//存储一个提示信息
				session.setAttribute("msg", "用户名或者密码错误！");
				resp.sendRedirect("/CMS/login.jsp");
			}
			else 
			{
				//跳转主页，登录成功
				//登录成功时一般会将登录的用户信息保存到session
				session.setAttribute("user", user);
				resp.sendRedirect("/CMS/Query2");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
