CREATE TABLE "users"
(
    "id"         INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name"  TEXT NOT NULL,
    "username"   TEXT NOT NULL UNIQUE,
    "password"   TEXT NOT NULL
);

CREATE TABLE "schools"
(
    "id"           INTEGER PRIMARY KEY,
    "name"         TEXT    NOT NULL,
    "type"         TEXT    NOT NULL,
    "location"     TEXT    NOT NULL,
    "founded_year" INTEGER NOT NULL
);

CREATE TABLE "companies"
(
    "id"       INTEGER PRIMARY KEY,
    "name"       TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL
);

CREATE TABLE "educations"
(
    "id"         INTEGER PRIMARY KEY,
    "user_id"    INTEGER NOT NULL,
    "school_id"  INTEGER NOT NULL,
    "start_date" TEXT    NOT NULL,
    "end_date"   TEXT,
    "degree"     TEXT,
    "field"      TEXT,
    FOREIGN KEY (user_id) REFERENCES "users" ("id"),
    FOREIGN KEY (school_id) REFERENCES "schools" ("id")
);

CREATE TABLE "experiences"
(
    "id"         INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL ,
    "company_id" INTEGER NOT NULL,
    "position"   TEXT NOT NULL,
    "start_date" TEXT NOT NULL,
    "end_date"   TEXT,
    FOREIGN KEY (user_id) REFERENCES "users" ("id"),
    FOREIGN KEY (company_id) REFERENCES "companies" ("id")
);

CREATE TABLE "connections"
(
    "id" INTEGER PRIMARY KEY,
    "user1_id" INTEGER NOT NULL,
    "user2_id" INTEGER NOT NULL,
    FOREIGN KEY (user1_id) REFERENCES "users"("id"),
    FOREIGN KEY (user2_id) REFERENCES "users"("id"),
    UNIQUE (user1_id, user2_id)
)