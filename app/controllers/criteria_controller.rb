class CriteriaController < ApplicationController
  before_action :set_criterium, only: [:show, :edit, :update, :destroy]

  # GET /criteria
  # GET /criteria.json
  def index
    @criteria = Criterium.order(id: 'asc')
    @groups = Group.all
  end

  def topsis
    @criteria = Criterium.where(group_id: params[:group_id])
    @kriteria = Criterium.where(group_id: params[:group_id])
    @grup = Group.find(params[:group_id])
    @bobot = Bobot.find(1)

    @rekap_datum = RekapDatum.new

    ## membuat instance variabel
    i = 1
    if @criteria.count == 5
      @criteria.each do |criterium|
        # Logika Bobot
          if criterium.tinggi_badan > 155
            criterium.tinggi_badan = 5;
          elsif criterium.tinggi_badan >= 151 && criterium.tinggi_badan <= 155
            criterium.tinggi_badan = 4;
          elsif criterium.tinggi_badan >= 146 && criterium.tinggi_badan <= 150
            criterium.tinggi_badan = 3;
          elsif criterium.tinggi_badan >= 141 && criterium.tinggi_badan <= 145
            criterium.tinggi_badan = 2;
          elsif criterium.tinggi_badan >= 141 && criterium.tinggi_badan <= 145
            criterium.tinggi_badan = 1;
          end

          # =====================
          if criterium.berat_badan >= 56 && criterium.berat_badan <= 65
            criterium.berat_badan = 4;
          elsif criterium.berat_badan >= 51 && criterium.berat_badan <= 55
            criterium.berat_badan = 3;
          elsif criterium.berat_badan >= 45 && criterium.berat_badan <= 50
            criterium.berat_badan = 2;
          end

          # =====================
          if criterium.kecepatan_berlari < 5
             criterium.kecepatan_berlari = 3;
          elsif criterium.kecepatan_berlari >= 5 && criterium.kecepatan_berlari <= 6
             criterium.kecepatan_berlari = 2;
          elsif criterium.kecepatan_berlari > 6
             criterium.kecepatan_berlari = 1;
          end
          
          # =====================
          if criterium.akurasi_tendangan == 'Tepat'
             criterium.akurasi_tendangan = 2;
          elsif criterium.akurasi_tendangan == 'Kurang Tepat'
             criterium.akurasi_tendangan = 1;
          end
        # end Logika bobot
        member = Member.find(criterium.member_id)
          self.instance_variable_set "@a#{i}", member.nama
          self.instance_variable_set "@a#{i}c1", criterium.tinggi_badan 
          self.instance_variable_set "@a#{i}c2", criterium.berat_badan 
          self.instance_variable_set "@a#{i}c3", criterium.kecepatan_berlari 
          self.instance_variable_set "@a#{i}c4", criterium.akurasi_tendangan.to_i
          self.instance_variable_set "@a#{i}c5", criterium.mental_bertanding 
        i+=1  
      end

    # ========= START RUMUS R
    @jumlahPangkatC1 = Math.sqrt((@a1c1*@a1c1) + (@a2c1*@a2c1) + (@a3c1*@a3c1) + (@a4c1*@a4c1) + (@a5c1*@a5c1))
    @jumlahPangkatC2 = Math.sqrt((@a1c2*@a1c2) + (@a2c2*@a2c2) + (@a3c2*@a3c2) + (@a4c2*@a4c2) + (@a5c2*@a5c2))
    @jumlahPangkatC3 = Math.sqrt((@a1c3*@a1c3) + (@a2c3*@a2c3) + (@a3c3*@a3c3) + (@a4c3*@a4c3) + (@a5c3*@a5c3))
    @jumlahPangkatC4 = Math.sqrt((@a1c4*@a1c4) + (@a2c4*@a2c4) + (@a3c4*@a3c4) + (@a4c4*@a4c4) + (@a5c4*@a5c4))
    @jumlahPangkatC5 = Math.sqrt((@a1c5*@a1c5) + (@a2c5*@a2c5) + (@a3c5*@a3c5) + (@a4c5*@a4c5) + (@a5c5*@a5c5))

    # ========= START RUMUS Y
    @y1a = @a1c1 / @jumlahPangkatC1 * @bobot.w1
    @y1b = @a2c1 / @jumlahPangkatC1 * @bobot.w1
    @y1c = @a3c1 / @jumlahPangkatC1 * @bobot.w1
    @y1d = @a4c1 / @jumlahPangkatC1 * @bobot.w1
    @y1e = @a5c1 / @jumlahPangkatC1 * @bobot.w1

    @y2a = @a1c2 / @jumlahPangkatC2 * @bobot.w2
    @y2b = @a2c2 / @jumlahPangkatC2 * @bobot.w2
    @y2c = @a3c2 / @jumlahPangkatC2 * @bobot.w2
    @y2d = @a4c2 / @jumlahPangkatC2 * @bobot.w2
    @y2e = @a5c2 / @jumlahPangkatC2 * @bobot.w2

    @y3a = @a1c3 / @jumlahPangkatC3 * @bobot.w3
    @y3b = @a2c3 / @jumlahPangkatC3 * @bobot.w3
    @y3c = @a3c3 / @jumlahPangkatC3 * @bobot.w3
    @y3d = @a4c3 / @jumlahPangkatC3 * @bobot.w3
    @y3e = @a5c3 / @jumlahPangkatC3 * @bobot.w3

    @y4a = @a1c4 / @jumlahPangkatC4 * @bobot.w4
    @y4b = @a2c4 / @jumlahPangkatC4 * @bobot.w4
    @y4c = @a3c4 / @jumlahPangkatC4 * @bobot.w4
    @y4d = @a4c4 / @jumlahPangkatC4 * @bobot.w4
    @y4e = @a5c4 / @jumlahPangkatC4 * @bobot.w4

    @y5a = @a1c5 / @jumlahPangkatC5 * @bobot.w5
    @y5b = @a2c5 / @jumlahPangkatC5 * @bobot.w5
    @y5c = @a3c5 / @jumlahPangkatC5 * @bobot.w5
    @y5d = @a4c5 / @jumlahPangkatC5 * @bobot.w5
    @y5e = @a5c5 / @jumlahPangkatC5 * @bobot.w5

    @y1 = [@y1a, @y1b, @y1c, @y1d, @y1e].min
    @y2 = [@y2a, @y2b, @y2c, @y2d, @y2e].min
    @y3 = [@y3a, @y3b, @y3c, @y3d, @y3e].min
    @y4 = [@y4a, @y4b, @y4c, @y4d, @y4e].min
    @y5 = [@y5a, @y5b, @y5c, @y5d, @y5e].min

    @y1m = [@y1a, @y1b, @y1c, @y1d, @y1e].max
    @y2m = [@y2a, @y2b, @y2c, @y2d, @y2e].max
    @y3m = [@y3a, @y3b, @y3c, @y3d, @y3e].max
    @y4m = [@y4a, @y4b, @y4c, @y4d, @y4e].max
    @y5m = [@y5a, @y5b, @y5c, @y5d, @y5e].max

    # ============ START FUNGSI D
    @d1 = Math.sqrt(((@y1 - @y1a) * (@y1 - @y1a)) + ((@y2 - @y2a) * (@y2 - @y2a)) + ((@y3 - @y3a) * (@y3 - @y3a)) + ((@y4 - @y4a) * (@y4 - @y4a)) + ((@y5 - @y5a) * (@y5 - @y5a)))
    @d2 = Math.sqrt(((@y1 - @y1b) * (@y1 - @y1b)) + ((@y2 - @y2b) * (@y2 - @y2b)) + ((@y3 - @y3b) * (@y3 - @y3b)) + ((@y4 - @y4b) * (@y4 - @y4b)) + ((@y5 - @y5b) * (@y5 - @y5b)))
    @d3 = Math.sqrt(((@y1 - @y1c) * (@y1 - @y1c)) + ((@y2 - @y2c) * (@y2 - @y2c)) + ((@y3 - @y3c) * (@y3 - @y3c)) + ((@y4 - @y4c) * (@y4 - @y4c)) + ((@y5 - @y5c) * (@y5 - @y5c)))
    @d4 = Math.sqrt(((@y1 - @y1d) * (@y1 - @y1d)) + ((@y2 - @y2d) * (@y2 - @y2d)) + ((@y3 - @y3d) * (@y3 - @y3d)) + ((@y4 - @y4d) * (@y4 - @y4d)) + ((@y5 - @y5d) * (@y5 - @y5d)))
    @d5 = Math.sqrt(((@y1 - @y1e) * (@y1 - @y1e)) + ((@y2 - @y2e) * (@y2 - @y2e)) + ((@y3 - @y3e) * (@y3 - @y3e)) + ((@y4 - @y4e) * (@y4 - @y4e)) + ((@y5 - @y5e) * (@y5 - @y5e)))

    @d1m = Math.sqrt(((@y1m - @y1a) * (@y1m - @y1a)) + ((@y2m - @y2a) * (@y2m - @y2a)) + ((@y3m - @y3a) * (@y3m - @y3a)) + ((@y4m - @y4a) * (@y4m - @y4a)) + ((@y5m - @y5a) * (@y5m - @y5a)));
    @d2m = Math.sqrt(((@y1m - @y1b) * (@y1m - @y1b)) + ((@y2m - @y2b) * (@y2m - @y2b)) + ((@y3m - @y3b) * (@y3m - @y3b)) + ((@y4m - @y4b) * (@y4m - @y4b)) + ((@y5m - @y5b) * (@y5m - @y5b)));
    @d3m = Math.sqrt(((@y1m - @y1c) * (@y1m - @y1c)) + ((@y2m - @y2c) * (@y2m - @y2c)) + ((@y3m - @y3c) * (@y3m - @y3c)) + ((@y4m - @y4c) * (@y4m - @y4c)) + ((@y5m - @y5c) * (@y5m - @y5c)));
    @d4m = Math.sqrt(((@y1m - @y1d) * (@y1m - @y1d)) + ((@y2m - @y2d) * (@y2m - @y2d)) + ((@y3m - @y3d) * (@y3m - @y3d)) + ((@y4m - @y4d) * (@y4m - @y4d)) + ((@y5m - @y5d) * (@y5m - @y5d)));
    @d5m = Math.sqrt(((@y1m - @y1e) * (@y1m - @y1e)) + ((@y2m - @y2e) * (@y2m - @y2e)) + ((@y3m - @y3e) * (@y3m - @y3e)) + ((@y4m - @y4e) * (@y4m - @y4e)) + ((@y5m - @y5e) * (@y5m - @y5e)));

    # =========== START FUNGSI HASIL
    @v1 = @d1 / (@d1m + @d1);
    @v2 = @d2 / (@d2m + @d2);
    @v3 = @d3 / (@d3m + @d3);
    @v4 = @d4 / (@d4m + @d4);
    @v5 = @d5 / (@d5m + @d5);

    # =========== RANKING
    @hash = {@a1 => @v1, @a2 => @v2, @a3 => @v3, @a4 => @v4, @a5 => @v5}
    @rank = @hash.sort_by { |nama, hasil| hasil }.reverse

    # @hash = {
    #   :a1 => { :name => @a1, :hasil => @v1 },
    #   :a2 => { :name => @a2, :hasil => @v2 },
    #   :a3 => { :name => @a3, :hasil => @v3 },
    #   :a4 => { :name => @a4, :hasil => @v4 },
    #   :a5 => { :name => @a5, :hasil => @v5 }
    # }

    end    
  end

  # GET /criteria/1
  # GET /criteria/1.json
  def show
  end

  # GET /criteria/new
  def new
    @criterium = Criterium.new
  end

  # GET /criteria/1/edit
  def edit
  end

  # POST /criteria
  # POST /criteria.json
  def create
    @criterium = Criterium.new(criterium_params)

    respond_to do |format|
      if @criterium.save
        format.html { redirect_to @criterium, notice: 'Criterium was successfully created.' }
        format.json { render :show, status: :created, location: @criterium }
      else
        format.html { render :new }
        format.json { render json: @criterium.errors, status: :unprocessable_entity }
      end
    end

   # if params[:rekap_datum] != nil
   #    @rekap_datum = RekapDatum.new(rekap_datum_params)
   #    respond_to do |format|
   #      if @rekap_datum.save
   #        #format.html { redirect_to @rekap_datum, notice: 'Rekap datum was successfully created.' }
   #        #format.json { render :show, status: :created, location: @rekap_datum }
   #        redirect_to request.env["HTTP_REFERER"], notice: 'Rekap datum was successfully created.'
   #      else
   #        format.html { render :new }
   #        format.json { render json: @rekap_datum.errors, status: :unprocessable_entity }
   #      end
   #    end
   #  end
  end

  # PATCH/PUT /criteria/1
  # PATCH/PUT /criteria/1.json
  def update
    respond_to do |format|
      if @criterium.update(criterium_params)
        format.html { redirect_to @criterium, notice: 'Criterium was successfully updated.' }
        format.json { render :show, status: :ok, location: @criterium }
      else
        format.html { render :edit }
        format.json { render json: @criterium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criteria/1
  # DELETE /criteria/1.json
  def destroy
    @criterium.destroy
    respond_to do |format|
      format.html { redirect_to criteria_url, notice: 'Criterium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterium
      @criterium = Criterium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criterium_params
      params.require(:criterium).permit(:tinggi_badan, :berat_badan, :kecepatan_berlari, :akurasi_tendangan, :mental_bertanding, :member_id, :group_id)
    end

    # def rekap_datum_params
    #   params.require(:rekap_datum).permit(:nama, :tanggal_lahir, :alamat, :handphone, :posisi, :nilai, :ranking)
    # end
end
