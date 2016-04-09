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
@WebServlet(name = "UpdateProducts", urlPatterns = {"/UpdateProducts"})
public class UpdateProductsServlet extends HttpServlet {
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
		try{
			if(req.getParameter("delete_data") != null){
				List<Integer> listAllId = new ArrayList<Integer>();
				ResultSet allId = dbDao.query("select id from ProductTable");
				while(allId.next())
					listAllId.add(allId.getInt("id"));
				for(Integer id: listAllId){
					if(req.getParameter("cb_delete_" + id) != null && req.getParameter("cb_delete_" + id).equals("on"))
						dbDao.modify("delete from ProductTable where id = ?", id);
				}
			}
			if(req.getParameter("new_data") != null){
				if(req.getParameter("new_productcode").isEmpty() || req.getParameter("new_productname").isEmpty() || req.getParameter("new_productsource").isEmpty())
					throw new Exception("商品代码、商品名和货源不能为空");
				dbDao.insert("insert into ProductTable (ProductCode, ProductName, ProductSource) values(?,?,?)",req.getParameter("new_productcode"), req.getParameter("new_productname"), req.getParameter("new_productsource"));
			}
		}catch ( Exception e){
			req.setAttribute("error", e.getMessage());
		}
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/ManageProducts");
		requestDispatcher.forward(req, res);
	}
}
