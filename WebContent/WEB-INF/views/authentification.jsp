<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
  <head>
    <title>Authentification</title>
    	<style type="text/css">

body {
    background-color: #242424;
  }


div {
    background-color: #fff;
    margin-bottom : 0;
    margin-left : auto;
    margin-right : auto;
    margin-top : 0;
    padding-bottom : 5px;
    padding-left : 5px;
    padding-right : 5px;
    padding-top : 5px;
    -moz-border-radius: 1%;
  }


input {
    background-color : #fff;
    border-bottom-color : #000000;
    border-bottom-style : solid;
    border-left-color : #000000;
    border-left-style : solid;
    border-right-color : #000000;
    border-right-style : solid;
    border-top-color : #000000;
    border-top-style : solid;
  }


.tmp {
    background-color: #242424;
    height:7px;
  }


.header {
	background-image: url('/Service_Scolarite_FSSM/bkgds/banner.png');
    padding-top: 5px;
    padding-bottom: 20px;
    height :100px;
    width : 60%;
  }


.content {
    height : 60%;
    width: 60%;
  }


h1 {
    word-spacing : 2px;
    color : #000;
    font-family : Sawasdee;
    font-size : 16px;
  }


h2 {
    color : #242424;
    font-family : Sawasdee;
    font-size : 16px;
    word-spacing : 3px;
  }

.authentification {
    
    height: 250px;
    width: 300px;
    padding: 20px 25px;
  }

.logo {
    float: left;
    height: 250px;
    width: 400px;
padding: 15px 20px;
  }

</style>
  </head>

  <body>
	<div class="header"></div>
	<div class="tmp"></div>
	<div class="content">
		
		<div class="authentification">	
			<form method="post" action="authentification">
			<br><h2 align="center">Bonjour, Veuillez  vous authentifier</h2><br><br>
			<table align="center">
				<TR>
					<TD width="100" valign="middle"><h1>Login </h1></TD><TD><input type="text" name="username" value="${username}" size="20"/></TD>
				</TR>
				<TR>
					<TD><h1>Password</h1></TD><TD><input type="password" name="password" value="${password}" size="20"/></TD>
				</TR>
				<TR>
					<TD></TD><TD align="right"><br><input type="submit" value="S'authentifier" style="border-style:groove;"></TD>
				</TR>
			</table>
			</form>
		</div>
	</div>
	
  </body>
</html>
