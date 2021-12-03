-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Dez-2021 às 16:07
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_horario`
--
CREATE DATABASE IF NOT EXISTS `db_horario` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_horario`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--
-- Criação: 25-Nov-2021 às 12:01
-- Última actualização: 03-Dez-2021 às 13:39
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `cargo`:
--

--
-- Extraindo dados da tabela `cargo`
--

INSERT DELAYED IGNORE INTO `cargo` (`id_cargo`, `descricao`) VALUES
(1, 'Coordenador de Curso'),
(2, 'Director de Turma'),
(3, 'Coordenador de Disciplina'),
(4, 'Coordenador de Turno');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_classe`
--
-- Criação: 25-Nov-2021 às 12:08
-- Última actualização: 03-Dez-2021 às 13:50
--

CREATE TABLE `tb_classe` (
  `id_classe` int(11) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_classe`:
--

--
-- Extraindo dados da tabela `tb_classe`
--

INSERT DELAYED IGNORE INTO `tb_classe` (`id_classe`, `descricao`) VALUES
(1, '10ª'),
(2, '11ª'),
(3, '12ª'),
(4, '13ª');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_classe_professor`
--
-- Criação: 25-Nov-2021 às 12:47
-- Última actualização: 03-Dez-2021 às 13:55
--

CREATE TABLE `tb_classe_professor` (
  `id_classe` int(11) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_classe_professor`:
--   `id_classe`
--       `tb_classe` -> `id_classe`
--   `id_professor`
--       `tb_professor` -> `id_professor`
--

--
-- Extraindo dados da tabela `tb_classe_professor`
--

INSERT DELAYED IGNORE INTO `tb_classe_professor` (`id_classe`, `id_professor`) VALUES
(1, 4),
(2, 3),
(2, 10),
(1, 10),
(2, 9),
(3, 9),
(3, 2),
(4, 2),
(1, 7),
(2, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contacto`
--
-- Criação: 25-Nov-2021 às 12:16
-- Última actualização: 03-Dez-2021 às 13:58
--

CREATE TABLE `tb_contacto` (
  `id_contacto` int(11) NOT NULL,
  `telefene_1` int(11) DEFAULT NULL,
  `telefone_2` int(11) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `professor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_contacto`:
--   `professor`
--       `tb_professor` -> `id_professor`
--

--
-- Extraindo dados da tabela `tb_contacto`
--

INSERT DELAYED IGNORE INTO `tb_contacto` (`id_contacto`, `telefene_1`, `telefone_2`, `email`, `professor`) VALUES
(1, 927100439, NULL, 'paulobaiaofaustino@gmail.com', 10),
(2, 928374823, 990782123, 'ckipanda12@gmail.com', 2),
(3, 922384232, NULL, 'kalungaisidro12@hotmail.com', 9),
(4, 927323283, NULL, 'joanacatimba124@gmail.com', 5),
(5, 932789123, 990283374, 'cristianolourenco89@gmail.com', 4),
(6, 928323, NULL, 'placidestxamba@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_curso`
--
-- Criação: 25-Nov-2021 às 12:06
-- Última actualização: 03-Dez-2021 às 13:42
--

CREATE TABLE `tb_curso` (
  `id_curso` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_curso`:
--

--
-- Extraindo dados da tabela `tb_curso`
--

INSERT DELAYED IGNORE INTO `tb_curso` (`id_curso`, `nome`) VALUES
(1, 'Administração Pública'),
(2, 'Comércio'),
(3, 'Comunicação Social'),
(4, 'Contabilidade e Gestão'),
(5, 'Estatística e Planeamento'),
(6, 'Finanças'),
(7, 'Gestão Empresarial'),
(8, 'Gestão de Transportes'),
(9, 'Informática de Gestão'),
(10, 'Marketing e Publicidade');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_curso_classe`
--
-- Criação: 25-Nov-2021 às 12:38
-- Última actualização: 03-Dez-2021 às 14:01
--

CREATE TABLE `tb_curso_classe` (
  `id_classe` int(11) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_curso_classe`:
--   `id_classe`
--       `tb_classe` -> `id_classe`
--   `id_curso`
--       `tb_curso` -> `id_curso`
--

--
-- Extraindo dados da tabela `tb_curso_classe`
--

INSERT DELAYED IGNORE INTO `tb_curso_classe` (`id_classe`, `id_curso`) VALUES
(1, 1),
(1, 3),
(1, 2),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_curso_disciplina`
--
-- Criação: 25-Nov-2021 às 12:43
-- Última actualização: 03-Dez-2021 às 15:02
--

CREATE TABLE `tb_curso_disciplina` (
  `id_curso` int(11) DEFAULT NULL,
  `id_disciplina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_curso_disciplina`:
--   `id_curso`
--       `tb_curso` -> `id_curso`
--   `id_disciplina`
--       `tb_disciplina` -> `id_disciplina`
--

--
-- Extraindo dados da tabela `tb_curso_disciplina`
--

INSERT DELAYED IGNORE INTO `tb_curso_disciplina` (`id_curso`, `id_disciplina`) VALUES
(1, 10),
(3, 6),
(2, 9),
(2, 1),
(6, 8),
(4, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_curso_turno`
--
-- Criação: 25-Nov-2021 às 12:40
-- Última actualização: 03-Dez-2021 às 15:00
--

CREATE TABLE `tb_curso_turno` (
  `id_curso` int(11) DEFAULT NULL,
  `id_turno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_curso_turno`:
--   `id_curso`
--       `tb_curso` -> `id_curso`
--   `id_turno`
--       `turno` -> `id_turno`
--

--
-- Extraindo dados da tabela `tb_curso_turno`
--

INSERT DELAYED IGNORE INTO `tb_curso_turno` (`id_curso`, `id_turno`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 1),
(3, 2),
(9, 1),
(9, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_disciplina`
--
-- Criação: 25-Nov-2021 às 12:10
-- Última actualização: 03-Dez-2021 às 14:55
--

CREATE TABLE `tb_disciplina` (
  `id_disciplina` int(11) NOT NULL,
  `nome` varchar(90) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_disciplina`:
--   `classe`
--       `tb_classe` -> `id_classe`
--

--
-- Extraindo dados da tabela `tb_disciplina`
--

INSERT DELAYED IGNORE INTO `tb_disciplina` (`id_disciplina`, `nome`, `classe`) VALUES
(1, 'Língua Portuguesa I', 1),
(2, 'Língua Portuguesa II', 2),
(3, 'Matemática I', 1),
(4, 'Matemática II', 2),
(5, 'Matemática III', 3),
(6, 'Educação Física I', 1),
(7, 'Educação Física II', 2),
(8, 'Contabilidade I', 1),
(9, 'Contabilidade II', 2),
(10, 'Contabilidade Analítica', 3),
(11, 'Técnicas e Linguagens de Programação I', 1),
(12, 'Técnicas e Linguagens de Programação II', 2),
(13, 'Técnicas e Linguagens de Programação III', 3),
(14, 'Sistemas Informáticos', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_disciplina_professor`
--
-- Criação: 25-Nov-2021 às 12:30
--

CREATE TABLE `tb_disciplina_professor` (
  `id_disciplina` int(11) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_disciplina_professor`:
--   `id_disciplina`
--       `tb_disciplina` -> `id_disciplina`
--   `id_professor`
--       `tb_professor` -> `id_professor`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_professor`
--
-- Criação: 25-Nov-2021 às 12:04
-- Última actualização: 03-Dez-2021 às 13:48
--

CREATE TABLE `tb_professor` (
  `id_professor` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `habilitacao_Literaria` varchar(80) DEFAULT NULL,
  `especialidade` varchar(120) DEFAULT NULL,
  `cargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_professor`:
--   `cargo`
--       `cargo` -> `id_cargo`
--

--
-- Extraindo dados da tabela `tb_professor`
--

INSERT DELAYED IGNORE INTO `tb_professor` (`id_professor`, `nome`, `habilitacao_Literaria`, `especialidade`, `cargo`) VALUES
(1, 'Placides Cruz', 'Licenciatura', 'Engenharia Informática', 1),
(2, 'Pedro Abrão', 'Licenciatura', 'Informática de Gestão Financeira', 4),
(3, 'Maurícia Culembe', 'Mestrado', 'Relações Humanas', NULL),
(4, 'Cristiano Lourenço', 'Mestrado', 'Análise de Sistemas Informáticos', 4),
(5, 'Joana Catimba', 'Licenciatura', 'Recursos Humanos', 3),
(6, 'Yussuf Sebastião', 'Mestrado', 'Modelagem de Dados', 4),
(7, 'Alberto Guiwho', 'Licenciatura', 'Gestão de Empresas', 3),
(8, 'Teresa Paulo', 'Licenciatura', 'Gestão Financeira', 3),
(9, 'Isidro Calunga', 'Mestrado ', 'Gestão de Redes Corporativas', 3),
(10, 'Paulo Baião Faustino', 'Técnico Médio', 'Educação Física', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_prof_curso`
--
-- Criação: 25-Nov-2021 às 12:26
-- Última actualização: 03-Dez-2021 às 14:50
--

CREATE TABLE `tb_prof_curso` (
  `id_professor` int(11) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_prof_curso`:
--   `id_professor`
--       `tb_professor` -> `id_professor`
--   `id_curso`
--       `tb_curso` -> `id_curso`
--

--
-- Extraindo dados da tabela `tb_prof_curso`
--

INSERT DELAYED IGNORE INTO `tb_prof_curso` (`id_professor`, `id_curso`) VALUES
(7, 2),
(4, 1),
(5, 4),
(6, 3),
(6, 1),
(6, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_sala`
--
-- Criação: 25-Nov-2021 às 12:19
-- Última actualização: 03-Dez-2021 às 14:14
--

CREATE TABLE `tb_sala` (
  `id_sala` int(11) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_sala`:
--

--
-- Extraindo dados da tabela `tb_sala`
--

INSERT DELAYED IGNORE INTO `tb_sala` (`id_sala`, `descricao`) VALUES
(1, 'B202'),
(2, 'B203'),
(3, 'B204'),
(4, 'B205'),
(5, 'B206'),
(6, 'B207'),
(7, 'B208'),
(8, 'B102'),
(9, 'C101'),
(10, 'C104');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_sala_professor`
--
-- Criação: 25-Nov-2021 às 12:49
-- Última actualização: 03-Dez-2021 às 14:47
--

CREATE TABLE `tb_sala_professor` (
  `id_sala` int(11) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_sala_professor`:
--   `id_sala`
--       `tb_sala` -> `id_sala`
--   `id_professor`
--       `tb_professor` -> `id_professor`
--

--
-- Extraindo dados da tabela `tb_sala_professor`
--

INSERT DELAYED IGNORE INTO `tb_sala_professor` (`id_sala`, `id_professor`) VALUES
(1, 5),
(8, 5),
(3, 4),
(3, 5),
(5, 7),
(1, 7),
(4, 3),
(5, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_turma`
--
-- Criação: 03-Dez-2021 às 14:06
-- Última actualização: 03-Dez-2021 às 14:17
--

CREATE TABLE `tb_turma` (
  `id_turma` int(11) NOT NULL,
  `descricao` varchar(10) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `sala` int(11) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_turma`:
--   `curso`
--       `tb_curso` -> `id_curso`
--   `turno`
--       `turno` -> `id_turno`
--   `sala`
--       `tb_sala` -> `id_sala`
--   `classe`
--       `tb_classe` -> `id_classe`
--

--
-- Extraindo dados da tabela `tb_turma`
--

INSERT DELAYED IGNORE INTO `tb_turma` (`id_turma`, `descricao`, `curso`, `turno`, `sala`, `classe`) VALUES
(1, 'A', 1, 1, 1, 1),
(2, 'B', 1, 1, 7, 1),
(3, 'A', 3, 2, 4, 2),
(4, 'B', 3, 2, 7, 2),
(5, 'A', 4, 1, 1, 4),
(6, 'B', 5, 3, 7, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_turma_professor`
--
-- Criação: 25-Nov-2021 às 12:33
-- Última actualização: 03-Dez-2021 às 14:22
--

CREATE TABLE `tb_turma_professor` (
  `id_turma` int(11) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_turma_professor`:
--   `id_turma`
--       `tb_turma` -> `id_turma`
--   `id_professor`
--       `tb_professor` -> `id_professor`
--

--
-- Extraindo dados da tabela `tb_turma_professor`
--

INSERT DELAYED IGNORE INTO `tb_turma_professor` (`id_turma`, `id_professor`) VALUES
(1, 9),
(1, 5),
(3, 6),
(5, 10),
(4, 3),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_turno_classe`
--
-- Criação: 25-Nov-2021 às 12:36
-- Última actualização: 03-Dez-2021 às 14:20
--

CREATE TABLE `tb_turno_classe` (
  `id_turno` int(11) DEFAULT NULL,
  `id_classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_turno_classe`:
--   `id_turno`
--       `turno` -> `id_turno`
--   `id_classe`
--       `tb_classe` -> `id_classe`
--

--
-- Extraindo dados da tabela `tb_turno_classe`
--

INSERT DELAYED IGNORE INTO `tb_turno_classe` (`id_turno`, `id_classe`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_turno_professor`
--
-- Criação: 25-Nov-2021 às 12:32
-- Última actualização: 03-Dez-2021 às 14:19
--

CREATE TABLE `tb_turno_professor` (
  `id_turno` int(11) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `tb_turno_professor`:
--   `id_turno`
--       `turno` -> `id_turno`
--   `id_professor`
--       `tb_professor` -> `id_professor`
--

--
-- Extraindo dados da tabela `tb_turno_professor`
--

INSERT DELAYED IGNORE INTO `tb_turno_professor` (`id_turno`, `id_professor`) VALUES
(1, 4),
(1, 9),
(2, 7),
(1, 3),
(1, 10),
(2, 10),
(3, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turno`
--
-- Criação: 25-Nov-2021 às 12:12
-- Última actualização: 03-Dez-2021 às 13:49
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELACIONAMENTOS PARA TABELAS `turno`:
--

--
-- Extraindo dados da tabela `turno`
--

INSERT DELAYED IGNORE INTO `turno` (`id_turno`, `descricao`) VALUES
(1, 'Manhã'),
(2, 'Tarde'),
(3, 'Noite');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Índices para tabela `tb_classe`
--
ALTER TABLE `tb_classe`
  ADD PRIMARY KEY (`id_classe`);

--
-- Índices para tabela `tb_classe_professor`
--
ALTER TABLE `tb_classe_professor`
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_professor` (`id_professor`);

--
-- Índices para tabela `tb_contacto`
--
ALTER TABLE `tb_contacto`
  ADD PRIMARY KEY (`id_contacto`),
  ADD KEY `professor` (`professor`);

--
-- Índices para tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Índices para tabela `tb_curso_classe`
--
ALTER TABLE `tb_curso_classe`
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Índices para tabela `tb_curso_disciplina`
--
ALTER TABLE `tb_curso_disciplina`
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices para tabela `tb_curso_turno`
--
ALTER TABLE `tb_curso_turno`
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_turno` (`id_turno`);

--
-- Índices para tabela `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  ADD PRIMARY KEY (`id_disciplina`),
  ADD KEY `classe` (`classe`);

--
-- Índices para tabela `tb_disciplina_professor`
--
ALTER TABLE `tb_disciplina_professor`
  ADD KEY `id_disciplina` (`id_disciplina`),
  ADD KEY `id_professor` (`id_professor`);

--
-- Índices para tabela `tb_professor`
--
ALTER TABLE `tb_professor`
  ADD PRIMARY KEY (`id_professor`),
  ADD KEY `cargo` (`cargo`);

--
-- Índices para tabela `tb_prof_curso`
--
ALTER TABLE `tb_prof_curso`
  ADD KEY `id_professor` (`id_professor`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Índices para tabela `tb_sala`
--
ALTER TABLE `tb_sala`
  ADD PRIMARY KEY (`id_sala`);

--
-- Índices para tabela `tb_sala_professor`
--
ALTER TABLE `tb_sala_professor`
  ADD KEY `id_sala` (`id_sala`),
  ADD KEY `id_professor` (`id_professor`);

--
-- Índices para tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `curso` (`curso`),
  ADD KEY `turno` (`turno`),
  ADD KEY `sala` (`sala`),
  ADD KEY `classe` (`classe`);

--
-- Índices para tabela `tb_turma_professor`
--
ALTER TABLE `tb_turma_professor`
  ADD KEY `id_turma` (`id_turma`),
  ADD KEY `id_professor` (`id_professor`);

--
-- Índices para tabela `tb_turno_classe`
--
ALTER TABLE `tb_turno_classe`
  ADD KEY `id_turno` (`id_turno`),
  ADD KEY `id_classe` (`id_classe`);

--
-- Índices para tabela `tb_turno_professor`
--
ALTER TABLE `tb_turno_professor`
  ADD KEY `id_turno` (`id_turno`),
  ADD KEY `id_professor` (`id_professor`);

--
-- Índices para tabela `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_classe`
--
ALTER TABLE `tb_classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_contacto`
--
ALTER TABLE `tb_contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_curso`
--
ALTER TABLE `tb_curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tb_professor`
--
ALTER TABLE `tb_professor`
  MODIFY `id_professor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_sala`
--
ALTER TABLE `tb_sala`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_classe_professor`
--
ALTER TABLE `tb_classe_professor`
  ADD CONSTRAINT `tb_classe_professor_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `tb_classe` (`id_classe`),
  ADD CONSTRAINT `tb_classe_professor_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `tb_professor` (`id_professor`);

--
-- Limitadores para a tabela `tb_contacto`
--
ALTER TABLE `tb_contacto`
  ADD CONSTRAINT `tb_contacto_ibfk_1` FOREIGN KEY (`professor`) REFERENCES `tb_professor` (`id_professor`);

--
-- Limitadores para a tabela `tb_curso_classe`
--
ALTER TABLE `tb_curso_classe`
  ADD CONSTRAINT `tb_curso_classe_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `tb_classe` (`id_classe`),
  ADD CONSTRAINT `tb_curso_classe_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `tb_curso` (`id_curso`);

--
-- Limitadores para a tabela `tb_curso_disciplina`
--
ALTER TABLE `tb_curso_disciplina`
  ADD CONSTRAINT `tb_curso_disciplina_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `tb_curso` (`id_curso`),
  ADD CONSTRAINT `tb_curso_disciplina_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `tb_disciplina` (`id_disciplina`);

--
-- Limitadores para a tabela `tb_curso_turno`
--
ALTER TABLE `tb_curso_turno`
  ADD CONSTRAINT `tb_curso_turno_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `tb_curso` (`id_curso`),
  ADD CONSTRAINT `tb_curso_turno_ibfk_2` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`);

--
-- Limitadores para a tabela `tb_disciplina`
--
ALTER TABLE `tb_disciplina`
  ADD CONSTRAINT `tb_disciplina_ibfk_1` FOREIGN KEY (`classe`) REFERENCES `tb_classe` (`id_classe`);

--
-- Limitadores para a tabela `tb_disciplina_professor`
--
ALTER TABLE `tb_disciplina_professor`
  ADD CONSTRAINT `tb_disciplina_professor_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `tb_disciplina` (`id_disciplina`),
  ADD CONSTRAINT `tb_disciplina_professor_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `tb_professor` (`id_professor`);

--
-- Limitadores para a tabela `tb_professor`
--
ALTER TABLE `tb_professor`
  ADD CONSTRAINT `tb_professor_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`id_cargo`);

--
-- Limitadores para a tabela `tb_prof_curso`
--
ALTER TABLE `tb_prof_curso`
  ADD CONSTRAINT `tb_prof_curso_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `tb_professor` (`id_professor`),
  ADD CONSTRAINT `tb_prof_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `tb_curso` (`id_curso`);

--
-- Limitadores para a tabela `tb_sala_professor`
--
ALTER TABLE `tb_sala_professor`
  ADD CONSTRAINT `tb_sala_professor_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `tb_sala` (`id_sala`),
  ADD CONSTRAINT `tb_sala_professor_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `tb_professor` (`id_professor`);

--
-- Limitadores para a tabela `tb_turma`
--
ALTER TABLE `tb_turma`
  ADD CONSTRAINT `tb_turma_ibfk_1` FOREIGN KEY (`curso`) REFERENCES `tb_curso` (`id_curso`),
  ADD CONSTRAINT `tb_turma_ibfk_2` FOREIGN KEY (`turno`) REFERENCES `turno` (`id_turno`),
  ADD CONSTRAINT `tb_turma_ibfk_3` FOREIGN KEY (`sala`) REFERENCES `tb_sala` (`id_sala`),
  ADD CONSTRAINT `tb_turma_ibfk_4` FOREIGN KEY (`classe`) REFERENCES `tb_classe` (`id_classe`);

--
-- Limitadores para a tabela `tb_turma_professor`
--
ALTER TABLE `tb_turma_professor`
  ADD CONSTRAINT `tb_turma_professor_ibfk_1` FOREIGN KEY (`id_turma`) REFERENCES `tb_turma` (`id_turma`),
  ADD CONSTRAINT `tb_turma_professor_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `tb_professor` (`id_professor`);

--
-- Limitadores para a tabela `tb_turno_classe`
--
ALTER TABLE `tb_turno_classe`
  ADD CONSTRAINT `tb_turno_classe_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`),
  ADD CONSTRAINT `tb_turno_classe_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `tb_classe` (`id_classe`);

--
-- Limitadores para a tabela `tb_turno_professor`
--
ALTER TABLE `tb_turno_professor`
  ADD CONSTRAINT `tb_turno_professor_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`),
  ADD CONSTRAINT `tb_turno_professor_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `tb_professor` (`id_professor`);


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata para tabela cargo
--

--
-- Metadata para tabela tb_classe
--

--
-- Metadata para tabela tb_classe_professor
--

--
-- Metadata para tabela tb_contacto
--

--
-- Metadata para tabela tb_curso
--

--
-- Metadata para tabela tb_curso_classe
--

--
-- Metadata para tabela tb_curso_disciplina
--

--
-- Metadata para tabela tb_curso_turno
--

--
-- Metadata para tabela tb_disciplina
--

--
-- Metadata para tabela tb_disciplina_professor
--

--
-- Metadata para tabela tb_professor
--

--
-- Metadata para tabela tb_prof_curso
--

--
-- Metadata para tabela tb_sala
--

--
-- Metadata para tabela tb_sala_professor
--

--
-- Metadata para tabela tb_turma
--

--
-- Metadata para tabela tb_turma_professor
--

--
-- Metadata para tabela tb_turno_classe
--

--
-- Metadata para tabela tb_turno_professor
--

--
-- Metadata para tabela turno
--

--
-- Metadata para o banco de dados db_horario
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
