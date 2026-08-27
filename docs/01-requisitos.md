# Documento de Requisitos

## Requisitos Funcionais (RF)
* **RF01:** O sistema deve permitir a busca de músicas por texto (nome, artista, álbum).
* **RF02:** O sistema deve extrair os metadados da música (capa, duração, título, autor).
* **RF03:** O sistema deve reproduzir o stream de áudio continuamente.
* **RF04:** O sistema deve possuir controles básicos de player (Play, Pause, Próximo, Anterior).

## Requisitos Não Funcionais (RNF)
* **RNF01:** O projeto deve ser multiplataforma (foco inicial em Linux/Windows).
* **RNF02:** A interface gráfica deve ser separada da lógica de negócios (padrão MVC ou MVVM).
* **RNF03:** A comunicação com a InnerTube API deve ser assíncrona para não travar a interface (UI Thread).
