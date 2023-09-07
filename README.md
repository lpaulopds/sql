## **Queries do curso completo de Banco de Dados e SQL, sem mistérios.**
>LINUX | DOCKER | PHP | MYSQL | MSSQL  
  
Repositório criado para documentar as queries do curso completo  
de Banco de Dados e SQL, sem mistérios! Esse repositório irá ser  
útil para garantir o aprendizado e consultas no futuro.  
  

>[!NOTE]
>As queries explicadas nas aulas estão no diretório: 'queries-curso'.  
  
### **Comandos para acessar as bases de dados e tabelas criadas durante o curso.**
Execute o comando abaixo na raiz do projeto para subir  
os containers do PHP, MySQL e MSSQL:
```bash
sudo docker compose up -d
```
#### **Para entrar no container MySQL e executar as queries:**  
1. Veja os ids dos containers   
```bash
sudo docker ps
```
2. Entrar no container MySQL  
```bash
sudo docker container exec -it CONTAINERID bash
```
3. Já no bash dentro do container MySQL, conecte no banco:  
```bash
mysql -u root -p
```  
  
#### **Para entrar no container MSSQL e executar queries:**  
1. Entrar no container MSSQL  
```bash
sudo docker container exec -it CONTAINERID bash
```  
2. Já no bash dentro do container MSSQL, conecte no banco:  
```bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA
```  
>[!Warning]
>Se não tiver o sql server instalado no linux,  
>será preciso ter um usuário mssql para administrar  
>a persistência do container do banco de dados.  
  
```bash
sudo useradd -u 1001 mssql
```
```bash
sudo chown -R mssql:lpaulopds persistent-mssql
```
  
----------------------
  
>[!NOTE]
>A senha do usuário root do MySQL está no arquivo: 'compose.yaml'  
>A senha do usuário SA do MSSQL está no arquivo: 'mssql/Dockerfile.'  
  
### **Mais informações**
#### **Docker**
* Arquivos de configurações das imagens do container docker: 'php/Dockerfile' e 'compose.yaml'
#### **PHP/APACHE**
* Logs do apache2 no diretório: 'apache/var/log/apache2'
* Caminho arquivo php.ini: 'apache/etc/'
* Arquivos de configurações do apache nos diretórios: 'apache/etc' e 'apache/vhost'
#### **MySQL**
* Volume do container MySQL no diretório: 'persistent'  
* Arquivo de configuração do MySQL: 'mysql/my.cnf'  
#### **MSSQL**
* Iniciando com containers SQL Server  
* O download do SQL Server pode demorar
  
### **Diagramas Modelagem de Dados**  
>Software: StarUML  
  
Modelagem oficina  
  
![Modelagem oficina](/images/oficina.png "Modelagem oficina")  
  
Modelagem autorelacionamento  
  
![Modelagem autorelacionamento](/images/autorelacionamento.png "Modelagem autorelacionamento")  
  
Modelagem Formas Normais  
  
![Modelagem Formas Normais](/images/fns.png "Modelagem Formas Normais")  
  
