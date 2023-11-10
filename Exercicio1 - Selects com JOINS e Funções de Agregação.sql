USE project
GO

SELECT * from users
SELECT * from projects
SELECT * from users_has_projects

-- Fazer:

--a) Adicionar User

--(6; Joao; Ti_joao; 123mudar; joao@empresa.com)

INSERT INTO users (name, username, password,email)
VALUES ('Joao', 'Ti_joao', '123mudar', 'joao@empresa.com')


--b) Adicionar Project
--(10004; Atualização de Sistemas; Modificação de Sistemas Operacionais nos PC's; 12/09/2014)
INSERT INTO projects (name, description, date)
VALUES ('Atualização de Sistemas', 'Modificação de Sistemas Operacionais nos PC''s', '2014-09-12')

--Exercícios DDL e DML – Banco de Dados Fatec ZL

--c) Consultar:
--1) Id, Name e Email de Users, Id, Name, Description e Data de Projects, dos usuários que
--participaram do projeto Name Re-folha

SELECT
    usuario.id AS Id_Usuario,
    usuario.name AS Name_Usuario,
    usuario.email AS E_mail,
    usuario.id AS Id_Projeto,
    pro.name AS Nome_Projeto,
    pro.description AS Descrição
FROM
    users usuario INNER JOIN users_has_projects up ON usuario.id = up.id_users
    INNER JOIN
    projects pro ON up.id_projects = pro.id
WHERE
    pro.name LIKE '%Re-folha';


--2) Name dos Projects que não tem Users
SELECT pj.name AS Nome_Projeto
FROM projects pj
LEFT JOIN users_has_projects up ON pj.id = up.id_projects
WHERE up.id_users IS NULL;


--3) Name dos Users que não tem Projects
SELECT us.name AS Nome_Usuario
FROM users us
LEFT JOIN users_has_projects up ON us.id = up.id_users
WHERE up.id_projects IS NULL;