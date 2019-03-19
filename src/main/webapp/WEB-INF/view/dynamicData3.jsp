<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<spring:url value="/resources/dist/vis.js"
	var="visjs" scope="session"></spring:url>
<spring:url value="/resources/dist/vis-network.min.css"
	var="visnetworkmincss" scope="session"></spring:url>
		
	
	
   <style type="text/css">
    body, select {
      font: 10pt sans;
    }
    #network {
      position:relative;
      width: 800px;
      height: 600px;
      border: 1px solid lightgray;
    }
    table.legend_table {
      font-size: 11px;
      border-width:1px;
      border-color:#d3d3d3;
      border-style:solid;
    }
    table.legend_table,td {
      border-width:1px;
      border-color:#d3d3d3;
      border-style:solid;
      padding: 2px;
    }
    div.table_content {
      width:80px;
      text-align:center;
    }
    div.table_description {
      width:100px;
    }

    #operation {
      font-size:28px;
    }
    #node-popUp {
      display:none;
      position:absolute;
      top:350px;
      left:170px;
      z-index:299;
      width:250px;
      height:120px;
      background-color: #f9f9f9;
      border-style:solid;
      border-width:3px;
      border-color: #5394ed;
      padding:10px;
      text-align: center;
    }
    #edge-popUp {
      display:none;
      position:absolute;
      top:350px;
      left:170px;
      z-index:299;
      width:250px;
      height:90px;
      background-color: #f9f9f9;
      border-style:solid;
      border-width:3px;
      border-color: #5394ed;
      padding:10px;
      text-align: center;
    }
  </style>

    <script type="text/javascript" src="${visjs }"></script>
    <link href="${visnetworkmincss }" rel="stylesheet" type="text/css"/>

    <script type="text/javascript">
    
    var v1 = ${sommets};
    var sommets = v1;//JSON.parse(v1);
    v1 = ${arrets};
    var arrets = v1;//JSON.parse(v1);
    console.log(v1);
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
            document.getElementById('node-popUp').style.display = 'block';
          }

          // Callback passed as parameter is ignored
          function clearNodePopUp() {
            document.getElementById('node-saveButton').onclick = null;
            document.getElementById('node-cancelButton').onclick = null;
            document.getElementById('node-popUp').style.display = 'none';
          }

          function cancelNodeEdit(callback) {
            clearNodePopUp();
            callback(null);
          }

          function saveNodeData(data, callback) {
            data.label = document.getElementById('node-label').value;
            clearNodePopUp();
            callback(data);
          }

          function editEdgeWithoutDrag(data, callback) {
            // filling in the popup DOM elements
            
            console.log(data);
            data.arrows={ "to":{"enabled":true,"scaleFactor":1,"type":'arrow'}};
            console.log(data.arrows['to'].enabled);
            document.getElementById('edge-label').value = data.label;
            document.getElementById('edge-orient').value =data.arrows;
            document.getElementById('edge-saveButton').onclick = saveEdgeData.bind(this, data, callback);
            document.getElementById('edge-cancelButton').onclick = cancelEdgeEdit.bind(this,callback);
            document.getElementById('edge-popUp').style.display = 'block';
          }

          function clearEdgePopUp() {
            document.getElementById('edge-saveButton').onclick = null;
            document.getElementById('edge-cancelButton').onclick = null;
            document.getElementById('edge-popUp').style.display = 'none';
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
            data.arrows['to'].enabled =  e.options[e.selectedIndex].value;
              console.log(data.arrows['to'].enabled)
            data.label = document.getElementById('edge-label').value;
            clearEdgePopUp();
            callback(data);
          }


       
       

       
          var seed = 2;
       

        function draw() {
            // create an array with nodes
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
            		physics:true,
            	    configure:function (option, path) {
            	      if (path.indexOf('smooth') !== -1 || option === 'smooth') {
            	        return true;
            	      }
            	      return false;
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

<body onload="init();">

<p>
    This example demonstrates dynamically adding, updating and removing nodes
    and edges using a DataSet.
</p>

<h1>Adjust</h1>


<h1>View</h1>
<div id="node-popUp">
  <span id="node-operation">node</span> <br>
  <table style="margin:auto;">
    <tr>
      <td>id</td><td><input id="node-id" value="new value" /></td>
    </tr>
    <tr>
      <td>Nom</td><td><input id="node-label" value="new value" /></td>
    </tr>
  </table>
  <input type="button" value="save" id="node-saveButton" />
  <input type="button" value="cancel" id="node-cancelButton" />
</div>

<div id="edge-popUp">
  <span id="edge-operation">edge</span> <br>
  <table style="margin:auto;">
    <tr>
      <td>Valeur</td><td><input id="edge-label" value="new value" /></td>
     
    </tr>
    <tr> <td>Orienté</td><td><select id="edge-orient">
      <option value="true" selected="selected">Oui</option>
      <option value="false">Non</option>
      </select> </td>
      </tr>
    </table>
  <input type="button" value="save" id="edge-saveButton" />
  <input type="button" value="cancel" id="edge-cancelButton" />
</div>

<br />
 <div id="network"></div>



</body>
</html>