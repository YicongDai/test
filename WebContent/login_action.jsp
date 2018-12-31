<%@ page language="java" import="java.util.*,com.mongodb.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login_action.jsp' starting page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

  </head>
  
  <body>
    <%
         response.setContentType("text/html;charset=utf-8");  
         request.setCharacterEncoding("utf-8");            
         String userName=(String)request.getParameter("username");  //get username
         String passWord=(String)request.getParameter("password");//get password
         String checkBox = request.getParameter("save_password");//get if user choose to remember password
         boolean login_test = false;               //boolean judge if login successfully
          try{   
             // connect mongodb 
             MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
             @SuppressWarnings("deprecation")
            DB db = mongoClient.getDB( "library" );  //database library
            DBCollection coll = db.getCollection("userInfo");  //collection userInfo
            System.out.println("Collection userInfo selected successfully");
            DBCursor cursor = coll.find();  //select and find information
            
            int i=1; 
            while (cursor.hasNext()) {     //search all
                System.out.println("userInfo Document: "+i); 
                DBObject show = cursor.next();              
                System.out.println(show); 
                @SuppressWarnings("rawtypes")
                Map show1 = show.toMap();  //trans map
                String toname = (String)show1.get("username");  // get username value
                String topassword = (String)show1.get("password"); //get password value
                if(toname.equals(userName) && topassword.equals(passWord)){  
                    System.out.println("login successfully！！！！！"+"username:"+toname+"  password:"+topassword);
                    login_test = true;
                }
                  System.out.println(show1.get("username"));
                i++;
            }
            
          }catch(Exception e){
             System.err.println( e.getClass().getName() + ": " + e.getMessage() );
         }
    
        if(login_test) {
            if ("save".equals(checkBox)) {
                String name1 = java.net.URLEncoder.encode(userName,"UTF-8");
                Cookie nameCookie = new Cookie("username", name1);
                //3 days
                nameCookie.setMaxAge(60 * 60 * 24 * 3);
                
                String pwd = java.net.URLEncoder.encode(passWord,"UTF-8");
                Cookie pwdCookie = new Cookie("password", pwd);
                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
                response.addCookie(nameCookie);
                response.addCookie(pwdCookie);
             }
            // request.getRequestDispatcher("welcome.jsp").forward(request, response);  
             response.sendRedirect("welcome.jsp");         
        }   
        else{
             response.sendRedirect("login_Fail.jsp");      
              // request.getRequestDispatcher("loginFail.jsp").forward(request, response);             
        }
     %>
  </body>
</html> 