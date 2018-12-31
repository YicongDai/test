<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";              
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>register page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="css/login.css">
    <Script Language="JavaScript">
            function check()
            {
                var tmp,str;              
                str=document.myform.password1.value;
                tmp=document.myform.password2.value;
                if(str != tmp)
                    alert("The two passwords are not consistent.Please reconfirm the password！！！");
            }
     </Script>
     
     
  </head>
  
  <body>
   <div class="content">
     <div class="head">
            <h1>welcome to register page!</h1>
        </div>

        <!--  register panel    -->
        <div class="panel">
          <form name="myform" action="register_action.jsp"  method="post">  
            
            <!--  username and password    -->
            <div class="group">
                <label></label>
                <input  type="text" placeholder="please enter the  username" name="username1">
            </div>
            <div class="group">
                <label></label>
                <input type="password" placeholder="please enter the  password" name="password1">
            </div>
             <div class="group">
                <label></label>
                <input type="password" placeholder="please confirm the  password" name="password2">
            </div>
                                      
            <!-- register button    -->
            <div class="login">
                <button type="submit" name="register"  onclick="check()">register</button>     
                <button type="reset" name="reset1">reset</button>   
            </div>
           </form>
           <div class="register">
           <button onclick="window.location.href='login.jsp'">back</button> 
           </div>
        </div>
      </div>
  </body>
</html>