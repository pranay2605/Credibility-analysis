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
                    <center><h4>Get Normal Tweet's from Twitter</h4></center>
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
                                    <th>Screen Name</th>
                                    <th>User ID</th>
                                    <th>Profile Images</th>
                                    <th>User Name</th>
                                    <th>Tweet</th>

                                </tr>
                                <%
                                    for (Status st : status) {
                                        Connection con1 = DbConnection.getConnection();
                                        Statement stt = con1.createStatement();
                                        String tweet = st.getText().replace("'", " ");
                                        tweet = tweet.replaceAll(URL_REGEX, "");
                                        tweet = tweet.replaceAll("@([^\\s]+)", "");
                                        tweet = tweet.replaceAll(CONSECUTIVE_CHARS, "$1");
                                        tweet = tweet.replaceAll(STARTS_WITH_NUMBER, "");
                                        tweet = tweet.replaceAll("&", "&");
                                        tweet = tweet.replaceAll(quest, "");
                                        System.out.println("Replce Tweets *-* : " + tweet);
                                        stt.executeUpdate("insert into cretweet (uid, img, uname, post, retweet, screenname) values ('" + st.getId() + "', '" + st.getUser().getBiggerProfileImageURL() + "', '" + st.getUser().getName() + "', '" + tweet + "', '" + st.getRetweetCount() + "', '" + st.getUser().getScreenName() + "')");

                                %>
                                <tr>
                                    <td style="color: darkblue"><center><%=st.getUser().getScreenName()%></center></td>
                                <td style="color: black"><center><%=st.getId()%></center></td>
                                <td><center><img src="<%=st.getUser().getBiggerProfileImageURL()%>" width="120" height="120" /></center></td>
                                <td style="color: darkblue"><center><%=st.getUser().getName()%></center></td>
                                <td style="color: blueviolet"><center><textarea style="width: 300px; height: 100px"><%=st.getText()%></textarea></center></td>
                                </tr>
                                <%}%>
                            </table>
                        </center>
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

