class AmbientesController < ApplicationController
  before_action :set_ambiente, only: %i[ show edit update destroy ]

  # GET /ambientes or /ambientes.json
  def index
    @ambientes = Ambiente.all
  end

  # GET /ambientes/1 or /ambientes/1.json
  def show
  end

  # GET /ambientes/new
  def new
    @ambiente = Ambiente.new
  end

  # GET /ambientes/1/edit
  def edit
  end

  # POST /ambientes or /ambientes.json
  def create
    @ambiente = Ambiente.new(ambiente_params)

    respond_to do |format|
      if @ambiente.save
        success_response(@ambiente, 'created')
      else
        failure_response(:new, @ambiente.errors)
      end
    end
  end

  # PATCH/PUT /ambientes/1 or /ambientes/1.json
  def update
    respond_to do |format|
      if @ambiente.update(ambiente_params)
        success_response(@ambiente, 'updated')
      else
        failure_response(:edit, @ambiente.errors)
      end
    end
  end

  # DELETE /ambientes/1 or /ambientes/1.json
  def destroy
    @ambiente.destroy
    respond_to do |format|
      format.html { redirect_to ambientes_url, notice: "Ambiente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_ambiente
    @ambiente = Ambiente.find(params[:id])
  end

  def ambiente_params
    params.require(:ambiente).permit(:nome, :tipo)
  end

  def success_response(ambiente, action)
    respond_to do |format|
      format.html { redirect_to ambiente_url(ambiente), notice: "Ambiente was successfully #{action}." }
      format.json { render :show, status: action == 'created' ? :created : :ok, location: ambiente }
    end
  end

  def failure_response(action, errors)
    respond_to do |format|
      format.html { render action, status: :unprocessable_entity }
      format.json { render json: errors, status: :unprocessable_entity }
    end
  end
end
