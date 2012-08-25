<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    height : 100%;
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
		<br><h2 align="center">Inscription</h2><br><br>
		<table align="center">
			<TR>
				<TD width="200" valign="middle"><h1>Nom</h1></TD><TD><input type="text" name="nom" size="20"/></TD>
			</TR>
			<TR>
				<TD><h1>Pr&eacute;nom</h1></TD><TD><input type="text" name="prenom" size="20"/></TD>
			</TR>
			<TR>
				<TD><h1>Date de naissance</h1></TD><TD><input type="text" name="date" size="20"/></TD><TD><h1>&nbsp;(jj/mm/aa)</h1></TD></TR>
			<TR>
				<TD><h1>Lieu de naissance</h1></TD><TD><input type="text" name="lieu" size="20"/></TD>
			</TR>
			<TR>
				<TD><h1>Sexe</h1></TD><TD>
				<SELECT name="sexe">
					  <OPTION><h1>Masculin</h1></OPTION>
					  <OPTION><H1>F&eacute;minin</H1></OPTION>
				</SELECT></TD>
			</TR>
			<TR>
				<TD><h1>S&eacute;rie du baccalaur&eacute;at</h1></TD><TD>
				<SELECT name="serie">
					  <OPTION value="Sc. Mathematiques A"> Sc. Math&eacute;matiques A</OPTION>
					  <OPTION value="Sc. Mathematiques B"> Sc. Math&eacute;matiques B</OPTION>
					  <OPTION value="Sc. de la Vie et de la Terre"> Sc. de la Vie et de la Terre</OPTION>
					  <OPTION value="Sc. Physique,Chimie"> Sc. Physiques, Chimie</OPTION>	
					  <OPTION value="Sc. et Techologies Electriques">Sc. et Technologies El&eacute;ctriques</OPTION>
					  <OPTION value="Sc. et Technologies Mecaniques"> Sc. et Technologies M&eacute;caniques</OPTION>
				</SELECT>
				</TD>
			</TR>
			<TR>
				<TD><h1>Acad&eacute;mie</h1></TD><TD><input type="text" name="academie" size="20"/></TD>
			</TR>
			<TR>
				<TD><h1>Province parentale</h1></TD><TD>
				<SELECT name="province">
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
				</SELECT>
				</TD>
			</TR>
			<TR>
				<TD></TD><TD align="right"><br><input type="submit" value="Suivant" style="border-style:groove;"></TD>
			</TR>
		</table>
		</form>
	</div>
	
  </body>
</html>

