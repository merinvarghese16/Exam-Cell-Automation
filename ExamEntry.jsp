
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obb"></jsp:useBean>


<!DOCTYPE html>
 <%
     String s="";
    
                                      if(request.getParameter("btn_submit")!=null)
                                      {
                                         
                                         obb.executeCommand("insert into tbl_exam (ExamName,BatchId,semId) VALUES('"+request.getParameter("txt_examName")+"','"+request.getParameter("selBatch")+"','"+request.getParameter("selSem")+"')");
                                         //s= "insert into tbl_exam (Exam Name,BatchId,semId) VALUES('"+request.getParameter("txt_examName")+"','"+request.getParameter("selBatch")+"','"+request.getParameter("selSem")+"')";

                                      
                                      }
                                      
 if(request.getParameter("del")!=null)
    {
      int bid=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_exam where id='"+bid+"'");
    }
    
    
                                      %>
<html>
    <head>
       
        <link href="AdminCss/AdminCss.css" rel="stylesheet" type="text/css" />
        <script src="Js/AdminCommonSearchJs.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject Entry</title>
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
                <div class="registerhead"><label style="color: #ff0033">Subject Entry</label></div>
                <table>
                    
                    
                    
    
     <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Batch : :</label></div></td>
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
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Semester :</label></div></td>
                        <td><div class="Religion_innerregisterform_new">
                                <select name="selSem"><option>-select--</option>
                                <%
                                
                                ResultSet rsss=obb.selectData("select * from tbl_semester");
                                while(rsss.next())
                                {
                                    %>
                                    <option value="<%=rsss.getString("id")%>"><%=rsss.getString("sem")%></option>
                                    
                                    <%
                                    
                                }
                                %>
                                
                                </select>
                            </div></td>
                    </tr>
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Exam :</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_examName" placeholder="Enter Enter Exam Name" class="regtxtbox" ></div></td>
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
                              <th style="width:60%;">Exam Name</th>
                                <th style="width:40%;">Semester</th>
                                 <th style="width:40%;">Batch</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs=obb.selectData("select * from tbl_exam  ex ,tbl_semester ss ,tbl_batch bb where ex.BatchId=bb.id and ex.semId=ss.id");
                             while(rs.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <%=rs.getString("ExamName") %>
                                </td>
                                <td>
                                    <%=rs.getString("sem") %>
                                </td>
                               
                               <td>
                                    <%=rs.getString("BatchName") %>
                                </td>
                               
                                <td>
                                    <a href="ExamEntry.jsp?del=<%=rs.getString("id")%>"><input type="button" class="button_link cancel" value="delete" ></a>
                                </td>
                                   
                            </tr>
                             
                            <%
                             }
                            
                             
                             
                             %>
                               
                        </table> 
                    
                </div>
                                        <!--table searching end here-->

            </div>
           
                             <%
out.print(s);
%>    
        </form>
      
         
    </body>
    
</html>
