--------------------------------------------------
-- Export file for user DEV                     --
-- Created by yeesaulov on 22.01.2018, 11:35:44 --
--------------------------------------------------

spool evg.log

prompt
prompt Creating table DICT_GOODS
prompt =========================
prompt
create table DEV.DICT_GOODS
(
  ID_GOODS     NUMBER(6) not null,
  NAME_GOODS   VARCHAR2(150),
  AMOUNT_GOODS NUMBER(6),
  PRICE        NUMBER(7,2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DEV.DICT_GOODS
  is 'Словарь товаров';
comment on column DEV.DICT_GOODS.ID_GOODS
  is 'ID товара';
comment on column DEV.DICT_GOODS.AMOUNT_GOODS
  is 'Кол-во товаров на складе';
comment on column DEV.DICT_GOODS.PRICE
  is 'Цена товара';
alter table DEV.DICT_GOODS
  add constraint PK_DICT_GOODS primary key (ID_GOODS)
  using index 
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEV.DICT_GOODS
  add constraint CH_AMOUNT_GOODS
  check (AMOUNT_GOODS >= 0);
alter table DEV.DICT_GOODS
  add constraint CH_ID_GOODS
  check (ID_GOODS >= 1);
alter table DEV.DICT_GOODS
  add constraint CH_PRICE
  check (PRICE > 0);
alter table DEV.DICT_GOODS
  add constraint NN_NAME_GOODS
  check ("NAME_GOODS" IS NOT NULL);
alter table DEV.DICT_GOODS
  add constraint NN_PRICE
  check ("PRICE" IS NOT NULL);

prompt
prompt Creating table DICT_USERS
prompt =========================
prompt
create table DEV.DICT_USERS
(
  ID_USER     NUMBER(6) not null,
  FIRST_NAME  VARCHAR2(30),
  SECOND_NAME VARCHAR2(30),
  LAST_NAME   VARCHAR2(30),
  PASSWORD    VARCHAR2(30),
  NAME_USER   VARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DEV.DICT_USERS
  is 'Словарь пользователеей';
comment on column DEV.DICT_USERS.FIRST_NAME
  is 'ИМЯ';
comment on column DEV.DICT_USERS.SECOND_NAME
  is 'ОТЧЕСТВО';
comment on column DEV.DICT_USERS.LAST_NAME
  is 'ФАМИЛИЯ';
alter table DEV.DICT_USERS
  add constraint PK_DICT_USERS primary key (ID_USER)
  using index 
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEV.DICT_USERS
  add constraint UN_DICT_USERS_1 unique (NAME_USER)
  using index 
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEV.DICT_USERS
  add constraint CH_ID_USER
  check (ID_USER >= 1);
alter table DEV.DICT_USERS
  add constraint NN_FIRST_NAME
  check ("FIRST_NAME" IS NOT NULL);
alter table DEV.DICT_USERS
  add constraint NN_LAST_NAME
  check ("LAST_NAME" IS NOT NULL);
alter table DEV.DICT_USERS
  add constraint NN_NAME_USER
  check ("NAME_USER" IS NOT NULL);
alter table DEV.DICT_USERS
  add constraint NN_PASSWORD
  check ("PASSWORD" IS NOT NULL);
alter table DEV.DICT_USERS
  add constraint NN_SECOND_NAME
  check ("SECOND_NAME" IS NOT NULL);

prompt
prompt Creating table PURCHASES
prompt ========================
prompt
create table DEV.PURCHASES
(
  ID_PURCHASE   NUMBER(6) not null,
  ID_USER       NUMBER(6),
  ID_GOODS      NUMBER(6),
  AMOUNT_GOODS  NUMBER(4),
  DATE_PURCHASE DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table DEV.PURCHASES
  is 'ПОКУПКИ';
comment on column DEV.PURCHASES.ID_PURCHASE
  is 'ID покупки';
comment on column DEV.PURCHASES.ID_GOODS
  is 'ID товара';
comment on column DEV.PURCHASES.AMOUNT_GOODS
  is 'Кол-во купленного товара';
comment on column DEV.PURCHASES.DATE_PURCHASE
  is 'Дата покупки';
alter table DEV.PURCHASES
  add constraint PK_PURCHASES primary key (ID_PURCHASE)
  using index 
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEV.PURCHASES
  add constraint FK_DICT_GOODS foreign key (ID_GOODS)
  references DEV.DICT_GOODS (ID_GOODS);
alter table DEV.PURCHASES
  add constraint FK_DICT_USERS foreign key (ID_USER)
  references DEV.DICT_USERS (ID_USER);
alter table DEV.PURCHASES
  add constraint CH_AMOUNT_GOODS_1
  check (AMOUNT_GOODS >= 1);
alter table DEV.PURCHASES
  add constraint CH_ID_PURCHASE
  check (ID_PURCHASE >= 1);
alter table DEV.PURCHASES
  add constraint NN_AMOUNT_GOODS
  check ("AMOUNT_GOODS" IS NOT NULL);
alter table DEV.PURCHASES
  add constraint NN_DATE_PURCHASE
  check ("DATE_PURCHASE" IS NOT NULL);
alter table DEV.PURCHASES
  add constraint NN_ID_GOODS
  check ("ID_GOODS" IS NOT NULL);
alter table DEV.PURCHASES
  add constraint NN_ID_USER
  check ("ID_USER" IS NOT NULL);
create index DEV.INDEX_ON_FOREIGN_KEY_0 on DEV.PURCHASES (ID_GOODS)
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index DEV.INDEX_ON_FOREIGN_KEY_4 on DEV.PURCHASES (ID_USER)
  tablespace INDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQ_ID
prompt ========================
prompt
create sequence DEV.SEQ_ID
minvalue 0
maxvalue 999999
start with 89
increment by 1
nocache
cycle
order;


spool off
