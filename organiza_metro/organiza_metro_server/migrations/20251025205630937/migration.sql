BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "alertas" (
    "id" bigserial PRIMARY KEY,
    "usuarioIdId" bigint NOT NULL,
    "tipo" text NOT NULL,
    "titulo" text NOT NULL,
    "mensagem" text NOT NULL,
    "dataCriacao" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lido" boolean NOT NULL DEFAULT false,
    "calibracaoId" bigint,
    "movimentacaoId" bigint,
    "materialId" bigint,
    "ferramentaId" bigint,
    "nivelPrioridade" bigint DEFAULT 1,
    "ativo" boolean NOT NULL DEFAULT true
);

--
-- ACTION DROP TABLE
--
DROP TABLE "ferramenta" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ferramenta" (
    "id" bigserial PRIMARY KEY,
    "codigoSap" bigint NOT NULL,
    "descricao" text NOT NULL,
    "patrimonio" text,
    "emUso" boolean NOT NULL,
    "divisao" text NOT NULL,
    "tipoId" bigint NOT NULL,
    "status" text NOT NULL,
    "dataAquisicao" timestamp without time zone NOT NULL,
    "dataUltimaMovimentacao" timestamp without time zone,
    "unidadeMedidaId" bigint NOT NULL,
    "baseId" bigint,
    "veiculoId" bigint,
    "empenhadoParaId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "ferramenta_patrimonio_idx" ON "ferramenta" USING btree ("patrimonio");

--
-- ACTION DROP TABLE
--
DROP TABLE "movimentacao" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "movimentacao" (
    "id" bigserial PRIMARY KEY,
    "usuarioId" bigint NOT NULL,
    "materialId" bigint,
    "ferramentaId" bigint,
    "quantidade" double precision,
    "tipoMovimentacao" text NOT NULL,
    "dataRequisicao" timestamp without time zone NOT NULL,
    "dataMovimentacao" timestamp without time zone NOT NULL,
    "dataDevolucao" timestamp without time zone,
    "modalidadeEntrega" text,
    "observacao" text,
    "origemBaseId" bigint,
    "destinoBaseId" bigint,
    "origemVeiculoId" bigint,
    "destinoVeiculoId" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "alertas"
    ADD CONSTRAINT "alertas_fk_0"
    FOREIGN KEY("usuarioIdId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "alertas"
    ADD CONSTRAINT "alertas_fk_1"
    FOREIGN KEY("calibracaoId")
    REFERENCES "calibracao"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "alertas"
    ADD CONSTRAINT "alertas_fk_2"
    FOREIGN KEY("movimentacaoId")
    REFERENCES "movimentacao"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "alertas"
    ADD CONSTRAINT "alertas_fk_3"
    FOREIGN KEY("materialId")
    REFERENCES "material"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "alertas"
    ADD CONSTRAINT "alertas_fk_4"
    FOREIGN KEY("ferramentaId")
    REFERENCES "ferramenta"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_0"
    FOREIGN KEY("tipoId")
    REFERENCES "tipo_material"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_1"
    FOREIGN KEY("unidadeMedidaId")
    REFERENCES "unidade_medida"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_2"
    FOREIGN KEY("baseId")
    REFERENCES "base"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_3"
    FOREIGN KEY("veiculoId")
    REFERENCES "veiculo"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_4"
    FOREIGN KEY("empenhadoParaId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "movimentacao"
    ADD CONSTRAINT "movimentacao_fk_0"
    FOREIGN KEY("usuarioId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "movimentacao"
    ADD CONSTRAINT "movimentacao_fk_1"
    FOREIGN KEY("materialId")
    REFERENCES "material"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "movimentacao"
    ADD CONSTRAINT "movimentacao_fk_2"
    FOREIGN KEY("ferramentaId")
    REFERENCES "ferramenta"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "movimentacao"
    ADD CONSTRAINT "movimentacao_fk_3"
    FOREIGN KEY("origemBaseId")
    REFERENCES "base"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "movimentacao"
    ADD CONSTRAINT "movimentacao_fk_4"
    FOREIGN KEY("destinoBaseId")
    REFERENCES "base"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "movimentacao"
    ADD CONSTRAINT "movimentacao_fk_5"
    FOREIGN KEY("origemVeiculoId")
    REFERENCES "veiculo"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "movimentacao"
    ADD CONSTRAINT "movimentacao_fk_6"
    FOREIGN KEY("destinoVeiculoId")
    REFERENCES "veiculo"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251025205630937', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251025205630937', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
