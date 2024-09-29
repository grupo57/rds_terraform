# Projeto RDS Terraform

Este projeto utiliza Terraform para gerenciar inst�ncias de banco de dados RDS na AWS. Ele inclui configura��es para ambientes de desenvolvimento (dev) e produ��o (main).

## Estrutura do Projeto

- `main.tf`: Arquivo principal contendo a defini��o dos recursos do Terraform.
- `.github/workflows/`: Cont�m os workflows do GitHub Actions para CI/CD.

## Vari�veis

As seguintes vari�veis s�o utilizadas no `main.tf`:

- `db_name`: Nome do banco de dados.
- `db_username`: Nome de usu�rio do banco de dados.
- `db_password`: Senha do banco de dados.
- `allocated_storage`: Armazenamento alocado para o banco de dados.
- `engine_version`: Vers�o do motor do banco de dados.
- `engine`: Motor do banco de dados (padr�o: `mysql`).
- `instance_class`: Classe da inst�ncia (padr�o: `db.t3.micro`).
- `parameter_group_name`: Nome do grupo de par�metros (padr�o: `default.mysql8.0`).
- `skip_final_snapshot`: Pular snapshot final (padr�o: `true`).
- `apply_immediately`: Aplicar imediatamente (padr�o: `true`).

## Workflows do GitHub Actions

### `terraform-merge-prod.yml`

Este workflow � acionado em pushs para a branch `main` e aplica as mudan�as no ambiente de produ��o.

### `terraform-merge-dev.yml`

Este workflow � acionado em pushs para a branch `dev` e aplica as mudan�as no ambiente de desenvolvimento.

### `terraform-checks.yml`

Este workflow � acionado em pull requests para as branches `dev` e `main` e realiza verifica��es de formata��o, inicializa��o, valida��o e plano do Terraform.

## Vari�veis de Ambiente no GitHub Actions

As seguintes vari�veis de ambiente podem ser configuradas no GitHub Actions:

Para acesso � AWS:
- `AWS_ACCESS_KEY_ID`: Chave de acesso da AWS (definir em secrets).
- `AWS_SECRET_ACCESS_KEY`: Chave secreta da AWS (definir em secrets).
- `AWS_DEFAULT_REGION`: Regi�o padr�o da AWS (definir em secrets).

Configura��es para banco de desenvolvimento (dev):
- `DB_USERNAME_DEV`: Nome de usu�rio do banco de dados de desenvolvimento (definir em secrets).
- `DB_PASSWORD_DEV`: Senha do banco de dados de desenvolvimento (definir em secrets).
- `DB_NAME_DEV`: Nome do banco de dados de desenvolvimento (definir em variables).
- `ALLOCATED_STORAGE_DEV`: Armazenamento alocado para o banco de dados de desenvolvimento (definir em variables).

Configura��es para banco de produ��o (prod):
- `DB_USERNAME_PROD`: Nome de usu�rio do banco de dados de produ��o (definir no secrets).
- `DB_PASSWORD_PROD`: Senha do banco de dados de produ��o (definir no secrets).
- `DB_NAME_PROD`: Nome do banco de dados de produ��o (definir no secrets).
- `ALLOCATED_STORAGE_PROD`: Armazenamento alocado para o banco de dados de produ��o (definido em variables).

## Como Usar

1. Clone o reposit�rio:
    ```sh
    git clone https://github.com/seu-usuario/seu-repositorio.git
    cd seu-repositorio
    ```

2. Configure as vari�veis de ambiente necess�rias:
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

5. Aplique as mudan�as:
    ```sh
    terraform apply -auto-approve
    ```

## Licen�a

Este projeto est� licenciado sob a licen�a MIT. Veja o arquivo `LICENSE` para mais detalhes.