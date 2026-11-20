BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "game_sessions" ADD COLUMN "hostTokenHash" text;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "players" ADD COLUMN "status" text NOT NULL DEFAULT 'connected'::text;
ALTER TABLE "players" ADD COLUMN "answersJson" text;
ALTER TABLE "players" ADD COLUMN "tokenHash" text;

--
-- MIGRATION VERSION FOR namma_kahoot
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('namma_kahoot', '20261120084354968', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261120084354968', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20261015164015382', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261015164015382', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;
