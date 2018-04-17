<%-- 
    Document   : AdminLogin
    Created on : 25 Sep, 2017, 6:49:12 AM
    Author     : basilscolu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj"></jsp:useBean>
<%
    String AdnUser="",AdnPass="";
    AdnUser=request.getParameter("txt_name");
    AdnPass=request.getParameter("txt_pass");
    if(request.getParameter("Btn_save")!=null)
    {
        ResultSet rsAdminLogin=obj.selectData("select * from tbl_teacher th where th.Username='"+AdnUser+"' and th.Password='"+AdnPass+"'");
    while(rsAdminLogin.next())
    {
        response.sendRedirect("Homepage.jsp");
    }
    }
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <style>
            body
               {
                 background:#d4d4d4 url("Images/Screenshot_20171213_203021.png")  center top;
                margin:0px; padding:0px; 
                font-size:12px; font-family:Arial; color:#363636;
               }
               .MalyaliMarriage_logo
                {
                 padding:10px 15px;
                 }
                 .Propic
                 {
                     width:600px;
                     height: 300px;
                     border:solid #363636;
                     border-radius: 10px;
                     margin-left: 400px;
                     margin-top: 50px;
                    //background-color: #FFFFFF;
                   background: transparent;
box-shadow: #bbb 0px 8px 8px 0px;                    
                 }
                  
  .regHead
  {
                       border-style:2px solid;
                       border-color: #363636;
                       border-radius:10px; 
                       padding: 5px 40px 5px 40px;
                       background-color:#ff0033;
                       
  }
    .registerhead
                       {
                           font-family:sans-serif ;font-size:24px;color:#ffffff;padding:20px 0px 10px 25px;
                      
                       }
                      
                       .MySaveBtn
                       {
                           margin-left: 150px;
                           margin-top: 20px;
                           border-radius: 10px;
                           color:#FFFFFF;
                           background-color: #ff0033;
                           width: 100px;
                           height: 30px;
                       }
                       .MySaveBtn:hover
                       {
                            margin-left: 140px;
                           margin-top: 10px;
                           border-radius: 10px;
                           color:#FFFFFF;
                           background-color: #ff0033;
                           width: 120px;
                           height: 35px;
                           //border: solid #363636;
                           box-shadow: #363636 5px 5px;
                           font-size: 20px;
                       }
                       .MytxtBox
                       {
                          margin-left: 20px;margin-top: 10px;border: solid #363636;border-radius: 10px;height: 30px;width: 200px;padding-left: 10px;
                       }
                       .MytxtBox:hover{
                           box-shadow: #363636 5px 5px;
                       }
                       .Mylabel
                       { 
                          margin-left: 40px;
                          margin-top: 10px;
                          color: #ffffff;
                          font-size: 25px;
                          font-family: cursive;
                       }
        </style>
    </head>
    <body>
        <form method="post">
         <div style="width: 600px;height: 120px; background-color: #363636;margin-bottom: 10px;margin-left: 400px;border: solid #363636;border-radius: 10px;">
              <div class="MalyaliMarriage_logo" style="float:left;"> 
					

                  <img src="logo/download (12).jpg" alt="Ilahia Exam Cell Automation" title="Ilahia Exam Cell Automation" width="120" height="100" >

				    </div> 
            <div    style="color:#ff0033; font-size:26px; margin:0px auto;float:left; margin:50px 0px 0px 25px;">Ilahia Exam Cell Automation
         
            </div>
              </div>

           <div class="Propic">
               
               <br><label class="registerhead" style="margin-left: 40px;"><span class="regHead">Admin Login</span></label> 
               <table style="margin-top: 50px;">
                   <tr>
                       <td>
                           <label class="Mylabel" >UserName </label></td><td>
                           <input class="MytxtBox" type="text" placeholder="Username" name="txt_name"></td>
               </tr>
               <tr>
                   <td>
               <label class="Mylabel">Password </label>
                   </td>
                   <td>               <input  class="MytxtBox" type="password" placeholder="Placeholder" name="txt_pass">
</td>
               </tr>
               </table>
               <button class="MySaveBtn" name="Btn_save" >Login</button>
              
         </div>
        </form>
    </body>
</html>

