--
-- File generated with SQLiteStudio v3.1.1 on Mi Mrz 22 09:12:28 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: ab_permission
DROP TABLE IF EXISTS ab_permission;
CREATE TABLE ab_permission (
	id INTEGER NOT NULL, 
	name VARCHAR(100) NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (name)
);
INSERT INTO ab_permission (id, name) VALUES (1, 'can_this_form_get');
INSERT INTO ab_permission (id, name) VALUES (2, 'can_this_form_post');
INSERT INTO ab_permission (id, name) VALUES (3, 'can_download');
INSERT INTO ab_permission (id, name) VALUES (4, 'can_userinfo');
INSERT INTO ab_permission (id, name) VALUES (5, 'can_show');
INSERT INTO ab_permission (id, name) VALUES (6, 'can_add');
INSERT INTO ab_permission (id, name) VALUES (7, 'can_delete');
INSERT INTO ab_permission (id, name) VALUES (8, 'can_list');
INSERT INTO ab_permission (id, name) VALUES (9, 'can_edit');
INSERT INTO ab_permission (id, name) VALUES (10, 'resetmypassword');
INSERT INTO ab_permission (id, name) VALUES (11, 'resetpasswords');
INSERT INTO ab_permission (id, name) VALUES (12, 'userinfoedit');
INSERT INTO ab_permission (id, name) VALUES (13, 'menu_access');
INSERT INTO ab_permission (id, name) VALUES (14, 'Copy Role');
INSERT INTO ab_permission (id, name) VALUES (15, 'can_chart');

-- Table: ab_permission_view
DROP TABLE IF EXISTS ab_permission_view;
CREATE TABLE ab_permission_view (
	id INTEGER NOT NULL, 
	permission_id INTEGER, 
	view_menu_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(permission_id) REFERENCES ab_permission (id), 
	FOREIGN KEY(view_menu_id) REFERENCES ab_view_menu (id)
);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (1, 1, 4);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (2, 2, 4);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (3, 1, 5);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (4, 2, 5);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (5, 1, 6);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (6, 2, 6);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (7, 3, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (8, 4, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (9, 5, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (10, 6, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (11, 7, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (12, 8, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (13, 9, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (14, 10, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (15, 11, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (16, 12, 8);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (17, 13, 9);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (18, 13, 10);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (19, 3, 11);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (20, 5, 11);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (21, 6, 11);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (22, 7, 11);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (23, 8, 11);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (24, 9, 11);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (25, 14, 11);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (26, 13, 12);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (27, 15, 13);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (28, 13, 14);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (29, 8, 15);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (30, 13, 16);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (31, 8, 17);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (32, 13, 18);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (33, 8, 19);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (34, 13, 20);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (35, 3, 21);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (36, 5, 21);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (37, 6, 21);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (38, 7, 21);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (39, 8, 21);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (40, 9, 21);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (42, 13, 22);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (43, 3, 23);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (44, 5, 23);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (45, 6, 23);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (46, 7, 23);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (47, 8, 23);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (48, 9, 23);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (50, 3, 24);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (51, 5, 24);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (52, 6, 24);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (53, 7, 24);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (54, 8, 24);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (55, 9, 24);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (57, 3, 25);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (58, 5, 25);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (59, 6, 25);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (60, 7, 25);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (61, 8, 25);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (62, 9, 25);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (64, 13, 26);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (65, 3, 27);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (66, 5, 27);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (67, 6, 27);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (68, 7, 27);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (69, 8, 27);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (70, 9, 27);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (72, 3, 28);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (73, 5, 28);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (74, 6, 28);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (75, 7, 28);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (76, 8, 28);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (77, 9, 28);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (97, 13, 21);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (98, 13, 23);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (99, 13, 24);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (100, 13, 25);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (101, 13, 27);
INSERT INTO ab_permission_view (id, permission_id, view_menu_id) VALUES (102, 13, 28);

-- Table: ab_permission_view_role
DROP TABLE IF EXISTS ab_permission_view_role;
CREATE TABLE ab_permission_view_role (
	id INTEGER NOT NULL, 
	permission_view_id INTEGER, 
	role_id INTEGER, 
	PRIMARY KEY (id), 
	FOREIGN KEY(permission_view_id) REFERENCES ab_permission_view (id), 
	FOREIGN KEY(role_id) REFERENCES ab_role (id)
);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (1, 1, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (2, 2, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (3, 3, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (4, 4, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (5, 5, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (6, 6, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (7, 7, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (8, 8, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (9, 9, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (10, 10, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (11, 11, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (12, 12, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (13, 13, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (14, 14, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (15, 15, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (16, 16, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (17, 17, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (18, 18, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (19, 19, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (20, 20, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (21, 21, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (22, 22, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (23, 23, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (24, 24, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (25, 25, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (26, 26, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (27, 27, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (28, 28, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (29, 29, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (30, 30, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (31, 31, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (32, 32, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (33, 33, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (34, 34, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (35, 35, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (36, 36, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (37, 37, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (38, 38, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (39, 39, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (40, 40, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (42, 42, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (43, 43, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (44, 44, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (45, 45, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (46, 46, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (47, 47, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (48, 48, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (50, 50, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (51, 51, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (52, 52, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (53, 53, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (54, 54, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (55, 55, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (57, 57, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (58, 58, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (59, 59, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (60, 60, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (61, 61, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (62, 62, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (64, 64, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (65, 65, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (66, 66, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (67, 67, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (68, 68, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (69, 69, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (70, 70, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (72, 72, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (73, 73, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (74, 74, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (75, 75, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (76, 76, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (77, 77, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (91, 39, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (92, 42, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (93, 47, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (94, 54, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (95, 61, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (96, 64, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (97, 69, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (98, 76, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (105, 36, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (106, 37, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (107, 38, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (108, 39, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (109, 40, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (110, 42, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (111, 44, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (112, 45, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (113, 46, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (114, 47, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (115, 48, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (116, 51, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (117, 52, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (118, 53, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (119, 54, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (120, 55, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (121, 58, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (122, 59, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (123, 60, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (124, 61, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (125, 62, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (126, 64, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (127, 66, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (128, 67, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (129, 68, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (130, 69, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (131, 70, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (132, 73, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (133, 74, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (134, 75, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (135, 76, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (136, 77, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (149, 97, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (150, 98, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (151, 99, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (152, 100, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (153, 101, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (154, 102, 1);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (155, 97, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (156, 98, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (157, 99, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (158, 100, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (159, 101, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (160, 102, 3);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (161, 97, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (162, 98, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (163, 99, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (164, 100, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (165, 101, 4);
INSERT INTO ab_permission_view_role (id, permission_view_id, role_id) VALUES (166, 102, 4);

-- Table: ab_role
DROP TABLE IF EXISTS ab_role;
CREATE TABLE ab_role (
	id INTEGER NOT NULL, 
	name VARCHAR(64) NOT NULL, 
	PRIMARY KEY (id), 
	UNIQUE (name)
);
INSERT INTO ab_role (id, name) VALUES (1, 'Admin');
INSERT INTO ab_role (id, name) VALUES (2, 'Public');
INSERT INTO ab_role (id, name) VALUES (3, 'Supplier');
INSERT INTO ab_role (id, name) VALUES (4, 'Customer');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
