<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html>
  <head>
    <title>Menu Principal</title>
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


h3 {
    float: right;
    font-size: 10px;
  }


a {
    color : #242424;
    float : right;
    font-family : 'VL PGothic';
    font-size : 10px;
    padding-right : 10px;
  }

</style>
  </head>

  <body>
	<div class="header"></div>
	<div class="tmp"></div>
	<div class="content">
		<a href="./logout">D&eacute;connexion</a>
		<br><h2 align="center">Bonjour <c:out value="${username}"/>,</h2><br>
		<table align="center" height="200" width="500">
			<TR><TD width="100"><A href="./showProfiles"><IMG src="/Service_Scolarite_FSSM/bkgds/logo_profils.jpg" alt="profils" width="80" height="80" align="middle" border="0"></A></TD><TD style="font-family : Sawasdee; font-size : 30px;" width="200" align="left">Profils utilisateurs</TD></TR>
		
			<TR><TD width="100"><A href="./showAccounts"><IMG src="/Service_Scolarite_FSSM/bkgds/logo_comptes.jpg" alt="comptes" width="80" height="80" align="middle" border="0"></A></TD><TD style="font-family : Sawasdee; font-size : 30px;" width="200" align="left">Comptes utilisateurs</TD></TR>
		</table>
	</div>
	
  </body>
</html>