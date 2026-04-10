# ☁️ AWS Cloud & Infrastructure Portfolio - Gustavo Gomes

Repositório focado em **Infraestrutura como Código (IaC)** e **Sustentação de Ambientes Críticos** na AWS.

---

## 🦂 Projeto Scorpion (EKS Cluster Modernization)

Este projeto representa a modernização de uma infraestrutura legada para um modelo de containers orquestrados. Foquei em criar um ambiente resiliente, seguro e com custos otimizados.

### 🛠️ Ferramentas Utilizadas
| Ferramenta | Nome | Descrição |
| :---: | :--- | :--- |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" width="35"> | **AWS EKS** | Gerenciamento do Cluster Kubernetes (Control Plane). |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/terraform/terraform-original.svg" width="35"> | **Terraform** | Orquestração de toda a infraestrutura como código (VPC, IAM, EKS). |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/kubernetes/kubernetes-plain.svg" width="35"> | **Kubectl** | Interação e deploy de recursos dentro do cluster. |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/linux/linux-original.svg" width="35"> | **Linux Bash** | Automação de scripts de configuração e instalação. |

### 🔍 Detalhes Técnicos e Troubleshooting
* **Rede de Alta Disponibilidade:** Construção de uma VPC Multi-AZ com subnets públicas e privadas para isolamento de carga.
* **FinOps na Prática:** Identifiquei que o uso de NAT Gateways elevaria o custo do laboratório desnecessariamente. Solucionei o problema movendo os nodes para subnets públicas com **Security Groups extremamente restritivos**, mantendo a segurança e custo zero de tráfego NAT.
* **IAM Roles for Service Accounts:** Configuração de permissões granulares para que o cluster tenha acesso apenas ao necessário na conta AWS.

> **Status do Cluster:**
> ![Kubectl Nodes](img/image_c7f3c2.png)
> *Evidência dos nós provisionados e prontos para receber carga.*

---

## 🎵 Projeto Aria.net (Static Web Hosting)

Solução de baixo custo para hospedagem de aplicações front-end utilizando serviços globais da AWS.

### 🛠️ Ferramentas Utilizadas
| Ferramenta | Nome | Descrição |
| :---: | :--- | :--- |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-plain-wordmark.svg" width="35"> | **Amazon S3** | Hospedagem de arquivos estáticos com alta durabilidade. |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/terraform/terraform-plain.svg" width="35"> | **Terraform** | Automação do bucket e políticas de acesso (Bucket Policy). |

### 🚀 Diferenciais do Projeto
* **Escalabilidade:** Arquitetura serverless que suporta milhões de acessos sem intervenção manual.
* **Segurança:** Implementação de bloqueio de acesso público indevido via Terraform.

---

## 📊 Resultados Alcançados
* **Agilidade:** Provisionamento completo do ambiente EKS em menos de 15 minutos.
* **Padronização:** Uso de módulos Terraform para garantir que o ambiente seja replicável.
* **Custo-Eficiência:** Arquiteturas desenhadas para aproveitar o Free Tier e evitar desperdícios.

---
*Este portfólio é um documento vivo da minha evolução como Engenheiro de Cloud.*
