# Dicionário de dados — Aluvi (modelo lógico em 3FN)

Legenda: **PK** = chave primária · **FK** = chave estrangeira · **UNIQUE** = valor único · **DEFAULT** = valor padrão.
Regras de exclusão (ON DELETE): **RESTRICT** (bloqueia), **CASCADE** (apaga os filhos), **SET NULL** (deixa a FK nula).

| Tabela | Coluna | Tipo | Chave | Obrigatório | Descrição |
|---|---|---|---|---|---|
| perfil | id | INT | PK | Sim | Identificador do perfil |
| perfil | nome_perfil | VARCHAR(50) | — | Sim | Nome do perfil (ex.: administrador, triagem, denunciante). **UNIQUE** |
| usuarios | id | INT | PK | Sim | Identificador do usuário |
| usuarios | perfil_id | INT | FK → perfil.id | Sim | Perfil do usuário. Exclusão: **RESTRICT** |
| usuarios | nome | VARCHAR(100) | — | Sim | Nome completo do usuário |
| usuarios | email | VARCHAR(120) | — | Sim | E-mail de acesso e contato. **UNIQUE** |
| tipo_orgao | id | INT | PK | Sim | Identificador do tipo de órgão |
| tipo_orgao | nome | VARCHAR(60) | — | Sim | Nome do tipo (ex.: Zoonoses, Ambiental, Polícia). **UNIQUE** |
| orgaos | id | INT | PK | Sim | Identificador do órgão |
| orgaos | nome | VARCHAR(100) | — | Sim | Nome do órgão (ex.: IBAMA, Polícia Ambiental) |
| orgaos | tipo_orgao_id | INT | FK → tipo_orgao.id | Sim | Tipo do órgão. Exclusão: **RESTRICT** |
| especie | id | INT | PK | Sim | Identificador da espécie |
| especie | nome | VARCHAR(60) | — | Sim | Nome da espécie (ex.: cachorro, arara). **UNIQUE** |
| especie | categoria | VARCHAR(20) | — | Sim | Categoria: doméstico, silvestre ou criação (`CHECK`) |
| animais | id | INT | PK | Sim | Identificador do animal |
| animais | especie_id | INT | FK → especie.id | Sim | Espécie do animal. Exclusão: **RESTRICT** |
| animais | porte | VARCHAR(20) | — | Não | Porte: pequeno, médio ou grande (`CHECK`) |
| denuncias | id | INT | PK | Sim | Identificador da denúncia |
| denuncias | usuario_id | INT | FK → usuarios.id | Não | Autor da denúncia; nulo em denúncia anônima. Exclusão: **SET NULL** |
| denuncias | descricao | TEXT | — | Sim | Relato do que foi visto, local e contexto |
| denuncias | status | VARCHAR(20) | — | Sim | Andamento: recebida, em_triagem, encaminhada ou concluida (`CHECK`). **DEFAULT** 'recebida' |
| denuncias | anonima | BOOLEAN | — | Sim | Indica se o denunciante não quis se identificar. **DEFAULT** false |
| denuncia_animal | denuncia_id | INT | PK, FK → denuncias.id | Sim | Denúncia à qual o animal pertence. Exclusão: **CASCADE** |
| denuncia_animal | animal_id | INT | PK, FK → animais.id | Sim | Animal envolvido na denúncia. Exclusão: **RESTRICT** |
| denuncia_orgao | denuncia_id | INT | PK, FK → denuncias.id | Sim | Denúncia encaminhada. Exclusão: **CASCADE** |
| denuncia_orgao | orgao_id | INT | PK, FK → orgaos.id | Sim | Órgão que recebeu o encaminhamento. Exclusão: **RESTRICT** |
| denuncia_orgao | data_encaminhamento | DATE | — | Sim | Data do encaminhamento. **DEFAULT** data atual |

## Justificativa das regras de exclusão

- **RESTRICT** nos cadastros de apoio (perfil, tipo de órgão, espécie, órgão, animal): impede apagar um registro que ainda está em uso.
- **CASCADE** em `denuncia_animal` e `denuncia_orgao` ao apagar a denúncia: essas linhas só existem por causa da denúncia.
- **SET NULL** em `denuncias.usuario_id`: se o usuário for removido, a denúncia continua registrada (como anônima), por isso a coluna não é obrigatória.
