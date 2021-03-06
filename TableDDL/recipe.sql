CREATE TABLE RECIPE 
(
  MEMBER_NO NUMBER 
, RECIPE_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1 NOCACHE ORDER NOT NULL 
, RECIPE_NAME VARCHAR2(100 BYTE) 
, CATEGORY VARCHAR2(20 BYTE) 
, RECIPE_DESC VARCHAR2(500 BYTE) NOT NULL 
, INGREDIENTS_A VARCHAR2(100 BYTE) 
, INGREDIENTS_B VARCHAR2(100 BYTE) 
, INGREDIENTS_C VARCHAR2(100 BYTE) 
, INGREDIENTS_D VARCHAR2(100 BYTE) 
, FILENAME_A VARCHAR2(100 BYTE) 
, DATA_A BLOB 
, UPLOAD_DATE VARCHAR2(20 BYTE) 
, GRAM_A VARCHAR2(100 BYTE) 
, GRAM_B VARCHAR2(100 BYTE) 
, VIEWS NUMBER 
, UPDATE_DATE VARCHAR2(100 BYTE) 
, GRAM_C VARCHAR2(100 BYTE) 
, GRAM_D VARCHAR2(100 BYTE) 
, FILENAME_B VARCHAR2(100 BYTE) 
, FILENAME_C VARCHAR2(100 BYTE) 
, FILENAME_D VARCHAR2(100 BYTE) 
, DATA_B BLOB 
, DATA_C BLOB 
, DATA_D BLOB 
, DATA_E BLOB 
, FILENAME_E VARCHAR2(100 BYTE) 
, METHOD_A VARCHAR2(1000 BYTE) 
, METHOD_B VARCHAR2(1000 BYTE) 
, METHOD_C VARCHAR2(1000 BYTE) 
, METHOD_D VARCHAR2(1000 BYTE) 
, METHOD_E VARCHAR2(1000 BYTE) 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL 
LOB (DATA_A) STORE AS SYS_LOB0000079153C00010$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  NOCACHE 
  LOGGING 
  TABLESPACE USERS 
  STORAGE 
  ( 
    INITIAL 106496 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS UNLIMITED 
    BUFFER_POOL DEFAULT 
  )  
) 	
LOB (DATA_B) STORE AS SYS_LOB0000075301C00022$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  NOCACHE 
  LOGGING 
  TABLESPACE USERS 
  STORAGE 
  ( 
    INITIAL 106496 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS UNLIMITED 
    BUFFER_POOL DEFAULT 
  )  
) 	
LOB (DATA_C) STORE AS SYS_LOB0000075301C00023$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  NOCACHE 
  LOGGING 
  TABLESPACE USERS 
  STORAGE 
  ( 
    INITIAL 106496 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS UNLIMITED 
    BUFFER_POOL DEFAULT 
  )  
) 	
LOB (DATA_D) STORE AS SYS_LOB0000075301C00024$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  NOCACHE 
  LOGGING 
  TABLESPACE USERS 
  STORAGE 
  ( 
    INITIAL 106496 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS UNLIMITED 
    BUFFER_POOL DEFAULT 
  )  
) 	
LOB (DATA_E) STORE AS SYS_LOB0000075301C00025$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  NOCACHE 
  LOGGING 
  TABLESPACE USERS 
  STORAGE 
  ( 
    INITIAL 106496 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS UNLIMITED 
    BUFFER_POOL DEFAULT 
  )  
);

CREATE UNIQUE INDEX RECIPE_PK ON RECIPE (RECIPE_ID ASC) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

ALTER TABLE RECIPE
ADD CONSTRAINT RECIPE_PK PRIMARY KEY 
(
  RECIPE_ID 
)
USING INDEX SEMINAR.RECIPE_PK
ENABLE;
