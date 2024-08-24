document.addEventListener("turbolinks:load", () => {
  var btnDescarga = [
    {
      text:      'Excel <i class="fas fa-file-excel"></i> ',
      extend:     'excelHtml5',
      fieldSeparator: '\t',
      extension: '.xlsx',
      titleAttr: 'Si desea exportar el archivo, Dar click en EXCEL'
    },
    {
      text:      'PDF <i class="fas fa-file-pdf"></i> ',
      extend:    'pdfHtml5',
      titleAttr: 'Si desea exportar el archivo, Dar click en PDF'
    }
  ];

  var espanol = {
    lengthMenu: "Mostrar _MENU_ Entradas",
    zeroRecords: "No hay ningun dato creado para mostrar",
    info: "Mostrando de _START_ a _END_ datos de _TOTAL_ creados",
    infoEmpty: "No hay registros disponibles",
    infoFiltered: "(resultados filtrados de _MAX_ en total)",
    search: "",
    processing: "Procesando ......",
    paginate: 
      {
        first: "Inicio",
        previous: "Anterior",
        next: "Siguiente",
        last: "Ultimo"
      }
  };

  var var_dom = "<'row'<'col-sm-3'l><'col-sm-3'B><'col-sm-6'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-5'i><'col-sm-3 text-center'p>>";

  // Definir la función para inicializar los popovers
  function initializePopovers() {
    $('[title]').attr("data-rel", "tooltip").attr("data-placement", "top");
    var showPopover = function() {
      $(this).popover('show');
    };
    var hidePopover = function() {
      $(this).popover('hide');
    };
    $("[data-rel='tooltip']").popover({
      trigger: 'manual'
    }).click(showPopover).hover(showPopover, hidePopover);
  }

  //configuracion para datatables agrupados por columnas dinamico
  /**
  * Función para agrupar filas en un DataTable en base a múltiples columnas.
  * @param {string} var_dom - Selector o elemento DOM donde se mostrará el DataTable. Por ejemplo, '#datatable_familia_producto' o document.getElementById('datatable_familia_producto').
  * @param {Array} agrupaciones - Un array que contiene objetos con detalles de las columnas que se utilizarán para la agrupación. Cada objeto debe tener la forma { columnIndex: number, label: string }, donde columnIndex es el índice de la columna (comenzando desde 0) y label es el nombre o etiqueta de la columna que se utilizará para mostrar el nombre del grupo.
  * @param {Array|null} columnDefs - Un array opcional que contiene configuraciones adicionales para las columnas del DataTable, en el formato requerido por DataTables columnDefs. Puede ser nulo si no se necesita ninguna configuración adicional.
  * @param {Object} options - Opciones adicionales para configurar el DataTable, siguiendo el formato de configuración del DataTable. Puedes personalizar opciones como el orden, dom, lenguaje, botones, etc.
  * @param {Array} columns - La configuración de columnas para el DataTable.
  * @param {Object} ajaxConfig - Configuración Ajax para el DataTable.
  */
  function agrupar_filas(var_dom, agrupaciones, columnDefs, options, columns, ajaxConfig) {    
    // Comprueba si agrupaciones está vacío
    if (!agrupaciones || agrupaciones.length === 0) {
      // Aquí puedes inicializar la tabla sin el rowGroup, si lo deseas
      $(var_dom).DataTable({
        "columnDefs": columnDefs || [],
        fixedHeader: options.fixedHeader,
        stateSave: options.stateSave,
        stateDuration: options.stateDuration,
        dom: options.dom,
        language: options.language,
        responsive: options.responsive,
        //lengthChange: options.lengthChange,
        lengthMenu: options.lengthMenu,
        select: options.select,
        buttons: options.buttons,
        pagingType: options.pagingType,
        columns: columns,
        ajax: ajaxConfig,
        processing: options.processing,
        serverSide: options.serverSide
      });

      return;
    }

    var dataSrc = agrupaciones.map(agrupacion => agrupacion.columnIndex);
    var orden = agrupaciones.length > 1 ? 
                agrupaciones.map(agrupacion => [agrupacion.indexOrden, agrupacion.order || 'asc']) :
                [];

    $(var_dom).DataTable({
        "order": orden,
        "columnDefs": [...agrupaciones.map(agrupacion => ({ "visible": false, "targets": agrupacion.indexOrden })), ...(columnDefs ?? [])],
        rowGroup: {
          dataSrc: dataSrc,
          startRender: function (rows, group, level) {
            var className = '';
            var groupName = '';

            agrupaciones.forEach((agrupacion, index) => {
              if (level === index) {
                className = `group-start-level-${index}`;
                groupName = `${agrupacion.label} ${group}`;
              }
            });

            return $('<tr/>')
              .append(`<td colspan="20" style='background-color: transparent;'> ${groupName} </td>`)
              .addClass(className);
          }
        },
        initComplete: function () {
          initializePopovers(); // Inicializar popovers después de que la tabla esté lista
        },
        fixedHeader: options.fixedHeader,
        stateSave: options.stateSave,
        stateDuration: options.stateDuration,
        dom: options.dom,
        language: options.language,
        responsive: options.responsive,
        //lengthChange: options.lengthChange,
        lengthMenu: options.lengthMenu,
        select: options.select,
        buttons: options.buttons,
        pagingType: options.pagingType,
        columns: columns,
        ajax: ajaxConfig,
        processing: options.processing,
        serverSide: options.serverSide
    });
  }

  //opciones que se pueden utilizar en el datatable - estas son estandar
  var opciones = {
    fixedHeader: true,
    stateSave: true,
    stateDuration: 1200,
    dom: var_dom,
    language: espanol,
    responsive: "true",
    lengthMenu: 
    [
      [25, 5, 10, 15, 50, -1],
      [25, 5, 10, 15, 50, 'Todos'],
    ],
    select: true,
    buttons: btnDescarga,
    pagingType: "simple_numbers",
    processing: true,
    serverSide: true
  };

  agrupar_filas(
    '#opcionCa_datatable',
    [
      { columnIndex: "opcion", label: '', indexOrden: 1 }
    ],
    [
      { responsivePriority: 1, targets: [0] },
      { responsivePriority: 1, targets: [-2,-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [1, 2] }
    ],
    opciones,
    [
      { data: "id", class: "text-center" },
      { data: "opcion" },
      { data: "componente" },
      { data: "atributo", class: "text-center" },
      { data: "descripcion" },
      { data: "estado", class: "text-center" },
      { data: "editar", class: "text-center" },
      { data: "inactivar", class: "text-center"}
    ],
    {
      url: $('#opcionCa_datatable').data('source')
    }
  );

  agrupar_filas(
    '#documento-datatable',
    [],
    [
      { responsivePriority: 1, targets: [0] },
      { responsivePriority: 1, targets: [-1, -2] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [4] },
      { responsivePriority: 2, targets: [-3, -4, -5] },
      { responsivePriority: 3, targets: [1, 2, 3, 5, 6] }
    ],
    opciones,
    [
      { data: "id", class: "text-center" },
      { data: "abr_sistema", class: "text-center" },
      { data: "abr_proceso", class: "text-center" },
      { data: "codigo_documento", class: "text-center" },
      { data: "nombre_documento" },
      { data: "abr_tipo_docto", class: "text-center" },
      { data: "version_actual", class: "text-center" },
      { data: "fecha_documento", class: "text-center" },
      { data: "docto_pdf", class: "text-center" },
      { data: "docto_word", class: "text-center" },
      { data: "docto_excel", class: "text-center" },
      { data: "editar", class: "text-center" },
      { data: "inactivar", class: "text-center" }
    ],
    {
      url: $('#documento-datatable').data('source')
    }
  );

  agrupar_filas(
    '#documento-limitado-datatable',
    [
      { columnIndex: "abr_clasifica", label: 'CLASIFICACIÓN: ', indexOrden: 0 },
      { columnIndex: "abr_sistema", label: 'SISTEMA: ', indexOrden: 1 },
      { columnIndex: "abr_proceso", label: 'PROCESO: ', indexOrden: 2 }
    ],
    [
      { responsivePriority: 1, targets: [2] },
      { responsivePriority: 1, targets: [-1, -2, -3] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [-4, -5, -6] },
    ],
    opciones,
    [
      { data: "abr_clasifica" },
      { data: "abr_sistema" },
      { data: "abr_proceso" },
      { data: "codigo_documento", class: "text-center" },
      { data: "nombre_documento" },
      { data: "version_actual", class: "text-center" },
      { data: "fecha_documento", class: "text-center" },
      { data: "docto_pdf", class: "text-center" },
      { data: "docto_word", class: "text-center" },
      { data: "docto_excel", class: "text-center" }
    ],
    {
      url: $('#documento-limitado-datatable').data('source')
    }
  );

  agrupar_filas(
    '#documento-ver-pdf-word-datatable',
    [
      { columnIndex: "abr_clasifica", label: 'CLASIFICACIÓN: ', indexOrden: 0 },
      { columnIndex: "abr_sistema", label: 'SISTEMA: ', indexOrden: 1 },
      { columnIndex: "abr_proceso", label: 'PROCESO: ', indexOrden: 2 }
    ],
    [
      { responsivePriority: 1, targets: [2] },
      { responsivePriority: 1, targets: [-1, -2] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [-3, -4, -5] },
    ],
    opciones,
    [
      { data: "abr_clasifica" },
      { data: "abr_sistema" },
      { data: "abr_proceso" },
      { data: "codigo_documento", class: "text-center" },
      { data: "nombre_documento" },
      { data: "version_actual", class: "text-center" },
      { data: "fecha_documento", class: "text-center" },
      { data: "docto_pdf", class: "text-center" },
      { data: "docto_word", class: "text-center" }
    ],
    {
      url: $('#documento-ver-pdf-word-datatable').data('source')
    }
  );

  agrupar_filas(
    '#documento-ver-pdf-excel-datatable',
    [
      { columnIndex: "abr_clasifica", label: 'CLASIFICACIÓN: ', indexOrden: 0 },
      { columnIndex: "abr_sistema", label: 'SISTEMA: ', indexOrden: 1 },
      { columnIndex: "abr_proceso", label: 'PROCESO: ', indexOrden: 2 }
    ],
    [
      { responsivePriority: 1, targets: [2] },
      { responsivePriority: 1, targets: [-1, -2] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [3, 4, 5] },
    ],
    opciones,
    [
      { data: "abr_clasifica" },
      { data: "abr_sistema" },
      { data: "abr_proceso" },
      { data: "codigo_documento", class: "text-center" },
      { data: "nombre_documento" },
      { data: "version_actual", class: "text-center" },
      { data: "fecha_documento", class: "text-center" },
      { data: "docto_pdf", class: "text-center" },
      { data: "docto_excel", class: "text-center" }
    ],
    {
      url: $('#documento-ver-pdf-excel-datatable').data('source')
    }
  );

  agrupar_filas(
    '#documento-ver-pdf-datatable',
    [
      { columnIndex: "abr_clasifica", label: 'CLASIFICACIÓN: ', indexOrden: 0 },
      { columnIndex: "abr_sistema", label: 'SISTEMA: ', indexOrden: 1 },
      { columnIndex: "abr_proceso", label: 'PROCESO: ', indexOrden: 2 }
    ],
    [
      { responsivePriority: 1, targets: [2] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [3, 4, 5] },
    ],
    opciones,
    [
      { data: "abr_clasifica" },
      { data: "abr_sistema" },
      { data: "abr_proceso" },
      { data: "codigo_documento", class: "text-center" },
      { data: "nombre_documento" },
      { data: "version_actual", class: "text-center" },
      { data: "fecha_documento", class: "text-center" },
      { data: "docto_pdf", class: "text-center" }
    ],
    {
      url: $('#documento-ver-pdf-datatable').data('source')
    }
  );

  agrupar_filas(
    '#documento-ver-word-excel-datatable',
    [
      { columnIndex: "abr_clasifica", label: 'CLASIFICACIÓN: ', indexOrden: 0 },
      { columnIndex: "abr_sistema", label: 'SISTEMA: ', indexOrden: 1 },
      { columnIndex: "abr_proceso", label: 'PROCESO: ', indexOrden: 2 }
    ],
    [
      { responsivePriority: 1, targets: [2] },
      { responsivePriority: 1, targets: [-1, -2] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [3, 4, 5] },
    ],
    opciones,
    [
      { data: "abr_clasifica" },
      { data: "abr_sistema" },
      { data: "abr_proceso" },
      { data: "codigo_documento", class: "text-center" },
      { data: "nombre_documento" },
      { data: "version_actual", class: "text-center" },
      { data: "fecha_documento", class: "text-center" },
      { data: "docto_word", class: "text-center" },
      { data: "docto_excel", class: "text-center" }
    ],
    {
      url: $('#documento-ver-word-excel-datatable').data('source')
    }
  );

  agrupar_filas(
    '#documento-ver-word-datatable',
    [
      { columnIndex: "abr_clasifica", label: 'CLASIFICACIÓN: ', indexOrden: 0 },
      { columnIndex: "abr_sistema", label: 'SISTEMA: ', indexOrden: 1 },
      { columnIndex: "abr_proceso", label: 'PROCESO: ', indexOrden: 2 }
    ],
    [
      { responsivePriority: 1, targets: [2] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [3, 4, 5] },
    ],
    opciones,
    [
      { data: "abr_clasifica" },
      { data: "abr_sistema" },
      { data: "abr_proceso" },
      { data: "codigo_documento", class: "text-center" },
      { data: "nombre_documento" },
      { data: "version_actual", class: "text-center" },
      { data: "fecha_documento", class: "text-center" },
      { data: "docto_word", class: "text-center" }
    ],
    {
      url: $('#documento-ver-word-datatable').data('source')
    }
  );

  agrupar_filas(
    '#documento-ver-excel-datatable',
    [
      { columnIndex: "abr_clasifica", label: 'CLASIFICACIÓN: ', indexOrden: 0 },
      { columnIndex: "abr_sistema", label: 'SISTEMA: ', indexOrden: 1 },
      { columnIndex: "abr_proceso", label: 'PROCESO: ', indexOrden: 2 }
    ],
    [
      { responsivePriority: 1, targets: [2] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [3, 4, 5] },
    ],
    opciones,
    [
      { data: "abr_clasifica" },
      { data: "abr_sistema" },
      { data: "abr_proceso" },
      { data: "codigo_documento", class: "text-center" },
      { data: "nombre_documento" },
      { data: "version_actual", class: "text-center" },
      { data: "fecha_documento", class: "text-center" },
      { data: "docto_excel", class: "text-center" }
    ],
    {
      url: $('#documento-ver-excel-datatable').data('source')
    }
  );

  agrupar_filas(
    '#documento-sin-botones-datatable',
    [
      { columnIndex: "abr_clasifica", label: 'CLASIFICACIÓN: ', indexOrden: 0 },
      { columnIndex: "abr_sistema", label: 'SISTEMA: ', indexOrden: 1 },
      { columnIndex: "abr_proceso", label: 'PROCESO: ', indexOrden: 2 }
    ],
    [
      { responsivePriority: 1, targets: [2] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [3, 4] },
    ],
    opciones,
    [
      { data: "abr_clasifica" },
      { data: "abr_sistema" },
      { data: "abr_proceso" },
      { data: "codigo_documento", class: "text-center" },
      { data: "nombre_documento" },
      { data: "version_actual", class: "text-center" },
      { data: "fecha_documento", class: "text-center" }
    ],
    {
      url: $('#documento-sin-botones-datatable').data('source')
    }
  );

});