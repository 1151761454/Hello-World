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
			 * ���󣺽���ǰ̨���ݣ���װ����ִ���޸ģ���תҳ��չʾ����
			 */
			req.setCharacterEncoding("UTF-8");
			Map<String, String[]> map = req.getParameterMap();
			User u=new User();
			
			BeanUtils.populate(u, map);
			
			//����service
			UserService service=new UserServiceImpl();
			service.upd(u);
			
			//��ת��ѯ
			resp.sendRedirect("/CMS/Query");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}


}
