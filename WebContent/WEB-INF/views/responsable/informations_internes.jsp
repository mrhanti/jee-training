<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
  <head>
    <title>Inscription</title>
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
    border-bottom-style : groove;
    border-left-color : #000000;
    border-left-style : groove;
    border-right-color : #000000;
    border-right-style : groove;
    border-top-color : #000000;
    border-top-style : groove;
  }


.tmp {
    background-color: #242424;
    height:7px;
  }


.header {
	background-image: url('http://localhost:8080/Service_Scolarite_FSSM/bkgds/banner.png');
    padding-top: 5px;
    padding-bottom: 20px;
    height :100px;
    width : 60%;
  }


.content {
    height : 70%;
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


a {
    color : #242424;
    float : right;
    font-family : 'VL PGothic';
    font-size : 10px;
    padding-right : 10px;
  }


select {
    border-bottom-color : #000000;
    border-bottom-style : groove;
    border-left-color : #000000;
    border-left-style : groove;
    border-right-color : #000000;
    border-right-style : groove;
    border-top-color : #000000;
    border-top-style : groove;
    background-color: #fff;
  }

</style>
  </head>

  <body>
	<div class="header"></div>
	<div class="tmp"></div>
	<div class="content">
		<form method="post" action="submit">
		<br><h2 align="center">Inscription</h2>
		<table align="center">
			<TR>
				<TD width="200" valign="middle"><h1>Fili&egrave;re</h1></TD><TD><c:out value="${filiere}"/></TD>
			</TR>
			<TR>
				<TD><h1>Status de l'&eacute;tudiant</h1></TD><TD>
				<SELECT name="status">
					  <OPTION value="Etudiant">Etudiant</OPTION>
					  <OPTION value="Fonctionnaire">Fonctionnaire</OPTION>
					  <OPTION value="Autres">Autres</OPTION>
				</SELECT></TD></TR>
			<TR>
				<TD><h1>Mode d'enseignement</h1></TD>
				<TD>
				<SELECT name="mode">
					  <OPTION value="Plein temps">Plein temps</OPTION>
					  <OPTION value="Mi temps">Mi temps</OPTION>
					  <OPTION value="Temps partiel">Temps partiel</OPTION>
				</SELECT>
				</TD>
			</TR>
			<TR>
				<TD><h1>Type d'h&eacute;bergement</h1></TD><TD>
				<SELECT name="hebergement">
					  <OPTION>Chambre en cit&eacute; universitaire</OPTION>
					  <OPTION>Chambre en r&eacute;sidence universitaire</OPTION>
					  <OPTION>Logement personnel hors chambre</OPTION>
					  <OPTION>Domicile parental</OPTION>
				</SELECT></TD>
			</TR>
			<TR>
				<TD></TD><TD align="right"><br><input type="submit" value="Suivant" style="border-style:groove;"></TD>
			</TR>
		</table>
		</form>
	</div>
	
  </body>
</html>