
<%@page import="twitter4j.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="MysqlConnection.DbConnection" %>
<%@page import="com.searchTweet.main.src.AnalyzeTweet" %>
<%@page import="com.searchTweet.main.src.DbConn" %>
<%@page import="com.searchTweet.main.src.AspectDetection" %>
<%@page import="com.searchTweet.main.src.TwitterAnalysis" %>
<%@page import="com.searchTweet.main.src.SentimentAnalysis" %>
<%@page import="javax.script.*"%>
<%@page import="java.awt.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.swing.JPanel"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                        <div class="logo"><a href="#"><img class="img-circle" style="width: 200px; height: 200px"  alt=""></a></div>
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
                    <center><h4>Get User Reputation Tweet's </h4></center>
                    <div class="center btmspace-80">

                        <!-- / start body -->
                        <center>

                            <%
                                if (request.getParameter("key") != null) {
                                    String location = "ireland";
                                    String key = request.getParameter("key").toString();
                                    if (request.getParameter("place") != null) {
                                        location = request.getParameter("place").toString().toLowerCase();
                                        AspectDetection maps = new AspectDetection();
                                        if ((maps.countries.get(location) == null) && (maps.cities.get(location) == null)) {
                                            location = "ireland";
                                        }
                                    }
                                    String keyword = request.getParameter("key").toString().toLowerCase();
                                    String searchfor = keyword + " -RT";  // to remove retweets
                                    TwitterAnalysis twe = new TwitterAnalysis();
                                    AnalyzeTweet sent = new AnalyzeTweet();

                                    List<Status> tweets = twe.TweetsRetrival(searchfor, location);

                                    try {
                                        int neu = 0, pos = 0, neg = 0;
                                        if (tweets.size() > 0) {
                                            int set = 20, total = 0;
                                            for (Status tweet : tweets) {
                                                double score = sent.AnalyzeTweets(tweet.getText());

                                                if (score >= 1) {
                                                    pos++;
                                                    if (set > 0) {
                            %>
                            <p class="postweet">
                                <%
                                        out.print("@" + tweet.getUser().getScreenName() + " - " + tweet.getText());
                                        set--;
                                    }
                                } else if (score <= -1) {
                                    neg++;
                                    if (set > 0) {
                                %>
                            </p>
                            <p class="negtweet">
                                <%
                                        out.print("@" + tweet.getUser().getScreenName() + " - " + tweet.getText());
                                        set--;
                                    }
                                } else if ((score < 1) && (score > -1)) {
                                    neu++;
                                    if (set > 0) {
                                %>
                            </p>
                            <p class="neutweet">

                                <%
                                                out.print("@" + tweet.getUser().getScreenName() + " - " + tweet.getText());
                                                set--;
                                            }
                                        }
                                    }
                                %>
                                <script type="text/javascript" src="https://www.google.com/jsapi"></script>
   <script type="text/javascript" src="https://www.google.com/jsapi"></script>
   <script type="text/javascript">

     // Load the Visualization API and the piechart package.
     google.load('visualization', '1.0', {'packages':['corechart']});

     // Set a callback to run when the Google Visualization API is loaded.
     google.setOnLoadCallback(drawChart);

     // Callback that creates and populates a data table,
     // instantiates the pie chart, passes in the data and
     // draws it.
     function drawChart() {

       // Create the data table.
       var data = new google.visualization.DataTable();
       
       data.addColumn('string', 'Sentiment');
       data.addColumn('number', 'Tweets');
       data.addRows([
         ['Positive', <%=pos%>],
         ['Neutral', <%=neu%>],
         ['Negative', <%=neg%>],
       ]);

       // Set chart options
       var options = {'title':'Sentiments of tweets for ' + '<%=key%>',
                      'width':400,
                      'height':300,
                      colors: ['#259C37', '#42E3E0', '#D90B15']};

       // Instantiate and draw our chart, passing in some options.
       var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
       chart.draw(data, options);
     }
   </script>
 		<div id="chart_center">
		<div id="chart_div"></div>
			</div>
					
				<% 
						total = pos + neg + neu; 
				//	PieCharts res = new PieCharts("The search results for "+ keyword, "Sentiment Analysis", pos ,neu ,neg );
				//	res.pack();
				//	res.setVisible(true);	    
				  %>
				  <p>
					<%
						out.print("Your search based on " + keyword + " has returned " + total + " results, out of which, " + pos + 
						" represent positive tweets, " +  neg + " represent negative tweets, and " + neu + " represent neutral tweets."+"<br><br>");						
						DbConn conn = new DbConn();
						conn.insertkey(location, keyword, pos, neu, neg);
						
						String previous[] = conn.getPrevious(location, keyword);
						int j, x;
						
						// I want to display in the chart only the results of the last 7 searches for the given specifications; to do that,
						// I need to know how many elements does the previous string contain and start the loop from the (nr of elements - 5) elem
						
						for (j=0; j<1000; j++)   
							if (previous[j] == null)
								break;
						if (j <= 28)
							x = 0;
						else 
							x = j - 28;
						
						if (previous[6] != null) {    // checking if there is at least a previous search with same specifications, so I can 
							// create the bar chart
						
						%>
						</p>
						<script type="text/javascript" src="https://www.google.com/jsapi"> </script>
					    <script type="text/javascript">
					      google.load("visualization", "1", {packages:["corechart"]});
					google.setOnLoadCallback(drawChart);
					function drawChart() {
						var dataArray = [['Time of search', 'Positive', 'Neutral' , 'Negative']];
						<%
						for (int i=x; i<1000; i=i+4) {
							if (previous[i]!= null) {
								if ((i%4 == 0) || (i==0)) 
									
								%>
									dataArray.push (['<%=previous[i]%>', parseInt(<%=previous[i+1]%>), parseInt(<%=previous[i+2]%>), parseInt(<%=previous[i+3]%>)]);
								<%
							}
						}
						%>
							
						var data = new google.visualization.arrayToDataTable(dataArray);
						
					  var options = {
					    title: 'Previous sentiments results for ' + '<%=key%>' + '(only a maximum of 7 most recent results are displayed)',
					    colors: ['#259C37', '#42E3E0', '#D90B15'],
					    hAxis: {title: 'Time of search', titleTextStyle: {color: 'black'}}
					  };

					  var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));

					  chart.draw(data, options);

					}
					    </script>

					    <div id="chart_div2" style="width: 900px; height: 500px;"></div>
											
											
			     <%			
						} else
							out.print("There are no results of previous searches for " + key + ".");
					}
					else
					{	
						out.print("<br><p>" + "Your search has not retrieved any results.</p>");
					}
					} catch (FileNotFoundException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}			
		 %>		

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

