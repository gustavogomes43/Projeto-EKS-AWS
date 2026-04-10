# 🦂 Projeto Scorpion: Orquestração de Microserviços com AWS EKS & Kubernetes

Este repositório detalha a implementação de uma infraestrutura escalável para a aplicação **Scorpion**, utilizando o **Amazon Elastic Kubernetes Service (EKS)**. O foco do projeto foi garantir alta disponibilidade, resiliência e automação de deploy em larga escala.

---

## 🚀 Contexto do Projeto & Arquitetura

### 🔴 O Desafio
Hospedar uma aplicação crítica que exige **auto-healing** (auto-recuperação), escalabilidade horizontal baseada em demanda e isolamento de recursos. Uma solução baseada em instâncias simples não seria capaz de gerenciar o ciclo de vida dos containers de forma eficiente.

### 🟢 A Solução
Implementação de um cluster gerenciado **AWS EKS**. A arquitetura utiliza **Nodes** distribuídos em múltiplas zonas de disponibilidade (Multi-AZ), garantindo que a aplicação Scorpion permaneça online mesmo em caso de falha de um datacenter da AWS.

---

## 🛠️ Stack Tecnológica & Engenharia de Containers

| Componente | Ferramenta | Justificativa Técnica |
| :---: | :--- | :--- |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/kubernetes/kubernetes-plain.svg" width="35"> | **Kubernetes** | Orquestração de containers, gerenciamento de segredos, volumes e service discovery. |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" width="35"> | **AWS EKS** | Plano de controle gerenciado que elimina a complexidade de gerenciar o Master Node do K8s. |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original.svg" width="35"> | **Docker** | Padronização da aplicação Scorpion em imagens imutáveis para garantir paridade entre ambientes. |

---

## 📈 Diferenciais Técnicos (Padrão Sênior)

* **Resiliência:** Configuração de *ReplicaSets* para garantir que o número desejado de pods esteja sempre em execução.
* **Service Discovery:** Implementação de *Services (ClusterIP/LoadBalancer)* para comunicação interna e exposição externa segura.
* **Segurança de Rede:** Isolamento de workloads dentro da VPC, utilizando Security Groups específicos para o cluster.
* **Observabilidade:** Monitoramento nativo da integridade dos nós e pods via console AWS.

---

## 📸 Evidências de Implementação (Case Study)

### 🔹 Infraestrutura como Serviço (EKS Cluster)
Provisionamento do cluster e validação dos nós trabalhadores (Worker Nodes).
![EKS Setup](img/EKS%20III.png)

### 🔹 Orquestração e Deploy de Workloads
Gerenciamento de pods e deploy da aplicação Scorpion via kubectl.
![Kubectl Deploy](img/EKS%20VI.png)

### 🔹 Escalabilidade e Saúde do Cluster
Monitoramento da distribuição de carga entre os nós do cluster.
![EKS Nodes](img/EKS%20IX.png)

### 🔹 Aplicação Scorpion em Produção
Resultado final da aplicação orquestrada e acessível globalmente.
![Scorpion Live](img/image_4a3f28.png.png)

---

## 🏁 Conclusão
O Projeto Scorpion demonstra a maturidade na gestão de ambientes conteinerizados, utilizando as melhores práticas de mercado para entrega de software resiliente e altamente disponível na nuvem AWS.

---
*Documentação desenvolvida por Gustavo Gomes | Cloud & DevOps Engineer*
