# ADR 002: Uso da InnerTube API (Engenharia Reversa)

**Status:** Aceito
**Contexto:** O projeto necessita de uma fonte de dados para músicas, playlists e URLs de stream. O Google não oferece uma API oficial para streaming de áudio por terceiros.
**Decisão:** Utilizaremos engenharia reversa da InnerTube API (a API não documentada usada pelo próprio YouTube Music). 
**Consequências:**
* **Positivas:** Excelente oportunidade de aprendizado em análise de tráfego de rede, falsificação de cabeçalhos HTTP (User-Agents) e extração de dados complexos em JSON.
* **Negativas:** Alto acoplamento externo. Se o YouTube alterar a estrutura do JSON da InnerTube API, o código de extração precisará ser refatorado.
