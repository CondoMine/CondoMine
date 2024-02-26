class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: %i[ show edit update destroy ]

  # GET /funcionarios
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios
  def create
    @funcionario = Funcionario.new(funcionario_params)
    if @funcionario.save
      respond_with_success(@funcionario, 'created')
    else
      respond_with_failure(:new, @funcionario.errors)
    end
  end

  # PATCH/PUT /funcionarios/1
  def update
    if @funcionario.update(funcionario_params)
      respond_with_success(@funcionario, 'updated')
    else
      respond_with_failure(:edit, @funcionario.errors)
    end
  end

  # DELETE /funcionarios/1
  def destroy
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: "Funcionario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_funcionario
    @funcionario = Funcionario.find(params[:id])
  end

  def funcionario_params
    params.require(:funcionario).permit(:nome, :cpf, :funcao)
  end

  def respond_with_success(funcionario, action)
    respond_to do |format|
      format.html { redirect_to funcionario_url(funcionario), notice: "Funcionario was successfully #{action}." }
      format.json { render :show, status: action == 'created' ? :created : :ok, location: funcionario }
    end
  end

  def respond_with_failure(action, errors)
    respond_to do |format|
      format.html { render action, status: :unprocessable_entity }
      format.json { render json: errors, status: :unprocessable_entity }
    end
  end
end
