package cn.xihua.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.xihua.domain.User;
import cn.xihua.service.UserService;
import cn.xihua.service.Impl.UserServiceImpl;

/**
 * Servlet implementation class QueryOneServlet
 */
@WebServlet("/QueryOne")
public class QueryOneServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		/**
		 * 需求：根据ID查询数据，跳转修改页面
		 */
		String id = req.getParameter("id");
		UserService service=new UserServiceImpl();
		User u= service.queryOne(id);
		
		//将数据传递给另外的页面【域对象】
		HttpSession session = req.getSession();
		session.setAttribute("one", u);
		
		//跳转修改页面
		resp.sendRedirect("/CMS/upd.jsp");
		
		//update user set username=?,age=? where id=?
	}

}
