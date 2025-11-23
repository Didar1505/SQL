CREATE TABLE "ingredients"
(
    "id"      INTEGER PRIMARY KEY,
    "name"    TEXT NOT NULL,
    "unit" TEXT NOT NULL,
    "price"   REAL NOT NULL
);

CREATE TABLE "donut_ingredients"
(
    "donut_id"      INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    FOREIGN KEY (donut_id) REFERENCES "donuts" ("id"),
    FOREIGN KEY (ingredient_id) REFERENCES "ingredients" ("id")
);

CREATE  TABLE "donuts"
(
    "id"             INTEGER PRIMARY KEY,
    "name"           TEXT    NOT NULL,
    "gluten_free"    INTEGER NOT NULL CHECK ( gluten_free IN (0, 1)),
    "price"          REAL    NOT NULL
);

CREATE TABLE "orders"
(
    "id"          INTEGER PRIMARY KEY,
    "customer_id" INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES "customers" ("id")
);

CREATE TABLE "customers"
(
    "id"         INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name"  TEXT NOT NULL
);

CREATE TABLE "history"
(
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER NOT NULL,
    "order_id" INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES "customers"("id"),
    FOREIGN KEY (order_id) REFERENCES "orders"("id"),
    UNIQUE (customer_id, order_id)
);

CREATE TABLE "order_items"
(
    "id" INTEGER PRIMARY KEY,
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL
)