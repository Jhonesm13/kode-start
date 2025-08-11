# Rick and Morty

Esse é um aplicativo feito em Flutter que usa a Rick and Morty API para mostrar uma lista de personagens do desenho.
Cada personagem aparece num card com a imagem e o nome.
O Aplicativo possui uma barra de busca que filtra os personagens enquanto você digita e, se clicar em um deles, ira para outra página para ver mais detalhes.


## Arquitetura do Projeto
O projeto segue uma arquitetura modularizada por camadas, visando separação de responsabilidades e facilidade de manutenção.
Models: Modelos de dados (mapeamento JSON para Dart)
Pages: Telas (UI e controle do estado local)
Repositories: Acesso a dados (API REST)
Widgets: Componentes reutilizáveis (APP Bar e cards)

main.dart: Ponto de partida da aplicação e configuração de rotas

## Padrões e Boas Práticas Utilizados
Padrão Repository
Centraliza o acesso a API no CharacterRepository.
Facilita manutenção e possíveis mudanças de fonte de dados.

## Search em tempo real
Campo de busca (TextField) filtra a lista localmente, evitando mais chamadas desnecessarias na API.
Utilizado .where() para filtrar pela propriedade name.

## Boas práticas de UI
Layout responsivo com Expanded e ListView.builder

## Tecnologias e Bibliotecas
Flutter (UI)
Dio (requisições HTTP)
Rick and Morty API (fonte de dados)
