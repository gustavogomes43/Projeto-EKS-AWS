# ☁️ AWS Cloud & Infrastructure Portfolio - Gustavo Gomes

Repositório focado em **Infraestrutura como Código (IaC)** e **Sustentação de Ambientes Críticos** na AWS. Aqui documento a transição de serviços legados para arquiteturas modernas, escaláveis e com foco em otimização financeira.

---

## 🦂 Projeto Scorpion (Mission Critical EKS Cluster)

Este projeto representa a modernização de uma infraestrutura legada para um modelo de containers orquestrados. Foquei em criar um ambiente resiliente, seguro e com custos otimizados.

### 🛠️ Tecnologias e Ferramentas
| Ícone | Ferramenta | Descrição |
| :---: | :---: | :--- |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" width="35"> | **AWS EKS** | Orquestração de containers com plano de controle gerenciado. |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/terraform/terraform-original.svg" width="35"> | **Terraform** | Provisionamento de infraestrutura imutável e versionada (VPC, IAM, EKS). |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/kubernetes/kubernetes-plain.svg" width="35"> | **Kubectl** | Gerenciamento e inspeção dos nós e workloads do cluster via CLI. |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/linux/linux-original.svg" width="35"> | **Linux Bash** | Automação de scripts de configuração, instalação de ferramentas e troubleshooting. |

### 🚀 Desafios e Visão de Engenharia
* **Infraestrutura como Código (IaC):** Todo o ambiente (Rede, Segurança, Computação) é replicável e versionado.
* **Troubleshooting Multi-AZ:** Identifiquei e corrigi a falha de registro dos Worker Nodes que estavam isolados em subnets privadas. 
* **FinOps na Prática:** Readequei a arquitetura de rede para subnets públicas com **Security Groups extremamente restritivos**, eliminando o custo fixo elevado de um NAT Gateway em ambiente de laboratório, mantendo a segurança e o custo zero de tráfego.

### 📸 Evidências do Sucesso
> **Status dos Nós Operacionais:**
> <img src="https://raw.githubusercontent.com/gustavogomes43/meu-portfolio-aws/main/img/image_c7f3c2.png" alt="Kubectl Nodes Status" width="100%">
> *Nós operacionais e com status 'Ready' em zona de disponibilidade us-east-1, confirmando o sucesso do provisionamento.*

---

## 🎵 Projeto Aria.net (S3 Static Hosting)

Desenvolvimento de uma arquitetura **Serverless** para hospedagem de sites estáticos, focada em performance e custo próximo de zero.

### 🛠️ Tecnologias e Ferramentas
| Ícone | Ferramenta | Descrição |
| :---: | :---: | :--- |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" width="35"> | **Amazon S3** | Armazenamento de objetos configurado para Static Website Hosting. |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/terraform/terraform-original.svg" width="35"> | **Terraform** | Automação do bucket, políticas de acesso e gerenciamento de Public Access Blocks. |

### 🚀 Diferenciais e Sustentabilidade
* **Escalabilidade Infinita:** Solução baseada em S3 que suporta picos de tráfego sem gerenciamento de instâncias.
* **Segurança de Dados:** Implementação de políticas de acesso granular via código (Bucket Policy).
* **Custo-Eficiência:** Implementação focada em manter o cliente dentro dos limites gratuitos (Free Tier) da AWS.

---

## 📊 Resultados Consolidados

* **Agilidade:** Deploy de infraestrutura complexa (VPC + EKS) em menos de 15 minutos via IaC.
* **Confiabilidade:** Redução de erros humanos através da eliminação de configurações manuais via Console.
* **Conformidade:** Ambiente 100% versionado e seguindo o Principle of Least Privilege (Menor Privilégio) nas IAM Roles.

---
*Este portfólio demonstra resiliência técnica e foco na sustentação de ambientes críticos.*
