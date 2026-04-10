# ☁️ AWS Cloud & Infrastructure Portfolio - Gustavo Gomes

Repositório focado em **Infraestrutura como Código (IaC)** e **Modernização de Aplicações** na AWS. Aqui documento projetos reais de transição para arquiteturas escaláveis e otimizadas.

---

## 🦂 Projeto Scorpion (Mission Critical EKS Cluster)

Provisionamento de um cluster Kubernetes gerenciado (EKS) focado em alta disponibilidade e resiliência.

### 🛠️ Tecnologias
| Ferramenta | Nome | Descrição |
| :---: | :---: | :--- |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" width="35"> | **AWS EKS** | Orquestração de containers. |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/terraform/terraform-original.svg" width="35"> | **Terraform** | IaC para VPC, IAM e EKS. |

### 📸 Galeria de Implementação (Scorpion)
* **Arquitetura de Rede:** ![VPC](img/14.png)
* **Provisionamento:** ![Apply](img/4.png)
* **Cluster Ativo:** ![Nodes](img/12.png)

---

## 🎵 Projeto Aria.net (S3 Static Hosting)

Este projeto foca na automação de hospedagem serverless de baixa latência e custo zero.

### 🛠️ Tecnologias
| Ferramenta | Nome | Descrição |
| :---: | :---: | :--- |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-plain-wordmark.svg" width="35"> | **Amazon S3** | Hosting estático e armazenamento. |
| <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/terraform/terraform-plain.svg" width="35"> | **Terraform** | Automação de Buckets e Policies. |

### 📸 Galeria de Implementação (Aria)

#### 🔹 Fase 1: Escopo e Planejamento IaC
Provisionamento inicial dos recursos de storage.
* **Terraform Init & Plan:** ![Plan](img/Terraform%20I.png)
* **Definição de Recursos:** ![Recursos](img/Terraform%20II.png)

#### 🔹 Fase 2: Automação e Outputs
Configuração de variáveis e visualização de resultados.
* **Criação do Bucket:** ![Bucket](img/Terraform%20III.png)
* **Outputs de Endpoint:** ![Outputs](img/Terraform%20IV.png)

#### 🔹 Fase 3: Segurança e Políticas de Acesso
Configuração de Bucket Policies para acesso público controlado.
* **Security Policy:** ![Policy](img/Terraform%20V.png)
* **Bloqueio de Acesso Indevido:** ![Public Access](img/Terraform%20VI.png)

#### 🔹 Fase 4: Validação e Deployment Final
Site publicado e funcional no endpoint da AWS.
* **Apply Finalizado:** ![Done](img/Terraform%20IX.png)
* **Site Online:** ![Aria Live](img/image_b791f0.png.png)

### 🚀 Diferenciais Técnicos
* **FinOps:** Custo zero utilizando o AWS Free Tier.
* **Sustentação:** Infraestrutura imutável - qualquer alteração é feita via código, eliminando o "clique-ops".

---
*Este portfólio demonstra resiliência técnica e foco na sustentação de ambientes críticos.*
