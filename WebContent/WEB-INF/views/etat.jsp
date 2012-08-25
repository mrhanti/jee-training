<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html>
  <head>
    <title>Informations</title>
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
	background-image: url('http://localhost:8080/Service_Scolarite_FSSM/bkgds/banner.png');
    padding-top: 5px;
    padding-bottom: 20px;
    height :100px;
    width : 60%;
  }


.content {
    height : 120%;
    width: 70%;
  }


h1 {
    word-spacing : 2px;
    color : #000;
    font-family : 'VL PGothic';
    font-size : 11px;
  }


h2 {
    word-spacing : 2px;
    color : #000;
    font-family : 'VL PGothic';
    font-size : 14px;
    text-decoration : underline;
  }

a {
    color : #242424;
    font-family : 'VL PGothic';
    font-size : 10px;
    padding-right : 10px;
  }

h5 {
    font-family : 'Arial Black';
    font-size : 24px;
    word-spacing: 3px;
  }

</style>
  </head>

  <body>
	<div class="header"></div>
	<div class="tmp"></div>
	<div class="content">
		<form method="post" action="confirm">
		<table align="center" height="500">
			<TR align="center"><TD></TD><TD><H5><c:out value="${nom}"/></H5></TD><TD><h5><c:out value="${prenom}"/></h5></TD><TD></TD></TR>
			<TR>
				<TD  valign="middle"><h2>Num&eacute;ro d'&eacute;tudiant </h2></TD><TD><h1><c:out value="${num}"/></h1></TD><TD><h2>Num&eacute;ro d'ordre</h2></TD><TD><h1><c:out value="${ordre}"/></h1></TD>
			</TR>
			<TR>
				<TD valign="middle"> <h2>CNE</h2> </TD> <TD><h1><c:out value="${cne}"/></h1></TD> <TD><h2>CIN</h2></TD> <TD><h1><c:out value="${cin}"/></h1></TD>
			</TR>
			<TR>
				<TD  valign="middle"><h2>Date de naissance</h2></TD><TD><h1><c:out value="${date}"/></h1></TD><TD><h2>Lieu de naissance</h2></TD><TD><h1><c:out value="${lieu}"/></h1></TD>
			</TR>
			<TR>
				<TD  valign="middle"><h2>Sexe</h2></TD><TD><h1><c:out value="${sexe}"/></h1></TD>
			</TR>
			<TR>
				<TD  valign="middle"><h2>S&eacute;rie du baccalaur&eacute;at</h2></TD><TD><h1><c:out value="${serie}"/></h1></TD><TD ><h2>Acad&eacute;mie</h2></TD><TD><h1><c:out value="${academie}"/></h1></TD>
			</TR>
			<TR>
				<TD  valign="middle"><h2>Province parentale</h2></TD><TD><h1><c:out value="${province}"/></h1></TD><TD ><h2>Fili&egrave;re</h2></TD><TD><h1><c:out value="${filiere}"/></h1></TD>
			</TR>
			<TR>
				<TD valign="middle"><h2>Status de l'&eacute;tudiant</h2></TD><TD><h1><c:out value="${status}"/></h1></TD><TD><h2>Mode d'enseignement</h2></TD><TD><h1><c:out value="${mode}"/></h1></TD>
			</TR>
			<TR>
				<TD valign="middle"><h2>Type d'h&eacute;bergement</h2></TD><TD><h1><c:out value="${hebergement}"/></h1></TD><TD><h2>Num&eacute;ro de t&eacute;l&eacute;phone</h2></TD><TD><h1><c:out value="${telephone}"/></h1></TD>
			</TR>
			<TR>
				<TD valign="middle"><h2>Adresse mail</h2></TD><TD><h1><c:out value="${email}"/></h1></TD><TD><h2>Adresse</h2></TD><TD><h1><c:out value="${adresse}"/></h1></TD>
			</TR>
			<% if(session.getAttribute("action").equals("inscription")) { %>
			<TR>
				<TD></TD><TD></TD><TD></TD><TD align="right"><br><input type="submit" value="Confirmer" style="border-style:groove;"></TD>
			</TR>
			<% } else { %>
			<div align="center">
			<a href="./edit?action=etudiant">Modifier</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="./certScolarite">Certificat de scolarit&eacute;</a>&nbsp;&nbsp;&nbsp;&nbsp;<A href="./attInscription">Attestation d'inscription</A>&nbsp;&nbsp;&nbsp;&nbsp;<a href="./attPresence">Attestation de pr&eacute;sence</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="./mainResponsable">Menu Principal</a>
			<br><br>
			</div>
			<% } %>
		</table>
		</form>
	</div>
	
  </body>
</html>

