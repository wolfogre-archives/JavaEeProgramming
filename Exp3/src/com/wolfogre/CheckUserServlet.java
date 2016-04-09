package com.wolfogre;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/9.
 */
@WebServlet(name = "CheckUser", urlPatterns = {"/CheckUser"})
public class CheckUserServlet extends HttpServlet {
	private DbDao dbDao;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dbDao = new DbDao("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/shopdb", "root", "DBlocal");
	}

	@Override
	public void destroy() {
		super.destroy();
		try {
			dbDao.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		try {
			if (req.getParameter("username").isEmpty() || req.getParameter("password").isEmpty())
				throw new Exception("用户名和密码不能为空");
			ResultSet resultSet = dbDao.query("select * from user where username = ? and password = ?", req.getParameter("username"), req.getParameter("password"));
			if (!resultSet.next())
				throw new Exception("用户名或密码不正确");
			req.setAttribute("user_id", resultSet.getInt("id"));
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/Shopping.jsp");
			requestDispatcher.forward(req, res);
		} catch (Exception e) {
			req.setAttribute("error", e.getMessage());
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/login.jsp");
			requestDispatcher.forward(req, res);
		}
	}
}