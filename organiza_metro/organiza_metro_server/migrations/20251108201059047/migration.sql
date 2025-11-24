BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "ferramenta" ADD COLUMN "nome" text;
ALTER TABLE "ferramenta" ADD COLUMN "quantidade" bigint;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "material" ADD COLUMN "nome" text;

--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251108201059047', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251108201059047', "timestamp" = now();

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
