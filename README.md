# Projeto RDS Terraform

Este projeto utiliza Terraform para gerenciar instâncias de banco de dados RDS na AWS. Ele inclui configurações para ambientes de desenvolvimento (dev) e produção (main).

## Estrutura do Projeto

- `main.tf`: Arquivo principal contendo a definição dos recursos do Terraform.
- `.github/workflows/`: Contém os workflows do GitHub Actions para CI/CD.

## Variáveis

As seguintes variáveis são utilizadas no `main.tf`:

- `db_name`: Nome do banco de dados.
- `db_username`: Nome de usuário do banco de dados.
- `db_password`: Senha do banco de dados.
- `allocated_storage`: Armazenamento alocado para o banco de dados.
- `engine_version`: Versão do motor do banco de dados.
- `engine`: Motor do banco de dados (padrão: `mysql`).
- `instance_class`: Classe da instância (padrão: `db.t3.micro`).
- `parameter_group_name`: Nome do grupo de parâmetros (padrão: `default.mysql8.0`).
- `skip_final_snapshot`: Pular snapshot final (padrão: `true`).
- `apply_immediately`: Aplicar imediatamente (padrão: `true`).

## Workflows do GitHub Actions

### `terraform-merge-prod.yml`

Este workflow é acionado em pushs para a branch `main` e aplica as mudanças no ambiente de produção.

### `terraform-merge-dev.yml`

Este workflow é acionado em pushs para a branch `dev` e aplica as mudanças no ambiente de desenvolvimento.

### `terraform-checks.yml`

Este workflow é acionado em pull requests para as branches `dev` e `main` e realiza verificações de formatação, inicialização, validação e plano do Terraform.

## Variáveis de Ambiente no GitHub Actions

As seguintes variáveis de ambiente podem ser configuradas no GitHub Actions:

Para acesso à AWS:
- `AWS_ACCESS_KEY_ID`: Chave de acesso da AWS (definir em secrets).
- `AWS_SECRET_ACCESS_KEY`: Chave secreta da AWS (definir em secrets).
- `AWS_DEFAULT_REGION`: Região padrão da AWS (definir em secrets).

Configurações para banco de desenvolvimento (dev):
- `DB_USERNAME_DEV`: Nome de usuário do banco de dados de desenvolvimento (definir em secrets).
- `DB_PASSWORD_DEV`: Senha do banco de dados de desenvolvimento (definir em secrets).
- `DB_NAME_DEV`: Nome do banco de dados de desenvolvimento (definir em variables).
- `ALLOCATED_STORAGE_DEV`: Armazenamento alocado para o banco de dados de desenvolvimento (definir em variables).

Configurações para banco de produção (prod):
- `DB_USERNAME_PROD`: Nome de usuário do banco de dados de produção (definir no secrets).
- `DB_PASSWORD_PROD`: Senha do banco de dados de produção (definir no secrets).
- `DB_NAME_PROD`: Nome do banco de dados de produção (definir no secrets).
- `ALLOCATED_STORAGE_PROD`: Armazenamento alocado para o banco de dados de produção (definido em variables).

## Como Usar

1. Clone o repositório:
    ```sh
    git clone https://github.com/seu-usuario/seu-repositorio.git
    cd seu-repositorio
    ```

2. Configure as variáveis de ambiente necessárias:
    ```sh
    export AWS_ACCESS_KEY_ID=your_access_key_id
    export AWS_SECRET_ACCESS_KEY=your_secret_access_key
    export AWS_DEFAULT_REGION=your_default_region
    export TF_VAR_db_username=your_db_username
    export TF_VAR_db_password=your_db_password
    export TF_VAR_db_name=your_db_name
    export TF_VAR_allocated_storage=your_allocated_storage
    ```

3. Inicialize o Terraform:
    ```sh
    terraform init
    ```

4. Selecione o workspace apropriado:
    ```sh
    terraform workspace select dev || terraform workspace new dev
    ```
   ou
    ```sh
    terraform workspace select main || terraform workspace new main
    ```

5. Aplique as mudanças:
    ```sh
    terraform apply -auto-approve
    ```

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.