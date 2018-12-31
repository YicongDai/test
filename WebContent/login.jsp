<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String username = "";
String password = "";
//get all Cookie
 Cookie[] cookies = request.getCookies();

 for (int i = 0; i < cookies.length; i++) {
          //find username and password
         if ("username".equals(cookies[i].getName())) {
             username = java.net.URLDecoder.decode(cookies[i].getValue(),"UTF-8");
         } else if ("password".equals(cookies[i].getName())) {
             password =  java.net.URLDecoder.decode(cookies[i].getValue(),"UTF-8");
         }
  }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="description" content="This is my page">
    
    <link rel="stylesheet" type="text/css" href="css/login.css">
    

  </head>
  
  <body>

    <div class="content">
        <div class="head">
            <h1>login</h1>
        </div>

        <!--  panel   -->
        <div class="panel">
          <form action="login_action.jsp" method="post">  
            
            <!--  username and password    -->
            <div class="group">
                <label>username</label>
                <input  type="text" placeholder="please enter the username" name="username" value="<%=username%>">
            </div>
            <div class="group">
                <label>password</label>
                <input type="password" placeholder="please enter the password" name="password" value="<%=password%>">
            </div>
            <div>
             <input type="checkbox" value="save" name="save_password"> 
             <label>remember password</label> 
            </div>
            <div class="group">
            <label></label>
            </div>
            <!--  login button    -->
            <div class="login">
                <button type="submit" name="login">login</button>
               <button type="reset" name="reset">reset</button>
            </div>
           </form>
        </div>
  
        <!--  register button    -->
        <div class="register">
            <button onclick="window.location.href='register.jsp'">create a new account</button>
        </div>

    </div>
  </body>
</html>