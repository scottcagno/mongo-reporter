<div id="navbar" class="navbar navbar-default navbar-static-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><i class="fa fa-home"></i> Home</a>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <#--links can go here-->
            </ul>
        </div>
    </div>
</div>

<#if RequestParameters.alert??>
    <div id="alert" class="col-sm-10 col-sm-offset-1">
        <div class="alert alert-info alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${RequestParameters.alert}
        </div>
    </div>
<#elseif RequestParameters.alertError??>
    <div id="alert" class="col-sm-10 col-sm-offset-1">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${RequestParameters.alertError}
        </div>
    </div>
<#elseif RequestParameters.alertSuccess??>
    <div id="alert" class="col-sm-10 col-sm-offset-1">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${RequestParameters.alertSuccess}
        </div>
    </div>
</#if>