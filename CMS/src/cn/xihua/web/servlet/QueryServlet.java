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
    	 * �����Ȳ�ѯ���ݣ������ݴ洢��������У���ת��ҳ��չʾ
    	 */
    	   UserService service=new UserServiceImpl();
    	   List<User> list=service.findAll();
    	   
    	   //��̨����List
   		   for (User user : list) {
   		    	System.out.println(user);
   	    	}
   		
   		  //ʹ��session����
   		  //��ȡsession����:�������Ҫ����cookie��Ϣ
   		  HttpSession session = req.getSession();
   		  //����ѯ�����ݴ洢��List����
   		  session.setAttribute("all", list);
   		
   		  //��ת��main.jspҳ��չʾ����
   		  resp.sendRedirect("/CMS/chaxun.jsp");	
    	   
    }
}
