<%-- 
    Document   : Religion
    Created on : 15 Aug, 2017, 2:45:55 PM
    Author     : basilscolu
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obb"></jsp:useBean>

<!DOCTYPE html>
<%
    String Batch="",BatchId="",Duration="";
    String s="";
    if(request.getParameter("btn_submit")!=null)
    {
        String Bname=request.getParameter("txt_Batch");
        if(!request.getParameter("hiddenid").equals(""))
        {
            int bid=Integer.parseInt(request.getParameter("hiddenid"));
            obb.executeCommand("update tbl_batch set BatchName='"+Bname+"'and Duration='"+request.getParameter("Duration")+"' where id='"+bid+"'");
        s="update tbl_batch set BatchName='"+Bname+"'and Duration='"+request.getParameter("Duration")+"' where id='"+bid+"'";
        }
        else
        {
        obb.executeCommand("insert into tbl_batch (BatchName,Duration)  values('"+Bname+"','"+request.getParameter("Duration")+"')");
                }
        
    }
    if(request.getParameter("del")!=null)
    {
      int bid=Integer.parseInt(request.getParameter("del"));  
      obb.executeCommand("delete from tbl_batch where id='"+bid+"'");
    }
    
    if(request.getParameter("edit")!=null)
    {
       String bid1=request.getParameter("edit");
       ResultSet rs1=obb.selectData("select * from tbl_batch where id='"+bid1+"'");
       while(rs1.next())
       {
       Batch=rs1.getString("BatchName");
       BatchId=rs1.getString("id");
       Duration=rs1.getString("Duration");
       
    }
    }
   %> 
<html>
    <head>
       
        <link href="AdminCss/AdminCss.css" rel="stylesheet" type="text/css" />
        <script src="Js/AdminCommonSearchJs.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Body Type page</title>
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
            
            <input type="hidden" name="hiddenid" value="<%=BatchId%>">
            
            
                   
            <div class="clear"></div>
            <div class="ReligionForm_details">
                <div class="registerhead"><label style="color: #ff0033">Batch Entry</label></div>
                <table>
                    <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Batch:</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="txt_Batch" placeholder="Enter Batch " class="regtxtbox" value="<%=Batch%>"></div></td>
                    </tr>
                     <tr>
                        <td><div class="Religion_innerregisterform_new" ><label class="religionlabel">Duration :</label></div></td><td><div class="Religion_innerregisterform_new"><input type="text" name="Duration" placeholder="Enter Duration " class="regtxtbox" value="<%=Duration%>"></div></td>
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
                              <th style="width:60%;">Body Type</th>
                               <th style="width:40%;">Duration</th>
                                <th style="width:40%;">Edit</th>
                               <th style="width:40%;">Delete</th>
                             </tr>
                             <% ResultSet rs=obb.selectData("select * from tbl_batch");
                             while(rs.next())
                             {
                             
      
       
                             %>
                             <tr>
                                <td>
                                    <%=rs.getString("BatchName") %>
                                </td>
                                <td>
                                    <%=rs.getString("Duration") %>
                                </td>
                               
                                <td>
                                    <a href="BatchEntry.jsp?edit=<%=rs.getString("id")%>"><input type="button" class="button_link" value="edit">
                                    </a>
                                </td>
                                <td>
                                    <a href="BatchEntry.jsp?del=<%=rs.getString("id")%>"><input type="button" class="button_link cancel" value="delete"></a>
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
