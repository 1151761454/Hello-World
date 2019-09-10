package cn.xihua.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PowerFilter implements Filter {

	@Override
	public void destroy() {
		// TODO �Զ����ɵķ������

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO �Զ����ɵķ������
		//������ÿ��Ĭ��ִ�еķ���
		//�ж��Ƿ��¼��û�е�¼��ת��¼ҳ��
		//�ж�session���Ƿ��е�¼���û���������д����¼
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) resp;
        HttpSession session=request.getSession();
        //��ȡ�������ݣ�����һ��null
        Object obj=session.getAttribute("user");
        if(obj==null) {
        	//��ʾ��Ϣ
        	session.setAttribute("msg", "���ȵ�¼");
        	//��ת��¼ҳ��
        	response.sendRedirect("/CMS/login.jsp");
        	return ;//����������ִ��
        }
        //����
        chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO �Զ����ɵķ������

	}

}
