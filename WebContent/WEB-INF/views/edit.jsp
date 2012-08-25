<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html>
  <head>
    <title>Modification</title>
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
    font-family : 'Sawasdee';
    font-size : 16px;
  }

a {
    color : #242424;
	float: right;
    font-family : 'VL PGothic';
    font-size : 10px;
    padding-right : 10px;
  }

</style>
  </head>

  <body>
	<div class="header"></div>
	<div class="tmp"></div>
	<div class="content" align="center">
		
		<form method="post" action="modify">
		<a href="./mainResponsable">Menu principal</a><br><br>
		<h2 style="text-decoration: none;">Modifications</h2>
		<% if(session.getAttribute("action").equals("etudiant")) { %>
		<table align="center" height="500">
			<TR>
				<TD  valign="middle"><h2>Nom</h2></TD><TD><h1><input type="text" name="nom" value="${nom}"/></h1></TD><TD><h2>Pr&eacute;nom</h2></TD><TD><h1><input type="text" name="prenom" value="${prenom}"/></h1></TD>
			</TR>
			<TR>
				<TD  valign="middle"><h2>Num&eacute;ro d'&eacute;tudiant </h2></TD><TD><h1><c:out value="${num}"/></h1></TD><TD><h2>Num&eacute;ro d'ordre</h2></TD><TD><h1><c:out value="${ordre}"/></h1></TD>
			</TR>
			<TR>
				<TD valign="middle"> <h2>CNE</h2> </TD> <TD><h1><c:out value="${cne}"/></h1></TD> <TD><h2>CIN</h2></TD> <TD><h1><input type="text" name="cin" value="${cin}"/></h1></TD>
			</TR>
			<TR>
				<TD  valign="middle"><h2>Date de naissance</h2></TD><TD><h1><input type="text" name="date" value="${date}"/></h1></TD><TD><h2>Lieu de naissance</h2></TD><TD><h1><c:out value="${lieu}"/></h1></TD>
			</TR>
			<TR>
				<TD  valign="middle"><h2>Sexe</h2></TD><TD><h1><c:out value="${sexe}"/></h1></TD>
			</TR>
			<TR>
				<TD  valign="middle"><h2>S&eacute;rie du baccalaur&eacute;at</h2></TD><TD><h1><c:out value="${serie}"/></h1></TD><TD ><h2>Acad&eacute;mie</h2></TD><TD><h1><c:out value="${academie}"/></h1></TD>
			</TR>
			<TR>
				<TD  valign="middle"><h2>Province parentale</h2></TD><TD><h1><SELECT name="province">
							  <OPTION>Azilal</OPTION>
							  <OPTION>Zagoura</OPTION>
							  <OPTION>Oued Ed-Dahab</OPTION>
							  <option>El Haouz</option>
							  <option>Marrakech</option>
							  <option>Essaouira</option>
							  <option>Chichaoua</option>
							  <option>El Kelaa des Seraghna</option>
							  <option>Tan-Tan</option>
							  <option>Ass-Zag</option>
							  <option>Guelmim</option>
							  <option>Beni-Mellal</option>
							  <option>Laayoune</option>
							  <option>Es-Smara</option>
							</SELECT></h1></TD><TD ><h2>Fili&egrave;re</h2></TD><TD><h1><c:out value="${filiere}"/></h1></TD>
			</TR>
			<TR>
				<TD valign="middle"><h2>Status de l'&eacute;tudiant</h2></TD><TD><h1><SELECT name="status">
						  <OPTION value="Etudiant">Etudiant</OPTION>
						  <OPTION value="Fonctionnaire">Fonctionnaire</OPTION>
						  <OPTION value="Autres">Autres</OPTION>
						</SELECT></h1></TD><TD><h2>Mode d'enseignement</h2></TD><TD><h1><SELECT name="mode">
						  <OPTION value="Plein temps">Plein temps</OPTION>
						  <OPTION value="Mi temps">Mi temps</OPTION>
						  <OPTION value="Temps partiel">Temps partiel</OPTION>
						</SELECT></h1></TD>
			</TR>
			<TR>
				<TD valign="middle"><h2>Type d'h&eacute;bergement</h2></TD><TD><h1><SELECT name="hebergement">
						  <OPTION>Chambre en cit&eacute; universitaire</OPTION>
						  <OPTION>Chambre en r&eacute;sidence universitaire</OPTION>
						  <OPTION>Logement personnel hors chambre</OPTION>
						  <OPTION>Domicile parental</OPTION>
						</SELECT></h1></TD><TD><h2>Num&eacute;ro de t&eacute;l&eacute;phone</h2></TD><TD><h1><input type="text" name="telephone" value="${telephone}"/></h1></TD>
			</TR>
			<TR>
				<TD valign="middle"><h2>Adresse mail</h2></TD><TD><h1><input type="text" name="email" value="${email}"/></h1></TD><TD><h2>Adresse</h2></TD><TD><h1><input type="text" name="adresse" value="${adresse}"/></h1></TD>
			</TR>
			
			<TR>
				<TD></TD><TD></TD><TD></TD><TD align="right"><br><input type="submit" value="Confirmer" style="border-style:groove;"></TD>
			</TR>
		</table>
		<% } else { %>
		<table width="300">
			<TR><TD align="left">Nom </TD><TD align="right"><INPUT type="text" name="nom" size="20" value="${nom}"></TD></TR>
			<TR><TD align="left">Pr&eacute;nom</TD><TD align="right"><INPUT type="text" name="prenom" value="${prenom}" size="20"></TD></TR>
			<TR><TD></TD><TD align="right"><br><input type="submit" value="Modifier"/></TD></TR>
		</table>
		<% } %>
		</form>
	</div>
	<br><br>
  </body>
</html>


