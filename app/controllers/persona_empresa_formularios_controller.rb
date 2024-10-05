class PersonaEmpresaFormulariosController < ApplicationController
  before_action :set_persona_empresa_formulario, only: %i[ show edit update destroy ]
  before_action :comprobar_permiso

  def index_permisos
    @usuarios = Persona.all.limit(10)
    puts "EMPRESA CONFIGURADA PARA EL USUARIO EN SESSION: #{current_user_empresa_id}"
  end

  def search_areas_persona

    id_persona = params[:area_empresa_persona_id_param]

    @empareas = PersonasArea.joins("inner join personas on personas.id = personas_areas.persona_id
                                  where personas.id = #{id_persona}
                                  and personas_areas.estado = 'A'")

    respond_to do |format|
        format.json { render json: @empareas.map { |p| { id: p.area_id, area: p.nombre_area} } }
      end
  end

  def consulta_permisos
    session[:id_persona_consulta_permiso] = params[:permisos_form][:id]
    session[:id_area_persona_consulta_permiso] = params[:permisos_form][:area_id]

    respond_to do |format|
      format.html { redirect_to mostrar_permisos_path }
      format.json { head :no_content }
    end
  end

  def mostrar_permisos
    @persona = Persona.find(session[:id_persona_consulta_permiso])

    @empresa = Empresa.joins("inner join areas on empresas.id = areas.empresa_id where areas.id = #{session[:id_area_persona_consulta_permiso]}").first

    @area = Area.find(session[:id_area_persona_consulta_permiso])


     @opcionesConfiguradas = PersonaEmpresaFormulario.includes(opcion_ca: [:componente, :atributo, opcion: [:menu, :sub_opcion]], personas_area: [persona: [:user], area: [:empresa]])
                                                     .joins("inner join personas_areas on persona_empresa_formularios.personas_area_id = personas_areas.id
                                                            inner join areas on personas_areas.area_id = areas.id
                                                            inner join empresas on empresas.id = areas.empresa_id
                                                            inner join personas on personas_areas.persona_id = personas.id
                                                            inner join opcion_cas on opcion_cas.id = persona_empresa_formularios.opcion_ca_id
                                                            inner join opciones on opciones.id = opcion_cas.opcion_id
                                                            WHERE
                                                            personas.id = #{@persona.id}
                                                            and areas.id = #{session[:id_area_persona_consulta_permiso]}").distinct

    @permisosConfigurados = PersonaEmpresaFormulario.includes(opcion_ca: [:componente, :atributo, opcion: [:menu, :sub_opcion]], personas_area: [persona: [:user], area: [:empresa]])
                                                    .joins("inner join personas_areas on persona_empresa_formularios.personas_area_id = personas_areas.id
                                                            inner join areas on personas_areas.area_id = areas.id
                                                            inner join empresas on empresas.id = areas.empresa_id
                                                            inner join personas on personas_areas.persona_id = personas.id
                                                            inner join opcion_cas on opcion_cas.id = persona_empresa_formularios.opcion_ca_id
                                                            inner join opciones on opciones.id = opcion_cas.opcion_id
                                                            WHERE
                                                            personas.id = #{@persona.id}
                                                            and areas.id = #{session[:id_area_persona_consulta_permiso]}")

  end


  def agregar_permiso
    respond_to do |format|
      format.html { redirect_to mostrar_agregar_permisos_path }
      format.json { head :no_content }
    end
  end

  def mostrar_agregar_permisos
    @persona = Persona.find(session[:id_persona_consulta_permiso])

    @area = Area.find(session[:id_area_persona_consulta_permiso])

    @menu_x_role = [];

  end

  def obtener_opciones_por_perfil
    role_id = params[:role_id]
    @menu_x_role = MenuRol.where("rol_id = ? and estado='A'", role_id.to_i)


    respond_to do |format|
      if @menu_x_role.count > 0
        htmlGenerado = ""
        atributosComponentes = ""

        @menu_x_role.each do |mxr|
          atributosComponentes = ""
          items = mxr.opcion.opcion_cas
          items.sort_by { |oc| "#{oc.opcion.menu.id} #{oc.opcion.id}"}.each do |oc|

            atributosComponentes << "<li class='list-group-item d-flex justify-content-between align-items-center flex-wrap'>
                                      <h6>#{oc.componente.nombre}</h6>
                                      <span class='text-secondary'>
                                        #{oc.atributo.nombre}
                                        <input type='checkbox' class='#{mxr.opcion.nombre.upcase.gsub " ", "_"}' name='permisoids[]' value='#{oc.id}' checked=true/>
                                      </span>
                                     </li>"
          end

          tarjeta = "<div class='col-md-4'>
                      <div class='card border-bottom-success'>
                        <div class='card-header text-success'>
                          <div class='row'>
                            <div class='col-10 text-left'>
                              <h6 style='font-size: 12px;'>#{mxr.opcion.menu.nombre.upcase}:</h6>
                              <h6 style='color: #f18313;'>#{mxr.opcion.nombre.upcase}</h6>
                            </div>
                            <div class='col-2 text-right' style='margin-top: 15px;'>
                              <a href='#' data-toggle='collapse' data-target='#collapse#{mxr.opcion.nombre.upcase.gsub ' ', '_'}' aria-expanded='true' class=''>
                                <i class='icon-action fa fa-chevron-down' style='color:#6c6868'></i>
                              </a>
                            </div>
                          </div>
                        </div>
                        <div class='collapse' id='collapse#{mxr.opcion.nombre.upcase.gsub ' ', '_'}' style=''>
                          <div class='card-body'>
                            <div class='text-right'>
                              <label id='car'>Todos</label>
                                <input type='checkbox' id='select-all#{mxr.opcion.nombre.upcase.gsub " ", "_"}' checked=true style='margin-right: 20px;'>
                            </div>
                            <div class='card mt-3'>
                              <ul class='list-group list-group-flush'>
                                #{atributosComponentes}
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                        <br>
                    </div>

                    <script>
                      document.getElementById('select-all#{mxr.opcion.nombre.upcase.gsub " ", "_"}').onclick = function() {
                        var checkboxes = document.querySelectorAll('input[class=#{mxr.opcion.nombre.upcase.gsub " ", "_"}]');
                        for (var checkbox of checkboxes) {
                          checkbox.checked = this.checked;
                        }
                      }
                    </script>"

          htmlGenerado << tarjeta
        end

        format.json { render json: { response: 1, data: htmlGenerado }  }
      else
        format.json { render json: { response: 0 }  }
      end
    end
  end

  def obtener_opciones_por_individual
    opcion_id = params[:opcion_id]
    @atributos_x_opcion = OpcionCa.where("opcion_id = ?", opcion_id.to_i)


    respond_to do |format|
      if @atributos_x_opcion.count > 0
        htmlGenerado = ""
        atributosComponentes = ""
        nombreMenu = ""
        nombreOpcion = ""

        @atributos_x_opcion.each do |oc|
          atributosComponentes << "<li
                                      class='list-group-item d-flex justify-content-between align-items-center flex-wrap'>
                                      <h6>#{oc.componente.nombre}</h6>
                                      <span class='text-secondary'>
                                          #{oc.atributo.nombre}
                                          <input type='checkbox' name='permisoids[]' value='#{oc.id}' checked=true/>
                                      </span>
                                   </li>"

          nombreMenu = oc.opcion.menu.nombre.upcase
          nombreOpcion = oc.opcion.nombre.upcase
        end

        tarjeta = "<div class='col-md-4'>
                        <div class='card border-bottom-success'>
                            <div class='card-header text-success'>
                                #{nombreMenu}: #{nombreOpcion}
                            </div>
                            <div class='card-body'>
                              <div class='text-right'>
                              <label id='car'>Todos</label>
                                <input type='checkbox' id='select-all' checked=true style='
                                margin-right: 20px;'>
                              </div>
                              <div class='card mt-3'>
                                  <ul class='list-group list-group-flush'>
                                      #{atributosComponentes}
                                  </ul>
                              </div>
                            </div>
                          </div>
                      </div>

                      <script>
                      document.getElementById('select-all').onclick = function() {
                        var checkboxes = document.getElementsByName('permisoids[]');
                        for (var checkbox of checkboxes) {
                          checkbox.checked = this.checked;
                        }
                      }
                      </script>
                    "
          htmlGenerado << tarjeta

        format.json { render json: { response: 1, data: htmlGenerado }  }
      else
        format.json { render json: { response: 0 }  }
      end
    end
  end

  def guardar_permisos

    @personaEA = PersonasArea.where("area_id = ? and persona_id = ?", session[:id_area_persona_consulta_permiso], session[:id_persona_consulta_permiso]).first
    @permisosSeleccionados = params[:permisoids]
    @tipoAsignacion = ""
    @resultado = 0
    if params_permisos[:options] == "0"
      @tipoAsignacion = "PERFIL"
    else
      @tipoAsignacion = "INDIVIDUAL"
    end

      if !@permisosSeleccionados.nil?
        @permisosSeleccionados.each do |acpo|
          @permisoUsuario = PersonaEmpresaFormulario.new
          @permisoUsuario.personas_area_id = @personaEA.id
          @permisoUsuario.opcion_ca_id = acpo.to_i
          @permisoUsuario.descripcion = @tipoAsignacion
          @permisoUsuario.estado = "A"
          @permisoUsuario.save
        end
        respond_to do |format|
          format.html { redirect_to mostrar_permisos_path, notice: "Permisos otorgados al usuario exitosamente" }
        end
      else
        respond_to do |format|
          format.html { redirect_to mostrar_permisos_path, alert: "No se agregó ningun permiso" }
        end
      end

  end

  def eliminar_seleccionados
    ids_seleccionados = params[:componentes_seleccionados]

    if ids_seleccionados.present?
      PersonaEmpresaFormulario.where(id: ids_seleccionados).destroy_all
      flash[:notice] = 'Componentes seleccionados eliminados exitosamente.'
    else
      flash[:error] = 'Por favor, selecciona al menos un componente para eliminar.'
    end

    redirect_to mostrar_permisos_path
  end

  def eliminar_permiso
    @idPermiso = params[:id]

    @permiso = PersonaEmpresaFormulario.find(@idPermiso)
    @permiso.destroy
    respond_to do |format|
      format.html { redirect_to mostrar_permisos_path, notice: "Permiso eliminado Exitosamente" }
      format.json { head :no_content }
    end
  end


  def search_usuario
    parametro = params[:q].upcase

    #cambios se quito  la validacion areas.empresa_id = (#{current_user_empresa_id})
    @usuarios = Persona.select(:id, :nombre, :apellido, :user_id)
                       .joins(" inner join users on personas.user_id = users.id
                                inner join personas_areas on personas_areas.persona_id = personas.id
                                inner join areas on personas_areas.area_id = areas.id
                                where personas.estado = 'A'
                                and upper(personas.nombre || ' ' || personas.apellido || ' ' ||  users.email) like upper('%#{parametro}%')").distinct.limit(50)
    respond_to do |format|
      format.json { render json: @usuarios.map { |p| { valor_id: p.id, valor_text: p.nombre_completo_con_email } } }
    end
  end


  # GET /persona_empresa_formularios or /persona_empresa_formularios.json
  def index
    @persona_empresa_formularios = PersonaEmpresaFormulario.all
  end

  # GET /persona_empresa_formularios/1 or /persona_empresa_formularios/1.json
  def show
  end

  # GET /persona_empresa_formularios/new
  def new
    @persona_empresa_formulario = PersonaEmpresaFormulario.new
  end

  # GET /persona_empresa_formularios/1/edit
  def edit
  end

  # POST /persona_empresa_formularios or /persona_empresa_formularios.json
  def create
    @persona_empresa_formulario = PersonaEmpresaFormulario.new(persona_empresa_formulario_params)

    respond_to do |format|
      if @persona_empresa_formulario.save
        format.html { redirect_to @persona_empresa_formulario, notice: "Persona empresa formulario was successfully created." }
        format.json { render :show, status: :created, location: @persona_empresa_formulario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @persona_empresa_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /persona_empresa_formularios/1 or /persona_empresa_formularios/1.json
  def update
    respond_to do |format|
      if @persona_empresa_formulario.update(persona_empresa_formulario_params)
        format.html { redirect_to @persona_empresa_formulario, notice: "Persona empresa formulario was successfully updated." }
        format.json { render :show, status: :ok, location: @persona_empresa_formulario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @persona_empresa_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /persona_empresa_formularios/1 or /persona_empresa_formularios/1.json
  def destroy
    @persona_empresa_formulario.destroy
    respond_to do |format|
      format.html { redirect_to persona_empresa_formularios_url, notice: "Persona empresa formulario was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona_empresa_formulario
      @persona_empresa_formulario = PersonaEmpresaFormulario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def persona_empresa_formulario_params
      params.require(:persona_empresa_formulario).permit(:personas_area_id, :opcion_ca_id, :descripcion, :estado, :user_created_id, :user_updated_id)
    end

    def params_permisos
      params.require(:add_permisos).permit(:nombre_usuario, :persona_id, :area_id, :listaPermisoIds, :options, :perfil_id, :opcion_id)
    end
end
