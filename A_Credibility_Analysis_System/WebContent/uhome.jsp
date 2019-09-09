<%@page import="MysqlConnection.DbConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="twitter4j.Status" %>
<%@page import="twitter4j.TwitterException" %>
<%@page import="twitter4j.TwitterFactory" %>
<%@page import="twitter4j.conf.ConfigurationBuilder" %>
<%
    String id = (String) session.getAttribute("sid");
    String name = null;
    Connection con = DbConnection.getConnection();
    Statement st1 = con.createStatement();
    try {
        ResultSet rs = st1.executeQuery("select * from user_details where id='" + id + "'");
        if (rs.next()) {
            name = rs.getString("uname");
            id = rs.getString("id");
            System.out.println("-------------------------- id : " + id + "User Name : " + name);
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    long serialVersionUID = -2486285775626564821L;
    String URL_REGEX = "((www\\.[\\s]+)|(https?://[^\\s]+))";
    String CONSECUTIVE_CHARS = "([a-z])\\1{1,}";
    String STARTS_WITH_NUMBER = "[1-9]\\s*(\\w+)";
    String quest = "\\?";

%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>A Credibility Analysis System</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-1.11.0.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Facsimile Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--Google Fonts-->
        <!-- start-smoth-scrolling -->
        <style>
            #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even){background-color: #f2f2f2;}

            #customers tr:hover {background-color: #ddd;}

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #f482ff;
                color: white;
            }
        </style>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event){		
                    event.preventDefault();
                    $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
                });
            });
        </script>
        <script src="js/jquery.chocolat.js"></script>
        <link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8">
        <!--light-box-files -->
        <script type="text/javascript" charset="utf-8">
            $(function() {
                $('.gallery-grid a').Chocolat();
            });
        </script>
        <style>
            .img-circle {
                border-radius: 50%;
            }
        </style>
        <%
            if (request.getParameter("msg") != null) {
        %>
        <script>alert('Login Successfully');</script>
        <%            }
        %>
    </head>
    <body >
        <!--banner start here-->
        <div class="banner">
            <div class="header">
                <div class="container">
                    <div class="header-main">
                        <div class="logo"><a href="#"><img class="img-circle" style="width: 200px; height: 200px" src="images\twitter-pro.png" alt=""></a></div>
                        <div class="top-nav">
                            <span class="menu"> <img src="images/icon.png" alt=""/></span>
                            <nav class="cl-effect-1">
                                <ul class="res">
                                    <li><a  href="uhome.jsp">Home</a></li>
                                    <li><a  href="getTweet.jsp">Get Normal Tweets</a></li>
                                    <li><a  href="coftweet.jsp">Preprocess Tweets</a></li>
                                    <li><a  href="user_rep.jsp">User Reputation Score</a></li>
                                    <li><a  href="search.jsp">Search API</a></li>
                                    <li><a  href="user_ex.jsp">User Search History</a></li>
                                    <li><a  href="index.jsp">Logout</a></li>
                                </ul>
                            </nav>
                            <!-- script-for-menu -->
                            <script>
                                $( "span.menu" ).click(function() {
                                    $( "ul.res" ).slideToggle( 300, function() {
                                        // Animation complete.
                                    });
                                });
                            </script>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <!--banner end here-->

        <!--about start here-->
        
        <div class="footer">
            <div class="container">
                <div class="copyright">
                </div>
                <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
            </div>
        </div>
        <!--footer end here-->
    </body>
</html>
