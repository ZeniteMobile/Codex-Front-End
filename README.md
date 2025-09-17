# Codex-Front-End

Este projeto é a interface front-end do Codex, desenvolvida em Flutter, com foco em uma experiência moderna, responsiva e multiplataforma.

## Visão Geral

O Codex-Front-End oferece telas para autenticação, dashboard, status de serviços, ajuda e gerenciamento de perfil do usuário. O design é limpo, intuitivo e segue boas práticas de UX.

## Telas Principais

| Login | Registro | Dashboard | Status | Ajuda | Perfil |
|-------|----------|-----------|--------|-------|--------|

| ![Login](<img width="258" height="563" alt="image" src="https://github.com/user-attachments/assets/95748bd3-1a0d-42d4-a55e-70f516d082d0" />
) | ![Registro](<img width="256" height="562" alt="image" src="https://github.com/user-attachments/assets/17f90f01-3921-4f4b-ae7b-091e08ad45fe" />
) | ![Dashboard](<img width="259" height="562" alt="image" src="https://github.com/user-attachments/assets/91c59489-3ba8-45dd-b5cf-fa8bd2acb33f" />
) | ![Status](<img width="257" height="564" alt="image" src="https://github.com/user-attachments/assets/7b0d917d-a611-4b05-89aa-daa9e8e7ed51" />
) | ![Ajuda](<img width="258" height="562" alt="image" src="https://github.com/user-attachments/assets/8cfa75dd-aa37-48f7-b66b-63f023ef0de4" />
) | ![Perfil](<img width="261" height="559" alt="image" src="https://github.com/user-attachments/assets/cdb4dfc1-ed88-4270-92c9-03065e20aa50" />
) |
> **Nota:** Algumas das telas ainda não foram devidamente prototipadas e/ou implementadas

### Funcionalidades

- **Login:** Autenticação via e-mail e senha, com opção de cadastro e recuperação de senha.
- **Registro:** Cadastro de novos usuários com validação de campos obrigatórios.
- **Dashboard:** Tela inicial após login, com dados relevantes da API como consumo, tempo de execução, numero de seções ativas, usos em determinado periodo, dentre outras funcionalidades ainda não construidas.
- **Status:** Visualização do status dos serviços, logs e indicadores de funcionamento.
- **Ajuda:** FAQ interativo com perguntas frequentes e respostas.
- **Perfil:** Visualização e edição dos dados do usuário, além da opção de logout.

## Estrutura do Projeto

- `lib/pages/`: Contém as telas principais como login, registro, dashboard, status, ajuda e perfil.
- `lib/routes/`: Gerenciamento de rotas e navegação.
- `assets/`: Imagens e recursos estáticos.
- `pubspec.yaml`: Gerenciamento de dependências.

## Como Executar

1. Instale o [Flutter](https://flutter.dev/docs/get-started/install).
2. Clone este repositório:
   ```sh
   git clone https://github.com/seu-usuario/Codex-Front-End.git
   cd Codex-Front-End
   ```
3. Instale as dependências:
   ```sh
   flutter pub get
   ```
4. Execute o aplicativo:
   ```sh
   flutter run
   ```

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para enviar um pull request ou abrir uma issue para discutirmos melhorias.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Customização
* Para alterar as cores e temas, edite o arquivo `lib/main.dart.`
* Para adicionar novas perguntas na tela de ajuda, edite lib/pages/ajuda.dart.
* Os assets podem ser modificados na pasta `assets/`.


Desenvolvido com ❤️ usando Flutter.
