CREATE TABLE "passengers" (
    "id" INTEGER PRIMARY KEY ,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);

CREATE TABLE "airlines" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "airline_concourses" (
    "id" INTEGER PRIMARY KEY,
    "airline_id" INTEGER NOT NULL,
    "concourse" TEXT NOT NULL CHECK ( "concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    FOREIGN KEY (airline_id) REFERENCES "airlines"("id"),
    UNIQUE (airline_id, concourse)
);

CREATE TABLE "checkins" (
    "id" INTEGER PRIMARY KEY,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "check_in_datetime" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (passenger_id) REFERENCES "passengers"("id"),
    FOREIGN KEY (flight_id) REFERENCES "flights"("id"),
    UNIQUE (passenger_id, flight_id)
);

CREATE TABLE "flights" (
    "id" INTEGER PRIMARY KEY,
    "number" TEXT NOT NULL,
    "airline_id" INTEGER NOT NULL ,
    "departure_airport" TEXT NOT NULL,
    "arrival_airport" TEXT NOT NULL ,
    "departure_time" TEXT NOT NULL,
    "arrival_time" TEXT NOT NULL ,
    FOREIGN KEY (airline_id) REFERENCES "airlines"("id")
);

