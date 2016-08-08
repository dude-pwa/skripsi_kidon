class BobotsController < ApplicationController
  before_action :set_bobot, only: [:show, :edit, :update, :destroy]

  # GET /bobots
  # GET /bobots.json
  def index
    @bobots = Bobot.all
  end

  # GET /bobots/1
  # GET /bobots/1.json
  def show
  end

  # GET /bobots/new
  def new
    @bobot = Bobot.new
  end

  # GET /bobots/1/edit
  def edit
  end

  # POST /bobots
  # POST /bobots.json
  def create
    @bobot = Bobot.new(bobot_params)

    respond_to do |format|
      if @bobot.save
        format.html { redirect_to @bobot, notice: 'Bobot was successfully created.' }
        format.json { render :show, status: :created, location: @bobot }
      else
        format.html { render :new }
        format.json { render json: @bobot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bobots/1
  # PATCH/PUT /bobots/1.json
  def update
    respond_to do |format|
      if @bobot.update(bobot_params)
        format.html { redirect_to @bobot, notice: 'Bobot was successfully updated.' }
        format.json { render :show, status: :ok, location: @bobot }
      else
        format.html { render :edit }
        format.json { render json: @bobot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bobots/1
  # DELETE /bobots/1.json
  def destroy
    @bobot.destroy
    respond_to do |format|
      format.html { redirect_to bobots_url, notice: 'Bobot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bobot
      @bobot = Bobot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bobot_params
      params.require(:bobot).permit(:w1, :w2, :w3, :w4, :w5)
    end
end
