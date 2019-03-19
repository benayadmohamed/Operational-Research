<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Administrateur</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->

<spring:url value="/resources/plugins/validator/dist/jquery.validate.js"
	var="jqueryvalidatejs"  scope="session"></spring:url>
	
<spring:url value="/resources/js/js.js"
	var="jsjs" scope="session"></spring:url>
	
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
	
<spring:url value="/resources/network/network-min.js"
	var="networkminjs" scope="session"></spring:url>
<spring:url value="/resources/network/jsapi"
	var="jsapi" scope="session"></spring:url>
	
<link rel="stylesheet" href="${bootstrapmincss}">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${AdminLTEmincss }">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${_allskinsmin}">
<link href="${bootstrapdialogmincss}" rel="stylesheet" type="text/css" />
	<script src="${jsapi }"></script>
	<script src="${networkminjs }"></script>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script type="text/javascript">
  
  var sommets2=${sommets2};
  var arrets2=${arrets2};
  var sommets3;
  var sommets4;
  var vidG=${idG};
  var nodesTable = null;
  var linksTable = null;
  var network2 = null;

  //var DIR = 'img/soft-scraps-icons/';

  google.load('visualization', '1');
  
  // Set callback to run when API is loaded
  google.setOnLoadCallback(drawVisualization); 
     
  
     
     function drawVisualization() {
       // Create a data table with nodes.
       nodesTable = new google.visualization.DataTable();
       nodesTable.addColumn('number', 'id');
       nodesTable.addColumn('string', 'text');   // optional
       nodesTable.addColumn('string', 'image');  // optional
       nodesTable.addColumn('string', 'style');   // optional
       
       // Create a data table with links.
       linksTable = new google.visualization.DataTable();
       linksTable.addColumn('number', 'from');
       linksTable.addColumn('number', 'to');
      linksTable.addColumn('number', 'text');  // optional
       linksTable.addColumn('string', 'color');  // optional
       linksTable.addColumn('number', 'length');  // optional
       linksTable.addColumn('string', 'style'); // optional
       
       var width = 3.0;
       var color = '#BFBFBF';
       var len = 150; // pixels
       
       // create people
       for(i in sommets2 ){
       	//console.log(sommets2[i]);
       	nodesTable.addRow([sommets2[i].id,sommets2[i].nom,sommets2[i].image, 'image']);
       }
       
for(i in arrets2 ){
	if(arrets2[i].oriente==true)
	linksTable.addRow([arrets2[i].depart.id, arrets2[i].arrive.id,arrets2[i].longueur, color, len,'arrow-end']);
	else
		linksTable.addRow([arrets2[i].depart.id, arrets2[i].arrive.id,arrets2[i].longueur, color, len,'line']);
		
}
  
       // specify options
       var options2 = {
        // 'width':  '600px', 
         'height': '1000px',
         'packages': {
           'style': 'image',
           'image':'/ProjectRo/resources/img/Email-icon32.png'
         }
       };

       // Instantiate our graph object.
       network2 = new links.Network(document.getElementById('mynetwork'));

       // Draw our graph with the created data and options 
       network2.draw(nodesTable, linksTable, options2);
       
       // start generating random emails
      //timeout();
       
     }
    
     function timeout() {
   	  //if(arrive.prédécesseurPcc==null){
   		    
         if(arrive < 2){
       	  console.log(arrive);
   		 sendRandomMail(arrive-1,arrive); 
   	  }else{
        
         //var delay = Math.round(100 + Math.random() * 1000);
         console.log('f');
         sendRandomMail(arrive-1,arrive);
         setTimeout(timeout, 1000)
        // sendRandomMail(arrive,cherche(arrive));
         
   	  }
   	  }
       

       function sendRandomMail(Sto,Sfrom){
         try {
          
          // var from = Sfrom.id;
           //var to = Sto.id;
         
           var from = sommets4[Sfrom].id;
           var to = sommets4[Sto].id;
           var packagesTable = new google.visualization.DataTable();
           packagesTable.addColumn('number', 'from');
           packagesTable.addColumn('number', 'to');        
           packagesTable.addRow([from, to]);
           network2.addPackages(packagesTable);
          // arrive=cherche(arrive);
           arrive=Sto;
         }
         catch(err) {
          // alert(err);
         }
       }  
       
     function CalculePcc(){
   	
   	  
   	  
   
         var vdepart=$('#selectDepart').find(":selected").val();
        // $('#selectDepart').prop('disabled', 'disabled');
         
         $.post("/ProjectRo/CalculePcc", { idG:vidG,idS:vdepart } )
         .done(function( data ) {
         	//console.log(  data );
         //	data=JSON.parse(data);
         	//data=data.sommets;
         
     
      	//for (i in data) {
      		
      	
     		sommets3=data;
     		console.log(data);
     	     sommets4=[];
     	    var varrive=$('#selectArrive').find(":selected").val();
     		var test=chercheidex(varrive);
     		while(test.prédécesseurPcc!=null){
     			sommets4.push(test);
     			test=cherche(test);
     		}
     		sommets4.push(test);
     		
     		//console.log(sommets4);
     	    arrive=sommets4.length-1;//chercheidex(7);

     		console.log(arrive);
     		timeout() ;
     		//check(arrive);
     		//var delay = Math.round(10000 + Math.random() * 1000);
         //  setTimeout(null, delay)
   	//}
          
         });
   	
   }
     function CalculePlc(){
    
          var vdepart=$('#selectDepart').find(":selected").val();
         // $('#selectDepart').prop('disabled', 'disabled');
          
          $.post("/ProjectRo/CalculePlc", { idG:vidG,idS:vdepart } )
          .done(function( data ) {
          	//console.log(  data );
          	//data=JSON.parse(data);
          	//data=data.sommets;
          
          
       	//for (i in data) {
       		
       	
      		sommets3=data;
      	     sommets4=[];
      	    var varrive=$('#selectArrive').find(":selected").val();
      		var test=chercheidex(varrive);
      		while(test.prédécesseurPcc!=null){
      			sommets4.push(test);
      			test=cherche(test);
      		}
      		sommets4.push(test);
      		
      		//console.log(sommets4);
      	    arrive=sommets4.length-1;//chercheidex(7);

      		console.log(arrive);
      		timeout() ;
      		//check(arrive);
      		//var delay = Math.round(10000 + Math.random() * 1000);
          //  setTimeout(null, delay)
    	//}
           
          });
    	
    }
     function check(Sommet){
   	  
   	  if(Sommet.prédécesseurPcc==null){
   	        // run when condition is met
   		  sendRandomMail(Sommet,cherche(Sommet));
   		//  check(sommets3[5]);
   	    }
   	    else {
   	    	var v=cherche(Sommet);
   	        //setTimeout(check(v), 10000); // check again in a second
   	       setTimeout(check(v),3000);;
   	       setTimeout(sendRandomMail(Sommet,cherche(Sommet)),3000);;
   	    }
   	     
   	}
     
     var cherche=function(Sommet){
   	  for (i in sommets3) {
   		  if(Sommet.prédécesseurPcc==sommets3[i].id)
   			  return sommets3[i];
   	  }
        		return null;
     }

     var chercheidex=function(id){
   	  for (i in sommets3) {
   		  if(id==sommets3[i].id)
   			  return sommets3[i];
   	  }
        		return null;
     }
     function modifier(v){
   	  
     }
  
  </script>
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
				Algorithme de Dijkstra <small>.</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i>Algorithme de Dijkstra</a></li>

			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<!-- content page -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="row">
				<!-- content page -->
				<div class="col-md-12">
					<c:choose>
						<c:when test="${msg!=null && statut==false}">
							<div class="col-md-12">
								<div class="box box-danger box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">
											<c:out value="${pro['erreur']}"></c:out>
										</h3>

										<div class="box-tools pull-right">
											<button type="button" class="btn btn-box-tool"
												data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div>
										<!-- /.box-tools -->
									</div>
									<!-- /.box-header -->
									<div class="box-body">${msgs[msg]}</div>
									<!-- /.box-body -->
								</div>
								<!-- /.box -->
							</div>
							<c:remove var="msg" />
						</c:when>
						<c:when test="${msg!=null && statut==true}">
							<div class="col-md-12">
								<div class="box box-success box-solid">
									<div class="box-header with-border">
										<h3 class="box-title">
											<c:out value="${pro['succes']}"></c:out>
										</h3>

										<div class="box-tools pull-right">
											<button type="button" class="btn btn-box-tool"
												data-widget="remove">
												<i class="fa fa-times"></i>
											</button>
										</div>
										<!-- /.box-tools -->
									</div>
									<!-- /.box-header -->
									<div class="box-body">${msgs[msg]}</div>
									<!-- /.box-body -->
								</div>
								<!-- /.box -->
							</div>
							<c:remove var="msg" />
						</c:when>
					</c:choose>
					</div></div>
					<div class="row">
						<!-- content page -->
						<div class="col-md-12">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">Exemple : Algorithme de Dijkstra </h3>
								</div>

<br>
<div class="row">
<div class="col-md-1">
</div>
<div class="col-md-10">
 
          <div class="form-group">
                <label>Routeur de depart</label>
                <select  id="selectDepart" class="form-control select2">
                <c:forEach var="v" items="${lisetSommet}">
											 
                  <option value="${v.getId()}" >${v.getNom()}</option>
                  
                </c:forEach>
                </select>
           </div>
            <div class="form-group">
                <label>Routeur d'arrivé</label>
                <select id="selectArrive" class="form-control select2">
                   <c:forEach var="v" items="${lisetSommet}">
											 
                  <option value="${v.getId()}" >${v.getNom()}</option>
                  
                </c:forEach>
                </select>
           </div>
              
			<a onclick="CalculePcc()" id="CalculePCC" class="btn btn-app">
                <i  class="fa fa-play"></i> Calcule PCC
              </a>
              <a onclick="CalculePlc()" class="btn btn-app">
                <i class="fa fa-play"></i> Calcule PLC
              </a>
              
     </div>
 <div class="col-md-1">
</div>
</div>

 <div  class="row">					<!-- content page -->
			
                       <div    id="mynetwork"  class="col-md-12"></div>
 </div>
 </div>
							</div>
						</div>
					</div>
					<!-- Button trigger modal -->


<!-- Modal -->



				</div>

			</div>
			<!-- /.row --> 
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<jsp:include page="footer.jsp"></jsp:include>
		
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->


	<script src="${jquery223minjs }"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${bootstrapminjs }"></script>
	<script src="${bootstrapdialogminjs}"></script>
	
	<!-- FastClick -->
	<script src="${fastclickjs }"></script>
	<!-- AdminLTE App -->
	<script src="${appminjs }"></script>
	<script src="${jsjs }"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${demojs }"></script>
	
	
</body>
</html>
