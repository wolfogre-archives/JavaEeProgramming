package com.wolfogre;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/13.
 */
@WebServlet(name = "CheckOut", urlPatterns = {"/CheckOut"})
public class CheckOutServlet extends HttpServlet {
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
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher requestDispatcher;
		try{
			int number = Integer.parseInt(req.getParameter("number"));
			int userId = (Integer)req.getSession().getAttribute("user_id");
			int  productId = Integer.parseInt(req.getParameter("product_id"));
			dbDao.insert("insert into ShopRecords (userId, productId, number, shopDate) values(?,?,?,?)",userId,productId,number,new java.sql.Date(new java.util.Date().getTime()));
		}catch ( Exception e){
			req.setAttribute("error", e.getMessage());
		}
		requestDispatcher = req.getRequestDispatcher("/WEB-INF/OrderResult.jsp");
		requestDispatcher.forward(req, res);
	}
}
