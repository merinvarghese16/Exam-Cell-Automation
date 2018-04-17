
 <%@page import="java.sql.ResultSet"%>
<jsp:useBean class="db.dbConnection" id="obj">
    
</jsp:useBean>
<%
  
    
    
    
    
int Noofclass=Integer.parseInt(request.getParameter("NOOFCLASS"));

String Batcid=request.getParameter("BatchId");
int NoOfdays=0;
int workforeach=0;
int Tcount=0;
int count=0;
String BatchId="";

ResultSet aaa=obj.selectData("select count(*) from tbl_examduty ex where ex.ExamId='"+Batcid+"'");
while(aaa.next())
{
    count=Integer.parseInt(aaa.getString("count(*)"));
}
if(count>0)
{
    %>
    <a href="ExamDuties.jsp">Already Generated ! Click Here To View Generated Result</a>
    <%
}
else
{
    

ResultSet Rsc=obj.selectData("select count(*) from tbl_examtimetable et where et.ExamId='"+Batcid+"' ");
while(Rsc.next())
{
    NoOfdays=Integer.parseInt(Rsc.getString("COUNT(*)"));
   
}
ResultSet sss=obj.selectData("select BatchId from tbl_exam ee where ee.id='"+Batcid+"'");
while(sss.next())
{
   BatchId=sss.getString("BatchId");
}


ResultSet rsteacher=obj.selectData("select count(*) from tbl_teacher");
while(rsteacher.next())
{
    Tcount=Integer.parseInt(rsteacher.getString("count(*)"));
}

workforeach=(Noofclass*NoOfdays);
int calc=(workforeach/Tcount);
int remainder=(workforeach % Tcount);

%>

<%

ResultSet rst=obj.selectData("select * from tbl_teacher");
while(rst.next())
{
    obj.executeCommand("insert into tbl_dutyassign (Fid,NoofDay,Examid) VALUES('"+rst.getString("FacultyId") +"','"+calc+"','"+Batcid+"')");
}


for (int j=0;j<remainder+2;j++)
{
    String randomFid=obj.random(Batcid);
    obj.executeCommand("update tbl_dutyassign dd set dd.NoofDay=dd.NoofDay+1 where dd.Examid='"+Batcid+"'  and dd.Fid='"+randomFid+"'");
}





ResultSet rstime=obj.selectData("select * from tbl_examtimetable ex where  ex.Examid ='"+Batcid+"'");
while(rstime.next())
{
  
    int month=Integer.parseInt(rstime.getString("mm"))+1;
    
      String date=rstime.getString("yy")+"-"+month+"-"+rstime.getString("dd");
     for(int i=1;i<=Noofclass;i++)
     {
        
      ResultSet rsrand=obj.selectData("select Fid,NoofDay from tbl_dutyassign where NoofDay>0 and Examid='"+Batcid+"'   ORDER BY RAND() LIMIT 1 ");
      while(rsrand.next())
      {
          int N=Integer.parseInt(rsrand.getString("NoofDay"));
         
        Boolean bb= obj.executeCommand("insert into tbl_examduty  (dateOf,Fid,Examid,class,BatchId) VALUES('"+date+"','"+rsrand.getString("Fid")+"','"+Batcid+"','"+i+"','"+BatchId+"')");
     if(bb)
     {
         N=N-1;
          
          obj.executeCommand("update tbl_dutyassign dd set dd.NoofDay='"+N+"' where dd.Fid='"+rsrand.getString("Fid")+"' and Examid='"+Batcid+"'  ");
     } 
    else
           {
            
           ResultSet rsrand1=obj.selectData("select Fid,NoofDay from tbl_dutyassign where NoofDay>0 and Fid!='"+rsrand.getString("Fid")+"' and Examid='"+Batcid+"'  ORDER BY RAND() LIMIT 1 ");
            while(rsrand1.next())
            {
               
             Boolean check=obj.executeCommand("insert into tbl_examduty  (dateOf,Fid,Examid,class,BatchId) VALUES('"+date+"','"+rsrand1.getString("Fid")+"','"+Batcid+"','"+i+"','"+BatchId+"')");
              if(check)
              {
            N=Integer.parseInt(rsrand1.getString("NoofDay"));
                 N=N-1;
          obj.executeCommand("update tbl_dutyassign dd set dd.NoofDay='"+N+"' where dd.Fid='"+rsrand1.getString("Fid")+"' and Examid='"+Batcid+"'");
              }
              else
              {
                  String Query="";
                  ResultSet sel=obj.selectData("select * from tbl_examduty ex where ex.dateOf='"+date+"'");
                  while(sel.next())
                  {
                      Query=Query+" Fid!='"+sel.getString("Fid")+"' and";
                  }
                  Query=Query+" Fid!=''";
                  
                 ResultSet last=obj.selectData("select * from tbl_examduty  where "+Query+" ORDER BY RAND() LIMIT 1");
                 
                 while(last.next())
                 {
                     obj.executeCommand("insert into tbl_examduty  (dateOf,Fid,Examid,class,BatchId) VALUES('"+date+"','"+last.getString("Fid")+"','"+Batcid+"','"+i+"','"+BatchId+"')");
                 }
              }
           
            }
            
           
           }
      
     }
     }
}
%>
 <table id="myTable" >
     <tr>
         <th colspan="4"><img src="logo/logo_test.jpg" style="width: 100%;height: 100%"><br>
             <label style=" font-size: 18px ; margin-left: 200px;">MCA Department Exam Duty List</label>
         </th>
     </tr>
    
     <tr > <th>Date</th> 
         <th>Faculty</th> 
         <th>Class</th> 
         <th>Batch</th> 
     </tr>
    
                            
                           
<%

ResultSet exduty=obj.selectData("select * from tbl_examduty ex,tbl_teacher tt,tbl_batch bb where ex.Fid=tt.FacultyId and ex.ExamId='"+Batcid+"' and bb.id=ex.BatchId order by ex.dateOf");
while(exduty.next())
{
%>
 <tr>
     <td>
    <%=exduty.getString("dateOf")%>
</td>
<td>
    <%=exduty.getString("Name")%>
</td>
<td>
    <%=exduty.getString("class")%>
</td>
<td>
    <%=exduty.getString("BatchName")%>
</td>
</tr>
<%
}
%>
     
                        </table> 
 <input type="button" value="Print Exam Duty" style="width: 200px;background: #66ff66;margin-left: 400px; display: block"onclick="MyPrint()" id="prntbtn">

<%
}

 %>
  
                       