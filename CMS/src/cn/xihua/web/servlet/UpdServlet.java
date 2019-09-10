package cn.xihua.web.servlet;

import java.io.IOException;
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
 * Servlet implementation class UpdServlet
 */
@WebServlet("/Upd")
public class UpdServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			/**
			 * 需求：接收前台数据，封装对象，执行修改，跳转页面展示数据
			 */
			req.setCharacterEncoding("UTF-8");
			Map<String, String[]> map = req.getParameterMap();
			User u=new User();
			
			BeanUtils.populate(u, map);
			
			//调用service
			UserService service=new UserServiceImpl();
			service.upd(u);
			
			//跳转查询
			resp.sendRedirect("/CMS/Query");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}


}
