var ASEC_=1000*60;
var INTERVALO_CONSULTAS_=ASEC_*1; //dos minutos por consulta
var cropBoxData;
var canvasData;
var cropper;
var image_tcrop;

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
     try{
         $("#botones_msg").removeClass("hidden");
    	   $("#botones_msg").css('visibility','visible');
         cargar_mensajes_recibidos();
         console.debug('Reloj intervalo '+INTERVALO_CONSULTAS_);
         var myVar = setInterval(cargar_mensajes_recibidos, INTERVALO_CONSULTAS_);
         console.debug('Reloj configurado verificacion de mensajes ...');
     }catch(e){
          console.debug('Reloj intervalo error '+e);
     }
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
     $('#experiencia').keyup(function() {
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
     $('#resena').keyup(function() {
         var max_chars=$(this).attr("maxlength");
         var chars = $(this).val().length;
         //var diff = max_chars - chars;
         $('#cont_resena').html(chars+"/"+max_chars);
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
     try{
         var max_chars=$('#resena2').attr("maxlength");
         var chars = $('#resena2').val().length;
         $('#cont_resena2').html(chars+"/"+max_chars);
     }catch(e){

     }



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
$('.link_enviar_oferta').on("click", function() {
     var id_= $(this).attr('data-id');
     console.debug('Enviando oferta id='+id_);
     enviar_oferta(id_);

    // enviar_mensaje();
});
$('#leer_mensajes').on("click", function() {
	   console.debug('marcando notificaciones como leidos...');
     marcar_como_leidos();
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
            $('#modal_image').modal('show');
            $('#modal_image').find('#imagen_mod').attr("src",  object.data );
            //image_tcrop= $('#modal_image').find('#imagen_mod');
            image_tcrop = document.getElementById('imagen_mod');
            /*var cropper = new Cropper(image, {
              dragMode: 'move',
              aspectRatio: 16 / 9,
              autoCropArea: 0.8,
              restore: false,
              guides: false,
              center: false,
              highlight: false,
              cropBoxMovable: false,
              cropBoxResizable: false,
              toggleDragModeOnDblclick: false,
      				minContainerWidth: 400
            });*/

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

$('#modal_image').on('shown.bs.modal', function () {
    cropper = new Cropper(image_tcrop, {
        dragMode: 'move',
        movable: false,
        cropBoxMovable: true,
        cropBoxResizable: false,
        autoCropArea: 0.6,
        restore: false,
        guides: false,
        center: false,
        minContainerHeight: 400,
        minContainerWidth: 400,
        minCanvasHeight: 400,
        minCanvasWidth: 400,
        width: 400,
        height: 400,
       ready: function () {
           cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);
       }
    });
  }).on('hidden.bs.modal', function () {
        cropBoxData = cropper.getCropBoxData();
        canvasData = cropper.getCanvasData();
        croppedCanvas = cropper.getCroppedCanvas();
        //console.debug('Imagen='+croppedCanvas.toDataURL());

      //  $('#upload_img_oferta')[0].files[0]
        $("#set_imagen").attr("src",  croppedCanvas.toDataURL());
        //$('#modal_image').modal('show');
        //$('#modal_image').find('#imagen_mod').attr("src",  object.data );
        cropper.destroy();
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
    		     url: APP_URL+'/actualizarfoto',
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
          datos.append('image', croppedCanvas);
          //datos.append('image', $('#upload_img_oferta')[0].files[0]);
    	    datos.append('id', id_);
    	    datos.append('_token', CSRF_TOKEN);
    	    //console.debug( datos );
        	$.ajax({
        		     type: 'post',
        		     enctype: 'multipart/form-data',
                 processData: false,
                 contentType: false,
        		     data: datos,
        		     url: APP_URL+'/actualizarfoferta',
        		     success: function(data){
                      croppedCanvas=null;
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
                  url: APP_URL+'/enviarmensaje',
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


    function enviar_oferta(id_){
          if(id_ == ''){
              return false;
          }
          var para_  =  $('#para').val();
          var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
          $.ajax({
                       type: 'post',
                       data: {
                             _token : CSRF_TOKEN,
                             para: para_,
                             id: id_,
                       },
                       url: APP_URL+'/enviaroferta',
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
            console.debug('Verificando mensajes recibidos...');
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
                     url: APP_URL+'/recibirmensaje',
                     success: function(data){
                       console.debug('recibido='+data);
                        if(data!=''){
                          new Audio(APP_URL+'/images/alerta.mp3' ).play()
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


      function recibir_notificaciones(){
                   var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
                     $.ajax({
                            type: 'post',
                            data: {
                                 _token : CSRF_TOKEN,
                           },
                            url: APP_URL+'/recibirnotificaciones',
                            success: function(data){
                                console.debug('rp='+data );
                                if(data=='SI'){

                                }

                              /*  $("#mensajes").append(data);
                                $("#msg").val("");
                                $('#style-2').attr('scrollTop', $('#style-2').attr('scrollHeight'));*/
                        },
                        error: function (xhr, ajaxOptions, thrownError) {

                             console.debug('Error='+xhr.responseText);
                            /* $("#mensajes").append(xhr.responseText);
                             $("#msg").val("");
                             console.debug('Sccroll ='+ $('#style-2').attr('scrollTop') );
                             console.debug('Sccroll ='+ $('#style-2').attr('scrollHeight') );
                             $('#style-2').attr('scrollTop', $('#style-2').attr('scrollHeight') );*/
                       }

                  });
        }


      function marcar_como_leidos(){
             var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
               $.ajax({
                      type: 'post',
                      data: {
                           _token : CSRF_TOKEN,
                     },
                      url: APP_URL+'/leermensajes',
                      success: function(data){
                          console.debug('rp='+data );
                          if(data=='SI'){
                                $("#div_tt_nuevas").html('0');
                                $("#div_tt_nuevas_").html('No tienes mensajes');
                          }

                        /*  $("#mensajes").append(data);
                          $("#msg").val("");
                          $('#style-2').attr('scrollTop', $('#style-2').attr('scrollHeight'));*/
                  },
                  error: function (xhr, ajaxOptions, thrownError) {

                       console.debug('Error='+xhr.responseText);
                      /* $("#mensajes").append(xhr.responseText);
                       $("#msg").val("");
                       console.debug('Sccroll ='+ $('#style-2').attr('scrollTop') );
                       console.debug('Sccroll ='+ $('#style-2').attr('scrollHeight') );
                       $('#style-2').attr('scrollTop', $('#style-2').attr('scrollHeight') );*/
                 }

            });
         }
