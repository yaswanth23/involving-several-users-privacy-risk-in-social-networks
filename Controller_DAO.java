package dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;


import org.springframework.orm.hibernate3.HibernateTemplate;



import pojo.User_About_Bean;
import pojo.User_Image_Request;
import pojo.User_Post_Text_Bean;
import pojo.User_Profile_Picture_Bean;
import pojo.User_Register_Bean;
import pojo.User_Response_Bean;

public class Controller_DAO {
	
	HibernateTemplate template;
    ArrayList file;
    List list;
    Iterator it;
    String name;
    HttpServletResponse response;
   
    Query query;
    int delete;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}
	
	
	
	
	public void user_register(User_Register_Bean bean)
	{
		template.save(bean);
		
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	public List  user_select(User_Register_Bean bean)
	{  
		    
		list=template.find("from User_Register_Bean where email='"+bean.getEmail()+"'");

		return list;
		    
	}
	
	
	
	
	public int password_check(User_Register_Bean bean)
	{
		list=template.find("from User_Register_Bean where name='"+bean.getName()+"'   and  password='"+bean.getPassword()+"'  ");

		return list.size();
	}
	
	
	public void post_user_text(User_Post_Text_Bean bean) 
	{
		try
		{
		template.save(bean);
		}
		catch(Exception e)
		{
			try
			{
			response.sendRedirect("Home_Page.jsp");
			}
			catch(Exception ce)
			{
				ce.printStackTrace();
			}
		}
		
	}
	
	
	
	public List user_post_all(String user)
	{
		list=template.find("from User_Post_Text_Bean where user='"+user+"' ");
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>"+list);
		
		if(list!=null)
		{
		System.out.println("Inserted");	
		return list;
		}
		else
		{
			System.out.println("Emplty");
	    list.add("empty");
		return list;	
		}
	}
	
	public void profile_pic_user(User_Profile_Picture_Bean bean)
	{
		template.save(bean);
	}
	
	public String User_Profile(String name)
	{
		list=template.find("from User_Profile_Picture_Bean where name='"+name+"'   ");
		
		it=list.iterator();
		
		while(it.hasNext())
		{
			User_Profile_Picture_Bean bean=(User_Profile_Picture_Bean) it.next();
			
			name=bean.getProfile();
		}
		
		return name;
	}
	
	
	public void about_user(User_About_Bean bean)
	{
		try
		{
		template.save(bean);
		}
		catch(Exception e)
		{
		}
	}
	
	
	public List about_user_select(String user)
	{
		list=template.find("from User_About_Bean where user='"+user+"' ");
		
		return list;
	}
	
	public List select_all_user_from_register(String name)
	{
		list=template.find("from User_Register_Bean where name!='"+name+"'");
		
		return list;
	}
	
	public void request_image(User_Image_Request bean)
	{
		template.save(bean);
	}
	
	public List select_request(String name)
	{
		list=template.find("from User_Image_Request where receiver='"+name+"'");
		
		return list;
	}
	
	public void insert_request(User_Response_Bean bean)
	{
		template.save(bean);
	}
	
	public void delete_request(User_Image_Request bean)
	{
		
		template.delete(bean);
	}
	
	
	public List select_response(String name)
	{
		list=template.find("from User_Response_Bean where sender='"+name+"'");
		
		return list;
	}
	
	public List select_response_image(String name,String image)
	{
		list=template.find("from User_Response_Bean where sender='"+name+"' and image='"+image+"' ");
		
		return list;
	}
	
	
}
