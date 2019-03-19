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
	
<spring:url value="/resources/dist/vis.js"
	var="visjs" scope="session"></spring:url>
<spring:url value="/resources/dist/vis-network.min2.css"
	var="visnetworkmincss" scope="session"></spring:url>
	

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
   <style type="text/css">
  
    #network {
     
      height: 1000px;
      
    }
    
  </style>
  	 <script type="text/javascript" src="${visjs }"></script>
    <link href="${visnetworkmincss }" rel="stylesheet" type="text/css"/>
	
  <script type="text/javascript">
  var arrets=${arrets};
  var sommets=${sommets};
  var sommets2=${sommets2};
  var arrets2=${arrets2};
  var sommets3;
  var sommets4;
  var vidG=${idG};
  var lisetSommet=${lisetSommet};
  var nodesTable = null;
  var linksTable = null;
  var network2 = null;

  
  var nodes, edges, network;

  // convenience method to stringify a JSON object
  function toJSON(obj) {
      return JSON.stringify(obj, null, 4);
  }
  function setDefaultLocale() {
      var defaultLocal = navigator.language;
    /*  var select = document.getElementById('locale');
      
      select.selectedIndex = 0; // set fallback value
      for (var i = 0, j = select.options.length; i < j; ++i) {
        if (select.options[i].getAttribute('value') === defaultLocal) {
          select.selectedIndex = i;
          break;
        }
      }*/
    }

    function destroy() {
      if (network !== null) {
        network.destroy();
        network = null;
      }
    }
    
  function editNode(data, cancelAction, callback) {
      document.getElementById('node-label').value = data.label;
      document.getElementById('node-saveButton').onclick = saveNodeData.bind(this, data, callback);
      document.getElementById('node-cancelButton').onclick = cancelAction.bind(this, callback);
      $('#exampleModal').modal('show');
    }

    // Callback passed as parameter is ignored
    function clearNodePopUp() {
    	$('#exampleModal').modal('hide');
    }

    function cancelNodeEdit(callback) {
      clearNodePopUp();
      callback(null);
    }

    function saveNodeData(data, callback) {
    	
    
    
   
     // clearNodePopUp();
     // callback(data);
      if($('#node-operation').html()=='Add Node'){
     	 //data=JSON.stringify(data);
     	 
     	 var e = document.getElementById("note-image");
     	 
     	
     	 $.post("/ProjectRo/addNode", {nom:$('#node-label').val(),image:e.options[e.selectedIndex].value,idG:vidG})
          .done(function( data ) {
        	  if(data!=null){
        			console.log(data);
        	  clearNodePopUp();
      		  // create an array with nodes
      		  data.id=JSON.stringify(data.id) ;
                 //data.label=JSON.stringify(data.label) ;
               data.shape='image';
               
               callback(data);
        	  }
          });
    	  
    	   
      }else{
    	  var e = document.getElementById("note-image");
    	  var d;
    	 // console.log(data.color);
    	 // d={id:data.id,label:'',image:''};
    	  data.label=$('#node-label').val();
    	  data.image=e.options[e.selectedIndex].value;
    	  
    	 
    	  //data=d;
     	  data=JSON.stringify(data);
     	 
      	   $.ajax({
            	  method: "POST",
            	  contentType : "application/json; charset=utf-8",
            	  url: "/ProjectRo/updateNode",
            	  data: data,
            	  dataType: 'json',
            	  success: function (data) {
            		  
            		  clearNodePopUp();
            		  // create an array with nodes
            		  data.id=JSON.stringify(data.id) ;
                      // data.label=JSON.stringify(data.label) ;
                     //  data=JSON.parse(data) ;
                    		    // arrets.push(data) ;//JSON.parse(v1);
                    		    	
            	//	  draw();
                     callback(data);
            	  }
            	})  ;  
         	console.log(  JSON.stringify(data) );
       }
      
    }

    function editEdgeWithoutDrag(data, callback) {
      // filling in the popup DOM elements
      
      console.log(data);
      //data.arrows={ "to":{"enabled":true,"scaleFactor":1,"type":'arrow'}};
     if(data.arrows==null){
    	 data.arrows={to:true};
     }
     if( data.label==null){
    	 data.label=0;
     }
      document.getElementById('edge-label').value = data.label;
      document.getElementById('edge-orient').value =data.arrows.to;
      document.getElementById('edge-saveButton').onclick = saveEdgeData.bind(this, data, callback);
      document.getElementById('edge-cancelButton').onclick = cancelEdgeEdit.bind(this,callback);
      $('#exampleModal2').modal('show');
    }

    function clearEdgePopUp() {
    	$('#exampleModal2').modal('hide');
    }

    function cancelEdgeEdit(callback) {
      clearEdgePopUp();
      callback(null);
    }

    function saveEdgeData(data, callback) {
      if (typeof data.to === 'object')
        data.to = data.to.id
      if (typeof data.from === 'object')
        data.from = data.from.id
        
        var e = document.getElementById("edge-orient");
      data.arrows={to : e.options[e.selectedIndex].value};
      data.label = document.getElementById('edge-label').value;
    
     if($('#edge-operation').html()=='Add Edge'){
    	 data=JSON.stringify(data);
    	 
   	   $.ajax({
         	  method: "POST",
         	  contentType : "application/json; charset=utf-8",
         	  url: "/ProjectRo/addEdge",
         	  data: data,
         	  dataType: 'json',
         	  success: function (data) {
         		  
         		  clearEdgePopUp();
         		  // create an array with nodes
         		  data.id=JSON.stringify(data.id) ;
                    data.label=JSON.stringify(data.label) ;
                  //  data=JSON.parse(data) ;
                 		    // arrets.push(data) ;//JSON.parse(v1);
                 		    	
         	//	  draw();
                  callback(data);
         	  }
         	})  ;  
   	   
     }else{
    	
    	  data=JSON.stringify(data);
    	 
     	   $.ajax({
           	  method: "POST",
           	  contentType : "application/json; charset=utf-8",
           	  url: "/ProjectRo/updateEdge",
           	  data: data,
           	  dataType: 'json',
           	  success: function (data) {
           		  
           		  clearEdgePopUp();
           		  // create an array with nodes
           		  data.id=JSON.stringify(data.id) ;
                      data.label=JSON.stringify(data.label) ;
                    //  data=JSON.parse(data) ;
                   		    // arrets.push(data) ;//JSON.parse(v1);
                   		    	
           	//	  draw();
                    callback(data);
           	  }
           	})  ;  
        	console.log(  JSON.stringify(data) );
      }
    }


  
  var seed = 2;
  

  function draw() {
  	 console.log( arrets );
      nodes = new vis.DataSet();
    /*  nodes.on('*', function () {
          document.getElementById('nodes').innerHTML = JSON.stringify(nodes.get(), null, 4);
      });*/
      nodes.add(sommets);

      // create an array with edges
      edges = new vis.DataSet();
      /*edges.on('*', function () {
          document.getElementById('edges').innerHTML = JSON.stringify(edges.get(), null, 4);
      });*/
      edges.add(arrets);

      // create a network
      var container = document.getElementById('network');
      var data = {
          nodes: nodes,
          edges: edges
      };
      var options = {
      	/*nodes: {
      		image: '${pageContext.request.contextPath}<c:url value="${router}"></c:url>'
      		  },*/
            edges: {
				    smooth: false
				  },
				 layout: {randomSeed:seed}, // just to make sure the layout is the same when the locale is changed
		      //  locale: document.getElementById('locale').value,
		        manipulation: {
		          addNode: function (data, callback) {
		            // filling in the popup DOM elements
		            document.getElementById('node-operation').innerHTML = "Add Node";
		            editNode(data, clearNodePopUp, callback);
		         
		          },
		          editNode: function (data, callback) {
		            // filling in the popup DOM elements
		            document.getElementById('node-operation').innerHTML = "Edit Node";
		            editNode(data, cancelNodeEdit, callback);
		         
		          },
		          addEdge: function (data, callback) {
		            if (data.from == data.to) {
		              var r = confirm("Do you want to connect the node to itself?");
		              if (r != true) {
		                callback(null);
		                return;
		              }
		            }
		            document.getElementById('edge-operation').innerHTML = "Add Edge";
		            editEdgeWithoutDrag(data, callback);
		         
		          },
		          editEdge: {
		            editWithoutDrag: function(data, callback) {
		              document.getElementById('edge-operation').innerHTML = "Edit Edge";
		              editEdgeWithoutDrag(data,callback);
		           
		            }
		          },
		        deleteEdge: function (datas, callback) {
		        	 console.log(datas.edges[0]);
		        	 
		        	  $.post( "/ProjectRo/deleteEdge",   { id:datas.edges[0] } )
		              .done(function( data ) {
		              	console.log(  data );
		                if(data==true){
		                	callback(datas);
		                	
    		        	 
		                }
		              });
		             
		        },
		      deleteNode: function (datas, callback) {
		        	 console.log(datas.nodes[0]);
	        	 
	        	  $.post( "/ProjectRo/deleteNode",   { id:datas.nodes[0] } )
	              .done(function( data ) {
	              	console.log(  data );
	                if(data==true){
	                	callback(datas);
	                	
     		        	 
	                }
	              });
	             
	        }
		          
		        }
				
      
     /*
      nodes:{
      	image: '<c:url value="/resources/img/NetworkDriveicon.png"></c:url>'
      }*/
      };
      
      network = new vis.Network(container, data, options);

  }
  
  function init() {
      setDefaultLocale();
      draw();
    }




  
  </script>
</head>
<body onload="init();" class="hold-transition skin-blue sidebar-mini">
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
				Modifier Graphe <small>.</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Modifier Graphe</a></li>

			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="row">
				<!-- content page -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="row">
			
					<div class="row">
						<!-- content page -->
						<div class="col-md-12">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">Modifier Graphe :</h3>
								</div>

<br>
<div class="row">
<div class="col-md-1">
</div>
<div class="col-md-10">
 
        
              
			<a href="index2?idG=${idG}" id="CalculePCC" class="btn btn-app">
                <i   class="fa fa-play"></i> Bellman (PCC et PLC)
              </a>
              <a href="index?idG=${idG}"  class="btn btn-app">
                <i class="fa fa-play"></i> Dijkstra (PCC et PLC)
              </a>
             
     </div>
 <div class="col-md-1">
</div>
</div>
<div  class="row">					<!-- content page -->
			
						<div id="network"class="col-md-12">
 </div>
 </div>

 </div>
							</div>
						</div>
					</div>
					<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="node-operation">Node</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Nom</label>
                  <input type="text" class="form-control" id="node-label" placeholder="Nom">
                </div>
                 <div class="form-group">
                  <label>Type de machine</label>
                  <select id="note-image" class="form-control">
                   <option value="/ProjectRo/resources/img/iRouter.png" selected="selected">Router</option>
                   <option value="/ProjectRo/resources/img/iServer.png">Server</option>
                   <option value="/ProjectRo/resources/img/iPrinter.png">Printer</option>
                   <option value="/ProjectRo/resources/img/iLaptop.png">Laptop</option>
                   <option value="/ProjectRo/resources/img/iIPPhone.png">IP Phone</option>
                   <option value="/ProjectRo/resources/img/iWorkstation.png">Pc</option>
                   
                  </select>
                </div>
              </div>
              <!-- /.box-body -->
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="node-cancelButton"  data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary" id="node-saveButton" >Save</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="edge-operation">Arret</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">Longueur</label>
                  <input type="text" class="form-control" id="edge-label" placeholder="Longueur">
                </div>
                
                 <div class="form-group">
                  <label>Orienté</label>
                  <select id="edge-orient" class="form-control">
                   <option value="true" selected="selected">Oui</option>
                   <option value="false">Non</option>
                  </select>
                </div>
                
                
                
              </div>
              <!-- /.box-body -->
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="edge-cancelButton"  data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary" id="edge-saveButton" >Save</button>
      </div>
    </div>
  </div>
</div>

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
