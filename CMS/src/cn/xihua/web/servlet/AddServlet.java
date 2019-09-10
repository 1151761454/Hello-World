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
          * ���󣺽���ҳ�����ݣ���ӵ����ݿ⣬��תչʾ
          */
	    req.setCharacterEncoding("UTF-8");
	    Map<String, String[]> map=req.getParameterMap();
	    //��Map�����ݷ�װ��user������
	    User user =new User();
	    BeanUtils.populate(user,map);
	
	    System.out.println(user);
	
	    //����Servie�е�add����
	    UserService service=new UserServiceImpl();
	    service.add(user);
	    
	  //��ת��ѯ
		resp.sendRedirect("/CMS/Query");
	    
      } catch (Exception e) {
		// TODO: handle exception
    	  e.printStackTrace();
	}
	
	}
}
