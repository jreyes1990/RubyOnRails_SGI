require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('datatables.net-bs4')
//= require active_admin_datetimepicker

import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'
import "@fortawesome/fontawesome-free/js/all";
import "@fortawesome/fontawesome-free/css/all.css";
import 'select2'
import 'select2/dist/css/select2.css'
import 'smartwizard'
import 'smartwizard/dist/css/smart_wizard_all.min.css'

import "datatables.net-responsive-bs4/css/responsive.bootstrap4";
import "datatables.net-responsive/js/dataTables.responsive";
import "datatables.net-responsive-bs4/js/responsive.bootstrap4";

import "datatables.net-rowgroup-bs4/css/rowGroup.bootstrap4";
import "datatables.net-rowgroup/js/dataTables.rowGroup";
import "datatables.net-rowgroup-bs4/js/rowGroup.bootstrap4";

import "bootstrap-tooltip-custom-class/bootstrap-v4/popover/dist/css/bootstrap-popover-custom-class";
import "bootstrap-tooltip-custom-class/bootstrap-v4/tooltip/dist/css/bootstrap-tooltip-custom-class";

import {
    end,
    left
} from '@popperjs/core'

var jQuery = require("jquery");

// import jQuery from "jquery";
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

import "../controllers"
import 'select2/dist/js/i18n/es'
import "./custom_permisos_usuario";
import "./custom_datatable";
import "./custom_datatable_ajax";


document.addEventListener("turbolinks:load", () => {
  require("./custom");

  $(document).ready(function() {
    $('.documento-checkbox').on('change', function() {
      var checkboxes = $(this).closest('.card-body').find('.documento-checkbox');
      var atLeastOneChecked = checkboxes.filter(':checked').length > 0;
      var atLeastOneActive = checkboxes.filter(':checked[data-estado="A"]').length > 0;
      var atLeastOneInactive = checkboxes.filter(':checked[data-estado="I"]').length > 0;
      var botonAccionSelected = $(this).closest('.card-body').find('button[name="aplicar_selected"]');
      
      // Verificar si al menos un checkbox marcado está activo
      botonAccionSelected.toggle(atLeastOneChecked && (atLeastOneActive || atLeastOneInactive));
    });
  });

  $(document).ready(function() {
    $('.permiso-documento-checkbox').on('change', function() {
      var checkboxes = $(this).closest('.card-body').find('.permiso-documento-checkbox');
      var atLeastOneChecked = checkboxes.filter(':checked').length > 0;
      // var atLeastOneActive = checkboxes.filter(':checked[data-estado="A"]').length > 0;
      // var atLeastOneInactive = checkboxes.filter(':checked[data-estado="I"]').length > 0;
      var botonAccion2Selected = $(this).closest('.card-body').find('button[name="aplicar_permiso_selected"]');
      
      // Verificar si al menos un checkbox marcado está activo
      // botonAccion2Selected.toggle(atLeastOneChecked && (atLeastOneActive || atLeastOneInactive));
      botonAccion2Selected.toggle(atLeastOneChecked);
    });
  });

  document.oncontextmenu = ev =>{
      ev.preventDefault();
  }
 
  $(document).ajaxSend(function (e, xhr, options) {
    var token = $("meta[name='csrf-token']").attr("content");
    xhr.setRequestHeader("X-CSRF-Token", token);
  });

  /* *******************************************************   
    * Para controlar el sidebar en posición cerrado o abierto
    * ******************************************************** */
  let sidebarState = sessionStorage.getItem('sidebar');
  $(".sidebar").toggleClass(sidebarState);

  $("#sidebarToggle, #sidebarToggleTop").on('click', function (e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
        sessionStorage.setItem('sidebar', 'toggled');
        $('.sidebar .collapse').collapse('hide');
    } else {
        sessionStorage.setItem('sidebar', '');
    };
  });

  // Cierre cualquier acordeón de menú abierto cuando la ventana cambie de tamaño a continuación 768px
  if ($(window).width() < 768) {        
    $('.sidebar .collapse').collapse('hide');
  };

  // Cierre cualquier acordeón de menú abierto cuando la ventana cambie de tamaño a continuación 480px
  if ($(window).width() < 480 && !$(".sidebar").hasClass("toggled")) {        
    $("body").addClass("sidebar-toggled");
    $(".sidebar").addClass("toggled");
    $('.sidebar .collapse').collapse('hide');
  };

  if (sidebarState == 'toggled') {
    $(".menu_sb").addClass("collapsed");
    $(".opcion_sb").removeClass("show");
  }

  /* *******************************************************   
    * Fin para controlar el sidebar en posición cerrado o abierto
    * ******************************************************** */

  // Configuracion de Scroll Top Button
  $(window).scroll(function () {
    if ($(this).scrollTop() > 40) {
      $('#topBtn').fadeIn();
    } else {
      $('#topBtn').fadeOut();
    }
  });

  $("#topBtn").click(function () {
    $('html ,body').animate({
      scrollTop: 0
    }, 800)
  });

  // Configuracion para activar select2
  $('.select2').select2({
    theme: "bootstrap4",
    language: "es-GT",
    width: '100%'
  });

  // Configuracion para activar select2
  $('.select2-multiple').select2({
    //theme: "bootstrap4",
    language: "es-GT",
    width: '100%'
  });

  $('.select2-proceso').select2({
    //theme: "bootstrap4",
    language: "es-GT",
    placeholder: "Seleccione un proceso",
    width: '100%'
  });

  $('.select2-sistema-permiso').select2({
    placeholder: "Seleccione los sistemas",
  });

  $('.select2-usuario-permiso').select2({
    placeholder: "Seleccione los usuarios",
  });

  $('.select2-sistema-proceso').select2({
    placeholder: "Seleccione los procesos",
  });

  $('.select2-tipo-documento').select2({
    placeholder: "Seleccione los tipos de documentos",
  });
    
  $('.select2-documento').select2({
    placeholder: "Seleccione los documentos",
  });

  // Configuracion para combos dinamicos menu-opciones
  var opcion = $('#menu_rol_opciones_id').html()

  $('#menu_menu_id').on('select2:select', function (e) {
    var menu = $('#menu_menu_id :selected').text()
    var opcionesByMenu = $(opcion).filter("optgroup[label='" + menu + "']").html()

    if (opcionesByMenu)
      $('#menu_rol_opciones_id').html(opcionesByMenu)
    else
      $('#menu_rol_opciones_id').empty()
  });

  $('div.toggle-vis').on( 'click', function (e) {
    //e.preventDefault();
    // Get the column API object
    var column = table.column( $(this).attr('data-column') );
    // Toggle the visibility
    column.visible( ! column.visible() );
  } );

  //BUSCADOR USUARIOS
  $('.select2-usuario').select2({
    ajax: {
      url: $('.select2-usuario').data('endpoint'),
      dataType: "json",
      delay: 500,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, page) {
        return {
          //results: data
          results: $.map(data, function (value, index) {
            return {
              id: value.valor_id,
              text: value.valor_text
            };
          })
        };
      }
    },
    minimumInputLength: 3,
    theme: "bootstrap4",
    language: "es-GT",
    width: '100%'
  });

  // funcion para los mensajes de los toggle en las tablas
  $(function() {
    $('[title]').attr("data-rel", "tooltip");
    $("[data-rel='tooltip']")
        .attr("data-placement", "top");

    var showPopover = function() {
      $(this).popover('show');
    };
    var hidePopover = function() {
      $(this).popover('hide');
    };
    $("[data-rel='tooltip']").popover({
      trigger: 'manual'
    }).click(showPopover).hover(showPopover, hidePopover);
  });
  // Fin de la funcion para los mensajes de los toggle en las tablas

  //control de los tiempos de los flash
  $(".alert").fadeTo(4000, 500).slideUp(500, function () {
      $(".alert").slideUp(4000);
  });

  //BUSCADOR EMPLEADOS WS
  if (window.gon != null) {
    $('.select2-empleado').select2({
      ajax: {
        url: gon.url_api + gon.nombre_rama,
        dataType: gon.datatype,
        delay: 500,
        headers: {
          "Authorization": "Bearer " + gon.token,
          "Content-Type": gon.contentype,
        },
        data: function (params) {
          return {
            empleado: params.term, // search term
            page: params.page,
            user: gon.user,
            codigo_empresa: gon.codigo_empresa
          };
        },
        processResults: function (data, page) {
          return {
            //results: data
            results: $.map(data, function (value, index) {
              return {
                id: value.valor_id,
                text: value.valor_text
              };
            })
          };
        }
      },
      minimumInputLength: 3,
      theme: "bootstrap4",
      language: "es-GT",
      width: '100%'
    });

    //CAPTURA DATOS DE EMPLEADO SELECCIONADO
    $('.select2-empleado').on('select2:select', function (e) {
      var codigo_empleado = e.params.data.id;
      var nombre_empleado = e.params.data.text;

      $('#seleccion_empleado_codigo_empleado').val(codigo_empleado);
      $('#seleccion_empleado_nombre_empleado').val(nombre_empleado);
    });
  }

  //BUSCADOR EMPRESAS
  $('.select2-empresa').select2({
    ajax: {
      url: $('.select2-empresa').data('endpoint'),
      dataType: "json",
      delay: 500,
      data: function (params) {
        return {
          q: params.term, // search term
          page: params.page
        };
      },
      processResults: function (data, page) {
        return {
          //results: data
          results: $.map(data, function (value, index) {
            return {
              id: value.valor_id,
              text: value.valor_text
            };
          })
        };
      }
    },
    minimumInputLength: 2,
    theme: "bootstrap4",
    language: "es-GT",
    width: '100%'
  });
    
  $('#usuario_selected_id').on('select2:select', function (e) {
    $.ajax({
      url: $('.path_search_area_empresa_p').data('endpoint'),
      type:'GET',
      dataType: "json",
      data: {
        area_empresa_persona_id_param: e.params.data.id
      },
      success:function(data) {                                    
        $("#area_empresa_persona_id").empty();
        var json = data;
        for (var i of json) {
          $("#area_empresa_persona_id").append("<option value='"+i.id+"'>"+i.area+"</option>");
        }            
      }      
    });      
  });

  //PROCESO LLAVE COMPUESTA
  $('#proceso_id').on('select2:select', function (e) {
    $.ajax({
      url: $('#proceso_id').data('endpoint'),
      type:'GET',
      dataType: "json",
      data: {
        id_proceso: e.params.data.id
      },
      success:function(data) {
        $("#tipo_documento_id").empty();
        var json = data;
        $("#tipo_documento_id").append("<option value='"+0+"'>Seleccione un tipo documento</option>");
        for (var i of json) {
          $("#tipo_documento_id").append("<option value='"+i.id_documento+"'>"+i.nombre+"</option>");
        }
      }
    });
  });

  //PROCESO LLAVE COMPUESTA
  $('#tipo_documento_id').on('select2:select', function (e) {
      console.log(e.params.data.id);
      $.ajax({
          url: $('#tipo_documento_id').data('endpoint'),
          type:'GET',
          dataType: "json",
          data: {
              id_compuesto_final: e.params.data.id
          },
          success:function(data) {
              $("#codigo_formado").empty();
              var json = data;
              $("#codigo_formado").val(data.descripcion).trigger('change');
          }
      });
  });

    //MOSTRAR U OCULTAR CONTRASEÑA INICIO DE SESIÓN
    $('#show_password').on('click', function (e) {
        var cambio = document.getElementById("txtPassword");
        if(cambio.type == "password"){
            cambio.type = "text";
            $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
        }else{
            cambio.type = "password";
            $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
        }
        $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
    });

    //MANEJO DE CAMPOS OCULTOS SEGUIMIENTO DE SOLICITUD 
    $('#version').hide();
    $('#fecha').hide();
    $('#divFileDocument').hide();
    
    $('#divChangeClass')
    .removeClass('col-md-12')
    .addClass('col-md-7')

    $('#estado_documento_id').on('select2:select', function (e) {
        var id_selected = e.params.data.id

        if(id_selected == 1){
            $('#version').show();
            $('#fecha').show();
            $('#divFileDocument').show();
            $('#divChangeClass')
            .removeClass('col-md-7')
            .addClass('col-md-12')  
        } else{
            $('#version').hide();
            $('#fecha').hide();
            $('#divFileDocument').hide();
            $('#divChangeClass')
            .removeClass('col-md-12')
            .addClass('col-md-7')
        }
    });

    //PROCESO SELECCION DE SISTEMA PARA PROCESO ID
    $('#tipo_sistema_id').change('select2:select', function (e) {
        $("#proceso_ids").empty();  
        $.ajax(
            {
                url: $('#tipo_sistema_id').data('endpoint'),
                type:'GET',
                dataType: "json",
                data: {
                    id_sistema: $(this).val()
                },
                success:function(data) {
                    $("#proceso_ids").empty();
                    var json = data;
                    $("#proceso_ids").append("<option value='"+0+"'>Seleccione un Proceso</option>");
                    for (var j of json) {
                        $("#proceso_ids").append("<option selected='selected' value='"+j.proceso_id+"'>"+j.nombre_proceso+"</option>");
                        //console.table(`Id: ${j.id_documento} Codigo: ${j.codigo_documento}${j.correlativo_documento}: ${j.nombre}`)
                    }
                }
            },
        );
    });
    
   
    //PROCESO SELECCION DE PROCESO PARA TIPO DOCUMENTO ID
    $('#proceso_ids').change('select2:select', function (e) {        
        $("#tipo_documento_ids").empty();        
        $.ajax(
            {
                url: $('#proceso_ids').data('endpoint'),
                type:'GET',
                dataType: "json",
                data: {
                    ids_proceso: $(this).val()
                },
                success:function(data) {
                    $("#tipo_documento_ids").empty();
                    var json = data;
                    $("#tipo_documento_ids").append("<option value='"+0+"'>Seleccione un Tipo Documento</option>");
                    for (var j of json) {
                        $("#tipo_documento_ids").append("<option value='"+j.tiposDocumentos_ids+"'>"+j.nombre_tipoDocumento+"</option>");
                        //console.table(`Id: ${j.tiposDocumentos_ids}: ${j.nombre_tipoDocumento}`)
                    }
                }
            },
        );
        
    });

    //PROCESO SELECCION DE TIPO DOCUMENTO PARA DOCUMENTO ID
    $('#tipo_documento_ids').change('select2:select', function (e) {        
        $("#documento_id").empty();

        $.ajax(
            {
                url: $('#tipo_documento_ids').data('endpoint'),
                type:'GET',
                dataType: "json",
                data: {
                    ids_tipo_documento: $(this).val()
                },
                success:function(data) {
                    $("#documento_id").empty();
                    var json = data;
                    $("#documento_id").append("<option value='"+0+"'>Seleccione un Documento</option>");
                    for (var j of json) {
                        $("#documento_id").append("<option selected='selected' value='"+j.id_documentos+"'>"+j.codigo_documentos+""+j.correlativo_documentos+": "+j.nombress+"</option>");
                        //console.table(`Id: ${j.id_documentos} Codigo: ${j.codigo_documentos}${j.correlativo_documentos}: ${j.nombress}`)
                    }
                }
            },
        );
    });

  /**
   * Función para inicializar los select2 con ajax
   * @param {string} selector - Selector del elemento select2, ejemplo: "#empresa_id_estado_x_proceso"
   * @param {string} search_param - Nombre del parámetro de búsqueda para el endpoint
   * @param {string} ajax_param - Nombre del parámetro de búsqueda para el endpoint de la segunda llamada
   * @param {function} success_callback - Función que se ejecuta cuando la segunda llamada es exitosa
   * @param {function} clear_callback - Función que se ejecuta cuando la segunda llamada no es exitosa
   * @param {function} post_select_callback - Función que se ejecuta después de seleccionar un elemento del select2, puede ir null (opcional)
   */
  function initializeSelect2(selector, search_param, ajax_param, success_callback, clear_callback, post_select_callback = null) {
    // Configuración del select2 con AJAX
    $(selector).select2({
      ajax: {
        url: $(selector).data('endpoint'), // URL del endpoint para la búsqueda AJAX
        dataType: "json",
        delay: 500,
        data: function (params) {
          let search_obj = {};
          search_obj[search_param] = params.term; // Parámetro de búsqueda con el término ingresado en el select2
          return search_obj;
        },
        processResults: function (data, page) {
          return {
            results: $.map(data, function (value, index) {
              return {
                id: value.valor_id,
                text: value.valor_text
              };
            })
          };
        }
      },
      minimumInputLength: 2,
      theme: "bootstrap4",
      language: "es-GT",
      width: '100%'
    }).on('select2:select', function (e) {
      var selectedOption = e.params.data.id;
      if (selectedOption !== '') {
        if (post_select_callback) {
          post_select_callback(selectedOption);
        }
        let ajax_data = {};
        ajax_data[ajax_param] = selectedOption; // Parámetro de búsqueda para la segunda llamada AJAX
        $.ajax({
          url: $(this).data('endpoint'), // URL del endpoint para la segunda llamada AJAX
          dataType: "json",
          data: ajax_data,
          success: success_callback // Función a ejecutar cuando la segunda llamada es exitosa
        });
      } else {
        clear_callback(); // Función a ejecutar cuando no hay una opción seleccionada
      }
    });
  }

  /* BUSCADOR AREA - EMPRESA, EN EL MODULO USUARIO */
  initializeSelect2(
    "#empresa_id_usuario",
    "search_empresa_usuario_params",
    "empresa_usuario_params",
    function (data) {
      $("#area_id_usuario").empty();
      $("#area_id_usuario").append("<option value='" + 0 + "'>Seleccione una área</option>");
      for (var i of data.area_empresa) {
          $("#area_id_usuario").append("<option value='" + i.valor_id + "'>" + i.valor_text + "</option>");
      }
    },
    function () {
      $("#area_id_usuario").empty().trigger('change');
    }
  )

});
//import "controllers"