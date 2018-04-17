<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obb"></jsp:useBean>


<!DOCTYPE html>
 <%
     
    
                                      if(request.getParameter("btn_submit")!=null)
                                      {
                                           
                                           Random rand = new Random();
                                         int n = rand.nextInt(90000) + 10000;
                                         String SId="Stud"+n;
                                         obb.executeCommand("insert into tbl_student (StudId,KtuId,Name,ClassId,BatchId) VALUES('"+SId+"','"+request.getParameter("txt_KtuId")+"','"+request.getParameter("txt_SName")+"','"+request.getParameter("selClass")+"','"+request.getParameter("selBatch")+"')");
                                          //s="insert into tbl_teacher (FacultyId,Name) VALUES('"+FId+"','"+request.getParameter("txt_facultyName")+"')";
                                      }
                                      
                                      
      if(request.getParameter("del")!=null)
    {
      int bid=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_student where id='"+bid+"'");
    }
    
    
                                      %>
<html>
    <head>
       
        <link href="AdminCss/AdminCss.css" rel="stylesheet" type="text/css" />
        <script src="Js/AdminCommonSearchJs.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Entry</title>
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
           
            
            
            
                   
            <div class="clear"></div>
            <div class="ReligionForm_details">
                <div class="registerhead"><label style="color: #ff0033">Student Entry</label></div>
                <table>
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Student Name :</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_SName" placeholder="Enter   Student Name" class="regtxtbox"  ></div></td>
                    </tr>
                     <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel"> KTU ID :</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_KtuId" placeholder="Enter KTU ID" class="regtxtbox"  ></div></td>
                    </tr>
                     <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Batch :</label></div></td>
                        <td><div class="Religion_innerregisterform_new">
                                
                                <select name="selBatch"><option>-select--</option>
                                <%
        ResultSet rsbatch=obb.selectData("select * from tbl_batch");
        while(rsbatch.next())
        {
            %>
            <option value="<%=rsbatch.getString("id")%>"><%=rsbatch.getString("BatchName")%></option>
            <%
        }
        %>
                                </select>
                                
                                
                              </div></td>
                    </tr>
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Class :</label></div></td>
                        <td><div class="Religion_innerregisterform_new">
                                
                                <select name="selClass"><option value="0">-select--</option>
                                    <option value="1">A</option>
                                    <option value="2">B</option>
                                    <option value="3">C</option>
                                    <option value="4">D</option>
                                </select></div></td></tr>
                    
                    <tr><td></td><td><div class="Religion_innerregisterform_new" ><input type="submit" value="save" name="btn_submit" class="campaign_buttonnew">
                                  <input type="submit" value="Cancel" name="btn_cancel" class="campaign_buttonnew cancelbtn"> </div></td>
                                 
                </tr>
                </table>
                <!--table searching start here-->
                       
               
                         
                
                 <div class="Religion_innerregisterform_table">
                 <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
                          <table id="myTable" >
                            
                             <tr class="header" >
                              <th style="width:60%;">Student Name</th>
                              <th style="width:40%;">KTU Id</th>
                              <th style="width:40%;">Batch</th>
                              <th style="width:40%;">Class</th>
                              
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs=obb.selectData("select * from tbl_student ss,tbl_batch bb where ss.BatchId=bb.id order by ss.BatchId");
                             while(rs.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <%=rs.getString("Name") %>
                                </td>
                                <td>
                                    <%=rs.getString("KtuId") %>
                                </td>
                                <td>
                                    <%=rs.getString("BatchName") %>
                                </td>
                                <td>
                                  <%
                                    if(rs.getString("ClassId").equals("1") )
                                    {
                                     %>
                                     A
                                     <%
                                    }
                                    if(rs.getString("ClassId").equals("2") )
                                    {
                                     %>
                                     B
                                     <%
                                    }
                                    if(rs.getString("ClassId").equals("3") )
                                    {
                                     %>
                                     C
                                     <%
                                    }
                                    if(rs.getString("ClassId").equals("4") )
                                    {
                                     %>
                                     D
                                     <%
                                    }
                                    
                                    %>
                                   
                                </td>
                               
                               
                                <td>
                                    <a href="Student Entry.jsp?del=<%=rs.getString("id")%>"><input type="button" class="button_link cancel" value="delete"></a>
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
