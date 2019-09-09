<%@page import="java.sql.ResultSet"%>
<%@page import="MysqlConnection.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Connection con = null;
    Statement st = null;
    Connection con1 = null;
    Statement st1 = null;
    ResultSet rs = null;
    String mail = request.getParameter("email");
    String pass = request.getParameter("pass");
    System.out.println("Email : " + mail);
    System.out.println("password : " + pass);

    int status = Integer.parseInt(request.getParameter("status"));
    System.out.println("Status : " + status);

    try {
        con = DbConnection.getConnection();
        con1= DbConnection.getConnection();
        st = con.createStatement();
        st1 = con1.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from user_details where email='" + mail + "' AND pass='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("sid", rs.getString("id"));
                        st1.executeUpdate("TRUNCATE cretweet");
                        
                        response.sendRedirect("uhome.jsp?msg=success");
                    } else {
                        response.sendRedirect("index.jsp?msggg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:

                try {
                    con = DbConnection.getConnection();
                    st = con.createStatement();

                    if (mail.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")) {
                        st.executeUpdate("TRUNCATE tweets");
                        response.sendRedirect("ahome.jsp?msg=success");
                    } else {
                        response.sendRedirect("admin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 5:
                try {
                    rs = st.executeQuery("select * from reg where yyys='" + pass + "' AND role='Soldier'");
                    if (rs.next()) {
                        response.sendRedirect("s_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("s_one_p.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 6:
                try {
                    rs = st.executeQuery("select * from reg where yyys='" + pass + "' AND role='Commander'");
                    if (rs.next()) {

                        response.sendRedirect("c_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("c_one_p.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                break;

            case 8:
                try {
                    if (mail.equalsIgnoreCase("Admin") && pass.equalsIgnoreCase("Admin")) {
                        response.sendRedirect("admin_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("admin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

           
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>
