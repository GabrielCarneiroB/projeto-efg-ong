CREATE DATABASE IF NOT EXISTS usuario
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE usuario;

CREATE TABLE IF NOT EXISTS perfil (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome_perfil VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_perfil_nome (nome_perfil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS tipo_orgao (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_tipo_orgao_nome (nome)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS especie (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  categoria VARCHAR(20) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_especie_nome (nome)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS usuarios (
  id INT(11) NOT NULL AUTO_INCREMENT,
  perfil_id INT(11) NOT NULL,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_usuarios_email (email),
  KEY idx_usuarios_perfil_id (perfil_id),
  CONSTRAINT usuarios_ibfk_1 FOREIGN KEY (perfil_id)
    REFERENCES perfil (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS orgaos (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  tipo_orgao_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  KEY idx_orgaos_tipo_orgao_id (tipo_orgao_id),
  CONSTRAINT orgaos_ibfk_1 FOREIGN KEY (tipo_orgao_id)
    REFERENCES tipo_orgao (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS animais (
  id INT(11) NOT NULL AUTO_INCREMENT,
  especie_id INT(11) NOT NULL,
  porte VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_animais_especie_id (especie_id),
  CONSTRAINT animais_ibfk_1 FOREIGN KEY (especie_id)
    REFERENCES especie (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS denuncias (
  id INT(11) NOT NULL AUTO_INCREMENT,
  usuario_id INT(11) DEFAULT NULL,
  descricao TEXT NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'recebida',
  anonima TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  KEY idx_denuncias_usuario_id (usuario_id),
  CONSTRAINT denuncias_ibfk_1 FOREIGN KEY (usuario_id)
    REFERENCES usuarios (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS denuncia_animal (
  denuncia_id INT(11) NOT NULL,
  animal_id INT(11) NOT NULL,
  PRIMARY KEY (denuncia_id, animal_id),
  KEY idx_denuncia_animal_animal_id (animal_id),
  CONSTRAINT denuncia_animal_ibfk_1 FOREIGN KEY (denuncia_id)
    REFERENCES denuncias (id) ON DELETE CASCADE,
  CONSTRAINT denuncia_animal_ibfk_2 FOREIGN KEY (animal_id)
    REFERENCES animais (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS denuncia_orgao (
  denuncia_id INT(11) NOT NULL,
  orgao_id INT(11) NOT NULL,
  data_encaminhamento DATE NOT NULL DEFAULT (CURDATE()),
  PRIMARY KEY (denuncia_id, orgao_id),
  KEY idx_denuncia_orgao_orgao_id (orgao_id),
  CONSTRAINT denuncia_orgao_ibfk_1 FOREIGN KEY (denuncia_id)
    REFERENCES denuncias (id) ON DELETE CASCADE,
  CONSTRAINT denuncia_orgao_ibfk_2 FOREIGN KEY (orgao_id)
    REFERENCES orgaos (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
