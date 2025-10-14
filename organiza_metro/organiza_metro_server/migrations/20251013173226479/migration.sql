BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "usuario" (
    "id" bigserial PRIMARY KEY,
    "nome" text NOT NULL,
    "registro" bigint NOT NULL,
    "area" text NOT NULL,
    "email" text NOT NULL,
    "telefone" bigint NOT NULL,
    "isAdmin" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR organiza_metro
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('organiza_metro', '20251013173226479', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251013173226479', "timestamp" = now();

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
