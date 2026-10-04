# CelestiaGoth OS - Episodio 019
## Título Original: A Dog and Pony Show

### Objetivo del Agente (LLM)
Para este episodio, debes implementar:

1. **Scraping del Transcript:**
   Descargar el transcript desde `https://mlp.fandom.com/wiki/Transcripts/A_Dog_and_Pony_Show` y guardarlo en `data/ep019_transcript.md`.

2. **Análisis de Conflicto (Identificación del Villano/Obstáculo):**
   Lee el transcript para determinar quién es el antagonista o cuál es el conflicto principal.

3. **Generación del Juego 2D (`views/game_ep019.erb`):**
   - Diseña una mecánica de Canvas 2D donde el jugador represente a las Mane 6 (o al protagonista del episodio) y deba esquivar ataques basados en el villano.
   - El juego debe durar exactamente 45 segundos.
   - Es 100% imposible de ganar.
   - Al perder, hace un fade-out y muestra un reporte resumen en HTML.

4. **Metáfora de Ingeniería de Audio:**
   Determina qué fallo técnico representa la victoria del villano. Por ejemplo, si el villano usa engaños, la metáfora es "Aliasing y Distorsión de Intermodulación".

5. **Reporte PDF de 20 páginas (`lib/celestia_goth/reports/ep019_report.rb`):**
   Genera un reporte masivo utilizando Prawn que explique la derrota basándose en la acústica, masterización y arreglo, referenciando `Compendio_Tecnicas_Composicion.pdf` y `Film_Scoring_Literary_Encyclopedia_Complete.pdf`.
