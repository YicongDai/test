<%@ page language="java" import="java.util.*,com.mongodb.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String text_change = "wait to register";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register_action.jsp' starting page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="description" content="This is my page">

  </head>
  
  <body>   
    <%
         response.setContentType("text/html;charset=utf-8");  
         request.setCharacterEncoding("utf-8");            
         String userName1=(String)request.getParameter("username1"); //get username
         String passWord1=(String)request.getParameter("password1"); //get password1
         String passWord2=(String)request.getParameter("password2");//get password2
         if(!passWord1.equals(passWord2)){ 
          //if the two passwards are not consistent，return register.jsp
               response.sendRedirect("register.jsp"); 
         }
    
         try{   
             //connect mongodb
             MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
             
             @SuppressWarnings("deprecation")
             DB db = mongoClient.getDB( "library" );  
             DBCollection coll = db.getCollection("userInfo");  
             System.out.println("Collection userInfo selected successfully");
            
             DBObject user = new BasicDBObject();//define a Bson to store username and password
             user.put("username", userName1);
             user.put("password", passWord1);            
             coll.insert(user);    //insert info                         
             response.sendRedirect("register_success.jsp");  //when user register successfully, direct to register_success.jsp
                                                  
          }catch(Exception e){
             System.err.println( e.getClass().getName() + ": " + e.getMessage() );
         }    
     %>
     
   
  </body>
</html>