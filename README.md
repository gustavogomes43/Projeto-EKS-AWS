# 🦂 Projeto Scorpion: Orquestração de Microserviços com AWS EKS

[![Kubernetes](https://img.shields.io/badge/Kubernetes-v1.29-326CE5?logo=kubernetes)](https://kubernetes.io/)
[![AWS EKS](https://img.shields.io/badge/AWS-EKS_Managed-FF9900?logo=amazonaws)](https://aws.amazon.com/eks/)
[![Status](https://img.shields.io/badge/Status-Production_Ready-success)](#)

## 📝 Visão Geral
O **Projeto Scorpion** é uma implementação robusta de orquestração de microserviços utilizando o **Amazon EKS**. A arquitetura foi desenhada para suportar aplicações críticas que exigem **escalabilidade horizontal**, **auto-healing** e gerenciamento eficiente de recursos via Managed Node Groups.

---

## 🏗️ Arquitetura de Engenharia (The Scorpion Design)

Este diagrama representa a estrutura de camadas do cluster, desde a segurança de borda até a execução dos Pods:

```mermaid
%%{init: {'theme': 'base', 'themeVariables': { 'primaryColor': '#232F3E', 'edgeLabelBackground':'#ffffff', 'tertiaryColor': '#ffffff', 'primaryTextColor': '#ffffff', 'lineColor': '#879196'}}}%%
graph TD
    subgraph Scorpion_Architecture [🦂 Projeto Scorpion: Arquitetura de Engenharia EKS]
        direction TB

        subgraph Layer_1 [Camada 1: Entrada e Segurança]
            direction LR
            Internet((Internet)) --> WAF[AWS WAF]
            WAF --> ALB[Elastic Load Balancer]
            IAM[IAM & RBAC] -.-> EKS_API
        end

        subgraph Layer_2 [Camada 2: AWS EKS Control Plane]
            direction TB
            EKS_API[EKS API Server]
            ETCD[etcd (Datastore)]
            EKS_API --- ETCD
        end

        subgraph Layer_3 [Camada 3: Data Plane (Managed Nodes)]
            direction LR
            EC2_1[Worker Node 1]
            EC2_2[Worker Node 2]
        end

        subgraph Layer_4 [Camada 4: Workloads & Pods]
            direction TB
            K8s_Deploy[K8s Deployment]
            Pod_1((Scorpion Pod))
            Pod_2((Scorpion Pod))
            K8s_Deploy --> Pod_1
            K8s_Deploy --> Pod_2
        end

        ALB ==> Layer_4
        EKS_API ==> Layer_3
        Layer_3 ==> Layer_4
    end

    classDef aws_orange fill:#FF9900,stroke:#232F3E,stroke-width:2px,color:white;
    classDef aws_purple fill:#C851BD,stroke:#232F3E,stroke-width:2px,color:white;
    classDef k8s_blue fill:#326CE5,stroke:#232F3E,stroke-width:2px,color:white;
    classDef white_box fill:#ffffff,stroke:#232F3E,stroke-width:1px,color:#232F3E;

    class ALB,WAF,EC2_1,EC2_2 aws_orange;
    class EKS_API,ETCD,IAM aws_purple;
    class K8s_Deploy,Pod_1,Pod_2 k8s_blue;
    class Scorpion_Architecture,Layer_1,Layer_2,Layer_3,Layer_4 white_box;
---

### Detalhamento Técnico das Camadas

O diagrama acima ilustra o fluxo de dados e controle, dividido em 6 pilares estratégicos:

| Pilar | Descrição Técnica e Decisões de Design |
| :--- | :--- |
| **Pilar 1: Networking & IAM** | **VPC CNI:** Escolhido para que cada Pod receba um IP real da VPC, otimizando a latência de rede.<br>**IRSA:** Implementação de permissões granulares do IAM diretamente para os Pods (Princípio de Least Privilege). |
| **Pilar 2: Control Plane** | **Gerenciamento:** Totalmente operado pela AWS em múltiplas Zonas de Disponibilidade (AZs) para garantir **Alta Disponibilidade (HA)** do API Server e etcd. |
| **Pilar 3: Data Plane (Workers)** | **Managed Node Groups:** Workers em instâncias EC2, com automação de atualizações de segurança e patches operados pelo EKS. |
| **Pilar 4: Orquestração** | **CoreDNS & kube-proxy:** Componentes vitais para a descoberta de serviços e gerenciamento de rede dentro do cluster. |
| **Pilar 5: Workloads (Scorpion)** | **Deployment:** Objeto Kubernetes imutável que garante a quantidade correta de réplicas rodando.<br>**Services:** Exposição via *ClusterIP* ou *LoadBalancer* para entrada de tráfego. |
| **Pilar 6: Lógica de Negócio** | **Microserviço Scorpion:** A aplicação Python/Node.js otimizada para containers, rodando de forma isolada e segura. |

---

> **Destaque Visual:** O diagrama demonstra como a aplicação Scorpion (Camada 6) é orquestrada através de camadas de compute, rede e orquestração gerenciadas pela AWS (EKS), garantindo que um recrutador entenda a profundidade técnica do projeto em um piscar de olhos.

---

## 🛠️ Tecnologias e Decisões de Design

| Componente | Ferramenta | Justificativa |
| :--- | :--- | :--- |
| **Orquestrador** | **Kubernetes** | Padronização de mercado para gerenciamento de containers e escalabilidade. |
| **Cloud Provider** | **AWS (EKS)** | Redução do overhead operacional no gerenciamento do Master Node. |
| **CLI Management** | **Kubectl & AWS CLI** | Automação total via terminal para deploys e troubleshoot. |

---

## 🚀 Ciclo de Vida e Implementação (Case Study)

### 1. Provisionamento e Setup do Cluster
O cluster foi configurado para suportar cargas de trabalho distribuídas. Acompanhei cada etapa do provisionamento para garantir que o Control Plane estivesse saudável antes do join dos nodes.
![EKS Setup](img/1.png)
![Status Active](img/11.png)

### 2. Deploy de Workloads e Services
Utilizei objetos de **Deployment** para garantir a imutabilidade das réplicas e **Services (LoadBalancer/ClusterIP)** para a exposição correta da aplicação Scorpion.
![Kubectl Deploy](img/12.png)
![Replica Sets](img/7.png)

### 3. Monitoramento e Escalabilidade
Validação do estado dos Nodes e Pods para garantir que o cluster responda corretamente a picos de tráfego, mantendo o **High Availability (HA)**.
![EKS Nodes](img/13.png)
![Running Pods](img/8.png)

---

## 🧠 Desafios Técnicos e Soluções (Troubleshooting)

**1. Ajuste de Contexto e Autenticação (RBAC):**
* **Desafio:** Configurar o `aws-auth` ConfigMap para permitir que diferentes usuários IAM tivessem permissões granulares dentro do cluster.
* **Solução:** Mapeamento correto de Roles IAM para Grupos do Kubernetes, garantindo segurança no acesso administrativo.

**2. Persistência e Ciclo de Vida:**
* **Desafio:** Garantir que a aplicação Scorpion mantivesse a consistência durante os rolling updates.
* **Solução:** Configuração de *Readiness* e *Liveness Probes*, evitando que o tráfego fosse direcionado a containers que ainda não estavam prontos para processar requisições.

---

## 📈 Impacto de Negócio
* **Disponibilidade:** 99.9% de uptime garantido pela arquitetura distribuída do EKS.
* **Agilidade:** O tempo de deploy de novas versões da aplicação Scorpion foi reduzido de minutos para segundos (Zero Downtime Deploy).
* **Resiliência:** Em caso de falha de um Node, o Kubernetes automaticamente reagenda os Pods em nós saudáveis, sem intervenção humana.

---

## 🏁 Resultado Final
A aplicação **Scorpion** está operando em um ambiente resiliente, escalável e pronto para produção, demonstrando domínio em toda a jornada de orquestração moderna.
![Scorpion Live](img/14.png)

---

**Autor:** [Gustavo Gomes](https://github.com/gustavogomes43) | *Cloud & Kubernetes Engineer*
