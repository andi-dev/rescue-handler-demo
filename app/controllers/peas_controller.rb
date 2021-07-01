class PeasController < ApplicationController
  class MyError < StandardError; end

  rescue_from MyError, with: :rescue_my_error

  before_action :set_pea, only: %i[show edit update destroy]

  # GET /peas or /peas.json
  def index
    raise MyError
    @peas = Pea.all
  rescue MyError
    render html: "error handled"
  end

  def process_action(*)
    super
  rescue Exception => exception
    request.env["action_dispatch.show_detailed_exceptions"] ||= show_detailed_exceptions?
    rescue_with_handler(exception) || raise
  end

  # GET /peas/1 or /peas/1.json
  def show; end

  # GET /peas/new
  def new
    @pea = Pea.new
  end

  # GET /peas/1/edit
  def edit; end

  # POST /peas or /peas.json
  def create
    @pea = Pea.new(pea_params)

    respond_to do |format|
      if @pea.save
        format.html { redirect_to @pea, notice: 'Pea was successfully created.' }
        format.json { render :show, status: :created, location: @pea }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peas/1 or /peas/1.json
  def update
    respond_to do |format|
      if @pea.update(pea_params)
        format.html { redirect_to @pea, notice: 'Pea was successfully updated.' }
        format.json { render :show, status: :ok, location: @pea }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peas/1 or /peas/1.json
  def destroy
    @pea.destroy
    respond_to do |format|
      format.html { redirect_to peas_url, notice: 'Pea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pea
    @pea = Pea.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pea_params
    params.fetch(:pea, {})
  end

  def rescue_my_error
    raise "rescued from rescue_from in controller"
  end
end