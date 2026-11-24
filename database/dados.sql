USE usuario;

INSERT INTO perfil (id, nome_perfil) VALUES
(1, 'Administrador'),
(2, 'Denunciante'),
(3, 'Atendente');

INSERT INTO tipo_orgao (id, nome) VALUES
(1, 'Órgão Público'),
(2, 'Organização Não Governamental'),
(3, 'Segurança Pública');

INSERT INTO especie (id, nome, categoria) VALUES
(1, 'Cachorro', 'Doméstico'),
(2, 'Gato', 'Doméstico'),
(3, 'Cavalo', 'Produção'),
(4, 'Papagaio', 'Silvestre'),
(5, 'Coelho', 'Doméstico');

INSERT INTO usuarios (id, perfil_id, nome, email) VALUES
(2, 1, 'Gabriel Carneiro', 'gabriel@email.com'),
(3, 2, 'Ana Souza', 'ana@email.com'),
(4, 2, 'Bruno Lima', 'bruno@email.com'),
(5, 3, 'Carla Mendes', 'carla@email.com'),
(6, 2, 'Daniel Rocha', 'daniel@email.com');

INSERT INTO orgaos (id, nome, tipo_orgao_id) VALUES
(1, 'Secretaria do Meio Ambiente', 1),
(2, 'Centro de Controle de Zoonoses', 1),
(3, 'Polícia Civil', 3),
(4, 'ONG Proteção Animal', 2),
(5, 'Instituto de Proteção Animal', 2);

INSERT INTO animais (id, especie_id, porte) VALUES
(1, 1, 'Grande'),
(2, 2, 'Pequeno'),
(3, 3, 'Grande'),
(4, 4, 'Médio'),
(5, 5, 'Pequeno');

INSERT INTO denuncias (id, usuario_id, descricao, status, anonima) VALUES
(1, 3, 'Abandono de cachorro em via pública', 'recebida', 0),
(2, 4, 'Animal sem alimentação adequada', 'em análise', 0),
(3, 2, 'Suspeita de maus-tratos contra animais', 'recebida', 0),
(4, NULL, 'Denúncia anônima de abandono', 'encaminhada', 1),
(5, 6, 'Animal mantido em condições inadequadas', 'em análise', 0),
(6, 3, 'Cavalo aparentemente maltratado', 'recebida', 0),
(7, NULL, 'Possível comércio irregular de animal silvestre', 'encaminhada', 1),
(8, 4, 'Coelho abandonado em terreno', 'recebida', 0);

INSERT INTO denuncia_animal (denuncia_id, animal_id) VALUES
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

INSERT INTO denuncia_orgao (denuncia_id, orgao_id, data_encaminhamento) VALUES
(1, 1, '2026-11-19'),
(2, 2, '2026-11-19'),
(3, 1, '2026-11-19'),
(4, 3, '2026-11-19'),
(5, 4, '2026-11-19'),
(6, 2, '2026-11-19'),
(7, 3, '2026-11-19'),
(8, 1, '2026-11-19');

ALTER TABLE perfil AUTO_INCREMENT = 4;
ALTER TABLE tipo_orgao AUTO_INCREMENT = 4;
ALTER TABLE especie AUTO_INCREMENT = 6;
ALTER TABLE usuarios AUTO_INCREMENT = 7;
ALTER TABLE orgaos AUTO_INCREMENT = 6;
ALTER TABLE animais AUTO_INCREMENT = 6;
ALTER TABLE denuncias AUTO_INCREMENT = 9;
