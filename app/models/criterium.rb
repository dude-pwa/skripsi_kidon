class Criterium < ActiveRecord::Base
  belongs_to :member
  belongs_to :group

  validates :tinggi_badan, presence: true
  validates :berat_badan, presence: true
  validates :kecepatan_berlari, presence: true
  validates :akurasi_tendangan, presence: true
  validates :prestasi, presence: true

  def logika_bobot
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
  	elsif criterium.kecepatan_berlari > 5 &&  criterium.kecepatan_berlari < 6
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
  end
  
end
