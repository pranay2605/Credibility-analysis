package Registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import MysqlConnection.DbConnection;
/**
 * Servlet implementation class Reg
 */
@WebServlet("/Reg")
public class Reg extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Reg() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("name");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        System.out.println("User Name : " + uname);
        System.out.println("Password : " + pass);
        System.out.println("Email ID : " + email);
        System.out.println("State : " + state);
        System.out.println("Country : " + country);

        InputStream inputStream = null;



        Connection conn = null;

        try {

            conn = DbConnection.getConnection();
            String sql = "INSERT INTO user_details (uname, pass, email, state, country) values (?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, uname);
            statement.setString(2, pass);
            statement.setString(3, email);
            statement.setString(4, state);
            statement.setString(5, country);

        
            int row = statement.executeUpdate();
            if (row > 0) {
                response.sendRedirect("index.jsp?msg=Success");
            } else {
                response.sendRedirect("index.jsp?msg=Error");
            }
        } catch (SQLException ex) {
//            ex.printStackTrace();
            response.sendRedirect("register.jsp?msg=This_mailID_already_uesd");
        }
	}

}
