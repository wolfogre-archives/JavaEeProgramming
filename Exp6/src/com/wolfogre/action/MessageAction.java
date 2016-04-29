package com.wolfogre.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wolfogre.domain.Message;
import com.wolfogre.domain.User;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/29.
 */
public class MessageAction extends ActionSupport {
	public String showMessage(){
		ActionContext actionContext = ActionContext.getContext();
		User user = (User)actionContext.getSession().get("user");

		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();

		List<Message> messageList = new ArrayList<Message>();
		HashMap<Integer, String> userMap = new HashMap<Integer, String>();
		if(user.getLevel() == 0) {
			SQLQuery sqlQuery = session.createSQLQuery("SELECT * FROM Message WHERE userid = " + user.getId() ).addEntity(Message.class);
			messageList = sqlQuery.list();
			userMap.put(user.getId(), user.getUsername());
		}
		if(user.getLevel() == 1) {
			SQLQuery sqlQuery = session.createSQLQuery("SELECT * FROM Message ").addEntity(Message.class);
			messageList = sqlQuery.list();
			sqlQuery = session.createSQLQuery("SELECT * FROM User ").addEntity(User.class);
			List<User> userList = sqlQuery.list();
			for(User u : userList)
				userMap.put(u.getId(), u.getUsername());
		}

		session.close();
		sessionFactory.close();

		actionContext.put("messageList", messageList);
		actionContext.put("userMap", userMap);

		return SUCCESS;
	}
}
