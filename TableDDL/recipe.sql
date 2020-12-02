--------------------------------------------------------
--  已建立檔案 - 星期二-十二月-01-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table RECIPE
--------------------------------------------------------

  CREATE TABLE "SEMINAR"."RECIPE" 
   (	"MEMBER_NO" NUMBER, 
	"RECIPE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"RECIPE_NAME" VARCHAR2(20 BYTE), 
	"CATEGORY" VARCHAR2(20 BYTE), 
	"RECIPE_DESC" VARCHAR2(500 BYTE), 
	"METHOD" VARCHAR2(600 BYTE), 
	"INGREDIENTS_A" VARCHAR2(10 BYTE), 
	"INGREDIENTS_B" VARCHAR2(10 BYTE), 
	"INGREDIENTS_C" VARCHAR2(10 BYTE), 
	"INGREDIENTS_D" VARCHAR2(10 BYTE), 
	"FILENAME" VARCHAR2(30 BYTE), 
	"DATA" BLOB, 
	"UPLOAD_DATE" NVARCHAR2(20), 
	"GRAM_A" VARCHAR2(10 BYTE), 
	"GRAM_B" VARCHAR2(10 BYTE), 
	"VIEWS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"   NO INMEMORY 
 LOB ("DATA") STORE AS SECUREFILE "SYS_LOB0000079153C00010$$"(
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into SEMINAR.RECIPE
SET DEFINE OFF;
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,14,'水餃','雞肉','好吃','method1111111111','豬肉餡','1',null,null,null,'2020-11-11',null,null,1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,15,'咖哩飯','雞肉','讚','method2','咖哩塊','1',null,null,null,'2020-11-11',null,null,4);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,16,'陽春麵a','雞肉','棒','method3','A菜','1',null,null,null,'2020-11-11',null,null,1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,17,'雞腿飯','雞肉','多汁','method4','雞腿','1',null,null,null,'2020-11-11',null,null,7);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,136,'咖哩飯aaaaa','雞肉','1','1','1','1',null,null,'b.jpg','2020-11-16',null,'1',6);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,19,'壽司','雞肉','軟Q','method666666','米','1',null,null,null,'2020-11-11',null,null,1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,20,'牛肉麵','牛肉','很好吃','method7','麵','1',null,null,null,'2020-11-11','1','1',1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,21,'拉麵','豬肉','非常好吃','method8','麵','1',null,null,null,'2020-11-11',null,null,1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,32,'排骨飯a','豬肉',null,null,'米','1',null,null,null,'2020-11-11',null,null,1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,135,'排骨飯b','豬肉','b','b','b','b',null,null,'b.jpg','2020-11-16','b','b',1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,48,'排骨飯d','雞肉','5555555','5555555','555','1',null,null,null,'2020-11-11',null,null,1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,22,'水餃bbbbb','雞肉',null,null,null,'1',null,null,null,'2020-11-11',null,null,3);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (41,312,'11111111','蔬食',null,null,null,null,null,null,'h.jpg','2020-12-1',null,null,1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (1,26,'水餃c','雞肉',null,null,null,'1',null,null,null,'2020-11-11',null,null,1);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME,UPLOAD_DATE,GRAM_A,GRAM_B,VIEWS) values (41,310,'2222222','蔬食',null,null,null,null,null,null,null,'2020-11-26',null,null,1);
--------------------------------------------------------
--  DDL for Index RECIPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEMINAR"."RECIPE_PK" ON "SEMINAR"."RECIPE" ("RECIPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table RECIPE
--------------------------------------------------------

  ALTER TABLE "SEMINAR"."RECIPE" MODIFY ("RECIPE_ID" NOT NULL ENABLE);
  ALTER TABLE "SEMINAR"."RECIPE" ADD CONSTRAINT "RECIPE_PK" PRIMARY KEY ("RECIPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
