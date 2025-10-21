BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "movimentacao" ADD COLUMN "dataDevolucao" timestamp without time zone;
ALTER TABLE "movimentacao" ADD COLUMN "modalidadeEntrega" text;
ALTER TABLE "movimentacao" ALTER COLUMN "quantidade" SET NOT NULL;

--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251020210424448', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251020210424448', "timestamp" = now();

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
