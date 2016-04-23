package com.wolfogre.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wolfogre.domain.ShopRecord;
import com.wolfogre.domain.User;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import java.sql.Date;
import java.util.List;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/23.
 */
public class CheckOutAction extends ActionSupport{
	private int productId;
	private String productCode;
	private String productName;
	private String productSource;
	private int number;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	@Override
	public String execute() throws Exception {
		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		ShopRecord shopRecord = new ShopRecord();
		ActionContext actionContext = ActionContext.getContext();
		shopRecord.setUserId(((User)actionContext.getSession().get("user")).getId());
		shopRecord.setProductId(getProductId());
		shopRecord.setNumber(getNumber());
		shopRecord.setShopDate(new java.sql.Date(new java.util.Date().getTime()));
		session.save(shopRecord);

		transaction.commit();

		session.close();
		sessionFactory.close();
		return SUCCESS;
	}
}
