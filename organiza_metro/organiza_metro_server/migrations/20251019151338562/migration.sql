BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "base" (
    "id" bigserial PRIMARY KEY,
    "codigo" text NOT NULL,
    "nome" text NOT NULL,
    "endereco" text,
    "responsavelId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "calibracao" (
    "id" bigserial PRIMARY KEY,
    "ferramentaId" bigint NOT NULL,
    "dataCalibracao" timestamp without time zone NOT NULL,
    "validadeCalibracao" timestamp without time zone NOT NULL,
    "status" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ferramenta" (
    "id" bigserial PRIMARY KEY,
    "codigoSap" bigint NOT NULL,
    "descricao" text NOT NULL,
    "patrimonio" text,
    "emUso" boolean NOT NULL,
    "tipo" text NOT NULL,
    "status" text NOT NULL,
    "dataAquisicao" timestamp without time zone,
    "dataUltimaMovimentacao" timestamp without time zone,
    "unidadeMedidaId" bigint NOT NULL,
    "baseId" bigint,
    "veiculoId" bigint,
    "empenhadoParaId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "ferramenta_patrimonio_idx" ON "ferramenta" USING btree ("patrimonio");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "material" (
    "id" bigserial PRIMARY KEY,
    "codigoSap" bigint NOT NULL,
    "descricao" text NOT NULL,
    "quantidade" double precision NOT NULL,
    "estoqueMinimo" double precision,
    "dataUltimaMovimentacao" timestamp without time zone,
    "tipoId" bigint NOT NULL,
    "unidadeMedidaId" bigint NOT NULL,
    "baseId" bigint,
    "veiculoId" bigint
);

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
    "dataMovimentacao" timestamp without time zone NOT NULL,
    "observacao" text,
    "origemBaseId" bigint,
    "destinoBaseId" bigint,
    "origemVeiculoId" bigint,
    "destinoVeiculoId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tipo_material" (
    "id" bigserial PRIMARY KEY,
    "nome" text NOT NULL,
    "faixaInicial" bigint NOT NULL,
    "faixaFinal" bigint NOT NULL,
    "descricao" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "unidade_medida" (
    "id" bigserial PRIMARY KEY,
    "codigo" text NOT NULL,
    "descricao" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "veiculo" (
    "id" bigserial PRIMARY KEY,
    "codigo" text NOT NULL,
    "descricao" text,
    "baseId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "base"
    ADD CONSTRAINT "base_fk_0"
    FOREIGN KEY("responsavelId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "calibracao"
    ADD CONSTRAINT "calibracao_fk_0"
    FOREIGN KEY("ferramentaId")
    REFERENCES "ferramenta"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_0"
    FOREIGN KEY("unidadeMedidaId")
    REFERENCES "unidade_medida"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_1"
    FOREIGN KEY("baseId")
    REFERENCES "base"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_2"
    FOREIGN KEY("veiculoId")
    REFERENCES "veiculo"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_3"
    FOREIGN KEY("empenhadoParaId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "material"
    ADD CONSTRAINT "material_fk_0"
    FOREIGN KEY("tipoId")
    REFERENCES "tipo_material"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "material"
    ADD CONSTRAINT "material_fk_1"
    FOREIGN KEY("unidadeMedidaId")
    REFERENCES "unidade_medida"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "material"
    ADD CONSTRAINT "material_fk_2"
    FOREIGN KEY("baseId")
    REFERENCES "base"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "material"
    ADD CONSTRAINT "material_fk_3"
    FOREIGN KEY("veiculoId")
    REFERENCES "veiculo"("id")
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "veiculo"
    ADD CONSTRAINT "veiculo_fk_0"
    FOREIGN KEY("baseId")
    REFERENCES "base"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251019151338562', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251019151338562', "timestamp" = now();

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
