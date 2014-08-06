<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<title>Landing Page</title>
        <#include "stubs/header.ftl">
	</head>
	<body id="body">

		<#include "stubs/navbar.ftl">

        <!-- content -->
        <div class="jumbotron">
            <div class="container">
                <span class="pull-left col-sm-6">
                    <img class="img-responsive logo" src="/static/img/logo.png"/>
                </span>
                <span class="col-sm-2"></span>
                <span class="pull-left col-sm-4">
                    <p class="lead text-muted">
                        A state of the art query and report generator specifically designed for mongoDB.
                    </p>
                    <small>
                        Have other reporting tools left you wanting more out of the leading NoSQL
                        database on the market? Well want no more beacause that want is about to
                        be satisfied, forever.
                    </small>
                </span>
            </div>
        </div>
        <div class="container">
            <div class="col-sm-4 text-center">
                <a href="/server" class="btn btn-default btn-block">
                    <br/>
                    <i class="fa fa-database fa-5x"></i>
                    <p class="lead">Servers</p>
                </a>
            </div>
            <div class="col-sm-4 text-center">
                <a href="/query" class="btn btn-default btn-block">
                    <br/>
                    <i class="fa fa-terminal fa-5x"></i>
                    <p class="lead">Queries</p>
                </a>
            </div>
            <div class="col-sm-4 text-center">
                <a href="/report" class="btn btn-default btn-block">
                    <br/>
                    <i class="fa fa-file-text fa-5x"></i>
                    <p class="lead">Reports</p>
                </a>
            </div>
        </div>
        <!-- content -->

        <#include "stubs/footer.ftl">

	</body>
</html>
