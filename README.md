# 🦂 Projeto Scorpion: Orquestração de Microserviços com AWS EKS & Kubernetes

Este repositório detalha a implementação de uma infraestrutura escalável para a aplicação **Scorpion**, utilizando o **Amazon Elastic Kubernetes Service (EKS)**. O foco do projeto foi garantir alta disponibilidade, resiliência e automação de deploy em larga escala.

---

## 🚀 Contexto do Projeto & Arquitetura

### 🔴 O Desafio
Hospedar uma aplicação crítica que exige **auto-healing** (auto-recuperação) e escalabilidade horizontal. Uma solução baseada em instâncias simples não seria capaz de gerenciar o ciclo de vida dos containers de forma eficiente.

### 🟢 A Solução
Implementação de um cluster gerenciado **AWS EKS**. A arquitetura utiliza **Nodes** distribuídos em múltiplas zonas de disponibilidade (Multi-AZ), garantindo que a aplicação Scorpion permaneça online mesmo em caso de falha de um datacenter.

---

## 🛠️ Stack Tecnológica & Engenharia de Containers

| Ferramenta | Ícone | Justificativa Técnica |
| :--- | :---: | :--- |
| **Kubernetes** | <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/kubernetes/kubernetes-plain.svg" width="45"> | Orquestração de containers e gerenciamento de ReplicaSets. |
| **AWS EKS** | <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" width="45"> | Plano de controle gerenciado de alta disponibilidade. |
| **Docker** | <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original.svg" width="45"> | Padronização da aplicação Scorpion em imagens imutáveis. |

---

## 📸 Evidências de Implementação (Case Study)

### 🔹 Infraestrutura como Serviço (EKS Cluster)
*Provisionamento do cluster e validação dos Worker Nodes.*
![EKS Setup](img/EKS%20III.png)

---

### 🔹 Orquestração e Deploy de Workloads
*Gerenciamento de pods e deploy da aplicação via kubectl.*
![Kubectl Deploy](img/EKS%20VI.png)

---

### 🔹 Escalabilidade e Saúde do Cluster
*Monitoramento da distribuição de carga entre os nós do cluster.*
![EKS Nodes](img/EKS%20IX.png)

---

### 🔹 Aplicação Scorpion em Produção
*O resultado final: aplicação orquestrada e acessível globalmente.*
![Scorpion Live](img/image_4a3f28.png.png)

---

## 🏁 Conclusão
O Projeto Scorpion demonstra a maturidade na gestão de ambientes conteinerizados na nuvem AWS.

---
*Documentação desenvolvida por Gustavo Gomes | Cloud & DevOps Engineer*
