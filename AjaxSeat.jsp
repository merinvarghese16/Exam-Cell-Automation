
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>

<%
//String Eid=request.getParameter("EID");
 int count=0;
 int cc=0;
 String batc="";
int maxNo=0;


%>
 
 <%
 ResultSet rsss1=obj.selectData("select count(*) from tbl_examduty ex where ex.ExamId='"+request.getParameter("EID")+"' group by class " );
while(rsss1.next())
{
    count=count+1;
}
ResultSet rsss=obj.selectData("select * from tbl_examduty ex where ex.ExamId='"+request.getParameter("EID")+"' group by dateOf " );
while(rsss.next()){
    batc=rsss.getString("BatchId");
}
ResultSet rsss2=obj.selectData("select count(*) from tbl_student st where st.BatchId='"+batc+"'");
if(rsss2.next())
{
    cc=Integer.parseInt(rsss2.getString("count(*)"));
}
maxNo=30; 

String eid=request.getParameter("EID");
String rollno=request.getParameter("KtuId");
String noRow=request.getParameter("noOfclass");

int col=maxNo/Integer.parseInt(noRow);
String studArray[]=new String[100];
String studArray1[]=new String[100];
//String studArray2[]=new String[100];
int cccc=0;
int cccc1=0;
int SArray1=0;
int SArray2=0;

ResultSet rsArray=obj.selectData("select * from tbl_student st where st.BatchId='"+batc+"' and rollNo>='"+request.getParameter("KtuId")+"' order by rollNo asc");
while(rsArray.next())
{
   studArray[cccc] =rsArray.getString("KtuId");
   cccc=cccc+1;
studArray1[SArray1]=rsArray.getString("KtuId");
SArray1=SArray1+1;
   
}
ResultSet rsArray1=obj.selectData("select * from tbl_student st where st.BatchId='"+batc+"' and rollNo<'"+request.getParameter("KtuId")+"' order by rollNo asc");
while(rsArray1.next())
{
studArray[cccc] =rsArray1.getString("KtuId");

   cccc=cccc+1;
   SArray2=SArray2+1;
}

%> 

    
<%

for(int j=0;j<count;j++)
{
    %>
    <table id="class<%=j+1%>" style="border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 20px;
 ">
        <tr style="border-bottom: 1px solid #ddd;">
         <th colspan="<%=Integer.parseInt(noRow)*2%>" style="text-align: left;
  padding: 12px;"><img src="logo/logo_test.jpg" style="width: 100%;height: 100%"><br>
             <label style=" font-size: 18px ; margin-left: 200px;">Students Seat order </label>
         </th>
     </tr>
        <tr style="border-bottom: 1px solid #ddd;"><th colspan="<%=Integer.parseInt(noRow)*2%>" style="text-align: left;
  padding: 12px;"><center> class <%=j+1%></center>
            <%
            int ii=j+1;
            ResultSet rst=obj.selectData("select * from tbl_examduty ex,tbl_teacher tt where ex.dateOf='"+request.getParameter("date")+"' and ex.ExamId='"+request.getParameter("EID")+"' and ex.class='"+ii+"' and tt.FacultyId=ex.Fid");
            while(rst.next())
            {
            %>
         <br>   <label>Date Of Examination  : <%=request.getParameter("date")%></label>
            <br>   <label>Exam Duty  : <%=rst.getString("Name")%></label>
            <br>
            <%
            
            if(j==count-1)
            {
            if(SArray2<maxNo)
            {
                %>
            <label><%=studArray[maxNo]%>--><%=studArray[cccc-1]%></label>
            <% 
            }
            else if(SArray2>=maxNo)
            {
                 %>
            <label><%=studArray[maxNo]%>--><%=studArray[SArray2-1+SArray1]%></label>
            <% 
                
            }
            
           
                
            }
            else
            {
               
                if(SArray1>=maxNo)
                {
                    %>
            <label><%=studArray[0]%>--><%=studArray[maxNo-1]%></label>
            <%  
                }
                else if(SArray1<maxNo)
                {
                   %>
            <label><%=studArray[0]%>--><%=studArray[SArray1-1]%>,<%=studArray[SArray1]%>--><%=studArray[maxNo-1]%></label>
            <%   
                }
            }
           
            }
                %>
                
        </th></tr>
    <tr style="border-bottom: 1px solid #ddd;">
    <%
for(int i=0;i<Integer.parseInt(noRow);i++)
{
    %>
    <td style="text-align: left;
  padding: 12px;">
    <%
            
   for(int x=0;x<col;x++) 
   {
       
       if(cccc1>cc-1)
       {
           
       }
       else
       {
       %>
      
       <table><tr><%= studArray[cccc1]%></tr></table>
       
       <%
       cccc1=cccc1+1;
        
       }
   }
   %>
  </td> 
   <%
}
%>

<%
%>
</tr>

</table>
<label><input type="button" value="Print Seat Arrangement Of Class <%=j+1%> !!" style="width: 200px;background: #66ff66;margin-left: 400px; display: block"onclick="class<%=j+1%>()" id="prntbtn">
</label>
<br>
<%
}

%>

