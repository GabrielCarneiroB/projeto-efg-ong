-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/11/2026 às 00:47
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `usuario`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais`
--

CREATE TABLE `animais` (
  `id` int(11) NOT NULL,
  `especie_id` int(11) NOT NULL,
  `porte` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `animais`
--

INSERT INTO `animais` (`id`, `especie_id`, `porte`) VALUES
(1, 1, 'Grande'),
(2, 2, 'Pequeno'),
(3, 3, 'Grande'),
(4, 4, 'Médio'),
(5, 5, 'Pequeno');

-- --------------------------------------------------------

--
-- Estrutura para tabela `denuncias`
--

CREATE TABLE `denuncias` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `descricao` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'recebida',
  `anonima` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `denuncias`
--

INSERT INTO `denuncias` (`id`, `usuario_id`, `descricao`, `status`, `anonima`) VALUES
(1, 3, 'Abandono de cachorro em via pública', 'recebida', 0),
(2, 4, 'Animal sem alimentação adequada', 'em análise', 0),
(3, 2, 'Suspeita de maus-tratos contra animais', 'recebida', 0),
(4, NULL, 'Denúncia anônima de abandono', 'encaminhada', 1),
(5, 6, 'Animal mantido em condições inadequadas', 'em análise', 0),
(6, 3, 'Cavalo aparentemente maltratado', 'recebida', 0),
(7, NULL, 'Possível comércio irregular de animal silvestre', 'encaminhada', 1),
(8, 4, 'Coelho abandonado em terreno', 'recebida', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `denuncia_animal`
--

CREATE TABLE `denuncia_animal` (
  `denuncia_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `denuncia_animal`
--

INSERT INTO `denuncia_animal` (`denuncia_id`, `animal_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 4),
(4, 2),
(5, 5),
(6, 3),
(7, 4),
(8, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `denuncia_orgao`
--

CREATE TABLE `denuncia_orgao` (
  `denuncia_id` int(11) NOT NULL,
  `orgao_id` int(11) NOT NULL,
  `data_encaminhamento` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `denuncia_orgao`
--

INSERT INTO `denuncia_orgao` (`denuncia_id`, `orgao_id`, `data_encaminhamento`) VALUES
(1, 1, '2026-11-19'),
(2, 2, '2026-11-19'),
(3, 1, '2026-11-19'),
(4, 3, '2026-11-19'),
(5, 4, '2026-11-19'),
(6, 2, '2026-11-19'),
(7, 3, '2026-11-19'),
(8, 1, '2026-11-19');

-- --------------------------------------------------------

--
-- Estrutura para tabela `especie`
--

CREATE TABLE `especie` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `especie`
--

INSERT INTO `especie` (`id`, `nome`, `categoria`) VALUES
(1, 'Cachorro', 'Doméstico'),
(2, 'Gato', 'Doméstico'),
(3, 'Cavalo', 'Produção'),
(4, 'Papagaio', 'Silvestre'),
(5, 'Coelho', 'Doméstico');

-- --------------------------------------------------------

--
-- Estrutura para tabela `orgaos`
--

CREATE TABLE `orgaos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo_orgao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `orgaos`
--

INSERT INTO `orgaos` (`id`, `nome`, `tipo_orgao_id`) VALUES
(1, 'Secretaria do Meio Ambiente', 1),
(2, 'Centro de Controle de Zoonoses', 1),
(3, 'Polícia Civil', 3),
(4, 'ONG Proteção Animal', 2),
(5, 'Instituto de Proteção Animal', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nome_perfil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome_perfil`) VALUES
(1, 'Administrador'),
(3, 'Atendente'),
(2, 'Denunciante');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_orgao`
--

CREATE TABLE `tipo_orgao` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_orgao`
--

INSERT INTO `tipo_orgao` (`id`, `nome`) VALUES
(2, 'Organização Não Governamental'),
(1, 'Órgão Público'),
(3, 'Segurança Pública');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `perfil_id`, `nome`, `email`) VALUES
(2, 1, 'Gabriel Carneiro', 'gabriel@email.com'),
(3, 2, 'Ana Souza', 'ana@email.com'),
(4, 2, 'Bruno Lima', 'bruno@email.com'),
(5, 3, 'Carla Mendes', 'carla@email.com'),
(6, 2, 'Daniel Rocha', 'daniel@email.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `especie_id` (`especie_id`);

--
-- Índices de tabela `denuncias`
--
ALTER TABLE `denuncias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `denuncia_animal`
--
ALTER TABLE `denuncia_animal`
  ADD PRIMARY KEY (`denuncia_id`,`animal_id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Índices de tabela `denuncia_orgao`
--
ALTER TABLE `denuncia_orgao`
  ADD PRIMARY KEY (`denuncia_id`,`orgao_id`),
  ADD KEY `orgao_id` (`orgao_id`);

--
-- Índices de tabela `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `orgaos`
--
ALTER TABLE `orgaos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_orgao_id` (`tipo_orgao_id`);

--
-- Índices de tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_perfil` (`nome_perfil`);

--
-- Índices de tabela `tipo_orgao`
--
ALTER TABLE `tipo_orgao`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `perfil_id` (`perfil_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `especie`
--
ALTER TABLE `especie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `orgaos`
--
ALTER TABLE `orgaos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo_orgao`
--
ALTER TABLE `tipo_orgao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `animais_ibfk_1` FOREIGN KEY (`especie_id`) REFERENCES `especie` (`id`);

--
-- Restrições para tabelas `denuncias`
--
ALTER TABLE `denuncias`
  ADD CONSTRAINT `denuncias_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `denuncia_animal`
--
ALTER TABLE `denuncia_animal`
  ADD CONSTRAINT `denuncia_animal_ibfk_1` FOREIGN KEY (`denuncia_id`) REFERENCES `denuncias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `denuncia_animal_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animais` (`id`);

--
-- Restrições para tabelas `denuncia_orgao`
--
ALTER TABLE `denuncia_orgao`
  ADD CONSTRAINT `denuncia_orgao_ibfk_1` FOREIGN KEY (`denuncia_id`) REFERENCES `denuncias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `denuncia_orgao_ibfk_2` FOREIGN KEY (`orgao_id`) REFERENCES `orgaos` (`id`);

--
-- Restrições para tabelas `orgaos`
--
ALTER TABLE `orgaos`
  ADD CONSTRAINT `orgaos_ibfk_1` FOREIGN KEY (`tipo_orgao_id`) REFERENCES `tipo_orgao` (`id`);

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
