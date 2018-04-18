package cn.bdqn.client.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.kgc.entity.User;
import cn.kgc.service.UserService;
import cn.kgc.service.impl.UserServiceImpl;

/**
 * 
 * 登陆相关的servlet
 * 
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	private UserService userservice=new UserServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		//1.获取从页面中输入的用户名和密码
		String username = request.getParameter("lo_username");
		String password = request.getParameter("lo_password");
		boolean flag=false;
		User user=new User();
		/*
		 * 手机号码的正则表达式
		*/
		 Pattern p=Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$");
		 Matcher m = p.matcher(username);
		 /*
		  * 邮箱的正则表达式
		 */
		 String regex_email = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		      User login =null;
		 if(m.matches()){
			 user.setPhone(username);
			 user.setPassword(password);
			 login=userservice.login2(user);
		 }else if(Pattern.matches(regex_email, username)){
			 user.setEmail(username);
			 user.setPassword(password);
			 login=userservice.login1(user);
		 }else{
			 user.setUsername(username);
			 user.setPassword(password);
			 login=userservice.login(user);
		 }	
		//2.调用service中的方法看user对象是否存在
		if(login!=null){
			//表示找到对象，登陆成功
			flag=true;
			System.out.print("恭喜你，登陆成功");
		}else{
			//登陆失败
			System.out.println("登陆失败，请重新登陆");
		}
		    PrintWriter out = response.getWriter();
		   out.write(JSON.toJSONString(flag));
	}

}
