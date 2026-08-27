# Arquitetura de Software

O sistema adotará uma arquitetura em camadas para garantir a separação de responsabilidades (Separation of Concerns).

1. **Camada de Apresentação (UI):** Desenvolvida em Qt/QML. Responsável apenas por exibir os dados e capturar eventos do usuário.
2. **Camada de Aplicação/Controllers:** Código C++ que atua como ponte entre a UI e o núcleo, gerenciando o estado do player (ex: usando sinais e slots do Qt).
3. **Camada de Domínio/Core:** Lógica de negócios pura (gerenciamento da fila de reprodução, entidades como Música, Playlist).
4. **Camada de Infraestrutura:** 
   * **Network Client:** Integração com a InnerTube API (requisições HTTP, parser de JSON).
   * **Audio Engine:** Integração com bibliotecas de baixo nível (FFmpeg, miniaudio) para decodificação e reprodução.
