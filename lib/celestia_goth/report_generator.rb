require 'prawn'

module CelestiaGoth
  class ReportGenerator
    def self.generate(ep_id, episode_data)
      Prawn::Fonts::AFM.hide_m17n_warning = true
      pdf = Prawn::Document.new(page_size: 'A4', margin: 40)
      
      transcript_path = File.expand_path("../../../data/ep#{ep_id}_transcript.md", __dir__)
      transcript_content = File.exist?(transcript_path) ? File.read(transcript_path) : "NO TRANSCRIPT FOUND FOR EPISODE #{ep_id}"

      pdf.font("Courier")
      
      # PAGE 1: COVER
      pdf.fill_color "330000"
      pdf.text "=====================================================================", align: :center
      pdf.move_down 50
      pdf.text "CELESTIA GOTH OS - MASTERING & ARRANGEMENT FAILURE REPORT", align: :center, size: 16, style: :bold
      pdf.move_down 50
      pdf.text "=====================================================================", align: :center
      pdf.move_down 100
      
      pdf.fill_color "000000"
      pdf.text "EPISODE: #{episode_data[:title]}", size: 14, style: :bold
      pdf.text "DOMINANT FREQUENCY/VILLAIN: #{episode_data[:villain]}", size: 14
      pdf.move_down 50
      pdf.text "REFERENCE MATERIALS:", size: 12, style: :bold
      pdf.text "- Compendio_Tecnicas_Composicion.pdf", size: 10
      pdf.text "- Film_Scoring_Literary_Encyclopedia_Complete.pdf", size: 10
      
      # PAGE 2: NARRATIVE TRANSLATION
      pdf.start_new_page
      pdf.text "1. THEMATIC & FREQUENCY ANALYSIS OF OBSTACLES", size: 14, style: :bold
      pdf.move_down 20
      
      # Generar texto de análisis basado en audio
      pdf.text "La estructura armónica del episodio se vio severamente comprometida. El sujeto '#{episode_data[:villain]}' introdujo una onda estacionaria en la mezcla que enmascaró completamente las frecuencias de la protagonista.", size: 10
      pdf.move_down 10
      pdf.text "Desde la perspectiva de producción discográfica, el clímax narrativo falló debido a una sobrecompresión en el bus maestro (representando el miedo o el conflicto ineludible). No se dejó rango dinámico para que la 'magia de la amistad' respirara.", size: 10
      
      pdf.move_down 20
      pdf.text "EXTRACTO DE TRANSCRIPT COMO ONDAS DE AUDIO:", style: :bold
      pdf.move_down 10
      # Tomar fragmentos del transcript
      lines = transcript_content.lines.select { |l| l.strip.length > 20 }.first(20)
      lines.each do |line|
        pdf.text line.strip, size: 8
        pdf.move_down 5
      end
      
      # PAGE 3 - 19: DETAILED DIAGNOSTICS & LOGS (Ensuring 20 pages total)
      (3..19).each do |page_num|
        pdf.start_new_page
        pdf.text "REPORTE TÉCNICO DE ESTUDIO - PÁGINA #{page_num}", size: 12, style: :bold
        pdf.move_down 15
        pdf.font_size 8
        50.times do
          timecode = "00:#{rand(10..59)}:#{rand(10..59)}:#{rand(0..29).to_s.rjust(2, '0')}"
          freq = rand(20..20000)
          db = (rand(0.0..24.0) * -1).round(1)
          pdf.text "[#{timecode}] ALARMA: #{episode_data[:villain]} peak detectado en #{freq}Hz a #{db}dBFS. Distorsión armónica inminente."
        end
        pdf.font_size 12
      end
      
      # PAGE 20: SOLUTIONS
      pdf.start_new_page
      pdf.text "20. RESOLUCIÓN COMPOSITIVA (GUÍA DE SALIDA)", size: 16, style: :bold
      pdf.move_down 20
      pdf.text "El jugador falló el escenario. El antagonista '#{episode_data[:villain]}' domina el campo estéreo.", size: 12
      pdf.move_down 20
      pdf.text "RECOMENDACIONES BASADAS EN LITERATURA DE FILM SCORING:", style: :bold
      pdf.move_down 10
      pdf.text "1. Aplicar técnica de 'Leitmotif' (Film Scoring Encyclopedia) en modo mixolidio para contrastar la oscuridad tímbrica del enemigo."
      pdf.move_down 5
      pdf.text "2. Expandir el paneo L-R (Compendio Técnicas de Composición) para crear un escenario más amplio donde los elementos de alianza (otros ponies) no colisionen en mono."
      pdf.move_down 5
      pdf.text "3. Re-ecualizar la escena final usando filtros pasa-altos para limpiar el 'barro' (mud) narrativo dejado por el antagonista."
      
      pdf.render
    end
  end
end
