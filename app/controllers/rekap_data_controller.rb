class RekapDataController < ApplicationController
  before_action :set_rekap_datum, only: [:show, :edit, :update, :destroy]

  # GET /rekap_data
  # GET /rekap_data.json
  def index
    @rekap_data = RekapDatum.all

    respond_to do |format|
      format.html
      format.pdf do
        pdf = RekapDataPdf.new(@rekap_data)
        #pdf.text 'Data Hasil Seleksi Tim YSSB Turangga'
        send_data pdf.render, filename: 'rekap_data.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  # GET /rekap_data/1
  # GET /rekap_data/1.json
  def show
  end

  # GET /rekap_data/new
  def new
    @rekap_datum = RekapDatum.new
  end

  # GET /rekap_data/1/edit
  def edit
  end

  # POST /rekap_data
  # POST /rekap_data.json
  def create
    @rekap_datum = RekapDatum.new(rekap_datum_params)

    respond_to do |format|
      if @rekap_datum.save
        format.html { redirect_to request.env["HTTP_REFERER"], notice: "Rekap data #{@rekap_datum.nama} was successfully updated." }
        #format.json { render :show, status: :created, location: @rekap_datum }
      else
        format.html { render :new }
        format.json { render json: @rekap_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rekap_data/1
  # PATCH/PUT /rekap_data/1.json
  def update
    respond_to do |format|
      if @rekap_datum.update(rekap_datum_params)
        format.html { redirect_to @rekap_datum, notice: "Rekap data #{@rekap_datum.nama} was successfully updated." }
        format.json { render :show, status: :ok, location: @rekap_datum }
      else
        format.html { render :edit }
        format.json { render json: @rekap_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rekap_data/1
  # DELETE /rekap_data/1.json
  def destroy
    @rekap_datum.destroy
    respond_to do |format|
      format.html { redirect_to rekap_data_url, notice: 'Rekap datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rekap_datum
      @rekap_datum = RekapDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rekap_datum_params
      params.require(:rekap_datum).permit(:nama, :tanggal_lahir, :alamat, :handphone, :posisi, :nilai, :ranking)
    end
end
