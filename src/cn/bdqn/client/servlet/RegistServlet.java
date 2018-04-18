package cn.bdqn.client.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.kgc.entity.User;
import cn.kgc.service.UserService;
import cn.kgc.service.impl.UserServiceImpl;

/**
 * Servlet implementation class RegistServlet
 */
@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private UserService userservice=new UserServiceImpl();  
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.��ȡ��ҳ����д����Ϣ
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		//����ע��ķ���
		User user=new User(null,username,null,password,email,null);
		boolean register = userservice.register(user);
		if(register){
			System.out.println("ע��ɹ�");
		}else{
			System.out.println("ע��ʧ��");
		}
		
	}

}
