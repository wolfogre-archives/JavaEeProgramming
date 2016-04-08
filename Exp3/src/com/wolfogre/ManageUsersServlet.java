package com.wolfogre;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/9.
 */
@WebServlet(name = "ManageUsers", urlPatterns = {"/ManageUsers"})
public class ManageUsersServlet extends HttpServlet {
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		//super.service(req, res);
		//父类HttpServlet的service方法默认实现是返回状态代码为405的HTTP错误表示对于指定资源的请求方法不被允许。
		String errMsg = "";
		RequestDispatcher requestDispatcher;
		try{

		}catch ( Exception e){
			e.printStackTrace();
		}
		if(errMsg != null && !errMsg.isEmpty()){
			requestDispatcher = req.getRequestDispatcher("/WEB-INF/ManageUsers.jsp");
			req.setAttribute("error", errMsg);
			requestDispatcher.forward(req, res);
		}
		//for debug
		requestDispatcher = req.getRequestDispatcher("/WEB-INF/ManageUsers.jsp");
		req.setAttribute("error", errMsg);
		requestDispatcher.forward(req, res);
	}
}
