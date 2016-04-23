package com.wolfogre.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

/**
 * Created by Jason Song(wolfogre.com) on 2016/4/22.
 */
public class LoginAction extends ActionSupport {
	@Override
	public String execute() throws Exception {
		ServletActionContext.getRequest().getSession().invalidate();
		return super.execute();
	}
}
