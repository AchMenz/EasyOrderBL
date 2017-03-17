--
-- File generated with SQLiteStudio v3.1.0 on Fr. März 17 18:24:00 2017
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

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
                               '2017-03-17 18:14:00.536777',
                               '2017-03-17 18:14:00.536795',
                               1,
                               'Wildschwein',
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
                               '2017-03-17 18:14:16.241117',
                               '2017-03-17 18:14:16.241139',
                               2,
                               'Hirsch',
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
    comment       TEXT,
    created_by_fk INTEGER       NOT NULL,
    changed_by_fk INTEGER       NOT NULL,
    PRIMARY KEY (
        id
    ),
    UNIQUE (
        email
    ),
    FOREIGN KEY (
        created_by_fk
    )
    REFERENCES ab_user (id),
    FOREIGN KEY (
        changed_by_fk
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
                               comment,
                               created_by_fk,
                               changed_by_fk
                           )
                           VALUES (
                               '2017-03-17 17:01:02.133320',
                               '2017-03-17 17:01:02.133339',
                               1,
                               'Fleischerei Müller',
                               'Str. d. Friedens 25
04317 Leipzig',
                               '0122318248124',
                               'fleischereimueller@mail.com',
                               'Sehr geehrte Fa. Müller,

im Folgenden meine Bestellung.

Mit freundlichen Grüßen,
Fa. XYZ',
                               'Das graue Einfahrttor nehmen.',
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
                               comment,
                               created_by_fk,
                               changed_by_fk
                           )
                           VALUES (
                               '2017-03-17 17:02:50.339261',
                               '2017-03-17 17:02:50.339277',
                               2,
                               'Wursthandel Schmidt',
                               'Karl-Liebknecht-Straße 12
04808 Wurzen',
                               '0332872472',
                               'SchmidtWH@aol.com',
                               'Sehr geehrter Wursthandel Schmidt,

im Folgenden meine Bestellung.

Mit freundlichen Grüßen,
Fa. XYZ',
                               'Mo-Fr 9-18 Uhr geöffnet.',
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
    number        FLOAT    NOT NULL,
    price         FLOAT,
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
                                price,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-03-17 18:21:33.927113',
                                '2017-03-17 18:21:33.927132',
                                1,
                                1,
                                1,
                                1,
                                NULL,
                                5,
                                NULL,
                                'eingeschweißt',
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
                                price,
                                comment,
                                changed_by_fk,
                                created_by_fk
                            )
                            VALUES (
                                '2017-03-17 18:22:05.497864',
                                '2017-03-17 18:22:05.497886',
                                2,
                                1,
                                2,
                                3,
                                NULL,
                                4,
                                NULL,
                                '',
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
                            '2017-03-17 18:17:02.203146',
                            '2017-03-17 18:17:02.203165',
                            1,
                            12.99,
                            '2017-02-27',
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
                            '2017-03-17 18:17:25.017834',
                            '2017-03-17 18:17:25.017851',
                            2,
                            13.5,
                            '2017-03-07',
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
                            '2017-03-17 18:17:54.147503',
                            '2017-03-17 18:17:54.147519',
                            3,
                            19.99,
                            '2017-02-26',
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
                            '2017-03-17 18:18:03.112562',
                            '2017-03-17 18:18:03.112577',
                            4,
                            20.99,
                            '2017-03-16',
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
                            '2017-03-17 18:18:23.122260',
                            '2017-03-17 18:18:23.122276',
                            5,
                            31.99,
                            '2017-01-30',
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
                            '2017-03-17 18:18:36.218372',
                            '2017-03-17 18:18:36.218387',
                            6,
                            27.5,
                            '2016-11-09',
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
                            '2017-03-17 18:19:08.761975',
                            '2017-03-17 18:19:08.761991',
                            7,
                            14.99,
                            '2017-02-27',
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
                            '2017-03-17 18:19:17.037001',
                            '2017-03-17 18:19:17.037021',
                            8,
                            15.99,
                            '2017-03-07',
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
                            '2017-03-17 18:19:25.505856',
                            '2017-03-17 18:19:25.505874',
                            9,
                            16.99,
                            '2017-03-16',
                            4,
                            1,
                            1
                        );


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
                              '2017-03-17 18:14:29.693249',
                              '2017-03-17 18:14:29.693270',
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
                              '2017-03-17 18:14:38.847692',
                              '2017-03-17 18:14:38.847715',
                              2,
                              'Filet',
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
                              '2017-03-17 18:14:56.648649',
                              '2017-03-17 18:14:56.648663',
                              3,
                              'Wickel',
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
                              '2017-03-17 18:15:02.183902',
                              '2017-03-17 18:15:02.183931',
                              4,
                              'Keule',
                              2,
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
    created_by_fk INTEGER       NOT NULL,
    changed_by_fk INTEGER       NOT NULL,
    PRIMARY KEY (
        id
    ),
    FOREIGN KEY (
        supplierId
    )
    REFERENCES table_supplier (id),
    FOREIGN KEY (
        created_by_fk
    )
    REFERENCES ab_user (id),
    FOREIGN KEY (
        changed_by_fk
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
                             created_by_fk,
                             changed_by_fk
                         )
                         VALUES (
                             '2017-03-17 17:03:58.932064',
                             '2017-03-17 17:03:58.932081',
                             1,
                             1,
                             '2017-03-23',
                             '10:45',
                             NULL,
                             NULL,
                             '100% eingeschweißt.',
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
                             created_by_fk,
                             changed_by_fk
                         )
                         VALUES (
                             '2017-03-17 17:09:24.584092',
                             '2017-03-17 17:09:24.584110',
                             2,
                             2,
                             '2017-03-19',
                             '15:45',
                             NULL,
                             NULL,
                             'Diesmal doppelt so viel, weil ich nächste Woche nicht komme.',
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
                             created_by_fk,
                             changed_by_fk
                         )
                         VALUES (
                             '2017-03-17 17:10:21.307107',
                             '2017-03-17 17:10:21.307126',
                             3,
                             1,
                             '2017-03-29',
                             '10:30',
                             NULL,
                             NULL,
                             'Keine roten Kisten mitgeben.',
                             1,
                             1
                         );


-- Table: ab_view_menu
DROP TABLE IF EXISTS ab_view_menu;

CREATE TABLE ab_view_menu (
    id   INTEGER       NOT NULL,
    name VARCHAR (100) NOT NULL,
    PRIMARY KEY (
        id
    ),
    UNIQUE (
        name
    )
);

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             1,
                             'IndexView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             2,
                             'UtilView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             3,
                             'LocaleView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             4,
                             'ResetPasswordView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             5,
                             'ResetMyPasswordView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             6,
                             'UserInfoEditView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             7,
                             'AuthDBView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             8,
                             'UserDBModelView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             9,
                             'List Users'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             10,
                             'Security'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             11,
                             'RoleModelView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             12,
                             'List Roles'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             13,
                             'UserStatsChartView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             14,
                             'User''s Statistics'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             15,
                             'PermissionModelView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             16,
                             'Base Permissions'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             17,
                             'ViewMenuModelView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             18,
                             'Views/Menus'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             19,
                             'PermissionViewModelView'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             20,
                             'Permission on Views/Menus'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             21,
                             'SupplierAdmin'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             22,
                             'Orders'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             23,
                             'OrdersAdmin'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             24,
                             'OrderlineAdmin'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             25,
                             'CategoryAdmin'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             26,
                             'Products'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             27,
                             'ProductAdmin'
                         );

INSERT INTO ab_view_menu (
                             id,
                             name
                         )
                         VALUES (
                             28,
                             'PriceAdmin'
                         );


-- Table: ab_permission
DROP TABLE IF EXISTS ab_permission;

CREATE TABLE ab_permission (
    id   INTEGER       NOT NULL,
    name VARCHAR (100) NOT NULL,
    PRIMARY KEY (
        id
    ),
    UNIQUE (
        name
    )
);

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              1,
                              'can_this_form_get'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              2,
                              'can_this_form_post'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              3,
                              'can_userinfo'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              4,
                              'can_delete'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              5,
                              'can_add'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              6,
                              'can_show'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              7,
                              'can_edit'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              8,
                              'can_list'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              9,
                              'can_download'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              10,
                              'resetmypassword'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              11,
                              'resetpasswords'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              12,
                              'userinfoedit'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              13,
                              'menu_access'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              14,
                              'Copy Role'
                          );

INSERT INTO ab_permission (
                              id,
                              name
                          )
                          VALUES (
                              15,
                              'can_chart'
                          );


-- Table: ab_permission_view
DROP TABLE IF EXISTS ab_permission_view;

CREATE TABLE ab_permission_view (
    id            INTEGER NOT NULL,
    permission_id INTEGER,
    view_menu_id  INTEGER,
    PRIMARY KEY (
        id
    ),
    FOREIGN KEY (
        permission_id
    )
    REFERENCES ab_permission (id),
    FOREIGN KEY (
        view_menu_id
    )
    REFERENCES ab_view_menu (id) 
);

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   1,
                                   1,
                                   4
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   2,
                                   2,
                                   4
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   3,
                                   1,
                                   5
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   4,
                                   2,
                                   5
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   5,
                                   1,
                                   6
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   6,
                                   2,
                                   6
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   7,
                                   3,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   8,
                                   4,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   9,
                                   5,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   10,
                                   6,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   11,
                                   7,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   12,
                                   8,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   13,
                                   9,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   14,
                                   10,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   15,
                                   11,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   16,
                                   12,
                                   8
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   17,
                                   13,
                                   9
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   18,
                                   13,
                                   10
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   19,
                                   4,
                                   11
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   20,
                                   5,
                                   11
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   21,
                                   6,
                                   11
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   22,
                                   7,
                                   11
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   23,
                                   8,
                                   11
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   24,
                                   9,
                                   11
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   25,
                                   14,
                                   11
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   26,
                                   13,
                                   12
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   27,
                                   15,
                                   13
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   28,
                                   13,
                                   14
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   29,
                                   8,
                                   15
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   30,
                                   13,
                                   16
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   31,
                                   8,
                                   17
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   32,
                                   13,
                                   18
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   33,
                                   8,
                                   19
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   34,
                                   13,
                                   20
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   35,
                                   4,
                                   21
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   36,
                                   5,
                                   21
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   37,
                                   6,
                                   21
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   38,
                                   7,
                                   21
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   39,
                                   8,
                                   21
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   40,
                                   9,
                                   21
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   42,
                                   13,
                                   22
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   43,
                                   4,
                                   23
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   44,
                                   5,
                                   23
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   45,
                                   6,
                                   23
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   46,
                                   7,
                                   23
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   47,
                                   8,
                                   23
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   48,
                                   9,
                                   23
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   50,
                                   4,
                                   24
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   51,
                                   5,
                                   24
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   52,
                                   6,
                                   24
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   53,
                                   7,
                                   24
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   54,
                                   8,
                                   24
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   55,
                                   9,
                                   24
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   78,
                                   9,
                                   25
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   79,
                                   6,
                                   25
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   80,
                                   8,
                                   25
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   81,
                                   4,
                                   25
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   82,
                                   5,
                                   25
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   83,
                                   7,
                                   25
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   85,
                                   13,
                                   26
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   94,
                                   9,
                                   27
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   95,
                                   8,
                                   27
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   96,
                                   5,
                                   27
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   97,
                                   6,
                                   27
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   98,
                                   4,
                                   27
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   99,
                                   7,
                                   27
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   101,
                                   9,
                                   28
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   102,
                                   8,
                                   28
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   103,
                                   5,
                                   28
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   104,
                                   6,
                                   28
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   105,
                                   4,
                                   28
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   106,
                                   7,
                                   28
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   120,
                                   13,
                                   21
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   121,
                                   13,
                                   23
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   122,
                                   13,
                                   24
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   123,
                                   13,
                                   25
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   124,
                                   13,
                                   27
                               );

INSERT INTO ab_permission_view (
                                   id,
                                   permission_id,
                                   view_menu_id
                               )
                               VALUES (
                                   125,
                                   13,
                                   28
                               );


-- Table: ab_user_role
DROP TABLE IF EXISTS ab_user_role;

CREATE TABLE ab_user_role (
    id      INTEGER NOT NULL,
    user_id INTEGER,
    role_id INTEGER,
    PRIMARY KEY (
        id
    ),
    FOREIGN KEY (
        user_id
    )
    REFERENCES ab_user (id),
    FOREIGN KEY (
        role_id
    )
    REFERENCES ab_role (id) 
);

INSERT INTO ab_user_role (
                             id,
                             user_id,
                             role_id
                         )
                         VALUES (
                             1,
                             1,
                             1
                         );


-- Table: ab_permission_view_role
DROP TABLE IF EXISTS ab_permission_view_role;

CREATE TABLE ab_permission_view_role (
    id                 INTEGER NOT NULL,
    permission_view_id INTEGER,
    role_id            INTEGER,
    PRIMARY KEY (
        id
    ),
    FOREIGN KEY (
        permission_view_id
    )
    REFERENCES ab_permission_view (id),
    FOREIGN KEY (
        role_id
    )
    REFERENCES ab_role (id) 
);

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        1,
                                        1,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        2,
                                        2,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        3,
                                        3,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        4,
                                        4,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        5,
                                        5,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        6,
                                        6,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        7,
                                        7,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        8,
                                        8,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        9,
                                        9,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        10,
                                        10,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        11,
                                        11,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        12,
                                        12,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        13,
                                        13,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        14,
                                        14,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        15,
                                        15,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        16,
                                        16,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        17,
                                        17,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        18,
                                        18,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        19,
                                        19,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        20,
                                        20,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        21,
                                        21,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        22,
                                        22,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        23,
                                        23,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        24,
                                        24,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        25,
                                        25,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        26,
                                        26,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        27,
                                        27,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        28,
                                        28,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        29,
                                        29,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        30,
                                        30,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        31,
                                        31,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        32,
                                        32,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        33,
                                        33,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        34,
                                        34,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        35,
                                        35,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        36,
                                        36,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        37,
                                        37,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        38,
                                        38,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        39,
                                        39,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        40,
                                        40,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        42,
                                        42,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        43,
                                        43,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        44,
                                        44,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        45,
                                        45,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        46,
                                        46,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        47,
                                        47,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        48,
                                        48,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        50,
                                        50,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        51,
                                        51,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        52,
                                        52,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        53,
                                        53,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        54,
                                        54,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        55,
                                        55,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        78,
                                        78,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        79,
                                        79,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        80,
                                        80,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        81,
                                        81,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        82,
                                        82,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        83,
                                        83,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        85,
                                        85,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        94,
                                        94,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        95,
                                        95,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        96,
                                        96,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        97,
                                        97,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        98,
                                        98,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        99,
                                        99,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        101,
                                        101,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        102,
                                        102,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        103,
                                        103,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        104,
                                        104,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        105,
                                        105,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        106,
                                        106,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        120,
                                        120,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        121,
                                        121,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        122,
                                        122,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        123,
                                        123,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        124,
                                        124,
                                        1
                                    );

INSERT INTO ab_permission_view_role (
                                        id,
                                        permission_view_id,
                                        role_id
                                    )
                                    VALUES (
                                        125,
                                        125,
                                        1
                                    );


-- Table: ab_role
DROP TABLE IF EXISTS ab_role;

CREATE TABLE ab_role (
    id   INTEGER      NOT NULL,
    name VARCHAR (64) NOT NULL,
    PRIMARY KEY (
        id
    ),
    UNIQUE (
        name
    )
);

INSERT INTO ab_role (
                        id,
                        name
                    )
                    VALUES (
                        1,
                        'Admin'
                    );

INSERT INTO ab_role (
                        id,
                        name
                    )
                    VALUES (
                        2,
                        'Public'
                    );


-- Table: ab_user
DROP TABLE IF EXISTS ab_user;

CREATE TABLE ab_user (
    id               INTEGER       NOT NULL,
    first_name       VARCHAR (64)  NOT NULL,
    last_name        VARCHAR (64)  NOT NULL,
    username         VARCHAR (64)  NOT NULL,
    password         VARCHAR (256),
    active           BOOLEAN,
    email            VARCHAR (64)  NOT NULL,
    last_login       DATETIME,
    login_count      INTEGER,
    fail_login_count INTEGER,
    created_on       DATETIME,
    changed_on       DATETIME,
    changed_by_fk    INTEGER,
    created_by_fk    INTEGER,
    PRIMARY KEY (
        id
    ),
    UNIQUE (
        username
    ),
    CHECK (active IN (0, 1) ),
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

INSERT INTO ab_user (
                        id,
                        first_name,
                        last_name,
                        username,
                        password,
                        active,
                        email,
                        last_login,
                        login_count,
                        fail_login_count,
                        created_on,
                        changed_on,
                        changed_by_fk,
                        created_by_fk
                    )
                    VALUES (
                        1,
                        'Test',
                        'Admin',
                        'admin',
                        'pbkdf2:sha256:50000$GObOvK5f$4b7b28c34504f5a13164a2b54f6de7123be82aabfe5da06281e037eb4f22658f',
                        1,
                        'test@mail.com',
                        '2017-03-17 17:49:38.057428',
                        1,
                        0,
                        '2017-03-17 17:49:26.759267',
                        '2017-03-17 17:49:26.759286',
                        NULL,
                        NULL
                    );


-- Table: ab_register_user
DROP TABLE IF EXISTS ab_register_user;

CREATE TABLE ab_register_user (
    id                INTEGER       NOT NULL,
    first_name        VARCHAR (64)  NOT NULL,
    last_name         VARCHAR (64)  NOT NULL,
    username          VARCHAR (64)  NOT NULL,
    password          VARCHAR (256),
    email             VARCHAR (64)  NOT NULL,
    registration_date DATETIME,
    registration_hash VARCHAR (256),
    PRIMARY KEY (
        id
    ),
    UNIQUE (
        username
    )
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
