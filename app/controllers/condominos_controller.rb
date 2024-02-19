class CondominosController < ApplicationController
  before_action :set_condomino, only: %i[ show edit update destroy ]

  # GET /condominos or /condominos.json
  def index
    @condominos = if params[:search]
                    if params[:search].match?(/^\d+$/) # Se o parâmetro de busca for um número (possivelmente um CPF)
                      Condomino.where(cpf: params[:search])
                    else
                      Condomino.where('nome LIKE ?', "%#{params[:search]}%")
                    end
                  else
                    Condomino.all
                  end
  end

  # GET /condominos/1 or /condominos/1.json
  def show
  end

  # GET /condominos/new
  def new
    @condomino = Condomino.new
  end

  # GET /condominos/1/edit
  def edit
  end

  # POST /condominos or /condominos.json
  def create
    @condomino = Condomino.new(condomino_params)

    respond_to do |format|
      if @condomino.save
        format.html { redirect_to condomino_url(@condomino), notice: "Condomino was successfully created." }
        format.json { render :show, status: :created, location: @condomino }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @condomino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condominos/1 or /condominos/1.json
  def update
    respond_to do |format|
      if @condomino.update(condomino_params)
        format.html { redirect_to condomino_url(@condomino), notice: "Condomino was successfully updated." }
        format.json { render :show, status: :ok, location: @condomino }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @condomino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condominos/1 or /condominos/1.json
  def destroy
    @condomino.destroy

    respond_to do |format|
      format.html { redirect_to condominos_url, notice: "Condomino was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condomino
      @condomino = Condomino.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def condomino_params
      params.require(:condomino).permit(:nome, :cpf, :contato)
    end
end
