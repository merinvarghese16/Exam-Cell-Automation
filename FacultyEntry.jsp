<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obb"></jsp:useBean>


<!DOCTYPE html>
 <%
      String FacultyName="",FacultyId="";
    
                                      if(request.getParameter("btn_submit")!=null)
                                      {
                                           if(!request.getParameter("hiddenid").equals(""))
        {
            int bid=Integer.parseInt(request.getParameter("hiddenid"));
            obb.executeCommand("update tbl_teacher set Name='"+request.getParameter("txt_facultyName")+"' where id='"+bid+"'");
        }
                                           else
                                           {
                                           Random rand = new Random();
                                         int n = rand.nextInt(90000) + 10000;
                                         String FId="F"+n;
                                         obb.executeCommand("insert into tbl_teacher (FacultyId,Name) VALUES('"+FId+"','"+request.getParameter("txt_facultyName")+"')");
                                          //s="insert into tbl_teacher (FacultyId,Name) VALUES('"+FId+"','"+request.getParameter("txt_facultyName")+"')";
                                      }
                                      }
                                      
                                        if(request.getParameter("del")!=null)
    {
      int bid=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_teacher where id='"+bid+"'");
    }
    
    if(request.getParameter("edit")!=null)
    {
       String bid1=request.getParameter("edit");
       ResultSet rs1=obb.selectData("select * from tbl_teacher where id='"+bid1+"'");
       while(rs1.next())
       {
       FacultyName=rs1.getString("Name");
       FacultyId=rs1.getString("id");
       
    }
    }
                                      %>
<html>
    <head>
       
        <link href="AdminCss/AdminCss.css" rel="stylesheet" type="text/css" />
        <script src="Js/AdminCommonSearchJs.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Entry</title>
        <style>
             body
               {
                 background:#d4d4d4 url("Images/Screenshot_20180219_221915.png") no-repeat right top;
                margin:0px; padding:0px; 
                font-size:12px; font-family:Arial; color:#363636;
               }
        </style>
    </head>
    <body>
          
        <div style="width: 1400px;height: 120px; background-color: #363636;margin-bottom: 10px;position: fixed">
              <div class="Happywedding_logo" style="float:left;"> 
					

					<img src="logo/download (12).jpg" alt="Ilahia Exam Cell" title="Ilahia Exam Cell" width="120" height="100">

				    </div> 
                                        <div style="color:#ff0033; font-size:26px; margin:0px auto;float:left; margin:50px 0px 0px 25px;">Ilahia Exam Cell
                
            </div>
                                      
                                   </div>
       
        <form class="Malayali_campaignrightthree" style="margin-top: 150px">
            <input type="hidden" name="hiddenid" value="<%=FacultyId%>">
            
            
            
                   
            <div class="clear"></div>
            <div class="ReligionForm_details">
                <div class="registerhead"><label style="color: #ff0033">Faculty Entry</label></div>
                <table>
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Faculty Name :</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_facultyName" placeholder="Enter Enter Faculty Name" class="regtxtbox" value="<%=FacultyName%>" ></div></td>
                    </tr>
                    <tr><td></td><td><div class="Religion_innerregisterform_new" ><input type="submit" value="save" name="btn_submit" class="campaign_buttonnew">
                                  <input type="submit" value="Cancel" name="btn_cancel" class="campaign_buttonnew cancelbtn"> </div></td>
                                 
                </tr>
                </table>
                <!--table searching start here-->
                       
               
                         
                
                 <div class="Religion_innerregisterform_table">
                 <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
                          <table id="myTable" >
                            
                             <tr class="header" >
                              <th style="width:60%;">Teacher Name</th>
                                <th style="width:40%;">Edit</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs=obb.selectData("select * from tbl_teacher");
                             while(rs.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <%=rs.getString("Name") %>
                                </td>
                               
                                <td>
                                    <a href="FacultyEntry.jsp?edit=<%=rs.getString("id")%>"><input type="button" class="button_link" value="edit">
                                    </a>
                                </td>
                                <td>
                                    <a href="FacultyEntry.jsp?del=<%=rs.getString("id")%>"><input type="button" class="button_link cancel" value="delete"></a>
                                </td>
                                   
                            </tr>
                             
                            <%
                             }
                            
                             
                             
                             %>
                               
                        </table> 
                    
                </div>
                                        <!--table searching end here-->

            </div>
           
                     
        </form>
      
         
    </body>
    
</html>
