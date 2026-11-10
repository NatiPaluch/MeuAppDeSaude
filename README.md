# Meu App de Saúde (Health Tracker)

Um aplicativo moderno, acessível e *offline-first* desenvolvido em React Native e Expo, projetado para ajudar pacientes (focando também em acessibilidade para o público idoso) a acompanhar de forma autônoma o seu quadro clínico, medicamentos, sinais vitais e bem-estar geral.

## 🚀 Tecnologias e Arquitetura

- **React Native & Expo (SDK 54)**: Framework base.
- **TypeScript**: Para tipagem estática e segurança do código.
- **Zustand**: Gerenciamento de estado global focado no funcionamento offline. O app foi construído de forma que os dados sejam gravados localmente para garantir rapidez e funcionamento sem internet.
- **Supabase (PostgreSQL + Auth + Realtime)**: Backend-as-a-Service para autenticação, persistência em nuvem e segurança via Row Level Security (RLS).
- **React Navigation**: Navegação em pilhas (Stack) com rotas modulares.

## 🛠️ O que já foi implementado (Status das Telas)

O aplicativo possui infraestrutura visual, navegação e fluxo de dados local (com persistência via AsyncStorage) completamente implementados. O acesso inicial é feito pelas credenciais simuladas de administrador (`admin` / `admin`).

Abaixo está o detalhamento de funcionamento de cada tela:

1. **🔑 Login**
   - **Funciona:** Formulário interativo que exige o preenchimento de e-mail/CPF e senha.
   - **Simulação/Mock:** Credencial fixa de acesso definida como usuário `admin` e senha `admin` para permitir o acesso rápido. O link de cadastro redireciona perfeitamente para a tela correspondente.

2. **📝 Cadastro**
   - **Funciona:** Formulário completo. Possui validação que impede o cadastro caso as senhas digitadas não coincidam. Exibe um alerta de sucesso e avança para a tela de Perfil.

3. **👤 Perfil**
   - **Funciona:** Permite preencher Idade, Peso, Altura e Sexo.
   - **Cálculo de IMC Automático:** Calcula o IMC em tempo real enquanto o usuário digita e exibe na tela o valor com a classificação de saúde (Ex: *Normal, Sobrepeso, Obesidade*). Salva e avança para a tela Inicial.

4. **🏠 Inicial (Dashboard)**
   - **Funciona:** Central do aplicativo. Exibe o nome do paciente personalizado e a foto de perfil cadastrada. Todos os 9 cartões de serviços de saúde e o ícone de configurações funcionam e redirecionam para as respectivas telas.

5. **⚙️ Configurações**
   - **Funciona:** Permite que o usuário mude o nome, telefone e escolha uma foto da galeria do celular utilizando a biblioteca nativa `expo-image-picker`. As informações atualizadas refletem imediatamente em todo o app.
   - **Simulação/Mock:** Botão "Recuperar Senha" exibe apenas um alerta simulado de envio de e-mail.

6. **😊 Humor**
   - **Funciona:** O usuário seleciona o humor do dia (Feliz, Triste, Nervoso ou Ansioso), salva no histórico local e a tela lista todos os sentimentos registrados com a data e emoji respectivos.

7. **🩸 Sinais Vitais**
   - **Funciona:** Entrada de Batimentos por Minuto (BPM), Glicose (mg/dL) e Pressão Arterial (mmHg). Salva no histórico de registros e exibe a lista atualizada de medições recentes com data/hora.

8. **⏰ Lembretes**
   - **Funciona:** Pede permissão real de notificações do celular. Permite criar lembretes com título, categoria (*Saúde, Remédio, Exercício, Higiene*) e horário (valida formato HH:MM).
   - **Integração Real:** Agenda notificações diárias reais no sistema operacional através do `expo-notifications` (com aviso em caso de ambiente web). Permite excluir lembretes da lista.

9. **💊 Farmácia**
   - **Funciona:** Cadastro de medicamentos contendo Nome, Dosagem, Formato e quantidade em estoque.
   - **Alerta Inteligente:** Exibe um alerta de interação medicamentosa básica caso tente cadastrar "AAS" ou "Aspirina".
   - **Geração de PDF Real:** O botão PDF gera um relatório completo dos seus medicamentos em formato HTML e abre o menu nativo de compartilhamento/impressão de arquivo do celular via `expo-sharing`.

10. **🩺 Enfermagem**
    - **Funciona:** Registro de Temperatura, Pressão e Oxigenação (SpO2). Avalia e alerta caso a temperatura aponte Febre (>37.8°C) ou Hipotermia (<35.0°C). Mostra histórico dos registros salvos.
    - **⚠️ Mock (Sem ação):** Os botões "Abrir Cartão de Vacinas" e "Registro de Curativos" são apenas visuais (não executam ações quando clicados).

11. **🏃 Educação Física**
    - **Funciona:** Permite selecionar a frequência de atividades (Ativo, De vez em quando, Não pratico) e salvar no perfil. Atualiza a barra de progresso da meta semanal conforme o usuário adiciona treinos realizados. Abre um pop-up com a Biblioteca de Exercícios e suas descrições.

12. **🧠 Psicologia**
    - **Funciona:** Botão de crise SOS (exibe alerta para contato com o CVV 188 e emergências).
    - **Questionários de Triagem Completos:** Modais interativos contendo os questionários reais PHQ-9 (Depressão) e GAD-7 (Ansiedade). O usuário responde todas as perguntas com múltipla escolha e o sistema calcula a pontuação final na hora, sugerindo buscar ajuda médica se necessário.

13. **🦵 Fisioterapia**
    - **Funciona:** Registro diário de nível de dor na escala EVA (0 a 10) com validação de entrada e exibição do histórico de evolução da dor.
    - **⚠️ Mock (Sem ação):** Os botões "Exercícios de Hoje" e "Lembretes de Postura" no cartão Plano Terapêutico são visuais e não possuem ação programada ao clicar.

---

<details>
<summary>📋 Ver a lista completa de Requisitos do Sistema</summary>

### Requisitos Funcionais (RF01 - RF48)

*   **RF01:** Tela de login e cadastro com e-mail ou CPF, telefone, senha.
*   **RF02:** Confirmação de cadastro por código enviado ao e-mail ou telefone (OTP).
*   **RF03:** Cadastro de perfil do paciente: idade, peso, altura, sexo.
*   **RF04:** Cálculo automático de IMC com base nos dados.
*   **RF05:** Coleta de informações médicas (diabetes, problema cardíaco, hipertensão).
*   **RF06:** Registro e histórico de BPM.
*   **RF07:** Registro e histórico de glicose (mg/dL).
*   **RF08:** Lembretes de medicamentos.
*   **RF09:** Aferição e histórico de Pressão Arterial (mmHg).
*   **RF10:** Registro diário de Humor.
*   **RF11:** Registro de Nível de Atividade Física diária.
*   **RF12:** Controle de ingestão de água.
*   **RF13:** Checklist diário de higiene básica.
*   **RF14:** Histórico completo de eventos médicos (log).
*   **RF15 a RF21 (Módulo Farmácia):** Cadastrar Medicamentos (nome, dose, etc.), Interação Medicamentosa (alertas de risco de sangramento), Gestão de Estoque Caseiro, Controle de adesão com base nos lembretes, Orientação de armazenamento, Histórico e Gerar Relatório em PDF.
*   **RF22 a RF28 (Módulo Enfermagem):** Sinais vitais aprofundados (SpO2, Temperatura corporal), Alertas automáticos ao preencher dados vitais fora de referência, Cartão de Vacinas em tabela, Registro de feridas/curativos, Lembrete de consultas, Checklist de acompanhante e Cadastro de Alergias.
*   **RF29 a RF35 (Módulo Educação Física):** Diário de treinos (descrição, tempo), Visualização de treinos na semana, Cálculo aproximado de kcal/treino, Avaliação de Percepção de Esforço, Biblioteca local de exercícios, Alerta de sedentarismo e Meta semanal.
*   **RF36 a RF42 (Módulo Psicologia):** Diário Emocional expandido, Acesso aos questionários PHQ-9 e GAD-7, Botão SOS (Contatos de crise / CVV 188), Controle do sono (horas e qualidade), Lembrete motivacional e Registro de fatores estressantes.
*   **RF43 a RF48 (Módulo Fisioterapia):** Mapa de Dor corporal (região e tipo de dor), Evolução da dor (gráfico), Exercícios terapêuticos, Lembrete de correção postural e Histórico de melhora motora funcional.

### Requisitos Não Funcionais (RNF01 - RNF14)
*   **RNF01 a RNF14:** Banco de dados seguro e offline-first, criptografia em trânsito, acessibilidade para idosos (letras maiores, auto contraste), conformidade com LGPD/HIPAA, tempo de resposta na interface, modo offline funcional e baixo peso do pacote (abaixo de 50mb).

</details>
---

#  Guia de Contribuição

Este documento define as regras e boas práticas para manter o repositório organizado, com histórico limpo e fluxo de trabalho previsível para todos os colaboradores.


##  Branches

> **`main` é protegida — ninguém faz `push` direto nela.** Toda mudança entra via Pull Request.

Crie uma branch por tarefa, seguindo o padrão de nomenclatura abaixo:

| Prefixo | Uso | Exemplo |
|---|---|---|
| `feature/` | nova funcionalidade | `feature/login-google` |
| `fix/` | correção de bug | `fix/erro-cadastro-usuario` |
| `hotfix/` | correção urgente em produção | `hotfix/api-fora-do-ar` |
| `chore/` | manutenção, configs, dependências | `chore/atualiza-dependencias` |
| `docs/` | documentação | `docs/atualiza-readme` |

**Regras gerais:**
- Sempre crie a branch a partir da versão mais atualizada da `main`/`develop`.
- Delete a branch após o merge (o GitHub pode fazer isso automaticamente).

---

##  Padrão de Commits (Conventional Commits)

**Formato:**
```
tipo(escopo opcional): descrição curta no imperativo
```

| Tipo | Quando usar |
|---|---|
| `feat` | nova funcionalidade |
| `fix` | correção de bug |
| `docs` | mudanças apenas em documentação |
| `style` | formatação, espaços, ponto e vírgula (sem mudar lógica) |
| `refactor` | refatoração sem mudar comportamento |
| `test` | adição ou ajuste de testes |
| `chore` | tarefas de manutenção, dependências, configs |
| `perf` | melhoria de performance |

**Exemplos:**
```
feat(auth): adiciona login com Google
fix(api): corrige erro 500 ao salvar usuário
docs: atualiza instruções de instalação
```

**Boas práticas:**
- Mensagens no presente/imperativo (`adiciona`, não `adicionado`).
- Primeira linha com até ~72 caracteres.
- Use o corpo do commit (linha em branco + texto) para explicar o *porquê*, quando necessário.
- Evite commits genéricos como `update`, `ajustes`, `wip`.
- Prefira commits pequenos e atômicos — uma mudança lógica por commit.

---

##  Pull Requests

| Regra | Descrição |
|---|---|
| Origem | Toda mudança vai para `main`/`develop` via PR, nunca via push direto |
| Título | Mesmo padrão dos commits (ex: `feat: adiciona tela de relatórios`) |
| Descrição | O que foi feito, por quê, como testar, issue relacionada (`Closes #12`) |
| Aprovação | Mínimo **1 aprovação** antes do merge |
| Autoaprovação | Evite mergear o próprio PR sem revisão de outra pessoa |
| Estratégia de merge | Prefira **Squash and Merge** (um commit por PR no histórico da `main`) |
| Tamanho | PRs grandes devem ser quebrados em partes menores sempre que possível |

---

##  Issues

| Boa prática | Descrição |
|---|---|
| Templates | Use templates de bug report / feature request sempre que disponíveis |
| Issue antes do código | Toda tarefa relevante deve ter uma issue antes de virar branch/PR |
| Labels | `bug`, `enhancement`, `documentation`, `good first issue`, `in progress`, etc. |
| Vínculo com PR | Use `Closes #X` ou `Fixes #X` na descrição do PR |

---

##  Código e Qualidade

- Mantenha um `.gitignore` adequado (`node_modules`, `.env`, arquivos de build, etc).
- **Nunca** commitar credenciais ou chaves de API — use variáveis de ambiente e um `.env.example` como referência.
- Rode o linter/formatter (ESLint, Prettier, Black, etc.) antes de commitar.

---

##  Documentação

- Sempre que uma mudança alterar comportamento, atualize o README/documentação no mesmo PR.
- Mantenha o README com: como instalar, como rodar e estrutura do projeto.

---

## 🚧 O que ainda falta fazer (Próximos Passos)

Para que o aplicativo saia do modo MVP/Simulação local e vá para produção:

- [ ] **Integração Real de Autenticação e Banco na Nuvem (Supabase)**: Configurar as credenciais reais no arquivo `.env` (baseado no `.env.example`), rodar o script `supabase/schema.sql` no painel do Supabase e conectar os fluxos de salvamento do `useStore.ts` ao `src/services/db.ts`.
- [ ] **Implementar telas/fluxos para botões adicionais (Atualmente Mocks)**:
  - Na tela de Enfermagem: Implementar o modal/tela do "Cartão de Vacinas" e do "Registro de Curativos".
  - Na tela de Fisioterapia: Implementar a visualização dos "Exercícios de Hoje" e os "Lembretes de Postura".
- [ ] **Implementação de Fluxos Avançados de Notificações**: Sincronizar lembretes agendados com push notifications configuráveis externamente.
