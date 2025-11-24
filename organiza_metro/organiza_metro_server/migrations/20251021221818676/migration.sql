BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "ferramenta" DROP CONSTRAINT "ferramenta_fk_3";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "movimentacao" DROP CONSTRAINT "movimentacao_fk_0";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "ferramenta"
    ADD CONSTRAINT "ferramenta_fk_3"
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

--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251021221818676', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251021221818676', "timestamp" = now();

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
