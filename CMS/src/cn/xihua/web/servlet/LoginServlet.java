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
		// TODO �Զ����ɵķ������
		try {
			/**
			 * ���󣺽���ǰ̨���ݣ���װ����ִ���޸ģ���תҳ��չʾ����
			 */
			req.setCharacterEncoding("UTF-8");
			User u=new User();
			Map<String, String[]> map = req.getParameterMap();
			BeanUtils.populate(u, map);
			//����service
			UserService service=new UserServiceImpl();
			User user= service.login(u);
			
		
			HttpSession session=req.getSession();
			//ִ�е�¼�ж�
			if(user==null)
			{
				//�û��������������
				//�洢һ����ʾ��Ϣ
				session.setAttribute("msg", "�û��������������");
				resp.sendRedirect("/CMS/login.jsp");
			}
			else 
			{
				//��ת��ҳ����¼�ɹ�
				//��¼�ɹ�ʱһ��Ὣ��¼���û���Ϣ���浽session
				session.setAttribute("user", user);
				resp.sendRedirect("/CMS/Query2");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
