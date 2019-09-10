package cn.xihua.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.xihua.service.UserService;
import cn.xihua.service.Impl.UserServiceImpl;

/**
 * Servlet implementation class DelServelt
 */
@WebServlet("/Del")
public class DelServelt extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/**
		 * 需求：根据id删除数据，跳转页面展示
		 */
		String id = req.getParameter("id");
		UserService service=new UserServiceImpl();
		service.del(id);
		
		//跳转查询
		resp.sendRedirect("/CMS/Query");
	}

}
