<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:insertDefinition name="defaultTemplate">

	<tiles:putAttribute name="body">
		
		  <title>Alta de activos</title>

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
                            <li>
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
                            Alta de Activos
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i> Activo
                            </li>
                            <li class="active">
                                <i class="fa fa-upload"></i> Alta
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                 <form enctype="multipart/form-data" id="formuploadajax" method="post">
                    <div class="col-lg-6">
                           <div class="form-group">
                   
                        
								    <input type="file" id="idFile" name="idFile">

								
                            </div>
                     </div>
                     <div class="col-md-4">
                     		<div class="form-group">
                     			
								    	<button type="submit" class="btn btn-success" 
	                           		style="cursor: pointer;" id="idSubir" name="idSubir">
	                           		
	                           		<i class="fa fa-upload" aria-hidden="true"></i>	                           		 
	                           		Subir</button>
                     		
                     		
                     		</div>
                     
                   
                     </div>
                      </form> 
                       <div id="mensaje"></div>
 
                 </div>  


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




      


	</tiles:putAttribute>


</tiles:insertDefinition>


<script>
			$(document).ready(function() {
				
				toastr.options = {
						"debug" : false,
						"positionClass" : "toast-top-full-width",
						"onclick" : null,
						"fadeIn" : 300,
						"fadeOut" : 1000,
						"timeOut" : 5000,
						"extendedTimeOut" : 1000,
					};

				
				$(":file").filestyle({buttonText: "Selecciona archivo"});
				
				
				
				  $("#formuploadajax").on("submit",  function(e){
		            e.preventDefault();

		            var formData = new FormData();
		            formData.append('idFile', $('input[type=file]')[0].files[0]);
	
		           $.ajax({
		                url: "${pageContext.request.contextPath}/activo/upload.htm",
		                type: "post",
		                dataType: "html",
		                data: formData,
		                cache: false,
		                contentType: false,
			     		processData: false, 
			     	    beforeSend: function() {
			     	        // setting a timeout
			     	        showloading();
			     	    },
			     	    success: function(res) {
			     	    	 $("#mensaje").html("Respuesta: " + res);
			     	    	toastr.success(res);
			     	    },
					      error: function(jqXHR, textStatus, errorThrown) {
					    	  toastr.error('ERROR: ' + textStatus);
					      },
			     	    complete: function() {
			     	       hideloading();
			     	    },
		            });
		        });
		    });
		  
			
</script>
