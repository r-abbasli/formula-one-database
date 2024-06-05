-- Find all races where Max Verstappen wins
SELECT * FROM "races"
WHERE "winner_driver_id" IN (
    SELECT "id" FROM "drivers"
    WHERE "first_name" = 'Max'
    "last_name" = 'Verstappen'
);


-- Find 2022 line-up of Ferrari
SELECT * FROM "drivers"
JOIN "raced_for_that_season"
ON "drivers"."id" = "raced_for_that_season"."driver"."id"
WHERE "raced_for_that_season"."year_id" IN (
    SELECT "id" FROM "seasons"
    WHERE "year" = 2022
) AND "raced_for_that_season"."team_id" IN (
    SELECT "id" FROM "teams"
    WHERE "name" = 'Ferrari'
);


-- Add Charles Leclerc and Max Verstappen
INSERT INTO "drivers" ("first_name", "last_name", "country")
VALUES ('Charles', 'Leclerc', 'Monaco');

INSERT INTO "drivers" ("first_name", "last_name", "country")
VALUES ('Max', 'Verstappen', 'Netherlands');
