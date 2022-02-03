import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;



@WebServlet(name = "login",urlPatterns="/log") 
public class login extends HttpServlet{
    public login() {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();  
        String uname=request.getParameter("name");
        String password=request.getParameter("pwd");
        try{
            Class.forName("com.mysql.jdbc.Driver");    
                
                
              
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "ipod2313"); 
            String quer="select * from user";
            Statement stmt = con.createStatement();  
            ResultSet rs = stmt.executeQuery("select * from user");
            HashMap<String, String> map = new HashMap<>();
            while(rs.next()){
                String n = rs.getString("name");
                String m = rs.getString("pass");
                map.put(n,m);
            }
            if(map.containsKey(uname)){
                String getPass;
                getPass = map.get(uname);
                if(getPass.equals(password)){
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", uname);
                    session.setMaxInactiveInterval(20); 
                    out.println("<html><head></head><body onload=\"alert('Login Successful')\"></body></html>");
                    RequestDispatcher rd;  
                    rd = request.getRequestDispatcher("newhtml.html");
                    rd.include(request, response);
                    return;
                }
                else{
                    out.println("<html><head></head><body onload=\"alert('Incorrect Password')\"></body></html>");
                    RequestDispatcher rd;  
                    rd = request.getRequestDispatcher("index.html");
                    rd.include(request, response);
                    return;
                }
            }
            else{
                out.println("<html><head></head><body onload=\"alert('Incorrect Username')\"></body></html>");
                RequestDispatcher rd;  
                rd = request.getRequestDispatcher("index.html");
                rd.include(request, response);
                return;
            }
        }
        catch(ClassNotFoundException | SQLException e)    
        {    
        }
    }
    
}

