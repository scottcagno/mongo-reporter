<!DOCTYPE html>
<html lang="en">
    <head id="head">
        <title>Servers</title>

        <#include "../stubs/header.ftl">

    </head>
    <body id="body">

    <#include "../stubs/navbar.ftl">

        <!-- content -->
        <div id="content" class="container">
            <!-- add/edit -->
            <div class="col-sm-4">
                <div class="panel panel-default">
                    <div class="panel-heading">Add or Update Server <span class="pull-right"><a href="/server">Add New</a></span></div>
                    <div class="panel-body">
                        <form role="form" method="post" action="/server">
                            <div class="form-group">
                                <input type="text" id="host" name="host" value="${(server.host)!}" class="form-control" placeholder="Host" required="true" autofocus="true"/>
                            </div>
                            <div class="form-group">
                                <input type="text" id="database" name="database" value="${(server.database)!}" class="form-control" placeholder="Database" required="true"/>
                            </div>
                            <div class="form-group">
                                <input type="text" id="username" name="username" value="${(server.username)!}" class="form-control" placeholder="Username" required="true"/>
                            </div>
                            <div class="form-group">
                                <input type="text" id="password" name="password" value="${(server.password)!}" class="form-control" placeholder="Password" required="true"/>
                            </div>
                            <input type="hidden" name="id" value="${(server.id)!}"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button class="btn btn-md btn-primary btn-block" type="submit">Save</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- add/edit -->
            <!-- view all -->
            <div class="col-sm-8">
                <div class="panel panel-default">
                    <div class="panel-heading">Current Servers</div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Host</th>
                                    <th>Database</th>
                                    <th>Connection</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#list servers as server>
                                <tr>
                                    <td>${(server.id)!}</td>
                                    <td>${(server.host)!}</td>
                                    <td>${(server.database)!}</td>
                                    <td>
                                        <a href="/server/${(server.id)!}/connection" class="btn btn-xs btn-success">Verify Conn.</a></td>
                                    <td>
                                        <a href="/server/${(server.id)!}" class="btn btn-xs btn-primary">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a href="#" class="btn btn-danger btn-xs" data-id="${(server.id)!}" data-toggle="modal" data-target="#deleteCheck">
                                            <i class="fa fa-trash-o"></i>
                                        </a>
                                    </td>
                                </tr>
                                </#list>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- view all -->
        </div>

        <div class="modal fade" id="deleteCheck" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Are you sure?</h4>
                    </div>
                    <div class="modal-body">
                        Permantly remove server? This action cannot be undone.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-md pull-left" data-dismiss="modal">No, Cancel</button>
                                <span id="delete">
                                    <form role="form" method="post" action="/server/{id}">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-primary btn-md">Yes, Remove Server</button>
                                    </form>
                                </span>

                    </div>
                </div>
            </div>
        </div>

        <!-- content -->

        <#include "../stubs/footer.ftl">

        <#include "../stubs/scripts.ftl">

        <script>
            $(document).ready(function() {

                // toggle safe delete modal popup
                $('a[data-toggle="modal"]').click(function(){
                    var id = $(this).data('id');
                    var form = $('.modal #delete');
                    form.html(form.html().replace('{id}',id));
                });
            });
        </script>

    </body>
</html>