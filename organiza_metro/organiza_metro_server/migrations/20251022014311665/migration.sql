BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "ferramenta" ALTER COLUMN "baseId" DROP NOT NULL;
ALTER TABLE "ferramenta" ALTER COLUMN "veiculoId" DROP NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "material" ALTER COLUMN "baseId" DROP NOT NULL;
ALTER TABLE "material" ALTER COLUMN "veiculoId" DROP NOT NULL;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "movimentacao" ALTER COLUMN "materialId" DROP NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "ferramentaId" DROP NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "origemBaseId" DROP NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "destinoBaseId" DROP NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "origemVeiculoId" DROP NOT NULL;
ALTER TABLE "movimentacao" ALTER COLUMN "destinoVeiculoId" DROP NOT NULL;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "requisicao_item" (
    "id" bigserial PRIMARY KEY,
    "materialId" bigint,
    "ferramentaId" bigint,
    "quantidade" double precision NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "requisicao_item"
    ADD CONSTRAINT "requisicao_item_fk_0"
    FOREIGN KEY("materialId")
    REFERENCES "material"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "requisicao_item"
    ADD CONSTRAINT "requisicao_item_fk_1"
    FOREIGN KEY("ferramentaId")
    REFERENCES "ferramenta"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251022014311665', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251022014311665', "timestamp" = now();

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
