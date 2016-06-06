<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<Center>
	<HEAD>
		<link rel="stylesheet" type="text/css" href="../../mystyle.css">
  		<H1 align = "center">Connection Pooling Report!</H1><BR>
	</HEAD>
</Center>
	<body>
			<p>
				Connection Pooling report<br>
				Single Instance<br>
				For the singe instance, I added the context pooling datasource information to the content.xml file, so it is allocated for the fabflix app only. At each data connection, our program checks the datasource using our moviedb JDBC connection and pulls from a pool of at most 100 connections that can be active and 30 idle.<br><br>

				For load balancing<br>
				Each of the separate instances implement their connection pooling exactly as the single instance does.
			</p>
	</body>
</head>
</center>
</html>