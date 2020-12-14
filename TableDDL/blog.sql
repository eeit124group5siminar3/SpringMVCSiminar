CREATE TABLE BLOG 
(
  MEMBER_NO VARCHAR2(20 BYTE) 
, VIEWS NUMBER 
, FILENAME VARCHAR2(60 BYTE) 
, DATA BLOB 
, BLOG_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1 NOCACHE ORDER NOT NULL 
, POST_DATE VARCHAR2(20 BYTE) NOT NULL 
, TITLE VARCHAR2(30 BYTE) 
, NAME VARCHAR2(20 BYTE) 
, STATUS NUMBER(*, 0) NOT NULL 
, INTRODUCTION VARCHAR2(800 BYTE) 
, UPDATE_DATE VARCHAR2(20 BYTE) 
, CONTENT CLOB 
, CONSTRAINT BLOG_PK PRIMARY KEY 
  (
    BLOG_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX BLOG_PK ON BLOG (BLOG_ID ASC) 
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
      NOPARALLEL 
  )
  ENABLE 
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
LOB (DATA) STORE AS SYS_LOB0000082016C00004$$ 
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
LOB (CONTENT) STORE AS SYS_LOB0000082016C00012$$ 
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
