<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<html>
  <head>
    <title>Messages</title>
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
    font-size : 12x;
  }
  
h2 {
    color : #242424;
    font-family : Sawasdee;
    font-size : 16px;
    word-spacing : 3px;
  }

.progressBar{
	width:216px;
	height:41px;
	background:url(http://localhost:8080/Service_Scolarite_FSSM/bkgds/bg_bar.gif) no-repeat 0 0;
	position:relative;
}
.progressBar span{
	position:absolute;
	display:block;
	width:200px;
	height:25px;
	background:url(http://localhost:8080/Service_Scolarite_FSSM/bkgds/bar.gif) no-repeat 0 0;
	top:8px;
	left:8px;
	overflow:hidden;
	text-indent:-8000px;
}
.progressBar em{
	position:absolute;
	display:block;
	width:200px;
	height:25px;
	background:url(http://localhost:8080/Service_Scolarite_FSSM/bkgds/bg_cover.gif) repeat-x 0 0;
	top:0;
}

</style>
  </head>

  <body>
	<div class="header"></div>
	<div class="tmp"></div>
	<div class="content" align="center">
		<br><h2 align="center">Messages</h2><br><br>
		
		<h1><c:out value="${message}"/></h1>
		
		<p class="progressBar">
			<span><em style="left:510px"></em></span>
		</p>
	</div>
	
  </body>
</html>
