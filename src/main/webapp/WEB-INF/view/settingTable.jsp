
<%
	switch (request.getParameter("tableDe")) {

	case "agence":
%>

<div class="box-tools pull-right">
	<div class="input-group-btn">
	
		<a  class="btn btn-default dropdown-toggle"
			data-toggle="dropdown">
			<i class="fa fa-cog"></i>
		</a>
		<ul class="dropdown-menu">
			<li><a href="index2?idG=<%=request.getParameter("idG")%>"><i class="fa fa-list"></i>Bellman (PCC et PLC)</a></li>
			<li><a href="index?idG=<%=request.getParameter("idG")%>"><i class="fa fa-list"></i>Dijkstra (PCC et PLC)</a></li>
			<li><a href="setGraphe?idG=<%=request.getParameter("idG")%>"><i class="fa fa-pencil-square-o"></i>Modifier</a></li>
			<li><a onclick="supagence(<%=request.getParameter("idG")%>)" href="#"><i class="fa fa-trash"></i>Supprimer</a></li>	
		</ul>
	</div>
</div>

<%
	;
		break;

	case "employe":
		
%>
<div class="box-tools pull-right">
	<div class="input-group-btn">
		<a onclick="infoemp(<%=request.getParameter("id_p")%>)"  class="btn btn-default" >
			<i class="fa fa-info-circle"></i>
		</a>
		<a  class="btn btn-default dropdown-toggle"
			data-toggle="dropdown">
			<i class="fa fa-cog"></i>
		</a>
		<ul class="dropdown-menu">
			<li><a href="cec?code=<%=request.getParameter("code")%>"><i class="fa fa-list"></i>Agence</a></li>
			<li><a href="me?id_p=<%=request.getParameter("id_p")%>"><i class="fa fa-pencil-square-o"></i>Modifier L'Employe</a></li>
			<li><a onclick="supemp(<%=request.getParameter("id_u")%>,<%=request.getParameter("id_p")%>)" href="#" ><i class="fa fa-trash"></i>Supprimer L'Employe</a></li>		
		</ul>
	</div>
</div>

<%
	;
		break;

	}
%>