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
		// TODO �Զ����ɵķ������
		/**
		 * ���󣺸���ID��ѯ���ݣ���ת�޸�ҳ��
		 */
		String id = req.getParameter("id");
		UserService service=new UserServiceImpl();
		User u= service.queryOne(id);
		
		//�����ݴ��ݸ������ҳ�桾�����
		HttpSession session = req.getSession();
		session.setAttribute("one", u);
		
		//��ת�޸�ҳ��
		resp.sendRedirect("/CMS/upd.jsp");
		
		//update user set username=?,age=? where id=?
	}

}
