


$( document ).ready(function() {
      console.debug('Inicialiado...');
      var d = $('#limite').val();
      console.debug('LImite : '+d);
      $('#clock').countdown(d).on('update.countdown', function(event) {
              var format = '%H:%M:%S';
              if(event.offset.totalDays > 0) {
                  format = '%-d day%!d ' + format;
              }
              if(event.offset.weeks > 0) {
                format = '%-w week%!w ' + format;
              }
              $(this).html(event.strftime(format));
    }).on('finish.countdown', function(event) {
          $(this).html('El tiempo ha expirado!').parent().addClass('disabled');
    });
  //  $('#enviar_msg').attr(enabled,true);
    $("#botones_msg").removeClass("hidden");
	  $("#botones_msg").css('visibility','visible');
    var myVar = setInterval(cargar_mensajes_recibidos, 10000);

      $('#experiencia2').keyup(function() {
         console.debug('Validar experienciaa...');
         var min_= parseFloat( $(this).attr("min") );
         var max_= parseFloat( $(this).attr("max") );
         var val = parseFloat(  $(this).val() );
         if( val<min_ ){
              $(this).val('') ;
         }
        if( val>max_ ){
           $(this).val('') ;
        }
     });
     $('#resena2').keyup(function() {
         var max_chars=$(this).attr("maxlength");
         var chars = $(this).val().length;
         //var diff = max_chars - chars;
         $('#cont_resena2').html(chars+"/"+max_chars);
     });
     $('#oferta_cnombre').keyup(function() {
         var max_chars=$(this).attr("maxlength");
         var chars = $(this).val().length;
         //var diff = max_chars - chars;
         $('#cont_oferta_nombre').html(chars+"/"+max_chars+' caracteres');
     });
     $('#oferta_cdes').keyup(function() {
         var max_chars=$(this).attr("maxlength");
         var chars = $(this).val().length;
         //var diff = max_chars - chars;
         $('#cont_oferta_des').html(chars+"/"+max_chars+' caracteres');
     });
     $('#direccion').keyup(function() {
         var max_chars=$(this).attr("maxlength");
         var chars = $(this).val().length;
         //var diff = max_chars - chars;
         $('#cont_oferta_dir').html(chars+"/"+max_chars+' caracteres');
     });
     var max_chars=$('#resena2').attr("maxlength");
     var chars = $('#resena2').val().length;
     $('#cont_resena2').html(chars+"/"+max_chars);

    console.debug('Fin Inicialiado...');
 });

 $('.datepicker').datepicker({
        format: "dd-mm-yyyy",
        clearBtn: true,
        language: "es",
        multidate: false,
       autoclose: true
 });


 $(".my-rating-1").starRating({
     totalStars: 5,
     starShape: 'rounded',
     starSize: 30,
     emptyColor: '#CEC5E5',
     hoverColor: '#00C2B7',
     activeColor: '#654DEA',
     useGradient: false,
     readOnly: true
 });
 $(".my-rating-2").starRating({
     totalStars: 5,
     useFullStars: true,
     starShape: 'rounded',
     starSize: 30,
     emptyColor: '#CEC5E5',
     hoverColor: '#00C2B7',
     activeColor: '#654DEA',
     useGradient: false,
     callback: function(currentRating, $el){
         alert('Calificacion otorgada '+ currentRating);
         console.log('DOM element ', $el);
     }

 });
function cargar_mapa(contenedor,lat,lon,auto){
    if(lat==0)
       lat=7.8106808;
    if(lon==0)
       lon=-72.4436847;

     var myLatlng = new google.maps.LatLng(lat,lon);
			var mapOptions = {
			     center: myLatlng,
			     zoom: 16,
			     mapTypeId: google.maps.MapTypeId.ROADMAP
			};
      var map = new google.maps.Map(document.getElementById(contenedor),mapOptions);
      placeMarkerAndPanTo(myLatlng, map);
      if(auto)
        getLocalizacion(map);
}

function placeMarkerAndPanTo(latLng, map) {
  var marker = new google.maps.Marker({
     position: latLng,
      map: map
   });
   map.panTo(latLng);
}
function getLocalizacion(vmap){
   try{
       navigator.geolocation.getCurrentPosition(function(pos) {
             vmap.setZoom(8);
             vmap.setCenter( new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
       }, function(error) {

       });
   }catch(e){

   }

}


 $('#set_imagen').on("click", function() {
    	console.debug('Buscando imagen...');
       $("#upload_img_").trigger('click');
 	//$("input[type='file']").trigger('click');
 });
 /*function sel_imagen(){
   console.debug('Buscando imagen crear perfil...');
      $("#upload_img_").trigger('click');
 }*/
 $('#set_cperfil').on("click", function() {
 	console.debug('Buscando imagen crear perfil...');
     $("#upload_img_").trigger('click');
 	//$("input[type='file']").trigger('click');
 });

$('#set_iperfil').on("click", function() {
	console.debug('Buscando imagen perfil...');
    $("#upload_img_perfil").trigger('click');
	//$("input[type='file']").trigger('click');
});
$('#set_ioferta').on("click", function() {
	console.debug('Buscando imagen oferta...');
    $("#upload_img_oferta").trigger('click');
});
$('#enviar_msg').on("click", function() {
	   console.debug('Enviando mensaje...');
     enviar_mensaje();
});
$("#upload_img_").change(function(event) {
	  console.debug('Cambiando imagen...');
    $.each(event.target.files, function(index, file) {
			  console.debug('Seleccionado index imagen...');
         var reader = new FileReader();
         reader.onload = function(event) {
						object = {};
						object.filename = file.name;
						object.data = event.target.result;
						$("#set_imagen").attr("src",  object.data );
				};
		    reader.readAsDataURL(file);
    });
});

 $("#upload_img_perfil").change(function(event) {
    $.each(event.target.files, function(index, file) {
        var reader = new FileReader();
        reader.onload = function(event) {
			object = {};
			object.filename = file.name;
			object.data = event.target.result;
			$("#img_perfil").attr("src",  object.data );
			$("#img_perfilg").attr("src",  object.data );
			  var id_=$('#id_usuario').val();
			      guardar_imagen_perfil(id_);
        };
        reader.readAsDataURL(file);
    });
});

$("#upload_img_oferta").change(function(event) {
   console.debug('Guardando imagen oferta...');
    $.each(event.target.files, function(index, file) {
        var reader = new FileReader();
        reader.onload = function(event) {
			object = {};
			object.filename = file.name;
			object.data = event.target.result;
			$("#set_ioferta").attr("src",  object.data );
			  var id_=$('#id_oferta').val();
			      guardar_imagen_oferta(id_);
        };
        reader.readAsDataURL(file);
    });
});



function guardar_imagen_perfil(id_){
  	var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
  	console.debug( "TOKEN="+CSRF_TOKEN );
  	datos = new FormData();
  	var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
      datos.append('image', $('#upload_img_perfil')[0].files[0]);
	    datos.append('id', id_);
	    datos.append('_token', CSRF_TOKEN);
	    console.debug( datos );
    	$.ajax({
    		     type: 'post',
    		     enctype: 'multipart/form-data',
             processData: false,
             contentType: false,
    		     data: datos,
    		     url: 'actualizarfoto',
    		 success: function(data){
    			    console.debug('Datos='+data);
    			// var obj = JSON.parse(data);
    			/* if(data.rp=="ok"){
    				 console.debug(obj.msg);
                    // $.growl({ title: 'Evento', message: 'Portada evento guardada',style:'notice' });
    			 }else{
    			    console.debug(obj.msg);
    				// $.growl({ title: 'Evento', message: 'Fallo la carga de la imagen',style:'error' });
    			 }*/
    		 },
    		 error: function (xhr, ajaxOptions, thrownError) {
    			// $.growl({ title: 'Evento', message: 'Error inesperado. ',style:'error' });
    			console.debug('Error='+xhr.responseText);
    		  }
    });

}

    function guardar_imagen_oferta(id_){
      	var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
      	console.debug( "TOKEN="+CSRF_TOKEN );
      	datos = new FormData();
      	var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
          datos.append('image', $('#upload_img_oferta')[0].files[0]);
    	    datos.append('id', id_);
    	    datos.append('_token', CSRF_TOKEN);
    	    //console.debug( datos );
        	$.ajax({
        		     type: 'post',
        		     enctype: 'multipart/form-data',
                 processData: false,
                 contentType: false,
        		     data: datos,
        		     url: '../../actualizarfoferta',
        		 success: function(data){
        			    console.debug('Foto oferta cargada en el servidor');
        		 },
        		 error: function (xhr, ajaxOptions, thrownError) {
        			  // $.growl({ title: 'Evento', message: 'Error inesperado. ',style:'error' });
        			  console.debug('Error='+xhr.responseText);
        		}
       });
    }

  function enviar_mensaje(){
         var msg_   =  $('#msg').val();
         if(msg_ == ''){
             return false;
         }
         var para_  =  $('#para').val();
         var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
           $.ajax({
                  type: 'post',
                  data: {
                       _token : CSRF_TOKEN,
                      para: para_,
                      msg: msg_,
                 },
                  url: '../../enviarmensaje',
                  success: function(data){
                      console.debug('rp='+data );
                      $("#mensajes").append(data);
                      $("#msg").val("");
                      $('#style-2').attr('scrollTop', $('#style-2').attr('scrollHeight'));
              },
              error: function (xhr, ajaxOptions, thrownError) {
                   //$.growl({ title: 'Evento', message: 'Error inesperado. ',style:'error' });
                   console.debug('Error='+xhr.responseText);
                   $("#mensajes").append(xhr.responseText);
                   $("#msg").val("");
                   console.debug('Sccroll ='+ $('#style-2').attr('scrollTop') );
                   console.debug('Sccroll ='+ $('#style-2').attr('scrollHeight') );
                   $('#style-2').attr('scrollTop', $('#style-2').attr('scrollHeight') );
             }

        });
     }

     function cargar_mensajes_recibidos(){
            var de_  =  $('#para').val();
            if(de_ == ''){
                return false;
            }
            console.debug('Enviando='+de_);
            var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
            $.ajax({
                     type: 'post',
                     data: {
                          _token : CSRF_TOKEN,
                           de: de_,
                     },
                     url: '../../recibirmensaje',
                     success: function(data){
                        if(data!=''){
                          new Audio('../../images/alerta.mp3' ).play()
                          $("#mensajes").append(data);
                          $('#style-2').attr('scrollTop', $('#style-2').attr('scrollHeight'));
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        //$("#mensajes").append(xhr.responseText);
                        //console.debug('Error='+xhr.responseText);
                    }
                });
      }
