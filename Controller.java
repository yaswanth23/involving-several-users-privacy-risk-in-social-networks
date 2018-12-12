package controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;


import pojo.User_About_Bean;
import pojo.User_Image_Request;
import pojo.User_Post_Text_Bean;
import pojo.User_Profile_Picture_Bean;
import pojo.User_Register_Bean;
import pojo.User_Response_Bean;

import dao.Controller_DAO;

@org.springframework.stereotype.Controller
public class Controller {
	
	
	public static Controller_DAO connect()
	{
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");

		Controller_DAO d=(Controller_DAO) ctx.getBean("edao");
		
		System.out.println("Application Connected");
		
		return d;	
	}
	
	
	@RequestMapping(value="/Logout",method={RequestMethod.GET})
	
	public ModelAndView Logout(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession se=request.getSession();
		
		se.invalidate();
		
		return new ModelAndView("User_Login");
	}
	
	
	
	@RequestMapping(value="/Main_Page",method={RequestMethod.GET})
	
	public ModelAndView main_page(HttpServletRequest request,HttpServletResponse response)
	{
		return new ModelAndView("User_Login");
	}
	
	
	
	
	@RequestMapping(value="/User_Register",method={RequestMethod.POST})
	
	public ModelAndView User_Register(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		
		String filename = null;
		
		String path=request.getServletContext().getRealPath("");
		
		path=path.substring(0,path.indexOf("."));
		
		System.out.println("path------------->"+path);
		
		String filepath="D:\\Frameworks\\Multi_Party\\WebContent\\resources\\Profile_Picture\\";
		
		String name,email,password;
		
		ArrayList list=new ArrayList();
		try
		{
			
		MultipartParser mpp=new MultipartParser(request,9999999);
		
		FilePart filepart;
		ParamPart parampart;
		Part part;
		
		
		while((part=mpp.readNextPart())!=null)
		{
			if(part.isFile())
			{
				
			filepart=(FilePart) part;
			
			filename=filepart.getFileName();
			
			File file=new File(filepath+filename);
			
			filepart.writeTo(file);
				
			}
			
			if(part.isParam())
			{
				parampart=(ParamPart) part;
				
				list.add(parampart.getStringValue());
				
			}
		}
		
		
		
		name=list.get(0).toString();
		
		email=list.get(1).toString();
		
		password=list.get(2).toString();
		
		User_Register_Bean bean=new User_Register_Bean();
		
		bean.setName(name);
		bean.setPassword(password);
		bean.setEmail(email);
		bean.setFilename(filename);
		
		Controller_DAO ctx=Controller.connect();
		
		ctx.user_register(bean);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return new ModelAndView("User_Login");
	}
	
	
	@RequestMapping(value="/User_Login_Controller")
	
	public ModelAndView login_controller(HttpServletRequest request,HttpServletResponse response)
	{
		return new ModelAndView("User_Login");
	}
	
	
	@RequestMapping(value="/User_Login_email",method={RequestMethod.POST})
	
	public ModelAndView login_email(HttpServletRequest request,HttpServletResponse response)
	{
		
		String name = null,pro = null;
		
		String email=request.getParameter("email");
		
		User_Register_Bean bean=new User_Register_Bean();
		
		bean.setEmail(email);
		
		Controller_DAO d=Controller.connect();
		
		List  file=d.user_select(bean);
		
		Iterator it=file.iterator();
		
		while(it.hasNext())
		{
			User_Register_Bean c=(User_Register_Bean) it.next();
			
			name=c.getName();
			
			pro=c.getFilename();
		}
		
		
		HttpSession se=request.getSession();
		
		se.setAttribute("pic",pro);

		
		if(name!=null)
		{
		return new ModelAndView("User_Login_Password","user",name);
		}
		else
		{
		return new ModelAndView("User_Login","result","Email Does not exist");
		}
	}
	
	
	@RequestMapping(value="/User_Password_check",method={RequestMethod.POST})
	
	
	public ModelAndView password_check(HttpServletRequest request,HttpServletResponse response)
	{
		String password=request.getParameter("password");
		
		String name=request.getParameter("user");
		
		User_Register_Bean bean=new User_Register_Bean();
		
		bean.setPassword(password);
		bean.setName(name);
		
		Controller_DAO d=Controller.connect();
		
		int value=d.password_check(bean);
		
		System.out.println(value);
		
		if(value==1)
		{
			HttpSession se=request.getSession();
			se.setAttribute("user",name);
		return new ModelAndView("Home_Page","user",name);
		}
		else
		{
			
		HttpSession se=request.getSession();
		se.setAttribute("user",name);
		se.setAttribute("inc","Password Incorrect");
			
		return new ModelAndView("User_Login_Password","user",name);
		}
		
		
	}
	
	
	@RequestMapping(value="/User_Post_Text",method={RequestMethod.POST})
	
	public ModelAndView User_Post_Text(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession se=request.getSession();
		
		Date d = new Date();
		 
        SimpleDateFormat sd=new SimpleDateFormat("EEE, MMM d, ''yy");
	    
	    SimpleDateFormat sd2=new SimpleDateFormat("h:mm a");
	    
	    String date=sd.format(d);
	    
	    String time=sd2.format(d);
	    
	    String text=request.getParameter("content");
	    
	    String user=se.getAttribute("user").toString();
	    
	    System.out.println(text);
	    
	    User_Post_Text_Bean bean=new User_Post_Text_Bean();
	    
	    bean.setDate(date);
	    bean.setTime(time);
	    bean.setContent(text);
	    bean.setUser(user);
	    
	    
	   
	    
	    se.setAttribute("user",user);
	    
	    Controller_DAO ctx=Controller.connect();
	    
	    ctx.post_user_text(bean);
	    

		return new ModelAndView("Home_Page","user",user);
	}
	
	
	@RequestMapping(value="/Profile_pic_Upload",method={RequestMethod.POST})
	
	public ModelAndView Profile_pic_Upload(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession se=request.getSession();
		
		String user=se.getAttribute("user").toString();
		
		String Path="D:\\Frameworks\\Multi_Party\\WebContent\\resources\\Profile_Picture\\";
		
		String filename=null;
		
		MultipartParser mpp=new MultipartParser(request,99999999);
		
		FilePart filepart;
		ParamPart parampart;
		Part part;
		
		while((part=mpp.readNextPart())!=null)
		{
			if(part.isFile())
			{
			filepart=(FilePart) part;	
				
			 filename=filepart.getFileName();	
			
			File file=new File(Path+filename);
			
			filepart.writeTo(file);
				
			}
		}
		
		User_Profile_Picture_Bean bean=new User_Profile_Picture_Bean();
		
		bean.setName(user);
		bean.setProfile(filename);
		
		se.setAttribute("user",user);
		
		Controller_DAO dao=Controller.connect();
		
		dao.profile_pic_user(bean);
		
		return new ModelAndView("Home_Page","user",user);
	}
	
	
	@RequestMapping(value="/User_Post_Image",method={RequestMethod.POST})
	
	public ModelAndView User_post_Image(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
        HttpSession se=request.getSession();
		
		Date d = new Date();
		 
        SimpleDateFormat sd=new SimpleDateFormat("EEE, MMM d, ''yy");
	    
	    SimpleDateFormat sd2=new SimpleDateFormat("h:mm a");
	    
	    String date=sd.format(d);
	    
	    String time=sd2.format(d);
	    
	   
	    
	    String user=se.getAttribute("user").toString();
	    se.setAttribute("user",user);
	  
	    
        String Path="D:\\Frameworks\\Multi_Party\\WebContent\\resources\\images\\";
		
		String filename=null;
		
		MultipartParser mpp=new MultipartParser(request,99999999);
		
		FilePart filepart;
		ParamPart parampart;
		Part part;
		
		while((part=mpp.readNextPart())!=null)
		{
			if(part.isFile())
			{
			filepart=(FilePart) part;	
				
			 filename=filepart.getFileName();	
			
			File file=new File(Path+filename);
			
			filepart.writeTo(file);
				
			}
		}
	    
	   
	    User_Post_Text_Bean bean=new User_Post_Text_Bean();
	    
	    bean.setDate(date);
	    bean.setTime(time);
	    bean.setUser(user);
	    bean.setContent(filename);
	    
	    Controller_DAO dao=Controller.connect();
	    
	    dao.post_user_text(bean);
	  

		return new ModelAndView("Home_Page","user",user);
	}
	
	
	@RequestMapping(value="/Update_My_Profile",method={RequestMethod.POST})
	
	public ModelAndView Update_My_Profile(HttpServletRequest request,HttpServletResponse response)
	{
		String study=request.getParameter("study");
		String working=request.getParameter("working");
		String from=request.getParameter("from");
		String live=request.getParameter("live");
		String rel=request.getParameter("rel");
		
		HttpSession se=request.getSession();
		
		String user=se.getAttribute("hello").toString();
		
		
		User_About_Bean bean=new User_About_Bean();
		
		bean.setFrom(from);
		bean.setLive(live);
		bean.setRel(rel);
		bean.setStudy(study);
		bean.setWorking(working);
		bean.setUser(user);
		
		Controller_DAO d=Controller.connect();
		
		d.about_user(bean);
		
		
		return new ModelAndView("Home_Page");
	}
	
	
	@RequestMapping(value="/Request_Image",method={RequestMethod.GET})
	
	public ModelAndView Request_Image(HttpServletRequest request,HttpServletResponse response)
	{
		
		String sender=request.getParameter("sender");
		
		System.out.println(">>>>>>>>>>>>>>"+sender);
		
		
		int[] i={0,1,2,3,4,5,6,7,8,9};
		
		int k1=(i[new Random().nextInt(i.length)]);
		int k2=(i[new Random().nextInt(i.length)]);
		int k3=(i[new Random().nextInt(i.length)]);
		int k4=(i[new Random().nextInt(i.length)]);
		int k5=(i[new Random().nextInt(i.length)]);
		int k6=(i[new Random().nextInt(i.length)]);
		int k7=(i[new Random().nextInt(i.length)]);
		int k8=(i[new Random().nextInt(i.length)]);
		
		String random=k1+""+k2+""+k3+""+k4+""+k5+""+k6+""+k7+""+k8;
		
		System.out.println(random);
		
		String receiver=request.getParameter("receiver");
		
		String image=request.getParameter("image");
		
		User_Image_Request bean=new User_Image_Request();
		
		bean.setImage(image);
		bean.setKey(random);
		bean.setReceiver(receiver);
		bean.setSender(sender);
		
		Controller_DAO d=Controller.connect();
		
		d.request_image(bean);
		
		HttpSession se=request.getSession();
		
		se.setAttribute("user",sender);
		
		return new ModelAndView("Home_Page");
	}
	
	
	
	@RequestMapping(value="/Response_Image",method={RequestMethod.GET})
	
	public ModelAndView Response_Image(HttpServletRequest request,HttpServletResponse response)
	{
		
		String key=request.getParameter("key");
		String sender=request.getParameter("sender");
		String receiver=request.getParameter("receiver");
		String id=request.getParameter("id");
		String image=request.getParameter("image");
		
		Controller_DAO dao=Controller.connect();
		
		User_Image_Request bean=new User_Image_Request();
		
		bean.setKey(key);
		bean.setId(Integer.parseInt(id));
		bean.setImage(image);
		bean.setSender(sender);
		bean.setReceiver(receiver);
		
		
		User_Response_Bean b=new User_Response_Bean();
		
		b.setKey(key);
		b.setId(Integer.parseInt(id));
		b.setImage(image);
		b.setSender(sender);
		b.setReceiver(receiver);
		
		
		Controller_DAO d=Controller.connect();
		
		d.insert_request(b);
		
		d.delete_request(bean);
		
		try {
			response.sendRedirect("Request_Image.jsp?user="+receiver);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	@RequestMapping(value="/Download",method={RequestMethod.GET})
	
	public ModelAndView Download(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		PrintWriter out=response.getWriter();
		
		String file=request.getParameter("file");
		
		String filepath="D:\\Frameworks\\Multi_Party\\WebContent\\resources\\images\\";
		
		response.setHeader("Content-Disposition","attachment;filename='"+file+"'");
		
		FileInputStream fis=new FileInputStream(filepath+file);
		
		int i;
		
		while((i=fis.read())!=-1)
		{
			out.write(i);
		}
		
		return null;
	}


        @RequestMapping(value="/encryption",method={RequestMethod.GET})
	
	public ModelAndView Download(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		               String Value=request.getParameter("image");
				
				byte[] text=Value.getBytes();
				
				
				KeyGenerator key=KeyGenerator.getInstance("DES");
				
				SecretKey sk=key.generateKey();
				
				Cipher cip=Cipher.getInstance("DES");
				
				
				cip.init(Cipher.ENCRYPT_MODE,sk);
				
				byte[] EText=cip.doFinal(text);
				
				String EncryptedText=new String(EText);
				
				
				cip.init(Cipher.DECRYPT_MODE,sk);
				
				byte[] DText=cip.doFinal(EText);
				
				String DecryptText=new String(DText);
		
		                 return null;
	}	
	

}
