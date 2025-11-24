BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "ferramenta" DROP CONSTRAINT "ferramenta_fk_3";
ALTER TABLE "ferramenta" ALTER COLUMN "dataAquisicao" SET NOT NULL;
ALTER TABLE "ferramenta" ALTER COLUMN "baseId" SET NOT NULL;
ALTER TABLE "ferramenta" ALTER COLUMN "veiculoId" SET NOT NULL;
ALTER TABLE "ferramenta" ALTER COLUMN "empenhadoParaId" SET NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "material" ALTER COLUMN "quantidade" DROP NOT NULL;
ALTER TABLE "material" ALTER COLUMN "baseId" SET NOT NULL;
ALTER TABLE "material" ALTER COLUMN "veiculoId" SET NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "movimentacao" DROP CONSTRAINT "movimentacao_fk_0";
ALTER TABLE "movimentacao" ALTER COLUMN "materialId" SET NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "ferramentaId" SET NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "quantidade" DROP NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "origemBaseId" SET NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "destinoBaseId" SET NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "origemVeiculoId" SET NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "destinoVeiculoId" SET NOT NULL;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_3"
    FOREIGN KEY("empenhadoParaId")
    REFERENCES "user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "movimentacao"
    ADD CONSTRAINT "movimentacao_fk_0"
    FOREIGN KEY("usuarioId")
    REFERENCES "user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251021215139434', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251021215139434', "timestamp" = now();

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
