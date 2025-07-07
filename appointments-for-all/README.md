----------------------------------------
Student: Leonardo Melo   
Email: leoomelo@gmail.com

# Nome do Projeto
# appointments-for-all
Ruby on Rails' project for appointments regardless specialities.
This project is a part of Ruby on Rails course MBA. Its goal is to apply the learned concepts on class to create a functional web applications, well-structures and with best development practices.

## 📦 Tecnologias Utilizadas

- [Ruby](https://www.ruby-lang.org/pt/) 3.4.4
- [Ruby on Rails](https://rubyonrails.org/) 8.0.2
- [PostgreSQL](https://www.postgresql.org/)
- [Solid Queue](https://github.com/rails/solid_queue)
- [Mission Control Jobs](https://github.com/rails/mission_control-jobs)
- [Bullet (N + 1)](https://github.com/flyerhzm/bullet)

## 🚀 Como rodar o projeto localmente

```bash
# Clone o repositório
https://github.com/leoomelo/appointments-for-all.git
appointments-for-all

# abra o VSCode
# Inicie o projeto dentro do dev container
# Executar rails db:seed (opcional)
```

## ✅ Funcionalidades implementadas

Descreva aqui as principais funcionalidades da sua aplicação. Por exemplo:

- Cadastro de Customers, Professionals e Appointments
- Background job para envio de notificações e email
- Sistema de agendamento para clientes e profissionais em geral.

## 🧠 Conceitos aplicados

Abaixo estão os conceitos aprendidos em aula e aplicados neste projeto, junto com a justificativa de sua utilização:

### 1. **Service Objects**

Utilizados para encapsular regras de negócio complexas fora dos models e controllers, mantendo o código mais limpo e testável. Podemos observar no projeto a classe AppointmentService::Create que faz isso e isso onde podemos comprovar o benefício da utilização desse conceito.

### 2. **ActiveJob + Solid Queue**

Usado para processamento assíncrono de tarefas demoradas, como envio de e-mails, sem bloquear o fluxo da aplicação. Aqui escolhi usar esse conceito pois se enviasse o email ficaria com a tela bloqueada para o usuário e isso acaba causando um empobrecimento na UX.

### 3. **Decorators**

Aplicados para exibir as datas do sistema de forma mais legível.

### 4. **Bullet**

Gem que facilita encontrar queries N + 1 no sistema e sugere alterações para otimização de queries no Active Query.

### 5. **Default Scope**

Sempre que entrar na rota /appointments, será exibidos os agendamentos futuros, onde o default scope no model de Appointments é aplicado. Para exibição de todos os agendamentos, existe a rota '/all_appointments'.

### 6. **Query Objects**

O principal propósito desse tipo de objeto é encapsular uma consulta de banco de dados de forma reutilizável, potencialmente combinável e parametrizável. Encontrado da classe AppointmentService::Create.

> _Em resumo, inclua pelo menos 5 conceitos que utilizou, a justificativa de cada um e como isso te ajudou no projeto._
----------------------------------------

# 📚 API de Rotas – Appointments for All

Este documento descreve todas as rotas disponíveis na aplicação, organizadas por recurso.

---

## 🔗 Sumário

- [🏠 Página inicial](#-página-inicial)
- [🩺 Health check](#-health-check)
- [📅 Agendamentos (`appointments`)](#-agendamentos-appointments)
- [🗂 Todos os agendamentos (sem escopo)](#-todos-os-agendamentos-sem-escopo)
- [👩‍⚕️ Agendamentos por profissional](#-agendamentos-por-profissional)
- [🧑‍⚕️ Profissionais (`professionals`)](#-profissionais-professionals)
- [🧑 Clientes (`customers`)](#-clientes-customers)
- [🛠 Dashboard de Jobs](#-dashboard-de-jobs)

---

## 🏠 Página inicial

- **Controller#Action**: `appointments#index`
- **Descrição**: Página inicial da aplicação, exibe a lista de agendamentos futuros.

---

## 🩺 Health check
GET /up


- **Controller#Action**: `rails/health#show`
- **Descrição**: Endpoint de verificação de saúde da aplicação.
- **Named route**: `rails_health_check_path`

---

## 📅 Agendamentos (`appointments`)

| Verbo | Caminho                        | Controller#Action       | Descrição                        |
|-------|--------------------------------|--------------------------|----------------------------------|
| GET   | `/appointments`               | `appointments#index`     | Lista todos os agendamentos     |
| GET   | `/appointments/new`           | `appointments#new`       | Formulário para novo agendamento |
| POST  | `/appointments`               | `appointments#create`    | Cria um novo agendamento         |
| GET   | `/appointments/:id`           | `appointments#show`      | Detalhes de um agendamento       |
| GET   | `/appointments/:id/edit`      | `appointments#edit`      | Formulário de edição             |
| PATCH | `/appointments/:id`           | `appointments#update`    | Atualiza um agendamento          |
| PUT   | `/appointments/:id`           | `appointments#update`    | Atualiza um agendamento          |
| DELETE| `/appointments/:id`           | `appointments#destroy`   | Remove um agendamento            |

---

## 🗂 Todos os agendamentos (sem escopo)
GET /all_appointments


- **Controller#Action**: `appointments#all_appointments`
- **Descrição**: Lista **todos os agendamentos**, ignorando o `default_scope`.  
  Ideal para histórico, visualizações administrativas ou relatórios completos.

---

## 👩‍⚕️ Agendamentos por profissional
GET /professionals/:professional_id/appointments

- **Controller#Action**: `appointments#index` (ou `appointments#by_professional`)
- **Descrição**: Lista os agendamentos de um profissional específico.
- **Named route**: `professional_professional_appointments_path(professional)`


🧑‍⚕️ Profissionais (professionals)
| Verbo  | Caminho                   | Controller#Action       | Descrição                |
| ------ | ------------------------- | ----------------------- | ------------------------ |
| GET    | `/professionals`          | `professionals#index`   | Lista profissionais      |
| GET    | `/professionals/new`      | `professionals#new`     | Formulário para novo     |
| POST   | `/professionals`          | `professionals#create`  | Cria profissional        |
| GET    | `/professionals/:id`      | `professionals#show`    | Detalhes do profissional |
| GET    | `/professionals/:id/edit` | `professionals#edit`    | Edita profissional       |
| PATCH  | `/professionals/:id`      | `professionals#update`  | Atualiza profissional    |
| PUT    | `/professionals/:id`      | `professionals#update`  | Atualiza profissional    |
| DELETE | `/professionals/:id`      | `professionals#destroy` | Remove profissional      |


🧑 Clientes (customers)
| Verbo  | Caminho               | Controller#Action   | Descrição            |
| ------ | --------------------- | ------------------- | -------------------- |
| GET    | `/customers`          | `customers#index`   | Lista clientes       |
| GET    | `/customers/new`      | `customers#new`     | Formulário para novo |
| POST   | `/customers`          | `customers#create`  | Cria cliente         |
| GET    | `/customers/:id`      | `customers#show`    | Detalhes do cliente  |
| GET    | `/customers/:id/edit` | `customers#edit`    | Edita cliente        |
| PATCH  | `/customers/:id`      | `customers#update`  | Atualiza cliente     |
| PUT    | `/customers/:id`      | `customers#update`  | Atualiza cliente     |
| DELETE | `/customers/:id`      | `customers#destroy` | Remove cliente       |


🛠 Dashboard de Jobs   
GET /jobs   
Montado via: MissionControl::Jobs::Engine

Descrição: Interface visual para monitorar e gerenciar background jobs (ActiveJob, Solid Queue, etc.).