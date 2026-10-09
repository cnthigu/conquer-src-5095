# Servidor Privado em C#

- Baseado na versão 5517
- Código escrito em C#
- Contém AccServer (autenticação) e GameServer (lógica do jogo)
- Repleto de correções, otimizações e melhorias de estabilidade
- Sistema de eventos automáticos, shop, PvP, guilds, etc.
- Banco de dados MySQL incluso no formato `.zq`

## Estrutura do Projeto

```
AccServer/     - Servidor de autenticação (login, conexão com DB)
GameServer/    - Toda lógica do jogo, eventos, controle de players
Database/      - Arquivo .zq com estrutura MySQL para uso direto
```
## Como Rodar

1. Clone este repositório
2. No `AccServer`, edite a string de conexão:
   - Exemplo: `Database=zq;Uid=root;Password=123456789`
3. No `GameServer`, altere a senha `Higor123*` para a mesma senha do banco
4. Importe o banco de dados `.zq` no MySQL (recomendo Navicat)
5. Compile os projetos no Visual Studio
6. Execute `AccServer.exe` e `GameServer.exe`

## Recursos Implementados

- **Offline Market** – Sistema de comércio funcionando mesmo com o personagem desconectado.
- **Offline Miner** – Mineração automática enquanto o jogador está offline.
- **Integração com Discord (Discord API)** – Atualizações e interações conectadas ao servidor do Discord.
- **Online Points** – Sistema de pontos por tempo online.
- **Sistema VIP** – Benefícios exclusivos para jogadores VIP.
- **Socket System** – Sistema completo de sockets para itens.
- Entre outras infinidades de coisas!
