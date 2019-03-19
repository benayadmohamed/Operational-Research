
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
        
          <img src="<c:url value='/resources/images/iRouter.png'/>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Algorithme de Routage </p>
          <a href="#"></a>
        </div>
      </div>
      <!-- search form 
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
  <br/>
  
        <li><a href="index?idG=12"><i class="fa fa-book"></i> <span> Algorithme de Dijksta</span></a>
        <li><a href="index2?idG=18"><i class="fa fa-book"></i> <span> Algorithme de Bellman</span></a>
        <li><a href="listGraphe"><i class="fa fa-list"></i> <span> List Graphe</span></a>
        
     
        
     
                   
      </ul>
    </section>
  </aside>