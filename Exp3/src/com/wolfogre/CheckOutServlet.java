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
			Object obj = req.getParameter("number");
			int number = Integer.getInteger(req.getParameter("number"));
			//TODO:obj是正常的，但是number却得不到，出现空引用异常
			int userId = (Integer)req.getSession().getAttribute("user_id");
			int  productId = (Integer)req.getAttribute("product_id");
			dbDao.insert("insert into ShopRecords (userId, productId, number, shopDate) values(?,?,?,?)",userId,productId,number,new java.sql.Date(new java.util.Date().getTime()));
		}catch ( Exception e){
			req.setAttribute("error", e.getMessage());
			//TODO:明明error被设置了
		}
		requestDispatcher = req.getRequestDispatcher("/WEB-INF/OrderResult.jsp");
		requestDispatcher.forward(req, res);
	}
}
