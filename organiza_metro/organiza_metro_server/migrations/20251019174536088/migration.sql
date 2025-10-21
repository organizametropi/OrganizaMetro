BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_info" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "registro" text NOT NULL,
    "telefone" text NOT NULL,
    "area" text NOT NULL,
    "isAdmin" boolean NOT NULL DEFAULT false
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_info"
    ADD CONSTRAINT "user_info_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251019174536088', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251019174536088', "timestamp" = now();

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
