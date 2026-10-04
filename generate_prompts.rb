require 'fileutils'
require 'cgi'

html = File.read('episodes_raw.html')
FileUtils.mkdir_p('prompts')

master_prompt = <<~MD
# CelestiaGoth OS - MASTER PROMPT
## Meta
- Proyecto: CelestiaGoth OS
- Temática: My Little Pony: Friendship is Magic vs Ingeniería de Audio/Mastering
- Objetivo: 230 minijuegos imposibles donde el villano gana, y un PDF de 20 páginas explica el fracaso usando términos de producción discográfica.

## Arquitectura por Episodio
Cada episodio contará con:
1. **Un juego 2D en Canvas (`views/game_epXXX.erb`):** El villano/obstáculo principal es el "Jefe". El jugador (protagonista) siempre pierde a los 45 segundos exactos.
2. **Colores HSB:** El esquema de colores HSB de la vista corresponde a la paleta del villano (obtenido y convertido de hex a HSB).
3. **Reporte (PDF 20 páginas):** Escrito en Prawn. El reporte toma el transcript del episodio y lo traduce a fallas de ingeniería de audio (e.g., cancelación de fase, sobrecompresión, aliasing).
4. **Soluciones:** Se recomiendan soluciones teóricas de `Compendio_Tecnicas_Composicion.pdf` y `Film_Scoring_Literary_Encyclopedia_Complete.pdf` para "ganar por fuera de la compu".

## Instrucciones para el LLM
Para cada episodio listado en los archivos `epXXX_prompt.md`, debes:
1. Implementar la lógica específica del Canvas 2D (ataques basados en el tema del villano/conflicto).
2. Definir el texto del reporte de 20 páginas usando analogías técnicas exactas según la trama.
MD

File.write('prompts/00_MASTER_PROMPT.md', master_prompt)

# Extract transcript links in order of appearance
links = html.scan(/href="\/wiki\/Transcripts\/([^"]+)"/).flatten

# Uniq while preserving order
unique_episodes = links.uniq

unique_episodes.each_with_index do |ep_slug, index|
  ep_num = (index + 1).to_s.rjust(3, '0')
  title = CGI.unescape(ep_slug.gsub('_', ' '))
  
  prompt_content = <<~MD
  # CelestiaGoth OS - Episodio #{ep_num}
  ## Título Original: #{title}
  
  ### Objetivo del Agente (LLM)
  Para este episodio, debes implementar:
  
  1. **Scraping del Transcript:**
     Descargar el transcript desde `https://mlp.fandom.com/wiki/Transcripts/#{ep_slug}` y guardarlo en `data/ep#{ep_num}_transcript.md`.
  
  2. **Análisis de Conflicto (Identificación del Villano/Obstáculo):**
     Lee el transcript para determinar quién es el antagonista o cuál es el conflicto principal.
  
  3. **Generación del Juego 2D (`views/game_ep#{ep_num}.erb`):**
     - Diseña una mecánica de Canvas 2D donde el jugador represente a las Mane 6 (o al protagonista del episodio) y deba esquivar ataques basados en el villano.
     - El juego debe durar exactamente 45 segundos.
     - Es 100% imposible de ganar.
     - Al perder, hace un fade-out y muestra un reporte resumen en HTML.
  
  4. **Metáfora de Ingeniería de Audio:**
     Determina qué fallo técnico representa la victoria del villano. Por ejemplo, si el villano usa engaños, la metáfora es "Aliasing y Distorsión de Intermodulación".
  
  5. **Reporte PDF de 20 páginas (`lib/celestia_goth/reports/ep#{ep_num}_report.rb`):**
     Genera un reporte masivo utilizando Prawn que explique la derrota basándose en la acústica, masterización y arreglo, referenciando `Compendio_Tecnicas_Composicion.pdf` y `Film_Scoring_Literary_Encyclopedia_Complete.pdf`.
  MD
  
  File.write("prompts/ep#{ep_num}_prompt.md", prompt_content)
end

puts "Generated 00_MASTER_PROMPT.md and #{unique_episodes.length} episode prompts."
