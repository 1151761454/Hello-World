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
		// TODO 自动生成的方法存根

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO 自动生成的方法存根
		//过滤器每次默认执行的方法
		//判断是否登录，没有登录跳转登录页面
		//判断session中是否有登录的用户对象，如果有代表登录
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) resp;
        HttpSession session=request.getSession();
        //获取不到数据，返回一个null
        Object obj=session.getAttribute("user");
        if(obj==null) {
        	//提示信息
        	session.setAttribute("msg", "请先登录");
        	//跳转登录页面
        	response.sendRedirect("/CMS/login.jsp");
        	return ;//跳出方法的执行
        }
        //放行
        chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO 自动生成的方法存根

	}

}
