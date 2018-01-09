prompt PL/SQL Developer import file
prompt Created on 22 Январь 2018 г. by yeesaulov
set feedback off
set define off
prompt Loading DICT_GOODS...
insert into DICT_GOODS (ID_GOODS, NAME_GOODS, AMOUNT_GOODS, PRICE)
values (1, 'Чайники', 15, 225.67);
insert into DICT_GOODS (ID_GOODS, NAME_GOODS, AMOUNT_GOODS, PRICE)
values (2, 'Телевизоры', 20, 3549);
insert into DICT_GOODS (ID_GOODS, NAME_GOODS, AMOUNT_GOODS, PRICE)
values (3, 'Мобилки', 50, 1750);
insert into DICT_GOODS (ID_GOODS, NAME_GOODS, AMOUNT_GOODS, PRICE)
values (4, 'Планшеты', 40, 2845);
insert into DICT_GOODS (ID_GOODS, NAME_GOODS, AMOUNT_GOODS, PRICE)
values (5, 'Холодильники', 15, 4529);
insert into DICT_GOODS (ID_GOODS, NAME_GOODS, AMOUNT_GOODS, PRICE)
values (6, 'Микроволновки', 35, 1455.23);
commit;
prompt 6 records loaded
prompt Loading DICT_USERS...
insert into DICT_USERS (ID_USER, FIRST_NAME, SECOND_NAME, LAST_NAME, PASSWORD, NAME_USER)
values (7, 'Евгений', 'Эдуардович', 'Эсаулов', 'aaa', 'evg');
insert into DICT_USERS (ID_USER, FIRST_NAME, SECOND_NAME, LAST_NAME, PASSWORD, NAME_USER)
values (1, 'Пётр', 'Петрович', 'Петров', '111', 'user1');
insert into DICT_USERS (ID_USER, FIRST_NAME, SECOND_NAME, LAST_NAME, PASSWORD, NAME_USER)
values (2, 'Иван', 'Иванович', 'Иванов', '222', 'user2');
insert into DICT_USERS (ID_USER, FIRST_NAME, SECOND_NAME, LAST_NAME, PASSWORD, NAME_USER)
values (3, 'Федор', 'Федорович', 'Федоров', '333', 'user3');
insert into DICT_USERS (ID_USER, FIRST_NAME, SECOND_NAME, LAST_NAME, PASSWORD, NAME_USER)
values (4, 'Василий', 'Васильевич', 'Васильев', '444', 'user4');
insert into DICT_USERS (ID_USER, FIRST_NAME, SECOND_NAME, LAST_NAME, PASSWORD, NAME_USER)
values (5, 'Павел', 'Павлович', 'Павлов', '555', 'user5');
commit;
prompt 6 records loaded
prompt Loading PURCHASES...
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (188, 1, 3, 1, to_date('23-09-2014 09:13:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (189, 1, 2, 3, to_date('23-09-2014 09:13:50', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (193, 1, 2, 3, to_date('28-10-2014 16:16:54', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (195, 7, 3, 1, to_date('28-10-2014 16:29:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (196, 7, 5, 1, to_date('28-10-2014 16:29:47', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (1, 4, 3, 10, to_date('15-02-1974 11:22:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (2, 5, 2, 15, to_date('16-03-1974 12:55:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (3, 2, 1, 17, to_date('17-04-1974 13:33:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (112, 1, 1, 1, to_date('04-10-2013 15:30:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (115, 2, 5, 1, to_date('04-10-2013 15:32:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (116, 2, 6, 1, to_date('04-10-2013 15:32:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (111, 1, 2, 1, to_date('04-10-2013 15:30:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (113, 1, 6, 1, to_date('04-10-2013 15:30:11', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (114, 2, 4, 1, to_date('04-10-2013 15:32:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (117, 3, 3, 1, to_date('04-10-2013 15:34:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (118, 3, 2, 1, to_date('04-10-2013 15:34:40', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (119, 3, 3, 1, to_date('04-10-2013 15:34:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into PURCHASES (ID_PURCHASE, ID_USER, ID_GOODS, AMOUNT_GOODS, DATE_PURCHASE)
values (120, 3, 2, 1, to_date('04-10-2013 15:34:40', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 18 records loaded
set feedback on
set define on
prompt Done.
