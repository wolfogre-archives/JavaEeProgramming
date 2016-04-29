package com.wolfogre.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wolfogre.domain.User;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/24.
 */
public class UserManageAction extends ActionSupport {

	public String login() throws Exception{
		ServletActionContext.getRequest().getSession().invalidate();
		ActionContext actionContext = ActionContext.getContext();
		actionContext.getParameters().clear();//TODO:不确定这有没有卵用
		return SUCCESS;
	}

	public String checkLogin() throws Exception{
		ActionContext actionContext = ActionContext.getContext();
		String username;
		String password;
		try{
			username = ((String[])actionContext.getParameters().get("username"))[0];
			password = ((String[])actionContext.getParameters().get("password"))[0];
		}catch (Exception ex){
			actionContext.put("error","请输入用户名和密码！");
			return ERROR;
		}

		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();

		SQLQuery sqlQuery = session.createSQLQuery("SELECT * FROM User WHERE username = '" + username +"'" ).addEntity(User.class);
		List<User> userList = sqlQuery.list();

		session.close();
		sessionFactory.close();

		if(userList.isEmpty() || !userList.get(0).getPassword().equals(password)){
			actionContext.put("error","无效的用户名或密码！");
			return ERROR;
		}

		User user = userList.get(0);
		actionContext.getSession().put("user", user);
		return SUCCESS;
	}

	public String showInfo() throws Exception{
		ActionContext actionContext = ActionContext.getContext();
		User user = (User)actionContext.getSession().get("user");
		if(user == null){
			actionContext.put("error", "您的登录已经失效！");
			return ERROR;
		}

		actionContext.put("user", user);
		return SUCCESS;
	}

	public String register() throws Exception{
		ServletActionContext.getRequest().getSession().invalidate();
		return SUCCESS;
	}

	public String checkRegister() throws Exception{
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> parameters = actionContext.getParameters();
		String username;
		String password;
		String passwrodAgain;
		String superCode;
		try{
			username = ((String[])parameters.get("username"))[0];
			password = ((String[])parameters.get("password"))[0];
			passwrodAgain = ((String[])parameters.get("password-again"))[0];
			superCode = ((String[])parameters.get("super-code"))[0];
		}catch (Exception ex){
			actionContext.put("error","请输入用户名和密码！");
			return ERROR;
		}

		if(username.isEmpty() || password.isEmpty() || passwrodAgain.isEmpty()){
			actionContext.put("error","请输入用户名和密码！");
			return ERROR;
		}

		if(!password.equals(passwrodAgain)){
			actionContext.put("error","两次输入的密码不一致！");
			return ERROR;
		}

		if(!superCode.isEmpty() && !superCode.equals("lovevivia")){
			actionContext.put("error","高级用户邀请码错误！");
			return ERROR;
		}

		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		//TODO:这里应该检查用户名是否已经存在，但是懒得写了

		User newUser = new User();
		newUser.setUsername(username);
		newUser.setPassword(password);
		if(!superCode.isEmpty()){
			newUser.setLevel(1);
		}
		session.save(newUser);

		transaction.commit();

		session.close();
		sessionFactory.close();

		return SUCCESS;
	}
}
