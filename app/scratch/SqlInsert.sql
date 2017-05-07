--
-- File generated with SQLiteStudio v3.1.0 on So. Mai 7 18:30:35 2017
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: table_product
DROP TABLE IF EXISTS table_product;

CREATE TABLE table_product (
    created_on    DATETIME      NOT NULL,
    changed_on    DATETIME      NOT NULL,
    id            INTEGER       NOT NULL,
    name          VARCHAR (255) NOT NULL,
    categoryId    INTEGER,
    changed_by_fk INTEGER       NOT NULL,
    created_by_fk INTEGER       NOT NULL,
    PRIMARY KEY (
        id
    ),
    FOREIGN KEY (
        categoryId
    )
    REFERENCES table_category (id),
    FOREIGN KEY (
        changed_by_fk
    )
    REFERENCES ab_user (id),
    FOREIGN KEY (
        created_by_fk
    )
    REFERENCES ab_user (id) 
);

INSERT INTO table_product (
                              created_on,
                              changed_on,
                              id,
                              name,
                              categoryId,
                              changed_by_fk,
                              created_by_fk
                          )
                          VALUES (
                              '2017-04-22 12:04:42.702009',
                              '2017-04-22 12:04:42.702026',
                              1,
                              'Keule',
                              1,
                              1,
                              1
                          );

INSERT INTO table_product (
                              created_on,
                              changed_on,
                              id,
                              name,
                              categoryId,
                              changed_by_fk,
                              created_by_fk
                          )
                          VALUES (
                              '2017-04-22 12:05:31.713783',
                              '2017-04-22 12:05:31.713799',
                              2,
                              'Rückenfilet',
                              1,
                              1,
                              1
                          );

INSERT INTO table_product (
                              created_on,
                              changed_on,
                              id,
                              name,
                              categoryId,
                              changed_by_fk,
                              created_by_fk
                          )
                          VALUES (
                              '2017-04-22 12:06:44.824903',
                              '2017-04-22 12:06:44.824927',
                              3,
                              'Gulasch',
                              2,
                              1,
                              1
                          );

INSERT INTO table_product (
                              created_on,
                              changed_on,
                              id,
                              name,
                              categoryId,
                              changed_by_fk,
                              created_by_fk
                          )
                          VALUES (
                              '2017-04-22 12:07:39.102363',
                              '2017-04-22 12:07:39.102383',
                              4,
                              'Keule',
                              2,
                              1,
                              1
                          );

INSERT INTO table_product (
                              created_on,
                              changed_on,
                              id,
                              name,
                              categoryId,
                              changed_by_fk,
                              created_by_fk
                          )
                          VALUES (
                              '2017-04-22 12:22:07.877332',
                              '2017-04-22 12:22:07.877358',
                              5,
                              'OhnePreis',
                              1,
                              1,
                              1
                          );

INSERT INTO table_product (
                              created_on,
                              changed_on,
                              id,
                              name,
                              categoryId,
                              changed_by_fk,
                              created_by_fk
                          )
                          VALUES (
                              '2017-04-22 17:02:45.058348',
                              '2017-04-22 17:02:45.058371',
                              6,
                              'Hals',
                              1,
                              1,
                              1
                          );


-- Table: table_supplier
DROP TABLE IF EXISTS table_supplier;

CREATE TABLE table_supplier (
    created_on    DATETIME      NOT NULL,
    changed_on    DATETIME      NOT NULL,
    id            INTEGER       NOT NULL,
    client        VARCHAR (255) NOT NULL,
    address       TEXT,
    telephone     VARCHAR (255),
    email         VARCHAR (255) DEFAULT ''
                                NOT NULL,
    emailText     TEXT          NOT NULL,
    emailSubject  VARCHAR (255) NOT NULL,
    comment       TEXT,
    changed_by_fk INTEGER       NOT NULL,
    created_by_fk INTEGER       NOT NULL,
    PRIMARY KEY (
        id
    ),
    UNIQUE (
        email
    ),
    FOREIGN KEY (
        changed_by_fk
    )
    REFERENCES ab_user (id),
    FOREIGN KEY (
        created_by_fk
    )
    REFERENCES ab_user (id) 
);

INSERT INTO table_supplier (
                               created_on,
                               changed_on,
                               id,
                               client,
                               address,
                               telephone,
                               email,
                               emailText,
                               emailSubject,
                               comment,
                               changed_by_fk,
                               created_by_fk
                           )
                           VALUES (
                               '2017-04-22 12:09:56.860229',
                               '2017-05-07 15:43:03.361368',
                               1,
                               'Wildhandel Schmidt',
                               'Straße des Friedens 5
04317 Leipzig',
                               '0341871234712',
                               'broyjoerg@aol.com',
                               'Sehr geehrte Damen und Herren,

im Folgenden meine Bestellung.

MfG,
Klaus Müller',
                               'Bestellung, Firma Wildhandel Schulz',
                               'Das ist ein Kommentar
mit zwei Zeilen.',
                               1,
                               1
                           );

INSERT INTO table_supplier (
                               created_on,
                               changed_on,
                               id,
                               client,
                               address,
                               telephone,
                               email,
                               emailText,
                               emailSubject,
                               comment,
                               changed_by_fk,
                               created_by_fk
                           )
                           VALUES (
                               '2017-04-22 12:11:29.187488',
                               '2017-04-22 12:11:29.187504',
                               2,
                               'Wurst und Fleisch Wagner',
                               'Friedrich Ebert Str. 78
04808 Wurzen',
                               '0342512883123',
                               'WagnerFleisch@aol.com',
                               'Sehr geehrte Damen und Herren,

im Folgenden meine Bestellung.

MfG,
Klaus Dieter',
                               'BlaBliBlub',
                               'Das ist ein
dreizeiliger
Kommentar.',
                               1,
                               1
                           );


-- Table: table_price
DROP TABLE IF EXISTS table_price;

CREATE TABLE table_price (
    created_on    DATETIME NOT NULL,
    changed_on    DATETIME NOT NULL,
    id            INTEGER  NOT NULL,
    price         FLOAT    NOT NULL,
    date          DATE     NOT NULL,
    productId     INTEGER,
    changed_by_fk INTEGER  NOT NULL,
    created_by_fk INTEGER  NOT NULL,
    PRIMARY KEY (
        id
    ),
    FOREIGN KEY (
        productId
    )
    REFERENCES table_product (id),
    FOREIGN KEY (
        changed_by_fk
    )
    REFERENCES ab_user (id),
    FOREIGN KEY (
        created_by_fk
    )
    REFERENCES ab_user (id) 
);

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 12:05:04.463901',
                            '2017-04-22 12:05:04.463920',
                            1,
                            9.99,
                            '2017-04-01',
                            1,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 12:05:17.267611',
                            '2017-04-22 12:05:17.267629',
                            2,
                            10.99,
                            '2017-04-02',
                            1,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 12:05:50.690154',
                            '2017-04-22 12:05:50.690170',
                            3,
                            19.99,
                            '2017-04-01',
                            2,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 12:06:11.404200',
                            '2017-04-22 12:06:11.404218',
                            4,
                            25.99,
                            '2017-04-02',
                            2,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 12:07:06.465211',
                            '2017-04-22 12:07:06.465227',
                            5,
                            7.99,
                            '2017-04-01',
                            3,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 12:07:18.142343',
                            '2017-04-22 12:07:18.142361',
                            6,
                            8.99,
                            '2017-04-02',
                            3,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 12:07:59.682610',
                            '2017-04-22 12:07:59.682633',
                            7,
                            17.99,
                            '2017-04-01',
                            4,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 12:08:08.726213',
                            '2017-04-22 12:08:08.726233',
                            8,
                            18.99,
                            '2017-04-02',
                            4,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 17:03:02.480030',
                            '2017-04-22 17:03:02.480048',
                            9,
                            11.99,
                            '2017-04-01',
                            6,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-22 17:03:12.431292',
                            '2017-04-22 17:03:12.431309',
                            10,
                            21.99,
                            '2017-04-02',
                            6,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-04-23 18:38:33.960068',
                            '2017-04-23 18:38:33.960090',
                            11,
                            31.99,
                            '2017-04-03',
                            2,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-05-07 16:44:47.477755',
                            '2017-05-07 16:44:47.477775',
                            12,
                            15.99,
                            '2017-05-07',
                            1,
                            1,
                            1
                        );

INSERT INTO table_price (
                            created_on,
                            changed_on,
                            id,
                            price,
                            date,
                            productId,
                            changed_by_fk,
                            created_by_fk
                        )
                        VALUES (
                            '2017-05-07 16:51:56.593992',
                            '2017-05-07 16:51:56.594010',
                            13,
                            13.99,
                            '2017-05-01',
                            2,
                            1,
                            1
                        );


-- Table: table_orderline
DROP TABLE IF EXISTS table_orderline;

CREATE TABLE table_orderline (
    created_on    DATETIME NOT NULL,
    changed_on    DATETIME NOT NULL,
    id            INTEGER  NOT NULL,
    orderId       INTEGER,
    categoryId    INTEGER,
    productId     INTEGER,
    priceId       INTEGER,
    number        FLOAT,
    comment       TEXT,
    changed_by_fk INTEGER  NOT NULL,
    created_by_fk INTEGER  NOT NULL,
    PRIMARY KEY (
        id
    ),
    FOREIGN KEY (
        orderId
    )
    REFERENCES table_orders (id),
    FOREIGN KEY (
        categoryId
    )
    REFERENCES table_category (id),
    FOREIGN KEY (
        productId
    )
    REFERENCES table_product (id),
    FOREIGN KEY (
        priceId
    )
    REFERENCES table_price (id),
    FOREIGN KEY (
        changed_by_fk
    )
    REFERENCES ab_user (id),
    FOREIGN KEY (
        created_by_fk
    )
    REFERENCES ab_user (id) 
);

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-04-22 12:12:27.526635',
                                '2017-05-07 16:42:58.784915',
                                1,
                                1,
                                1,
                                1,
                                12,
                                10,
                                '',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-04-22 12:12:56.501325',
                                '2017-05-07 11:36:28.126371',
                                2,
                                1,
                                1,
                                1,
                                12,
                                10,
                                'in kg',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-04-22 12:13:27.796668',
                                '2017-04-22 12:13:27.796684',
                                3,
                                1,
                                1,
                                2,
                                13,
                                10,
                                '',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-04-22 12:13:41.228538',
                                '2017-04-22 12:13:41.228561',
                                4,
                                1,
                                2,
                                3,
                                6,
                                13,
                                '',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-04-22 12:13:53.142504',
                                '2017-04-22 12:13:53.142526',
                                5,
                                1,
                                2,
                                4,
                                8,
                                12,
                                '',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-04-22 12:22:24.154228',
                                '2017-04-23 18:36:29.340510',
                                6,
                                1,
                                1,
                                2,
                                13,
                                15,
                                '',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-04-25 08:40:21.357148',
                                '2017-04-25 08:40:21.357169',
                                7,
                                1,
                                1,
                                6,
                                10,
                                55,
                                '',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-05-07 16:11:54.245560',
                                '2017-05-07 16:11:54.245578',
                                8,
                                1,
                                2,
                                3,
                                6,
                                20,
                                'Testitem',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-05-07 16:39:32.443331',
                                '2017-05-07 16:39:32.443353',
                                9,
                                1,
                                1,
                                6,
                                10,
                                10,
                                '',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-05-07 16:47:36.814145',
                                '2017-05-07 16:47:36.814165',
                                10,
                                1,
                                2,
                                3,
                                6,
                                100,
                                '',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-05-07 16:50:31.723366',
                                '2017-05-07 16:50:51.637728',
                                11,
                                1,
                                1,
                                2,
                                13,
                                10,
                                '',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-05-07 17:19:49.125722',
                                '2017-05-07 17:19:49.125740',
                                12,
                                2,
                                1,
                                1,
                                12,
                                10,
                                'in kg',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-05-07 17:20:07.639386',
                                '2017-05-07 17:20:07.639407',
                                13,
                                2,
                                2,
                                3,
                                6,
                                15,
                                'in kg',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-05-07 17:27:29.319308',
                                '2017-05-07 17:27:29.319329',
                                14,
                                3,
                                1,
                                2,
                                13,
                                10,
                                'auch gefrostet möglich',
                                1,
                                1
                            );

INSERT INTO table_orderline (
                                created_on,
                                changed_on,
                                id,
                                orderId,
                                categoryId,
                                productId,
                                priceId,
                                number,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-05-07 17:27:51.072175',
                                '2017-05-07 17:27:51.072191',
                                15,
                                3,
                                2,
                                4,
                                8,
                                5,
                                'mit Röhrenknochen',
                                1,
                                1
                            );


-- Table: table_category
DROP TABLE IF EXISTS table_category;

CREATE TABLE table_category (
    created_on    DATETIME      NOT NULL,
    changed_on    DATETIME      NOT NULL,
    id            INTEGER       NOT NULL,
    name          VARCHAR (255) NOT NULL,
    changed_by_fk INTEGER       NOT NULL,
    created_by_fk INTEGER       NOT NULL,
    PRIMARY KEY (
        id
    ),
    FOREIGN KEY (
        changed_by_fk
    )
    REFERENCES ab_user (id),
    FOREIGN KEY (
        created_by_fk
    )
    REFERENCES ab_user (id) 
);

INSERT INTO table_category (
                               created_on,
                               changed_on,
                               id,
                               name,
                               changed_by_fk,
                               created_by_fk
                           )
                           VALUES (
                               '2017-04-22 12:04:31.516384',
                               '2017-04-22 12:04:31.516404',
                               1,
                               'Hirsch',
                               1,
                               1
                           );

INSERT INTO table_category (
                               created_on,
                               changed_on,
                               id,
                               name,
                               changed_by_fk,
                               created_by_fk
                           )
                           VALUES (
                               '2017-04-22 12:06:30.573425',
                               '2017-04-22 12:06:30.573442',
                               2,
                               'Wildschwein',
                               1,
                               1
                           );


-- Table: table_orders
DROP TABLE IF EXISTS table_orders;

CREATE TABLE table_orders (
    created_on    DATETIME      NOT NULL,
    changed_on    DATETIME      NOT NULL,
    id            INTEGER       NOT NULL,
    supplierId    INTEGER,
    target_date   DATE          NOT NULL,
    target_time   VARCHAR (255),
    total_number  INTEGER,
    total_price   FLOAT,
    comment       TEXT,
    changed_by_fk INTEGER       NOT NULL,
    created_by_fk INTEGER       NOT NULL,
    PRIMARY KEY (
        id
    ),
    FOREIGN KEY (
        supplierId
    )
    REFERENCES table_supplier (id),
    FOREIGN KEY (
        changed_by_fk
    )
    REFERENCES ab_user (id),
    FOREIGN KEY (
        created_by_fk
    )
    REFERENCES ab_user (id) 
);

INSERT INTO table_orders (
                             created_on,
                             changed_on,
                             id,
                             supplierId,
                             target_date,
                             target_time,
                             total_number,
                             total_price,
                             comment,
                             changed_by_fk,
                             created_by_fk
                         )
                         VALUES (
                             '2017-04-22 12:11:59.996967',
                             '2017-04-22 12:11:59.996983',
                             1,
                             1,
                             '2017-04-24',
                             '10:45',
                             265,
                             3662.35,
                             'Bitte die roten Kisten mitgeben.',
                             1,
                             1
                         );

INSERT INTO table_orders (
                             created_on,
                             changed_on,
                             id,
                             supplierId,
                             target_date,
                             target_time,
                             total_number,
                             total_price,
                             comment,
                             changed_by_fk,
                             created_by_fk
                         )
                         VALUES (
                             '2017-05-07 17:17:51.381865',
                             '2017-05-07 17:17:51.381885',
                             2,
                             1,
                             '2017-05-08',
                             '18:00',
                             25,
                             294.75,
                             'Das ist ein
zweizeiliger Kommentar
mit einer weiteren Zeile.',
                             1,
                             1
                         );

INSERT INTO table_orders (
                             created_on,
                             changed_on,
                             id,
                             supplierId,
                             target_date,
                             target_time,
                             total_number,
                             total_price,
                             comment,
                             changed_by_fk,
                             created_by_fk
                         )
                         VALUES (
                             '2017-05-07 17:26:56.111468',
                             '2017-05-07 17:26:56.111487',
                             3,
                             1,
                             '2017-05-10',
                             '19:00',
                             15,
                             234.85,
                             'Bitte Bäckerkisten mitgeben.',
                             1,
                             1
                         );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
