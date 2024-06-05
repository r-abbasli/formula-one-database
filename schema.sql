CREATE TABLE "drivers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "championships" INTEGER NOT NULL DEFAULT 0,
    "wins" INTEGER NOT NULL DEFAULT 0,
    "pole_positions" INTEGER NOT NULL DEFAULT 0,
    "fastest_laps" INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY("id")
);


CREATE TABLE "teams" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "championships" INTEGER NOT NULL DEFAULT 0,
    "wins" INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY("id")
);


CREATE TABLE "seasons" (
    "id" INTEGER,
    "year" INTEGER NOT NULL,
    "champion_driver_id" INTEGER,
    "champion_team_id", INTEGER,
    PRIMARY KEY("id")
    FOREIGN KEY("champion_driver_id") REFERENCES "drivers"("id")
    FOREIGN KEY("champion_team_id") REFERENCES "teams"("id")
);


CREATE TABLE "raced_for_that_season" (
    "driver_id" INTEGER,
    "team_id" INTEGER,
    "year_id" INTEGER,
    FOREIGN KEY("driver_id") REFERENCES "drivers"("id")
    FOREIGN KEY("team_id") REFERENCES "teams"("id")
    FOREIGN KEY("year_id") REFERENCES "seasons"("id")
);


CREATE TABLE "circuits" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "length" NUMERIC NOT NULL,
    "turns" INTEGER NOT NULL,
    "capacity" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "races" (
    "year_id" INTEGER,
    "circuit_id" INTEGER,
    "winner_driver_id" INTEGER,
    "winner_team_id" INTEGER,
    "pole_position_driver_id" INTEGER,
    "fastest_laps_id" INTEGER,
    FOREIGN KEY("year_id") REFERENCES "seasons"("id")
    FOREIGN KEY("circuit_id") REFERENCES "circuits"("id")
    FOREIGN KEY("winner_driver_id") REFERENCES "drivers"("id")
    FOREIGN KEY("winner_team_id") REFERENCES "teams"("id")
    FOREIGN KEY("pole_position_driver_id") REFERENCES "drivers"("id")
    FOREIGN KEY("fastest_laps_id") REFERENCES "drivers"("id")
);

CREATE INDEX "driver_search" ON "drivers" ("first_name", "last_name");
CREATE INDEX "team_search" ON "teams" ("name");
