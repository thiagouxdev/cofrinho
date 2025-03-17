# Documentação do Projeto Cofrinho App

## Resumo

O Cofrinho App é uma aplicação Flutter que ajuda os usuários a gerenciar seus cofrinhos virtuais, estabelecer metas financeiras e acompanhar o progresso de suas economias. Utiliza uma arquitetura moderna baseada em features e camadas, com gerenciamento de estado via Riverpod e navegação com GoRouter. A persistência de dados é feita com Hive e SharedPreferences, e o design visual é consistente com suporte a temas claro e escuro.

## Visão Geral

O Cofrinho App é uma aplicação Flutter desenvolvida para ajudar os usuários a gerenciar seus cofrinhos virtuais, estabelecer metas financeiras e acompanhar o progresso de suas economias. A aplicação utiliza uma arquitetura moderna e organizada, seguindo boas práticas de desenvolvimento e padrões de projeto.

## Estrutura do Projeto

O projeto segue uma arquitetura baseada em features, com separação clara de responsabilidades e organização modular. A estrutura principal do projeto é a seguinte:

```
lib/
├── app/
│   └── routers/           # Configuração de rotas da aplicação
├── features/              # Módulos funcionais da aplicação
│   ├── home/              # Feature da tela inicial
│   ├── piggy_bank/        # Feature de gerenciamento de cofrinhos
│   ├── splash/            # Feature da tela de splash
│   └── welcome/           # Feature de boas-vindas e onboarding
├── l10n/                  # Internacionalização e localização
├── shared/                # Componentes compartilhados
│   ├── services/          # Serviços compartilhados
│   ├── strings/           # Strings e textos da aplicação
│   ├── themes/            # Temas e estilos visuais
│   └── widgets/           # Widgets reutilizáveis
├── main.dart              # Ponto de entrada da aplicação
└── my_app.dart            # Configuração do aplicativo
```

## Arquitetura

O projeto segue uma arquitetura baseada em camadas, inspirada no Clean Architecture, com as seguintes divisões:

### Estrutura de Features

Cada feature é organizada seguindo o padrão:

```
feature/
├── domain/               # Regras de negócio e modelos
│   └── models/           # Modelos de dados
├── presentation/         # Interface do usuário
│   ├── view/             # Telas e componentes visuais
│   └── viewmodel/        # Lógica de apresentação e estado
```

Esta organização permite:
- Isolamento de responsabilidades
- Facilidade de manutenção
- Testabilidade
- Escalabilidade

## Gerenciamento de Estado

O aplicativo utiliza o **Flutter Riverpod** como solução de gerenciamento de estado. O Riverpod oferece:

- Injeção de dependências
- Gerenciamento de estado reativo
- Facilidade para testes
- Providers tipados e seguros

Exemplos de providers podem ser encontrados nos arquivos de viewmodel dentro de cada feature.

## Sistema de Rotas

O aplicativo utiliza o **GoRouter** para gerenciamento de navegação, que oferece:

- Navegação baseada em rotas nomeadas
- Suporte a deep linking
- Transições personalizáveis
- Integração com o sistema de navegação do Flutter

As rotas são definidas em:
- `app/routers/app_routers.dart` - Constantes de rotas
- `app/routers/app_views.dart` - Configuração das rotas e suas views

## Persistência de Dados

O aplicativo utiliza duas principais soluções para persistência de dados:

1. **Hive** - Banco de dados NoSQL orientado a objetos
   - Utilizado para armazenar dados estruturados como os modelos de cofrinhos
   - Oferece alta performance por ser um banco de dados em memória
   - Suporte a adaptadores para serialização/deserialização de objetos

2. **SharedPreferences** - Armazenamento de chave-valor
   - Utilizado para armazenamento de configurações simples e preferências do usuário
   - Ideal para dados primitivos e configurações

## Temas e Estilo Visual

O aplicativo implementa um sistema de temas consistente, definido em `shared/themes/`. Os componentes visuais seguem um design system com:

- Paleta de cores definida
- Tipografia consistente usando Google Fonts
- Componentes de UI reutilizáveis
- Suporte a tema claro e escuro

## Dependências Principais

O projeto utiliza as seguintes dependências principais:

- **flutter_riverpod**: Gerenciamento de estado e injeção de dependências
- **go_router**: Sistema de navegação e roteamento
- **hive** e **hive_flutter**: Persistência de dados local
- **shared_preferences**: Armazenamento de preferências do usuário
- **google_fonts**: Tipografia e fontes personalizadas
- **flutter_svg**: Suporte a imagens vetoriais SVG
- **material_symbols_icons**: Pacote de ícones Material Symbols

## Fluxo de Execução

1. A aplicação inicia em `main.dart`, onde são configurados:
   - Inicialização do Hive para persistência
   - Configuração dos serviços (HiveService e SharedPreferencesService)
   - Configuração do ProviderScope para o Riverpod
   - Inicialização do GoRouter

2. O fluxo de navegação começa na rota `/` (SplashView)
3. Dependendo do estado da aplicação, o usuário é direcionado para:
   - Tela de boas-vindas (primeira execução)
   - Tela inicial (usuário já configurado)

## Convenções de Código

O projeto segue as convenções de código do Flutter e Dart:
- Nomes de classes em PascalCase
- Nomes de métodos e variáveis em camelCase
- Constantes em SNAKE_CASE
- Organização de imports seguindo o padrão Dart

## Processo de Build e Deployment

Para construir o aplicativo para diferentes plataformas:

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Próximos Passos e Melhorias

Algumas sugestões para evolução do projeto:

1. Implementação de testes unitários e de widgets
2. Integração com serviços de analytics
3. Implementação de notificações push
4. Suporte a múltiplos idiomas usando o sistema de l10n
5. Implementação de backup e sincronização em nuvem

## Contribuição

Para contribuir com o projeto:

1. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
2. Faça commit das suas alterações (`git commit -m 'Adiciona nova funcionalidade'`)
3. Envie para a branch (`git push origin feature/nova-funcionalidade`)
4. Abra um Pull Request
