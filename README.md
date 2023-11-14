# Tarefa-BD-SQL-

## Selects-Com-JOINS-Funcoes-de-Agregacao

[siga](https://siga.cps.sp.gov.br/aluno/login.aspx)

## Ex1 - 

Criar as tabelas da forma que foram diagramadas, obedecendo as seguintes restrições:
A coluna users_id da tabela associativa é FK da coluna id, tabela users
A coluna projects_id da tabela associativa é FK da coluna id, tabela projects
A coluna date da tabela projects deve verificar se a data é posterior que 01/09/2014.
Caso contrário, o registro não deve ser inserido
A PK de projects deve ser de auto incremento, iniciando em 10001, com incremento de
1
A PK de users deve ser de auto incremento, iniciando em 1, com incremento de 1
O valor padrão da coluna password da tabela users, deverá ser 123mudar
A coluna username da tabela users deve ter restrição de unicidade.

Modificar a coluna username da tabela Users para varchar(10)
Modificar a coluna password da tabela Users para varchar(8)

Exercícios DDL e DML – Banco de Dados Fatec ZL
Prof. M.Sc. Leandro Colevati dos Santos

Inserir os dados abaixo:
Users

| Id            | Name          |   Username    | Password      |  Email               |
| ------------- | ------------- | ------------- | ------------- | -------------------- |
| 1             | Maria         | Rh_maria      | 123mudar      |maria@empresa.com     |
| 2             | Paulo         | Ti_paulo      | 123@456       |paulo@empresa.com     |
| 3             | Ana           | Rh_ana        | 123mudar      |ana@empresa.com       |
| 4             | Clara         | Ti_clara      | 123mudar      |clara@empresa.com     |
| 5             | Aparecido     | Rh_apareci    | 55@!cido      |aparecido@empresa.com |



Projects
Id Name Description Date
10001 Re-folha Refatoração das
Folhas
05/09/2014
10002 Manutenção PC ́s Manutenção PC ́s 06/09/2014
10003 Auditoria NULL 07/09/2014

Users_id Projects_id
1 10001
5 10001
3 10003
4 10002
2 10002

Considerar as situações:
- O projeto de Manutenção atrasou, mudar a data para 12/09/2014
- O username de aparecido (usar o nome como condição de mudança) está feio, mudar para
Rh_cido
- Mudar o password do username Rh_maria (usar o username como condição de mudança)
para 888@*, mas a condição deve verificar se o password dela ainda é 123mudar
- O user de id 2 não participa mais do projeto 10002, removê-lo da associativa

Fazer:
a) Adicionar User
(6; Joao; Ti_joao; 123mudar; joao@empresa.com)
b) Adicionar Project
(10004; Atualização de Sistemas; Modificação de Sistemas Operacionais nos PC's; 12/09/2014)

Exercícios DDL e DML – Banco de Dados Fatec ZL
Prof. M.Sc. Leandro Colevati dos Santos
c) Consultar:
1) Id, Name e Email de Users, Id, Name, Description e Data de Projects, dos usuários que
participaram do projeto Name Re-folha
2) Name dos Projects que não tem Users
3) Name dos Users que não tem Projects

## Ex2 - 

## Ex3 - 

## Ex4 - 


<!---
![image](https://github.com/JonathanOliveiraCustodio/Tarefa-BD-SQL-Selects-Com-JOINS-Funcoes-de-Agregacao/assets/126304158/1069c7ca-c764-49df-b7e9-85582332c870)
--->

