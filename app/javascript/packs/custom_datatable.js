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

  //configuracion para datatables agrupados por columnas dinamico
  /**
  * Función para agrupar filas en un DataTable en base a múltiples columnas.
  * @param {string} var_dom - Selector o elemento DOM donde se mostrará el DataTable. Por ejemplo, '#datatable_familia_producto' o document.getElementById('datatable_familia_producto').
  * @param {Array} agrupaciones - Un array que contiene objetos con detalles de las columnas que se utilizarán para la agrupación. Cada objeto debe tener la forma { columnIndex: number, label: string }, donde columnIndex es el índice de la columna (comenzando desde 0) y label es el nombre o etiqueta de la columna que se utilizará para mostrar el nombre del grupo.
  * @param {Array|null} columnDefs - Un array opcional que contiene configuraciones adicionales para las columnas del DataTable, en el formato requerido por DataTables columnDefs. Puede ser nulo si no se necesita ninguna configuración adicional.
  * @param {Object} options - Opciones adicionales para configurar el DataTable, siguiendo el formato de configuración del DataTable. Puedes personalizar opciones como el orden, dom, lenguaje, botones, etc.
  */
  function agrupar_filas(var_dom, agrupaciones, columnDefs, options) {
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
        pagingType: options.pagingType
      });
      return;
    }

    var dataSrc = agrupaciones.map(agrupacion => agrupacion.columnIndex);
    var orden = agrupaciones.length > 1 ? 
                agrupaciones.map(agrupacion => [agrupacion.columnIndex, agrupacion.order || 'asc']) :
                [];

    $(var_dom).DataTable({
        "order": orden,
        "columnDefs": [...agrupaciones.map(agrupacion => ({ "visible": false, "targets": agrupacion.columnIndex })), ...(columnDefs ?? [])],
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
        pagingType: options.pagingType
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
    pagingType: "simple_numbers"
  };

  $('#datatable').DataTable({
    columnDefs: [
      { responsivePriority: 1, targets: [0] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [1, 2 , 4] },
    ],
    fixedHeader: true,
    stateSave: true,
    stateDuration: 1200,
    responsive: "true",
    lengthMenu: 
    [
      [25, 5, 10, 15, 50, -1],
      [25, 5, 10, 15, 50, 'Todos'],
    ],
    dom: var_dom,
    language: espanol,
    buttons: btnDescarga,
    pagingType: "simple_numbers"
  });

  agrupar_filas(
    '#datatable_area',
    [
      { columnIndex: 3, label: '' }
    ],
    [
      { responsivePriority: 1, targets: [0] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [1, 2 , 4] }
    ],
    opciones
  );

  agrupar_filas(
    '#datatable_usuario_area',
    [
      { columnIndex: 3, label: '' },
      { columnIndex: 2, label: '' }
    ],
    [
      { responsivePriority: 1, targets: [0] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [1, 2] }
    ],
    opciones
  );

  agrupar_filas(
    '#datatable_opcion',
    [
      { columnIndex: 6, label: '' }
    ],
    [
      { responsivePriority: 1, targets: [0, 2] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [1, 4, 5, -2] }
    ],
    opciones
  );

  agrupar_filas(
    '#datatable_menu_rol',
    [
      { columnIndex: 1, label: '' },
      { columnIndex: 3, label: '' }
    ],
    [
      { responsivePriority: 1, targets: [0] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [2, 3] }
    ],
    opciones
  );

  agrupar_filas(
    '#datatable_estado_documento',
    [
      { columnIndex: 2, label: '' },
    ],
    [
      { responsivePriority: 1, targets: [0] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [2, -2] }
    ],
    opciones
  );
  
  agrupar_filas(
    '#datatable_proceso',
    [
      { columnIndex: 3, label: '' },
      { columnIndex: 4, label: '' },
    ],
    [
      { responsivePriority: 1, targets: [0, 1] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [2, -2] }
    ],
    opciones
  );

  agrupar_filas(
    '#datatable_actividad_proceso',
    [
      { columnIndex: 2, label: '' },
    ],
    [
      { responsivePriority: 1, targets: [0, 1] },
      { responsivePriority: 1, targets: [-1] }, // Muestra las últimas dos columnas
      { responsivePriority: 2, targets: [2, -2] }
    ],
    opciones
  );

});