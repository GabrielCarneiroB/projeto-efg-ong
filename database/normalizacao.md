# Normalização do modelo (Aula 02 → 3FN)

Projeto: **Aluvi** (ONG de proteção animal, denúncias de maus-tratos).

## Modelo da Aula 02 (ponto de partida)

| Tabela | Campos |
|---|---|
| perfil | id (PK), nome_perfil |
| usuarios | id (PK), perfil_id (FK), nome, email |
| orgaos | id (PK), nome, tipo |
| animais | id (PK), especie, porte |
| denuncias | id (PK), usuario_id (FK), animal_id (FK), orgao_id (FK), descricao, status, anonima |

---

## Problema 1 — Violação da 1FN (tabela `denuncias`)

**Por quê:** `denuncias` guarda um único `animal_id` e um único `orgao_id`. Uma denúncia pode envolver vários animais (ex.: canil com 5 cães) e ser encaminhada a mais de um órgão (ex.: Polícia Ambiental e IBAMA). Para registrar isso, só haveria duas saídas ruins: repetir a linha inteira da denúncia (duplicando `descricao`, `status` e `anonima`) ou criar grupos repetidos de colunas (`animal1`, `animal2`...). Os relacionamentos do DER já são (1,n) dos dois lados, ou seja, são N:N e precisam de tabela associativa.

**Antes:**

| denuncias |
|---|
| id (PK), usuario_id (FK), animal_id (FK), orgao_id (FK), descricao, status, anonima |

**Depois:**

| denuncias | denuncia_animal | denuncia_orgao |
|---|---|---|
| id (PK), usuario_id (FK), descricao, status, anonima | denuncia_id (PK, FK), animal_id (PK, FK) | denuncia_id (PK, FK), orgao_id (PK, FK), data_encaminhamento |

Na 2FN, `data_encaminhamento` depende da chave composta inteira (denúncia + órgão), então a tabela está correta.

---

## Problema 2 — Violação da 3FN (tabela `animais`)

**Por quê:** o texto de `especie` se repete em cada linha ("Cachorro", "Cachorro", "Arara"...), com risco de variações de escrita ("Cachorro", "cão"). Além disso, qualquer característica da espécie, como a categoria usada pelo site (doméstico, silvestre ou de criação), dependeria de `especie` e não do `id` do animal. Isso é uma dependência transitiva (id → especie → categoria).

**Antes:**

| animais |
|---|
| id (PK), especie, porte |

**Depois:**

| especie | animais |
|---|---|
| id (PK), nome, categoria | id (PK), especie_id (FK), porte |

---

## Problema 3 — Violação da 3FN / valores repetidos (tabela `orgaos`)

**Por quê:** `tipo` é um texto livre que se repete em vários órgãos (ex.: "Zoonoses", "Ambiental", "Segurança") e permite inconsistências ("Ibama", "IBAMA "). O tipo é uma informação do grupo de órgãos, não de cada órgão individual, então ele vai para uma tabela própria.

**Antes:**

| orgaos |
|---|
| id (PK), nome, tipo |

**Depois:**

| tipo_orgao | orgaos |
|---|---|
| id (PK), nome | id (PK), nome, tipo_orgao_id (FK) |

---

## Observações adicionais

- **`status` em `denuncias`:** os valores são fixos (recebida, em triagem, encaminhada, concluída). Foi mantido como coluna com `DEFAULT 'recebida'` e `CHECK`, documentado no dicionário de dados.
- **`usuario_id` opcional:** como o site permite denúncia anônima, `denuncias.usuario_id` aceita nulo.
- **`perfil` e `usuarios`:** já estavam na 3FN (nenhum atributo depende de outro atributo comum).
