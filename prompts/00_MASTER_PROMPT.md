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
