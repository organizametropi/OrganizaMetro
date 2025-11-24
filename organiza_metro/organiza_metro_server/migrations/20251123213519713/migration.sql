BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "alertas" DROP CONSTRAINT "alertas_fk_0";
ALTER TABLE "alertas" DROP COLUMN "usuarioIdId";
ALTER TABLE "alertas" ADD COLUMN "usuarioId" bigint;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "ferramenta" DROP COLUMN "quantidade";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "alertas"
    ADD CONSTRAINT "alertas_fk_0"
    FOREIGN KEY("usuarioId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251123213519713', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251123213519713', "timestamp" = now();

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
