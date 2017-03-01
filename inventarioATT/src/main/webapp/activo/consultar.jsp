<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">

	<tiles:putAttribute name="body">
		
		  <title>Consulta de activos</title>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               <img alt="att" src="${pageContext.request.contextPath}/img/logo-att.png" width="65px"  style="padding-top: 10px;">
                     
                
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                 <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Jorge Martinez <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Perfil</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/logout.php"><i class="fa fa-fw fa-power-off"></i> Salir</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="javascript:;" data-toggle="collapse" data-target="#producto"><i class="fa fa-fw fa-book"></i> Activos <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="producto" class="collapse">
                            <li>
                                <a href="${pageContext.request.contextPath}/activo/alta.htm" ><i class="fa fa-fw fa-upload"></i> Alta </a>
                            </li>
                            <li >
                                <a href="${pageContext.request.contextPath}/activo/consultar.htm"><i class="fa fa-fw fa-search"></i> Consultar</a>
                            </li>

                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                    
                        <h1 class="page-header">
                            Consulta de Activos
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i> Activo
                            </li>
                            <li class="active">
                                <i class="fa fa-search"></i> Consulta
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-6">
                           <div class="form-group">
                                <label>Fecha Inicio</label>
                                <div class="input-group date" >
								    <input type="text" class="form-control" id="fhInicio" name="fhInicio">
								    <div class="input-group-addon">
								        <span class="glyphicon glyphicon-th"></span>
								    </div>
								</div>
                            </div>
                     </div>
                    <div class="col-lg-6">         
                            <div class="form-group">
                                <label>Fecha fin</label>
                            	<div class="input-group date">
								    <input type="text" class="form-control" id="fhfin" name="fhfin">
								    <div class="input-group-addon">
								        <span class="glyphicon glyphicon-th"></span>
								    </div>
								</div>
                            </div>

                    </div>
	          		 <div class="col-lg-12">
	                          <div class="form-group pull-right">	
	                           		<button type="button" class="btn btn-success" 
	                           		style="cursor: pointer;" id="idBuscar" name="idBuscar">
	                           		<i class="fa fa-search" aria-hidden="true"></i>	                           		 
	                           		Buscar</button>
	                          </div>	
	    
	                 </div>   
                 </div>  
                 <div class="row">    
                  <div class="col-lg-12">
	                           <div class="form-group">
                        			<div class="panel panel-info">
                            			<div class="panel-heading">
			                                <h3 class="panel-title">Lista de Activos</h3>
			                            </div>
			                            <div class="panel-body table-responsive" >
			                           			<table id="example"  class="display" cellspacing="0" width="100%">
					        						<thead>
														<tr>
															<th>#</th>
															<th>ORDEN</th>
															<th>MARCA</th>
															<th>MODELO</th>
															<th>ESTATUS</th>
															<th>FH CARGA</th>
															<th>PROVEEDOR</th>
															<th>SERIAL ATT</th>						
														</tr>
														
														</thead>
					    							</table>
			                            </div>
                        			</div>
	                             </div>
                            </div>  
            
                  </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

   <div id="clock-loader" style="display: none;">				
		<div style="font-weight: bold; color: white; font-size: 12pt;">
			<img src="${pageContext.request.contextPath}/img/ajax-loader.gif" alt="" border="0" /><br>Procesando...
		</div>	
	</div>	
    
    <!-- Modal -->
<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body…</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


   
    <!-- Modal -->
<div class="modal fade" id="myModalFrame">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #428BCA; color:#FFF;  border-top-left-radius: 5px; border-top-right-radius: 5px; ">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Vista del Producto</h4>
      </div>
      <div class="modal-body">
        <iframe src="" frameborder="0" id="targetiframe" style=" height:500px; width:100%;" name="targetframe" allowtransparency="true"></iframe> <!-- target iframe -->
      </div>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

      


	</tiles:putAttribute>


</tiles:insertDefinition>
