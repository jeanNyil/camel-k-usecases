CREATE DATABASE transactions;
USE transactions;

CREATE TABLE transactions.public.transactions (
    id serial NOT NULL,
    "timestamp" timestamp NULL,
    accountnumber varchar NULL,
    amount float8 NULL,
    CONSTRAINT transactions_pk PRIMARY KEY (id)
);

INSERT INTO public.transactions ("timestamp", accountnumber, amount) VALUES ('2021-01-01T00:00:00', '92842238', 100.0);
INSERT INTO public.transactions ("timestamp", accountnumber, amount) VALUES ('2021-01-02T00:00:00', '2873628736', 120.0);
INSERT INTO public.transactions ("timestamp", accountnumber, amount) VALUES ('2021-01-03T00:00:00', '12922878', 320.0);
INSERT INTO public.transactions ("timestamp", accountnumber, amount) VALUES ('2021-01-04T00:00:00', '12898878', 400.0);