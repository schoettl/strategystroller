function cancel_button(){
    ref =window.location.href;
    params = ref.split("?");
    if( params.length >1){
        params= "?"+params[1];
    }
    else{
        params = "";
    }
    ref = ref.split("/");
    if(ref[ref.length-3]=="users"){
    window.location.href='../login'+params;
    }
    else if(ref[ref.length-2]=="users"){
    window.location.href='../users/login'+params;    
    }
    else if (history.length != 0){
     history.back();
    }else{
     window.location.href=ref[0]+params;
    }
}
function setActiveNav(nav){
if(!nav){
    nav = window.location.href
}
if(nav.search("controller_unit/input_framework")!=-1){
jQuery("#navbar_setup").addClass("active");
}
else if(nav.search("reports__")!=-1){
jQuery("#navbar_reports").addClass("active");
}
else if(nav.search("forms/form_template")!=-1){
jQuery("#navbar_forms").addClass("active");
}
else if(nav.search("controller_unit/edit_users")!=-1){
jQuery("#navbar_edit_users").addClass("active");
}
}
jQuery(document).ready(function(){
setActiveNav();
});