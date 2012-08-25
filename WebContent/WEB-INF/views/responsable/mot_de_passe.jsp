<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
    font-size : 11px;
  }


h2 {
    color : #242424;
    font-family : Sawasdee;
    font-size : 16px;
    word-spacing : 3px;
  }

.password {
    
    height: 250px;
    width: 400px;
    padding: 20px 25px;
  }

</style>
  </head>

  <body>
	<div class="header"></div>
	<div class="tmp"></div>
	<div class="content">
		
		<div class="password">	
			<form method="post" action="changePassword">
			<br><h2 align="center">Modification du mot de passe utilisateur</h2><br><br>
			<table align="center">
				<TR>
					<TD width="240" valign="middle"><h1>Ancien Mot de passe </h1></TD><TD><input type="password" name="apassword" value="" size="20"/></TD>
				</TR>
				<TR>
					<TD><h1>Nouveau mot de passe</h1></TD><TD><input type="password" name="npassword" value="" size="20"/></TD>
				</TR>
				<TR>
					<TD><h1>Confirmation du mot de passe</h1></TD><TD valign="top"><input type="password" name="cnpassword" value="" size="20"/></TD>
				</TR>
				<TR>
					<TD></TD><TD align="right"><br><input type="submit" value="Confirmer" style="border-style:groove;"></TD>
				</TR>
			</table>
			</form>
		</div>
	</div>
	
  </body>
</html>
