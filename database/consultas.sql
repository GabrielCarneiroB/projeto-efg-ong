-- ============================================================
-- ATIVIDADE AULA 11 - CONSULTAS, ALTERACOES E INTEGRIDADE
-- Banco de dados: usuario
-- Projeto: Protecao Animal
--
-- IMPORTANTE:
-- Este arquivo contem os comandos da atividade, NAO o backup
-- completo do banco. Preserve o dump antigo como backup_usuario.sql.
-- Execute os comandos por partes, na aba SQL do phpMyAdmin.
-- Os testes de integridade 1451, 1452 e 1062 devem ser executados
-- individualmente, pois foram preparados para gerar esses erros.
-- ============================================================

-- ------------------------------------------------------------
-- 1) SELECT com WHERE
-- Objetivo: listar as denuncias que estao com status 'recebida'.
-- Resultado esperado com os dados atuais: denuncias de IDs 1, 3, 6 e 8.
-- ------------------------------------------------------------
SELECT id, usuario_id, descricao, status
FROM denuncias
WHERE status = 'recebida';


-- ------------------------------------------------------------
-- 2) ORDER BY
-- Objetivo: listar os usuarios em ordem alfabetica pelo nome.
-- Resultado esperado: Ana, Bruno, Carla, Daniel e Gabriel.
-- ------------------------------------------------------------
SELECT id, nome, email
FROM usuarios
ORDER BY nome ASC;


-- ------------------------------------------------------------
-- 3) LIKE
-- Objetivo: encontrar usuarios cujos nomes comecam com a letra G.
-- Resultado esperado com os dados atuais: Gabriel Carneiro.
-- ------------------------------------------------------------
SELECT id, nome, email
FROM usuarios
WHERE nome LIKE 'G%';


-- ------------------------------------------------------------
-- 4) LIMIT
-- Objetivo: mostrar somente os cinco primeiros usuarios por ID.
-- Resultado esperado com os dados atuais: IDs 2, 3, 4, 5 e 6.
-- ------------------------------------------------------------
SELECT id, nome, email
FROM usuarios
ORDER BY id ASC
LIMIT 5;


-- ------------------------------------------------------------
-- 5) UPDATE com SELECT antes
-- Objetivo: alterar temporariamente o status da denuncia de ID 1.
-- Primeiro confira o registro; depois atualize e confira o resultado.
-- Ao final, restaure o status original para preservar os dados.
-- Execute cada comando desta secao na ordem apresentada.
-- ------------------------------------------------------------
SELECT id, descricao, status
FROM denuncias
WHERE id = 1;

UPDATE denuncias
SET status = 'em análise'
WHERE id = 1;

SELECT id, descricao, status
FROM denuncias
WHERE id = 1;
-- Resultado esperado nesta etapa: status 'em análise'.

-- Restauracao do valor original (tambem com SELECT antes).
SELECT id, descricao, status
FROM denuncias
WHERE id = 1;

UPDATE denuncias
SET status = 'recebida'
WHERE id = 1;

SELECT id, descricao, status
FROM denuncias
WHERE id = 1;
-- Resultado esperado ao final: status 'recebida', como estava originalmente.


-- ------------------------------------------------------------
-- 6) DELETE com SELECT antes (exclusao de um registro de teste)
-- Objetivo: demonstrar DELETE sem apagar dados reais do projeto.
-- Cria um perfil temporario somente se ele ainda nao existir.
-- Confira o registro antes de exclui-lo.
-- ------------------------------------------------------------
INSERT INTO perfil (nome_perfil)
SELECT 'Perfil temporario - teste DELETE'
WHERE NOT EXISTS (
    SELECT 1
    FROM perfil
    WHERE nome_perfil = 'Perfil temporario - teste DELETE'
);

SELECT id, nome_perfil
FROM perfil
WHERE nome_perfil = 'Perfil temporario - teste DELETE';

DELETE FROM perfil
WHERE nome_perfil = 'Perfil temporario - teste DELETE';

SELECT id, nome_perfil
FROM perfil
WHERE nome_perfil = 'Perfil temporario - teste DELETE';
-- Resultado esperado: a ultima consulta nao retorna registros.


-- ------------------------------------------------------------
-- 7) Teste de integridade: erro 1451
-- Objetivo: tentar excluir uma especie que esta sendo utilizada
-- pela tabela animais. A chave estrangeira deve impedir a exclusao.
-- Execute o SELECT e, em seguida, o DELETE separadamente.
-- Resultado esperado no DELETE: erro 1451.
-- ------------------------------------------------------------
SELECT id, nome
FROM especie
WHERE id = 1;

DELETE FROM especie
WHERE id = 1;
-- Esperado: erro 1451, pois animais.especie_id referencia especie.id.
-- A especie nao deve ser excluida.


-- ------------------------------------------------------------
-- 8) Teste de integridade: erro 1452
-- Objetivo: tentar inserir uma denuncia com usuario_id inexistente.
-- O usuario 9999 nao existe; a chave estrangeira deve impedir o INSERT.
-- Execute este INSERT individualmente.
-- Resultado esperado: erro 1452.
-- ------------------------------------------------------------
SELECT id
FROM usuarios
WHERE id = 9999;

INSERT INTO denuncias (usuario_id, descricao, status, anonima)
VALUES (9999, 'Teste de chave estrangeira inexistente', 'recebida', 0);
-- Esperado: erro 1452, pois usuarios.id = 9999 nao existe.


-- ------------------------------------------------------------
-- 9) Teste de integridade: erro 1062
-- Objetivo: tentar cadastrar um email que ja existe.
-- A coluna usuarios.email possui restricao UNIQUE.
-- Execute este INSERT individualmente.
-- Resultado esperado: erro 1062.
-- ------------------------------------------------------------
SELECT id, nome, email
FROM usuarios
WHERE email = 'gabriel@email.com';

INSERT INTO usuarios (perfil_id, nome, email)
VALUES (1, 'Teste de email duplicado', 'gabriel@email.com');
-- Esperado: erro 1062, pois o email ja esta cadastrado.


-- ============================================================
-- FIM DA ATIVIDADE
-- Resumo: SELECT/WHERE, ORDER BY, LIKE, LIMIT, UPDATE, DELETE
-- e testes dos erros de integridade 1451, 1452 e 1062.
-- ============================================================
