<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/registerDiv.css" />
<link type="text/css" rel="stylesheet" href="css/re-login.css" > 	
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script>
	
	
	      var flag=false;
	$(document).ready(function($){
	/*手机号码注册相关验证*/
		$(".res_phone").focus(function(){			
			$(".res_phone").css("background-color","#FFFFFF");
			$(".res_phone").css("border-color","#71c3e7");
			$(".res_tips_total").css("background-color","#FFFFFF");
			$(".res_tips_total").css("border-color","#FFFFFF");	
			$(".res_tips_total").css("color","#ccc");	
			$(".res_tips_total").html("请输入手机号码");	
			$(".res_phone_success").hide();
			$(".res_phone_success").css("background-color","#FFFFFF");
		})
		
		$(".res_phone").blur(function(){
			var phone=$(".res_phone").val();/*获取电话号码*/
			var reg=/^1[3|4|5|7|8][0-9]\d{4,8}$/i;
			$(".res_phone").css("background-color","#f3f3f3");
			$(".res_phone").css("border-color","#ccc");
			$(".res_tips_total").html("");
			if(phone==""){
			$(".res_tips_total").css("background-color","#fadada");
			$(".res_tips_total").css("color","#d81e06");
			$(".res_tips_total").html("!请输入手机号码");
			}else if(phone.length<11||!reg.test(phone)){
			$(".res_tips_total").css("color","#d81e06");
			$(".res_tips_total").css("background-color","#fadada");
			$(".res_tips_total").html("!请输入可用的手机号码");	
			}else if(phone=="18036933220"){
			$(".res_tips_total").css("color","#d81e06");
			$(".res_tips_total").css("background-color","#fadada");
			$(".res_tips_total").html("!该号码已被注册");	
			}else {
			$(".res_phone_success").show();
			$(".res_phone_success").css("background-color","#def1db");
			$(".res_phone_success").html("√");	
			flag=true;
			}
			
		})
		/*用户名注册相关验证*/	
		$(".res_username").focus(function(){			
			$(".res_username").css("background-color","#FFFFFF");
			$(".res_username").css("border-color","#71c3e7");
			$(".res_tips_username").css("background-color","#FFFFFF");
			$(".res_tips_username").css("border-color","#FFFFFF");	
			$(".res_tips_username").css("color","#ccc");	
			$(".res_tips_username").html("请输入用户名");	
			$(".res_phone_success1").hide();
			$(".res_phone_success1").css("background-color","#FFFFFF");
		})
		
		$(".res_username").blur(function(){
			var username=$(".res_username").val();
			$(".res_username").css("background-color","#f3f3f3");
			$(".res_username").css("border-color","#ccc");
			$(".res_tips_username").html("");
			if(username=="cfx"){
			$(".res_tips_username").css("color","#d81e06");
			$(".res_tips_username").css("background-color","#fadada");
			$(".res_tips_username").html("!该用户名已被注册");
			flag=false;
			}else if(username!=""){
			$(".res_phone_success1").show();
			$(".res_phone_success1").css("background-color","#def1db");
			$(".res_phone_success1").html("√");			
			}			
		})	
		   /* 短信相关验证*/
		  $(".res_news").focus(function(){		
			$(".res_news").css("background-color","#FFFFFF");
			$(".res_news").css("border-color","#71c3e7");
			if(flag==true){
				$(".res_news_btn").attr("disabled",false);
              	$(".res_news_btn").css("background-color","#71c3e7");/*可以正常提交时按钮的颜色*/
			}else{
				$(".res_news_btn").attr("disabled",true);
              	$(".res_news_btn").css("background-color","#ddd");
			}
			
			
			
			
		})
		
		
		
		   /*密码相关验证*/
		    $(".res_password").focus(function(){			
			$(".res_password").css("background-color","#FFFFFF");
			$(".res_password").css("border-color","#71c3e7");
			$(".res_tips_password").css("background-color","#FFFFFF");
			$(".res_tips_password").css("border-color","#FFFFFF");	
			$(".res_tips_password").css("color","#ccc");	
			$(".res_tips_password").html("密码需由8-16位字母、数字和符号组成");	
			$(".res_phone_success4").hide();
			$(".res_phone_success4").css("background-color","#FFFFFF");
		})
		    
		    	
		   /*密码强度提示*/
		     $(".res_password").keyup(function(){
		     	var password=$(".res_password").val(); 
			if(password.length<10){
			 $(".res_pwd_strong_line1").css("background-color","#d81e06");
			 $(".res_pwd_strong_line2").css("background-color","#ccc");
			 $(".res_pwd_strong_line3").css("background-color","#ccc");
			}
				if(password.length<13&&password.length>9){
			 $(".res_pwd_strong_line1").css("background-color","#ff8c00");
			 $(".res_pwd_strong_line2").css("background-color","#ff8c00");
			 $(".res_pwd_strong_line3").css("background-color","#ccc");	
			}
				if(password.length<17&&password.length>12){
			 $(".res_pwd_strong_line1").css("background-color","#def1db");
			 $(".res_pwd_strong_line2").css("background-color","#def1db");
			 $(".res_pwd_strong_line3").css("background-color","#def1db");	
			} 
			    if(password.length<1){
			 $(".res_pwd_strong_line1").css("background-color","#ccc");
			 $(".res_pwd_strong_line2").css("background-color","#ccc");
			 $(".res_pwd_strong_line3").css("background-color","#ccc");
			}
				
			})  
		
		$(".res_password").blur(function(){
			var password=$(".res_password").val();
	        var passwordreg =reg=/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{8,16}$/;  
			$(".res_password").css("background-color","#f3f3f3");
			$(".res_password").css("border-color","#ccc");
			$(".res_tips_password").html("");
			if(!passwordreg.test(password)){
			$(".res_tips_password").css("color","#d81e06");
			$(".res_tips_password").css("background-color","#fadada");
			$(".res_tips_password").html("!请输入8-16位的数字或字符");				
			}else {
			$(".res_phone_success4").show();
			$(".res_phone_success4").css("background-color","#def1db");
			$(".res_phone_success4").html("√");			
			}	
		})	
		 /*密码确认相关验证*/
		    $(".res_repassword").focus(function(){	
			$(".res_repassword").css("background-color","#FFFFFF");
			$(".res_repassword").css("border-color","#71c3e7");
			$(".res_tips_repassword").css("background-color","#FFFFFF");
			$(".res_tips_repassword").css("border-color","#FFFFFF");	
			$(".res_tips_repassword").css("color","#ccc");	
			$(".res_tips_repassword").html("请再输入密码");	
			$(".res_phone_success5").hide();
			$(".res_phone_success5").css("background-color","#FFFFFF");		
		})
		
		$(".res_repassword").blur(function(){
			var password=$(".res_password").val();
	        var repassword=$(".res_repassword").val(); 
			$(".res_repassword").css("background-color","#f3f3f3");
			$(".res_repassword").css("border-color","#ccc");
			$(".res_tips_repassword").html("");
			if(repassword.length<8){
			$(".res_tips_repassword").css("color","#d81e06");
			$(".res_tips_repassword").css("background-color","#fadada");
			$(".res_tips_repassword").html("!请输入8-16位的数字或字符");				
			}else if(repassword==password){
			$(".res_phone_success5").show();
			$(".res_phone_success5").css("background-color","#def1db");
			$(".res_phone_success5").html("√");			
			}	
			
		})	
		
		
		
		/*邮箱注册相关验证*/
		$(".res_email").focus(function(){			
			$(".res_email").css("background-color","#FFFFFF");
			$(".res_email").css("border-color","#71c3e7");
			$(".res_tips_email").css("background-color","#FFFFFF");
			$(".res_tips_email").css("border-color","#FFFFFF");	
			$(".res_tips_email").css("color","#ccc");	
			$(".res_tips_email").html("请输入邮箱");	
			$(".res_phone_success6").hide();
			$(".res_phone_success6").css("background-color","#FFFFFF");
		})
		
		$(".res_email").blur(function(){
			var email=$(".res_email").val();
	var emailreg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
			$(".res_email").css("background-color","#f3f3f3");
			$(".res_email").css("border-color","#ccc");
			$(".res_tips_email").html("");
			if(!emailreg.test(email)){
			$(".res_tips_email").css("color","#d81e06");
			$(".res_tips_email").css("background-color","#fadada");
			$(".res_tips_email").html("!请输入正确的邮箱");	
				
			}else if(email=="1942781847@qq.com"){
			$(".res_tips_email").css("color","#d81e06");
			$(".res_tips_email").css("background-color","#fadada");
			$(".res_tips_email").html("!该邮箱已被注册");		
			}else {
			$(".res_phone_success1").show();
			$(".res_phone_success1").css("background-color","#def1db");
			$(".res_phone_success1").html("√");			
			}			
		})	
		
		/*进行提交按钮的禁用*/
		$(".res_span_4").click(function(){
			if($('.res_span_4').is(':checked')) {
                $(".res_table_submit").attr("disabled",false);
              	$(".res_table_submit").css("background-color","#71c3e7");/*可以正常提交时按钮的颜色*/
             }else{             	
              	$(".res_table_submit").attr("disabled",true);
              	$(".res_table_submit").css("background-color","#bbb");/*禁用时按钮的颜色*/
              }
		})		
		/*显示登陆弹窗*/
	    $('.login').click(function(){  
	         $('.popup-mask').fadeIn(200); 
	        $('.popup-login').slideDown(1000);  
	    })  
	    /* 关闭登陆弹窗*/
	    $('.popup-close .close').click(function(){  
	        $('.popup-mask').fadeOut(200); 
	        $('.popup-login').slideUp(1000); 
	                     /* 关闭提示 */
	        $('.popup_login_notice').slideUp(1000);
	          /*  清除输入框内容 */
	        $("form input[type=text],input[type=password]").each(function(){  
	            $(this).val('');  
	        }); 
	    }) 
	    /*使用ajax进行提交功能*/
	       $('.popup_login_btn').click(function(){ 	 
	    	var name=$("input[name=lo_username]").val();
	    	var pwd=$("input[name=lo_password]").val();
	    	$('.popup_login_notice').slideUp(1);
	    	$('.popup_u').slideUp(1); 
	    	$('.popup_p').slideUp(1); 
	    	$('.popup_err').slideUp(1);
	    	if(name==""){
	    		$('.popup_login_notice').slideDown(1);
	    		$('.popup_u').slideDown(1); 
	    	}else if(pwd==""){
	    		$('.popup_login_notice').slideDown(1);
	    		$('.popup_p').slideDown(1); 
	    	}
	    	 $.ajax({
	    		url:"LoginServlet",
	 			type:"post",
	 			dataType:"json",
	 			data:{
	 				lo_username: name,
	 				lo_password: pwd
	 			},
	 			success:function(data){
	 				if(data){
	 					window.location.href="http://localhost:8080/U2/login.jsp";
	 				}else{
	 					$('.popup_login_notice').slideDown(1);
	 		    		$('.popup_err').slideDown(1);
	 				}				
	 			}, 
	    		 
	    	 })
	    
	    })
	     

	})	
	</script>



<body>
<div class="res_header">
			<img class="res_head_img" src="img/login.png" width="48" height="48" /><span class="res_head_com">海豚音乐</span>
			<span class="res_head_register">欢迎注册</span>
			<span class="res_head_lo">已有账号？<a href="javascript:;" class="res_head_login login">请登陆></a></span>
		</div>
		<div class="res_box">
			<div class="res_register">
				<img src="img/phone.png" height="27" /><span>手机注册</span>
			</div>
			<!--注册框的表单元素-->
			<div class="res_input"  >
				<form action="RegistServlet" method="post">
					<table class="res_table">
						<tr>
							<td>
								<div class="res_text_box">
									手机号码:
									<div class="res_username_box ">
										<input type="text" name="phone"  maxlength="11"  class="res_table_all res_phone"/>										
									</div>
									<div class="res_tips_total  "></div>
									<div class="res_phone_success"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="res_text_box">
									<span class="res_span_1">用户名:</span>
									<div class="res_username_box ">
										<input type="text" name="username" class="res_table_all res_username" />	
									</div>
									<div class="res_tips_username "></div>
									<div class="res_phone_success1"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="res_text_box">
									短信验证: 
									    <div class="res_news_box">
								          <input type="text" name="news" class="res_table_news res_news" />
								        </div>
								          <input type="button" class="res_news_btn" value="获取短信" disabled/>
								          <div></div>
									    
								</div>	
							</td>
						</tr>
						<tr>
							<td>
								<div class="res_text_box">
									<span class="res_span_2">密码</span>:
									<div class="res_username_box ">
										<input type="password" maxlength="16" name="password" class="res_table_all res_password" />
									</div>
									<div class="res_tips_password "></div>
									<div class="res_phone_success4"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="res_pwd_strong">
									<span class="res_pwd_show">密码强度:弱
									<div class="res_pwd_strong_line1 "></div>
									<div class="res_pwd_strong_line2 "></div>
									<div class="res_pwd_strong_line3 "></div>
									强</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="res_text_box">
									确认密码:
									<div class="res_username_box ">
										<input type="password" maxlength="16" name="password" class="res_table_all res_repassword" />									
									</div>
									<div class="res_tips_repassword"></div>
									<div class="res_phone_success5"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="res_text_box">
									<span class="res_span_2">邮箱</span>:
									<div class="res_username_box ">
										<input type="email" name="email" class="res_table_all  res_email" />
									</div>
									<div class="res_tips_email "></div>
									<div class="res_phone_success6"></div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<span class="res_span_3">性别: &nbsp;</span>
								<input type="radio" name="sex" value="male"  checked/><span> 男  &nbsp; &nbsp; </span>
								<input type="radio" name="sex" value="female" /><span> 女  </span>
							</td>
						</tr>
						<tr>
							<td>
								<input  class="res_span_4"  type="checkbox" name="readed"  checked/>我已经认真阅读并同意 &nbsp; &nbsp; &nbsp;<a href="userpwdrule.html">用户协议</a>、<a href="privacy.html">隐私政策</a>
							</td>
						</tr>
						<tr>
							<td>
								<div class="res_submit_btn">
							       <input type="submit" value="注册" class="res_table_submit" />
							    </div>
						    </td>
						</tr>
					</table>
				</form>
			</div>

		</div>
		
		
		
		<!-- 登陆弹窗 --> 
<div class="popup-login">  
     <div class="popup-close">  
          <a href="javascript:;" title="关闭" class="close"><h2>×</h2></a>  
          <h4 class="popup_hd_tl">登陆海豚音乐</h4>  
     </div> 
     <!-- 登陆时进行验证 -->
     <div class="popup_login_notice">
     <img alt="警告" src="img/notice.png" width="12" height="12">
     <span class="popup_u">请先填用户名</span>
     <span class="popup_p">请输入密码</span>
     <span class="popup_err">用户名或密码不正确</span>
     </div>
     <form action="" method="post">
     <!-- 登陆框 -->
      <div class="popup_text_area">
        <div class="popup_txt_box popup_txt_box_username">
         <label class="popup_txt_tl" for="PopupUserName">账号：</label>
         <input  type="text" id="PopupUserName" name="lo_username" class="popup_txt_ipt"  placeholder="用户名/手机/邮箱">
        </div>
       </div>
       <!-- 密码框 -->
       <div class="popup_text_area1">
         <div class="popup_txt_box popup_txt_box_username">
         <label class="popup_txt_tl" for="PopupPassword">密码：</label>
         <input name="lo_password" type="password" id="PopupPassword" class="popup_pwd_ipt"  placeholder="请输入密码">
         <a href="retrievepwd.jsp" class="popup_forget_pwd" target="_blank">忘记密码</a>
         </div>
       </div>  
       <!--自动登陆单选框 -->
       <div class="popup_tool_lt">
            <input class="popup_checkbox" type="checkbox" name="autoLogin" id="autoLogin" checked>
            <label for="autoLogin">下次自动登陆</label>     
       </div>
       <!-- 立即注册超链接 -->
       <div class="popup_tool_rt">
            <a href="register.html">立即注册</a>     
       </div>  
       <!--登陆按钮 -->
       <div class="popup_login_box">
             <input type="button" class="popup_login_btn" value="登陆" />
       </div> 
       <!-- 第三方登陆方式及用户协议，隐私政策 -->
       <div class="popup_thirdpart">
                                    其他方式登陆:
        <a href="#"><img alt="QQ"  class="popup_thirdpart_qq"   src="img/qq.png" title="使用QQ号登陆" width="16" height="16"></a>
        <a href="#"><img alt="WeChat"  class="popup_thirdpart_qq"  src="img/weixin.png"   title="使用微信号登陆" width="16" height="16"></a>
        
         <a href="potocal.html" class="popup_user_info">用户协议</a>
         <a href="privacy.html">隐私政策</a>

       </div>
     </form>
</div>
<!--背景虚化层  -->
<div class="popup-mask"></div>

</body>
</html>