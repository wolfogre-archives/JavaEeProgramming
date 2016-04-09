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
@WebServlet(name = "Ordering", urlPatterns = {"/Ordering"})
public class OrderingServlet extends HttpServlet {
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
		RequestDispatcher requestDispatcher;
		try{
			ResultSet allId = dbDao.query("select id from ProductTable");
			int id = -1;
			while(allId.next())
			{
				id = allId.getInt("id");
				if(req.getParameter("btn_buy_" + id) != null)
					break;
				id = -1;
			}
			if(id == -1)
				throw new Exception("找不到指定的商品");
			//TODO:需要给下一个页面参数
		}catch ( Exception e){
			req.setAttribute("error", e.getMessage());
		}
		requestDispatcher = req.getRequestDispatcher("/WEB-INF/Ordering.jsp");
		requestDispatcher.forward(req, res);
	}
}
