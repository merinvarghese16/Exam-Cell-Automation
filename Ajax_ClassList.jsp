
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
<table><tr><td>
            <label>Select Date :</label></td><td>
 <select id="dateExm">  
     <option>--select Date--</option>
<%
//String Eid=request.getParameter("EID");
 int count=0;
 int cc=0;
 String batc="";
ResultSet rsss=obj.selectData("select * from tbl_examduty ex where ex.ExamId='"+request.getParameter("EID")+"' group by dateOf " );
while(rsss.next()){
    batc=rsss.getString("BatchId");
    %>
    <option value="<%=rsss.getString("dateOf")%>">
        <%=rsss.getString("dateOf")%>
    </option>
    <%
    
}



%>
 </select></td></tr>
 <%
 ResultSet rsss1=obj.selectData("select count(*) from tbl_examduty ex where ex.ExamId='"+request.getParameter("EID")+"' group by class " );
while(rsss1.next())
{
    count=count+1;
}
ResultSet rsss2=obj.selectData("select count(*) from tbl_student st where st.BatchId='"+batc+"'");
if(rsss2.next())
{
    cc=Integer.parseInt(rsss2.getString("count(*)"));
}
%>
   
    <tr><td> No of column :</td><td>  
            <input type="text" name="txt_noOfcol" id="noclassof" style="width: 100px;"></td></tr>
    <tr><td>
    <label>Starting KTU ID :</label></td><td><select id="ktuiddd"><option>-select-</option>
    <%
    int rollno=1;
    ResultSet rss3=obj.selectData("select * from tbl_student st where st.BatchId='"+batc+"' order by SUBSTR(KtuId from 1 for 1),CAST(SUBSTR(KtuId from 11) as UNSIGNED) asc");
    while(rss3.next())
    {
        obj.executeCommand("update tbl_student set rollNo='"+rollno+"' where id='"+rss3.getString("id")+"'");
        rollno=rollno+1;
        %>
        <option value="<%=rss3.getString("rollNo")%>">
        <%=rss3.getString("KtuId")%>
    </option>
        
        <%
    }
    
    %>
    </select></td></tr>
    
    <tr><td colspan="2">
    <input type="button" value="Get Student Seat" style="width: 200px;background: #66ff66;margin-left: 400px; display: block" onclick="getSeat()" id="prntbtn">

        </td></tr></table>    