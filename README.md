# Terraform AWS RDS Deployment

Este projeto utiliza Terraform para gerenciar a infraestrutura de banco de dados RDS na AWS. Existem dois ambientes configurados: `dev` e `prod`.

## Estrutura do Projeto

- `.github/workflows/terraform-checks.yml`: Workflow do GitHub Actions para verificar a formata��o e valida��o do Terraform em pull requests.
- `.github/workflows/terraform-merge-dev.yml`: Workflow do GitHub Actions para aplicar mudan�as no ambiente de desenvolvimento (`dev`).
- `.github/workflows/terraform-merge-prod.yml`: Workflow do GitHub Actions para aplicar mudan�as no ambiente de produ��o (`prod`).
- `main.tf`: Arquivo principal do Terraform que define os recursos do RDS para os ambientes `dev` e `prod`.

## Vari�veis

- `environment`: O ambiente para deploy (`dev` ou `main`).
- `db_username`: O nome de usu�rio do banco de dados.
- `db_password`: A senha do banco de dados.

## Recursos

- `aws_db_instance.grupo57_dev`: Inst�ncia RDS para o ambiente de desenvolvimento.
- `aws_db_instance.grupo57_prod`: Inst�ncia RDS para o ambiente de produ��o.

## Workflows do GitHub Actions

### Terraform Checks

Executa verifica��es de formata��o e valida��o do Terraform em pull requests para os branches `dev` e `main`.

### Terraform Merge Dev

Aplica mudan�as no ambiente de desenvolvimento (`dev`) ao fazer push para o branch `dev`.

### Terraform Merge Prod

Aplica mudan�as no ambiente de produ��o (`prod`) ao fazer push para o branch `main`.

## Como Usar

1. **Clone o reposit�rio:**
   ```sh
   git clone https://github.com/grupo57/rds_terraform.git
   cd rds_terraform
    ```
   
2. **Configurar vari�veis de ambiente:**
   Certifique-se de que as seguintes vari�veis de ambiente est�o configuradas no GitHub Secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_DEFAULT_REGION`
   - `DB_USERNAME_DEV`
   - `DB_PASSWORD_DEV`
   - `DB_USERNAME_PROD`
   - `DB_PASSWORD_PROD`


3. **Executar os Workflows:**
   - Crie um pull request para o branch `dev` ou `main` para acionar o workflow de verifica��es.
   - Fa�a push para o branch `dev` para aplicar mudan�as no ambiente de desenvolvimento.
   - Fa�a push para o branch `main` para aplicar mudan�as no ambiente de produ��o.

## Requisitos

- Terraform v1.4.2
- Conta AWS com permiss�es para gerenciar RDS

## Licen�a

Este projeto est� licenciado sob a [MIT License](LICENSE).