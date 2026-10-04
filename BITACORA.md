# Bitácora de Proyecto: CelestiaGoth OS

## Descripción General
CelestiaGoth OS es una interfaz web retro (estilo PC de los años 2000) construida en Ruby (Sinatra). Funciona como un catálogo interactivo de episodios de "My Little Pony: Friendship is Magic" (simulando un menú de juegos *9999-in-1*).

El objetivo principal es traducir los conflictos narrativos de cada episodio a metáforas y diagnósticos de **Ingeniería de Audio, Producción Discográfica, Mezcla y Composición Musical**.

## Arquitectura y Componentes
- **Backend (Ruby / Sinatra):** Controlador de rutas, carga de transcripciones, y orquestación.
- **Frontend (HTML/CSS/JS):**
  - **Filtro CRT y Estética 2000s:** CSS personalizado con líneas de escaneo y modo oscuro.
  - **Color Dinámico (HSB):** Los colores de la interfaz se derivan de la paleta del villano de cada episodio, convertidos desde HEX a HSB usando el módulo `CelestiaGoth::HexToHsb`.
- **Motor del Juego (Canvas 2D):** Un juego diseñado para que el jugador **pierda siempre** tras 45 segundos, reflejando el triunfo del antagonista en la narrativa.
- **Reporte Dinámico (Prawn / PDF):** 
  - Al perder el juego, se muestra un resumen técnico en pantalla.
  - Se puede exportar un reporte PDF de 20 páginas.
  - El PDF cruza la transcripción (extraída del wiki de Fandom) con problemas de fase, masterización, y arreglo musical, recomendando soluciones basadas en *Compendio_Tecnicas_Composicion.pdf* y *Film_Scoring_Literary_Encyclopedia_Complete.pdf*.

## Historial de Desarrollo

### 2026-10-04 (Inicio del Proyecto)
- [x] **Creación del repositorio local:** `/Users/andreibarwood/Documents/snocomm/celestiaGoth`.
- [x] **Configuración Base:** `Gemfile` (`sinatra`, `prawn`).
- [x] **Traductor Hex a HSB:** Implementado en `lib/celestia_goth/hex_to_hsb.rb`.
- [x] **Generador de Reportes PDF:** Implementado `CelestiaGoth::ReportGenerator` que genera un documento de 20 páginas, extrae la data de `data/ep1_transcript.md` y simula lecturas de decibeles y errores de mezcla.
- [x] **Script de Arranque:** Creado `bin/start_celestia` en puerto `9300`.
- [x] **Interfaz Web:** Implementado el menú 9999-in-1 en `views/index.erb` y el motor del juego imposible en `views/game.erb`.
- [x] **Primer Test:** Extracción del transcript del episodio 1 ("Friendship is Magic, part 1").
- [x] **Gestión de Versiones:** Creación de esta bitácora y despliegue a GitHub.

## Siguientes Pasos (To-Do)
- Añadir el web scraper / importador automático para procesar los más de 200 episodios y poblar la carpeta `data/` y el diccionario `EPISODES` en `app.rb`.
- Pulir mecánicas visuales del juego para reflejar características específicas de cada villano.
- Integrar la base de datos de colores `https://mlpvector.club/cg/pony/full` de manera automatizada.
