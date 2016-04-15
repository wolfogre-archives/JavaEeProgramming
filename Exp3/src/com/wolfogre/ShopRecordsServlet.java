package com.wolfogre;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/15.
 */
@WebServlet(name = "ShopRecordsServlet", urlPatterns = "/ShopRecords")
public class ShopRecordsServlet extends HttpServlet {
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

			ResultSet resultSet = dbDao.query("select shopRecords.Id as id,productCode,productName,productSource,number,shopDate from shopRecords,productTable where shopRecords.productId = productTable.id and userid = ?", req.getSession().getAttribute("user_id"));
			List<String[]> tableLines = new ArrayList<String[]>();
			while(resultSet.next()){
				String newLine[] = {String.valueOf(resultSet.getInt("id")), resultSet.getString("productCode"), resultSet.getString("productName"),resultSet.getString("productSource"),String.valueOf(resultSet.getInt("number")),String.valueOf(resultSet.getDate("shopDate")) };
				tableLines.add(newLine);
			}
			req.setAttribute("table_lines", tableLines);
		}catch ( Exception e){
			req.setAttribute("error", e.getMessage());
		}
		requestDispatcher = req.getRequestDispatcher("/WEB-INF/ShopRecords.jsp");
		requestDispatcher.forward(req, res);
	}
}
