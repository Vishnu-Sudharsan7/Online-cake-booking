<%@page import="java.io.*, java.util.*, java.sql.*"%>
<%@page import="javax.servlet.http. *, javax.servlet.*"%>


<%@page import="java.sql.*,java.util.*"%>
<%
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String Type=request.getParameter("type");
String Flavour=request.getParameter("Flavour");
String Frosting=request.getParameter("frosting");
String dropdate=request.getParameter("dropdate");
 int total=0,bill=12456678;
String str="";



try
{
   bill++;
    if(Type=="Double")
    {
        total+=500;
    }
    else
    {
        total+=350;
    }
    if(Frosting=="Fondant")
    {
        total+=200;
    }
    else
    {
        total+=100;
    }

%> <a href="newhtml.html"><button> click here </button></a><%
    
}
catch(Exception e)
{
	out.println(e);
}
%>
<html>
    <head>
         
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Bill</title>  
<style>   
Body {  
  font-family: Calibri, Helvetica, sans-serif;  
  background-image:url("images/bg_1.jpg") ;  
}  
button {   
       background-color: grey;   
       width: auto;  
        color: orange;   
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
         }   
 
 button:hover {   
        opacity: 1.0;   
    }   
          
     
   
</style>   
</head>    
<body>
    <font color="white" face="Courier ">    
    <center> <h1>  Bake O'Clock </h1> </center>
    <body>
    <center> <table BORDER="10 >
            

<tr rowspan="2">
            <th> Bill Number:</th>
<td><input type="text" name="conname" value=<%=bill%>></td>
</tr>

<th> Customer Name:</th>
<td><input type="text" name="conname" value=<%=firstname%>></td>
</tr>

<tr>
<th> Cake Type:</th>
<td><input type="text" name="conno" value=<%=Type%>></td>
</tr>

<tr>
<th> Flavour:</th>
<td><input type="text" name="condate" value=<%=Flavour%>></td>
</tr>

<tr>
<th> Frosting:</th>
<td><input type="text" name="conzn" value=<%=Frosting%>></td>
</tr>

<tr>
<th>Delivery date :</th>
<td><input type="text" name="conpmr"value=<%=dropdate%>></td>
</tr>

<tr>
<th> Total bill amount:</th>
<td><input type="text" name="concmr" value=<%=total%>></td>
</tr>
"PLEASE HAVE A COPY OF THE BILL WHILE DELIVERY" 

</table></center>
</body>
</html>
