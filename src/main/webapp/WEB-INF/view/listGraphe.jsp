<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
    <%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="action" value="ajouterAgence" scope="request"></c:set>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Administrateur</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->

<spring:url value="/resources/dialog/run_prettify.min.js"
	var="run_prettifyminjs" scope="session"></spring:url>
<spring:url value="/resources/dialog/bootstrap-dialog.min.css"
	var="bootstrapdialogmincss" scope="session"></spring:url>
<spring:url value="/resources/dialog/bootstrap-dialog.min.js"
	var="bootstrapdialogminjs" scope="session"></spring:url>



<spring:url value="/resources/plugins/datatables/jquery.dataTables.min.js"
	var="jquerydataTablesminjs" scope="session"></spring:url>
<spring:url value="/resources/plugins/datatables/dataTables.bootstrap.min.js"
	var="dataTablesbootstrapminjs" scope="session"></spring:url>
<spring:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"
	var="jqueryslimscrollminjs" scope="session"></spring:url>
	
<spring:url value="/resources/plugins/datatables/dataTables.bootstrap.css"
	var="dataTablesbootstrapcss" scope="session"></spring:url>
		

  
<spring:url value="/resources/bootstrap/css/bootstrap.min.css"
	var="bootstrapmincss" scope="session"></spring:url>
<spring:url value="/resources/dist/css/skins/_all-skins.min.css"
	var="_allskinsmin" scope="session"></spring:url>
<spring:url value="/resources/dist/css/AdminLTE.min.css"
	var="AdminLTEmincss" scope="session"></spring:url>

<spring:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"
	var="jquery223minjs" scope="session"></spring:url>
<spring:url value="/resources/bootstrap/js/bootstrap.min.js"
	var="bootstrapminjs" scope="session"></spring:url>

<spring:url value="/resources/dist/js/demo.js" var="demojs"
	scope="session"></spring:url>
<spring:url value="/resources/dist/js/app.min.js" var="appminjs"
	scope="session"></spring:url>
<spring:url value="/resources/plugins/fastclick/fastclick.js"
	var="fastclickjs" scope="session"></spring:url>

<link rel="stylesheet" href="${bootstrapmincss}">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="${dataTablesbootstrapcss}">
<!-- Theme style -->
<link rel="stylesheet" href="${AdminLTEmincss }">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${_allskinsmin}">
<link href="${bootstrapdialogmincss}" rel="stylesheet" type="text/css" />



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

		<!-- header -->
		<jsp:include page="Header.jsp"></jsp:include>
		<!-- fin header -->

		<!-- sidebar Menu-->
		<jsp:include page="sideBarMenu.jsp"></jsp:include>
		<!-- sidebar Menu fin -->

		<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       Consultation
        <small>.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Accuiel</a></li>
        <li><a href="#">Consultation</a></li>
        <li class="active">Graphes</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- content page -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">La Liste Des Graphes</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
             <div class="box">
            <div class="box-header">
              <h3 class="box-title"></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <div class="row">
                 <div class="col-md-2">
                  <button onclick="AjouterGraphe()" id="AjG" type="button" class="btn btn-block btn-success btn-lg">Ajouter Graphe</button>
                 </div>
            </div>
            <br>
            <div class="row">
                 <div class="col-md-12">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                 <th></th>
                  <th>ID</th>
                  <th>Nom</th>
                             
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${graphes}" var="v">
                <tr id="${v.getId()}" >
                 <td><jsp:include page="settingTable.jsp">
                  <jsp:param value="agence" name="tableDe"/>
                  <jsp:param value="${v.getId()}" name="idG"/>                  
                  </jsp:include></td>
                  <td><c:out value="${v.getId()}"/></td>
                  <td><c:out value="${v.getNom()}"/></td>
                                 
                </tr>
                </c:forEach>
                
                
                </tbody>
              
              </table>
              </div>
            </div>
            </div>
            <!-- /.box-body -->
          </div>
          </div>
        </div>
       
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="node-operation">Ajouter Graphe</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Nom</label>
                  <input type="text" class="form-control" id="nom-label" placeholder="Nom">
                </div>
              </div>
              <!-- /.box-body -->
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="node-cancelButton"  data-dismiss="modal">Cancel</button>
        <button onclick="AjouterGraphe2()" type="button" class="btn btn-primary" id="node-saveButton" >Save</button>
      </div>
    </div>
  </div>
</div>
  
  
		<!-- /.content-wrapper -->
		<jsp:include page="footer.jsp"></jsp:include>

		<!-- Control Sidebar -->
		<jsp:include page="sideBarMenu.jsp"></jsp:include>
		<!-- /.control-sidebar -->

		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
	</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->

	<script src="${jquery223minjs }"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${bootstrapminjs }"></script>
	
	<script src="${bootstrapdialogminjs}"></script>
	
	<!-- DataTables -->
	<script src="${jquerydataTablesminjs }"></script>
	<script src="${dataTablesbootstrapminjs }"></script>
	<!-- SlimScroll -->
	<script src="${jqueryslimscrollminjs }"></script>
	<!-- FastClick -->
	<script src="${fastclickjs }"></script>
	
	<!-- AdminLTE App -->
	<script src="${appminjs }"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${demojs}"></script>
	
<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>

<script type="text/javascript">
function AjouterGraphe(){
	$('#nom-label').val('');
	$('#exampleModal').modal('show');
}
function AjouterGraphe2(){
	var v=$('#nom-label').val();
	if(v!=''){
		$.post( "${pageContext.request.contextPath}/addGraphe", { nom : v} )
        .done(function( data ) {
        	if(data!=null){
        		//data=JSON.parse(data);
        		console.log(data);
        		jQuery("#example1 tbody").append('<tr id="'+data.id+'" ><td>'
        				+'<div class="box-tools pull-right">'
        				+'<div class="input-group-btn">'
        				+'<a  class="btn btn-default dropdown-toggle"'
        				+'data-toggle="dropdown">'
        				+'<i class="fa fa-cog"></i>'
        				+'</a>'
        				+'<ul class="dropdown-menu">'
        				+'<li><a href="index2?idG='+data.id+'"><i class="fa fa-list"></i>Bellman (PCC et PLC)</a></li>'
        				+'<li><a href="index?idG='+data.id+'"><i class="fa fa-list"></i>Dijkstra (PCC et PLC)</a></li>'
        				+'<li><a href="setGraphe?idG='+data.id+'"><i class="fa fa-pencil-square-o"></i>Modifier</a></li>'
        				+'<li><a onclick="supagence('+data.id+')" href="#"><i class="fa fa-trash"></i>Supprimer</a></li>'	
        				+'</ul>'
        				+'</div>'
        				+'</div>'
        				+'</td> <td>'+data.id+'</td><td>'+data.nom+'</td></tr>');
        	}
        });
	}
}

function msgerreur(val){
	
	 BootstrapDialog.show({
         title: 'Erreur',
         message: val ,
         type :'type-warning' 
     });
}

function msgreussi(val){
	  BootstrapDialog.show({
          title: 'Succès',
          message: val ,
          type :'type-success' 
      });
      
	
}
function infoage(val){

       $.post("/client/servicesAdmin/sia",{code:val},	function(data) {
			var d="{ 'name': 'John' }";
			
			var obj = jQuery.parseJSON( data );
			
			var $textAndPic = $('<div class="box box-primary"><div class="box-body box-profile">');
	        $textAndPic.append('<ul class="list-group list-group-unbordered"> ');
	        $textAndPic.append('<li class="list-group-item"><b>Code</b> <a class="pull-right">'+obj["code"]+'</a> </li> <li class="list-group-item">  <b>Adresse</b> <a class="pull-right">'+obj["adresse"]+'</a> </li>');
	        $textAndPic.append('<li class="list-group-item"><b>Nombre d\'employe</b> <a class="pull-right">'+obj["nbEmploye"]+'</a> </li> <li class="list-group-item">  <b>Nombre d\'administrateur</b> <a class="pull-right">'+obj["nbAdmin"]+'</a> </li>');
	       
	        $textAndPic.append('</ul></div></div>');
	        $textAndPic.append('');
	        
	        BootstrapDialog.show({
	            title: 'Info Agence',
	            message: $textAndPic
	            
	        });
		 });
		


	}
	
	function supagence(val) {
		BootstrapDialog
				.show({
					title : 'Suppression',
					type : 'type-danger',
					message : 'Voulez-vous supprimer ? \n Attention : vous allez supprimer les employés et les comptes de cette agence.',

					buttons : [
							{
								label : 'Supprimer',
								hotkey : 65, // Keycode of keyup event of key 'A' is 65.
								action : function(dialogItself) {
								
	$
											.post(
													"/client/servicesAdmin/ssa",
													{
														code : val
													},
													function(data) {

														if (data == 'true') {
															msgreussi('L\'agence a ete supprimee');
															dialogItself.close();

															$('#' + val).hide();
														} else {
															msgerreur('Il y a un problème \n L\'agence n\'est pas supprimee');
															dialogItself
																	.close();
														}

													});
								}
							}, {
								label : 'Annuler',
								hotkey : 66,
								action : function(dialogItself) {
									dialogItself.close();
								}
							} ]
				});
	}
</script>
</body>
</html>
