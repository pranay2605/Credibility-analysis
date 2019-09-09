<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
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
    String letters = "0123456789";
    String STARTS_WITH_NUMBER = "[1-9]\\s*(\\w+)";
    String quest = "\\?";

%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>A Credibility Analysis System </title>
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
        <div class="about" id="about">
            <div class="container">
                <div class="about-main">
                    <center><h4>Get Preprocessed Tweet's </h4></center>
                    <div class="center btmspace-80">
                        <%

                            ConfigurationBuilder cf = new ConfigurationBuilder();
                            cf.setDebugEnabled(true)
                                       .setOAuthConsumerKey("jT2Au0BlPAlZZy2gYENAGVKl4")
                                    .setOAuthConsumerSecret("MERRQssKeHCfZaYt6agSj7Brz8qBKfmEIjEFXgDS7qvWmMMBC4")
                                    .setOAuthAccessToken("345752065-7BNwnw8pCYF5eZeWyLzVfRTPhPQB6EHIv8TJsBGd")
                                    .setOAuthAccessTokenSecret("4IOXcEB7IlNHfgXQmdo9GbvtYCvPynZbhCVPvKbkAoKY0");

                            TwitterFactory tf = new TwitterFactory(cf.build());
                            twitter4j.Twitter twitter = tf.getInstance();
                            java.util.List<Status> status = twitter.getHomeTimeline();

                        %>
                        <!-- / Main body -->
                        <center>
                            <table id="customers">
                                <tr>
                                    <th>User ID</th>
                                    <th>ScreenName</th>
                                    <th>Profile Images</th>
                                    <th>User Name</th>
                                    <th>Tweet</th>
                                </tr>
                                <%

                                    try {
                                        Random cou1 = new SecureRandom();
                                        String sql = "SELECT * FROM cretweet ORDER BY retweet DESC";

                                        Connection con1 = DbConnection.getConnection();
                                        Statement st2 = con1.createStatement();
                                        Connection con3 = DbConnection.getConnection();
                                        Statement st3 = con3.createStatement();
                                        ResultSet rs = st2.executeQuery(sql);
                                        while (rs.next()) {
                                            String idd = rs.getString("screenname");
                                            int len1 = 1;
                                            String uid = "";
                                            for (int i = 0; i < len1; i++) {
                                                int index = (int) (cou1.nextDouble() * letters.length());
                                                uid += letters.substring(index, index + 1);
                                            }
                                            int len2 = 5;
                                            String nxt = "";
                                            for (int i = 0; i < len2; i++) {
                                                int index = (int) (cou1.nextDouble() * letters.length());
                                                nxt += letters.substring(index, index + 1);
                                            }
                                            String str = uid + "." + nxt;
                                            double value = Double.parseDouble(str);
                                            st3.executeUpdate("UPDATE cretweet set rep_user='" + value + "' where screenname='" + idd + "'");
                                %>
                                <tr>
                                    <td style="color: darkblue"><center><%=rs.getString("uid")%></center></td>
                                <td style="color: darkblue"><center><%=rs.getString("screenname")%></center></td>
                                <td><center><img src="<%=rs.getString("img")%>" width="120" height="120" /></center></td>
                                <td style="color: darkblue"><center><%=rs.getString("uname")%></center></td>
                                <td style="color: blueviolet"><center><textarea style="width: 300px; height: 100px"><%=rs.getString("post")%></textarea></center></td>

                                </tr>
                                <%
                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>
                            </table>
                        </center>
                        <!--<a href="Pre_Process.jsp"><input type="Submit" value="Pre-Processing" class="button" ></a>-->
                        <!-- / End body -->
                    </div>
                </div>
            </div>
        </div>
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
