<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html>
  <head>
    <title>Profils utilisateurs</title>
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

a {
    color : #242424;
    float : right;
    font-family : 'VL PGothic';
    font-size : 10px;
    padding-right : 10px;
  }


th {
    background-color : #aaaaaa;
    font-family : Sawasdee;
    font-size : 14px;
  }


td {
    font-family : Sawasdee;
    font-size : 12px;
  }

</style>
  </head>

  <body>
	<div class="header"></div>
	<div class="tmp"></div>
	<div class="content" align="center">
		<h1 style="font-size: 16px; font-family: Sawasdee;">Gestion des profils des responsables du service de scolarit&eacute;</h1><br>
		<table border="0" width="550">
		<TR>
			<TH>ID du responsable</TH>
			<TH>Nom du responsable</TH>
			<TH>Pr&eacute;nom du responsable</TH>
		</TR>
		<c:forEach var="responsable" items="${responsables}">
		<TR>
			<td><c:out value="${responsable.id}"/></td>
			<td><c:out value="${responsable.nom}"/></td>
			<td><c:out value="${responsable.prenom}"/></td>
			<td width="10"></td>
			<td><a href="./edit?action=responsable&id=<c:url value="${responsable.id}"/> "><img src="http://localhost:8080/Service_Scolarite_FSSM/bkgds/edit-icon.png" height="16" width="16"/></a></td>
			<td><a href="./delete?id=<c:url value="${responsable.id}"/> "><img src="http://localhost:8080/Service_Scolarite_FSSM/bkgds/delete-icon.png" height="16" width="16"/></a></td>
		</TR>
		</c:forEach>
		</table>
	</div>
	
  </body>
</html>