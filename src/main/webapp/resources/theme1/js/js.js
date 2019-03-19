

function infoadminAgence(val,val2){
	
    $.post("/client/servicesAdmin/sie",{id_p:val},	function(data) {
		var d="{ 'name': 'John' }";
		var obj = jQuery.parseJSON( data );
	
		
		var $textAndPic = $('<div class="box box-primary"><div class="box-body box-profile">');
        $textAndPic.append('<img class="profile-user-img img-responsive img-circle" src="'+val2+'" alt="User profile picture">');
        $textAndPic.append('<h3 class="profile-username text-center">'+obj['prenom']+' '+obj['nom']+'</h3>  <p class="text-muted text-center">Employe</p>');
        $textAndPic.append('<ul class="list-group list-group-unbordered"> ');
        $textAndPic.append('<li class="list-group-item"><b>Cin</b> <a class="pull-right">'+obj['cin']+'</a> </li> <li class="list-group-item">  <b>Nom</b> <a class="pull-right">'+obj['nom']+'</a> </li>');
        $textAndPic.append('<li class="list-group-item"><b>Prenom</b> <a class="pull-right">'+obj['prenom']+'</a> </li> <li class="list-group-item">  <b>Telephone</b> <a class="pull-right">'+obj['tele']+'</a> </li>');
        $textAndPic.append('<li class="list-group-item"><b>Email</b> <a class="pull-right">'+obj['email']+'</a> </li> <li class="list-group-item">  <b>Adresse</b> <a class="pull-right">'+obj['adresse_p']+'</a> </li>');
        
        $textAndPic.append('</ul></div></div>');
        $textAndPic.append('');
        
        BootstrapDialog.show({
            title: 'Profile',
            message: $textAndPic
            
        });
	 });
	

}

function infoadmin(obj,val2){
	 
//	        alert(val);
//			var obj = jQuery.parseJSON(val);
//		
			
			var $textAndPic = $('<div class="box box-primary"><div class="box-body box-profile">');
	        $textAndPic.append('<img class="profile-user-img img-responsive img-circle" src="'+val2+'" alt="User profile picture">');
	        $textAndPic.append('<h3 class="profile-username text-center">'+obj['prenom']+' '+obj['nom']+'</h3>  <p class="text-muted text-center">Employe</p>');
	        $textAndPic.append('<ul class="list-group list-group-unbordered"> ');
	        $textAndPic.append('<li class="list-group-item"><b>Cin</b> <a class="pull-right">'+obj['cin']+'</a> </li> <li class="list-group-item">  <b>Nom</b> <a class="pull-right">'+obj['nom']+'</a> </li>');
	        $textAndPic.append('<li class="list-group-item"><b>Prenom</b> <a class="pull-right">'+obj['prenom']+'</a> </li> <li class="list-group-item">  <b>Telephone</b> <a class="pull-right">'+obj['tele']+'</a> </li>');
	        $textAndPic.append('<li class="list-group-item"><b>Email</b> <a class="pull-right">'+obj['email']+'</a> </li> <li class="list-group-item">  <b>Adresse</b> <a class="pull-right">'+obj['adresse_p']+'</a> </li>');
	        
	        $textAndPic.append('</ul></div></div>');
	        $textAndPic.append('');
	        
	        BootstrapDialog.show({
	            title: 'Profile',
	            message: $textAndPic
	            
	        });
		
	
}