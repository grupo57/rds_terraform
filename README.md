# Terraform AWS RDS Deployment

Este projeto utiliza Terraform para gerenciar a infraestrutura de banco de dados RDS na AWS. Existem dois ambientes configurados: `dev` e `prod`.

## Estrutura do Projeto

- `.github/workflows/terraform-checks.yml`: Workflow do GitHub Actions para verificar a formatação e validação do Terraform em pull requests.
- `.github/workflows/terraform-merge-dev.yml`: Workflow do GitHub Actions para aplicar mudanças no ambiente de desenvolvimento (`dev`).
- `.github/workflows/terraform-merge-prod.yml`: Workflow do GitHub Actions para aplicar mudanças no ambiente de produção (`prod`).
- `main.tf`: Arquivo principal do Terraform que define os recursos do RDS para os ambientes `dev` e `prod`.

## Variáveis

- `environment`: O ambiente para deploy (`dev` ou `main`).
- `db_username`: O nome de usuário do banco de dados.
- `db_password`: A senha do banco de dados.

## Recursos

- `aws_db_instance.grupo57_dev`: Instância RDS para o ambiente de desenvolvimento.
- `aws_db_instance.grupo57_prod`: Instância RDS para o ambiente de produção.

## Workflows do GitHub Actions

### Terraform Checks

Executa verificações de formatação e validação do Terraform em pull requests para os branches `dev` e `main`.

### Terraform Merge Dev

Aplica mudanças no ambiente de desenvolvimento (`dev`) ao fazer push para o branch `dev`.

### Terraform Merge Prod

Aplica mudanças no ambiente de produção (`prod`) ao fazer push para o branch `main`.

## Como Usar

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/grupo57/rds_terraform.git
   cd rds_terraform
    ```
   
2. **Configurar variáveis de ambiente:**
   Certifique-se de que as seguintes variáveis de ambiente estão configuradas no GitHub Secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_DEFAULT_REGION`
   - `DB_USERNAME_DEV`
   - `DB_PASSWORD_DEV`
   - `DB_USERNAME_PROD`
   - `DB_PASSWORD_PROD`


3. **Executar os Workflows:**
   - Crie um pull request para o branch `dev` ou `main` para acionar o workflow de verificações.
   - Faça push para o branch `dev` para aplicar mudanças no ambiente de desenvolvimento.
   - Faça push para o branch `main` para aplicar mudanças no ambiente de produção.

## Requisitos

- Terraform v1.4.2
- Conta AWS com permissões para gerenciar RDS

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).