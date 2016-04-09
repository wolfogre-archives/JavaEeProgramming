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
@WebServlet(name = "ManageUsers", urlPatterns = {"/ManageUsers"})
public class ManageUsersServlet extends HttpServlet {
	private DbDao dbDao;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dbDao = new DbDao("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/shopdb","root", "DBlocal");
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
		//super.service(req, res);
		//父类HttpServlet的service方法默认实现是返回状态代码为405的HTTP错误表示对于指定资源的请求方法不被允许。
		RequestDispatcher requestDispatcher;
		try{

			ResultSet resultSet = dbDao.query("select * from user");
			List<String[]> tableLines = new ArrayList<String[]>();
			while(resultSet.next()){
				String newLine[] = {String.valueOf(resultSet.getInt(1)), resultSet.getString(2), resultSet.getString(3)};
				tableLines.add(newLine);
			}
			req.setAttribute("table_lines", tableLines);
			List<String> tableTitles = new ArrayList<String>();
			tableTitles.add("编号");
			tableTitles.add("用户名");
			tableTitles.add("密码");
			req.setAttribute("table_titles", tableTitles);
		}catch ( Exception e){
			req.setAttribute("error", e.getMessage());
		}
		requestDispatcher = req.getRequestDispatcher("/WEB-INF/ManageUsers.jsp");
		requestDispatcher.forward(req, res);
	}
}
