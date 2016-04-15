package com.wolfogre;

import javax.servlet.*;
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
public class QuitServlet extends HttpServlet{

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher requestDispatcher;
		req.getSession().invalidate();
		requestDispatcher = req.getRequestDispatcher("/index.jsp");
		requestDispatcher.forward(req, res);
	}
}
