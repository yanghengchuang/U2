<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/loginDiv.css" media="all">  
<script src="js/jquery-3.3.1.min.js"></script>  
<script>  
$(document).ready(function($) {  
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
</head>
<body>
 
<a class="login" href="javascript:;"><h4>登陆</h4></a> 
<a href="register.html"><h1>注册</h1></a> 

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
        
         <a href="#" class="popup_user_info">用户协议</a>
         <a href="about/privacy.html">隐私政策</a>

       </div>
     </form>
</div>
<!--背景虚化层  -->
<div class="popup-mask"></div>  


</body>
</html>