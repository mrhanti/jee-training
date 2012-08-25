<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>Recherche</title>
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
    height : 50%;
    width: 60%;
  }


h1 {
    color : #000;
    font-family : Sawasdee;
    font-size : 16px;
    word-spacing : 2px;
  }


h2 {
    color : #242424;
    font-family : Sawasdee;
    font-size : 16px;
    word-spacing : 3px;
  }

</style>
  </head>

  <body>
	<div class="header"></div>
	<div class="tmp"></div>
	<div class="content" align="center">
		
		<br><h2 align="center">Recherche</h2><br>
		<form action="recherche" method="post">
		<h2 style="font-size: 13px;">Veuillez saisir le CNE de l'&eacute;tudiant, puis cliquez sur "Rechercher"</h2><br>
		<table><TR><TD><h1>CNE : </h1></TD><TD><input type="text" size="20" name="recherche"/></TD><TD><input type="submit" value="Rechercher"/></TD></TR></table>
		</form>
		
	</div>
	
  </body>
</html>