package com.wolfogre.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wolfogre.domain.Product;
import com.wolfogre.domain.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

import java.util.Map;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/23.
 */
public class UpdateProductsAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();

		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> parameters = actionContext.getParameters();
		if(parameters.get("new_data") != null)
		{
			Product newProduct = new Product();
			newProduct.setProductCode(((String[])parameters.get("new_product_code"))[0]);
			newProduct.setProductName(((String[])parameters.get("new_product_name"))[0]);
			newProduct.setProductSource(((String[])parameters.get("new_product_source"))[0]);
			session.save(newProduct);
		}

		if(parameters.get("delete_data") != null)
		{
			String[] deleteList = (String[])parameters.get("cb_delete");
			for(String str: deleteList)
				session.delete(session.get(Product.class, Integer.parseInt(str)));
		}

		transaction.commit();

		session.close();
		sessionFactory.close();

		return super.execute();
	}
}
