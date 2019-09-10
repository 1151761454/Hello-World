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
		 * ���󣺸���idɾ�����ݣ���תҳ��չʾ
		 */
		String id = req.getParameter("id");
		UserService service=new UserServiceImpl();
		service.del(id);
		
		//��ת��ѯ
		resp.sendRedirect("/CMS/Query");
	}

}
