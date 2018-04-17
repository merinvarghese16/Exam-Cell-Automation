
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obb"></jsp:useBean>
<%@include file="header.jsp" %>

<!DOCTYPE html>
 <%
     
    
                                      if(request.getParameter("btn_submit")!=null)
                                      {
                                         
                                         obb.executeCommand("insert into tbl_subject(subjectname,Semester) VALUES('"+request.getParameter("ttx_subject")+"','"+request.getParameter("selSem")+"')");
                                          //s="insert into tbl_teacher (FacultyId,Name) VALUES('"+FId+"','"+request.getParameter("txt_facultyName")+"')";
                                      
                                      }
                                      
 if(request.getParameter("del")!=null)
    {
      int bid=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_subject where id='"+bid+"'");
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
          
         <form >
          
            
            
   
             <div class="ReligionForm_details" style="width: 60%">
                <div class="registerhead"><label style="color: #ff0033">Subject Entry</label></div>
                <table>
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
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Subject :</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="ttx_subject" placeholder="Enter Enter subject Name" class="regtxtbox" ></div></td>
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
                                <th style="width:40%;">Semester</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs=obb.selectData("select * from tbl_subject ss, tbl_semester s where ss.Semester=s.id");
                             while(rs.next())
                             {
                           
                             %>
                             <tr>
                                <td>
                                    <%=rs.getString("subjectname") %>
                                </td>
                                <td>
                                    <%=rs.getString("sem") %>
                                </td>
                               
                              
                                <td>
                                    <a href="SubjectEntry.jsp?del=<%=rs.getString("id")%>"><input type="button" class="button_link cancel" value="delete" ></a>
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
