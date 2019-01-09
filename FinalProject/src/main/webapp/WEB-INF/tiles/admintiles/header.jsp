<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
	<script type="text/javascript">
		$(function () {
		  	$('.navbar-toggle-sidebar').click(function () {
		  		$('.navbar-nav').toggleClass('slide-in');
		  		$('.side-body').toggleClass('body-slide-in');
		  		$('#search').removeClass('in').addClass('collapse').slideUp(200);
		  	});

		  	$('#search-trigger').click(function () {
		  		$('.navbar-nav').removeClass('slide-in');
		  		$('.side-body').removeClass('body-slide-in');
		  		$('.search-input').focus();
		  	});
		  });
	</script>
	<nav class="navbar navbar-default navbar-static-top" >
    <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle navbar-toggle-sidebar collapsed">
			MENU
			</button>
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">
				Administrator
			</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">      
			
			<ul class="nav navbar-nav navbar-right" style="display:block;">
				<li><a href="http://www.pingpong-labs.com" target="_blank">Visit Site</a></li>
				
			</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>  	
	