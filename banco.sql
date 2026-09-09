CREATE DATABASE biblioteca_1ano;
USE biblioteca_1ano;

CREATE USER 'biblioteca_user1'@'localhost' IDENTIFIED BY 'projeto1';
GRANT ALL PRIVILEGES ON biblioteca_1ano.* TO 'biblioteca_user1'@'localhost';
FLUSH PRIVILEGES;

SHOW DATABASES;
SELECT user FROM mysql.user;


CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    serie VARCHAR(20) NOT NULL,
    turma VARCHAR(20) NOT NULL,
    telefone VARCHAR(20)
);


CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    status VARCHAR(20) NOT NULL DEFAULT 'Disponível'
);


CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);


CREATE TABLE bibliotecario (
    id_bibliotecario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);


CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_livro INT,
    id_bibliotecario INT,
    data_emprestimo DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'Emprestado',
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);


CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    perfil VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo',
    id_aluno INT NULL,
    id_professor INT NULL,
    id_bibliotecario INT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);


INSERT INTO aluno (nome, serie, turma, telefone) VALUES
('Ana Silva', '1º Ano', 'A', '11987654321'),
('Bruno Costa', '1º Ano', 'B', '21976543210'),
('Carla Oliveira', '2º Ano', 'A', '31965432109'),
('Diego Souza', '2º Ano', 'C', '41954321098'),
('Elena Ramos', '3º Ano', 'A', '51943210987');


INSERT INTO livro (id_livro, titulo, autor, categoria, status) VALUES
(1, 'Dom Casmurro', 'Machado de Assis', 'Romance', 'Disponível'),
(2, 'O Cortiço', 'Aluísio Azevedo', 'Naturalismo', 'Disponível'),
(3, 'Capitães da Areia', 'Jorge Amado', 'Ficção', 'Disponível'),
(4, 'Vidas Secas', 'Graciliano Ramos', 'Literatura Brasileira', 'Disponível'),
(5, 'A Hora da Estrela', 'Clarice Lispector', 'Drama', 'Disponível');


INSERT INTO professor (nome, telefone, email) VALUES
('Kátia Ferreira', '11988887777', 'katia.f@escola.com'),
('Lucas Martins', '21977776666', 'lucas.m@escola.com'),
('Mariana Alves', '31966665555', 'mariana.a@escola.com'),
('Natan Ribeiro', '41955554444', 'natan.r@escola.com'),
('Ana Carvalho', '51944443333', 'olivia.c@escola.com');


INSERT INTO bibliotecario (nome, email) VALUES
('Fernando Lima', 'fernando.lima@biblioteca.com'),
('Mariana Santos', 'mariana.santos@biblioteca.com'),
('Carlos Rocha', 'carlos.rocha@biblioteca.com'),
('Patrícia Gomes', 'patricia.gomes@biblioteca.com'),
('Roberto Alves', 'roberto.alves@biblioteca.com');


INSERT INTO emprestimo (id_aluno, id_livro, id_bibliotecario, data_emprestimo, data_devolucao, data_prevista_devolucao, status) VALUES
(1, 1, 1, '2026-08-01', '2026-08-10', '2026-08-15', 'Devolvido'),
(2, 2, 2, '2026-08-03', NULL, '2026-08-17', 'Emprestado'),
(3, 3, 3, '2026-08-05', NULL, '2026-08-19', 'Atrasado'),
(4, 4, 4, '2026-08-10', NULL, '2026-08-24', 'Atrasado'),
(5, 5, 5, '2026-08-12', '2026-08-20', '2026-08-26', 'Devolvido');


INSERT INTO usuario (nome, email, senha, perfil, status, id_aluno, id_professor, id_bibliotecario) VALUES
('Ana Silva', 'ana.silva@escola.com', 'senha123', 'Aluno', 'Ativo', 1, NULL, NULL),
('Bruno Costa', 'bruno.costa@escola.com', 'senha456', 'Aluno', 'Ativo', 2, NULL, NULL),
('Kátia Ferreira', 'katia.f@escola.com', 'senha789', 'Professor', 'Ativo', NULL, 1, NULL),
('Lucas Martins', 'lucas.m@escola.com', 'senha101', 'Professor', 'Ativo', NULL, 2, NULL),
('Fernando Lima', 'fernando.lima@biblioteca.com', 'senha202', 'Bibliotecário', 'Ativo', NULL, NULL, 1);

SELECT * FROM aluno;

SELECT * FROM livro;

SELECT * FROM professor;

SELECT * FROM bibliotecario;

SELECT * FROM emprestimo;

SELECT * FROM usuario;
                                                                        