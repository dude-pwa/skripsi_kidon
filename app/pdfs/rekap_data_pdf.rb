class RekapDataPdf < Prawn::Document
	@@i = 1

	def initialize(rekap_data)
		super(page_size: 'A4', page_layout: :landscape)
		@rekap_data = RekapDatum.order('ranking asc').all
		data

	end

	def data
		text "Data Hasil Seleksi Tim YSSB Turangga\n\n", size: 24
		table data_all do
			row(0).font_style = :bold
			#columns(1..3).align = :right
			self.row_colors = ['dddddd', 'ffffff']
			self.header = true
			row(1..30).size = 10
		end
	end

	def data_all
		[['No', 'Nama', 'Tanggal Lahir', 'Alamat', 'Handphone', 'Posisi', 'Nilai', 'Ranking']] + 
		@rekap_data.map.with_index do |rekapan, index|
			[index+1, rekapan.nama, rekapan.tanggal_lahir, rekapan.alamat, rekapan.handphone, rekapan.posisi, rekapan.nilai, rekapan.ranking]
		end
	end
end