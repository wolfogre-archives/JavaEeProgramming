package com.wolfogre.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wolfogre.domain.User;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import java.util.List;
import java.util.Map;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/23.
 */
public class CheckLoginAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();

		User user;

		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> parameters = actionContext.getParameters();
		String username = ((String[])parameters.get("username"))[0];
		String password = ((String[])parameters.get("password"))[0];
		SQLQuery sqlQuery = session.createSQLQuery("SELECT * FROM User WHERE username = '" + username +"'" ).addEntity(User.class);
		List<User> userList = sqlQuery.list();
		if(userList.isEmpty() || !userList.get(0).getPassword().equals(password)){
			actionContext.put("error","无效的用户名或密码");
			return ERROR;
		}
		user = userList.get(0);

		session.close();
		sessionFactory.close();

		actionContext.getSession().put("user", user);
		return SUCCESS;
	}
}
