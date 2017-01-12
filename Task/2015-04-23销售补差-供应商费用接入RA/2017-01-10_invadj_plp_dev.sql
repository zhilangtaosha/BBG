--1.table script
/*
BBG_RA_INVADJ_SC_LC_DY_TMP
BBG_RA_INVADJ_SC_LC_DY_A
BBG_RA_INVADJ_CL_LC_DY_A
BBG_RA_INVADJ_DP_LC_DY_A
BBG_RA_INVADJ_IT_DY_A
BBG_RA_INVADJ_SC_LC_MN_A
BBG_RA_INVADJ_CL_LC_MN_A
BBG_RA_INVADJ_DP_LC_MN_A
BBG_RA_INVADJ_IT_MN_A
*/
--1.1.BBG_RA_INVADJ_SC_LC_DY_TMP
CREATE TABLE RABATCHER.BBG_RA_INVADJ_SC_LC_DY_TMP
(
  DAY_DT                 DATE,
  LOCATION               VARCHAR2(250 BYTE),
  REASON                 VARCHAR2(250 BYTE),
  DT_WID                 NUMBER(15),
  ORG_SCD1_WID           NUMBER(15),
  ORG_WID                NUMBER(15),
  ADJUSTMENT_REASON_WID  NUMBER(10),
  ADJ_QTY                NUMBER(20,4),
  ADJ_WEIGHT             NUMBER(20,4),
  ADJ_WEIGHT_UOM         VARCHAR2(100 BYTE),
  ADJ_COST               NUMBER(20,10),
  ORG_LC_WID             NUMBER(10),
  ORG_DS_WID             NUMBER(10),
  ORG_RG_WID             NUMBER(10),
  ORG_AR_WID             NUMBER(10),
  ORG_CH_WID             NUMBER(10),
  ORG_DS_NUM             VARCHAR2(30 BYTE),
  ORG_RG_NUM             VARCHAR2(30 BYTE),
  ORG_AR_NUM             VARCHAR2(30 BYTE),
  ORG_CH_NUM             VARCHAR2(30 BYTE),
  PROD_SC_WID            NUMBER(10),
  PROD_CL_WID            NUMBER(10),
  PROD_DP_WID            NUMBER(10),
  PROD_GP_WID            NUMBER(10),
  PROD_DV_WID            NUMBER(10),
  PROD_SC_NUM            VARCHAR2(80 BYTE),
  PROD_CL_NUM            VARCHAR2(80 BYTE),
  PROD_DP_NUM            VARCHAR2(80 BYTE),
  PROD_GP_NUM            VARCHAR2(80 BYTE),
  PROD_DV_NUM            VARCHAR2(80 BYTE),
  WK_WID                 NUMBER(15)             NOT NULL,
  WK_NUM                 VARCHAR2(6 CHAR)       NOT NULL,
  PR_WID                 NUMBER(15)             NOT NULL,
  PR_NUM                 VARCHAR2(6 CHAR)       NOT NULL,
  QT_WID                 NUMBER(15)             NOT NULL,
  QT_NUM                 VARCHAR2(6 CHAR)       NOT NULL,
  CHANGED_BY_ID          VARCHAR2(80 BYTE),
  CHANGED_ON_DT          DATE,
  CREATED_BY_ID          VARCHAR2(80 BYTE),
  CREATED_ON_DT          DATE,
  DATASOURCE_NUM_ID      NUMBER(10),
  DELETE_FLG             CHAR(1 BYTE),
  ETL_THREAD_VAL         NUMBER(4),
  INTEGRATION_ID         VARCHAR2(80 BYTE),
  AUX1_CHANGED_ON_DT     DATE,
  AUX2_CHANGED_ON_DT     DATE,
  AUX3_CHANGED_ON_DT     DATE,
  AUX4_CHANGED_ON_DT     DATE,
  DOC_CURR_CODE          VARCHAR2(30 BYTE),
  GLOBAL1_EXCHANGE_RATE  NUMBER(22),
  GLOBAL2_EXCHANGE_RATE  NUMBER(22),
  GLOBAL3_EXCHANGE_RATE  NUMBER(22),
  LOC_CURR_CODE          VARCHAR2(30 BYTE),
  LOC_EXCHANGE_RATE      NUMBER(22),
  TENANT_ID              VARCHAR2(80 BYTE),
  X_CUSTOM               VARCHAR2(10 BYTE),
  BBG_REFERENCE_DO1      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO2      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO3      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO4      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO5      VARCHAR2(250 BYTE),
  BBG_REFERENCE_FO1      NUMBER(20,4),
  BBG_REFERENCE_FO2      NUMBER(20,4),
  BBG_REFERENCE_FO3      NUMBER(20,4),
  BBG_REFERENCE_FO4      NUMBER(20,4),
  BBG_REFERENCE_FO5      NUMBER(20,4),
  BBG_REFERENCE_FO6      NUMBER(20,4),
  BBG_REFERENCE_FO7      NUMBER(20,4),
  BBG_REFERENCE_FO8      NUMBER(20,4),
  BBG_REFERENCE_FO9      NUMBER(20,4),
  BBG_REFERENCE_FO10     NUMBER(20,4)
)
TABLESPACE RETAIL_DATA
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

--1.2.BBG_RA_INVADJ_SC_LC_DY_A
-- Create sequence 
create sequence BBG_RA_INVADJ_SC_LC_DY_A_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

CREATE TABLE RADM.BBG_RA_INVADJ_SC_LC_DY_A
(
  ROW_WID                NUMBER(15),
	PROD_DH_WID            NUMBER(10),
  DT_WID                 NUMBER(15),
  ORG_SCD1_WID           NUMBER(15),
  ORG_WID                NUMBER(15),
  ORG_DH_WID             NUMBER(10),
  ADJUSTMENT_REASON_WID  NUMBER(10),
  ADJ_QTY                NUMBER(20,4),
  ADJ_WEIGHT             NUMBER(20,4),
  ADJ_WEIGHT_UOM         VARCHAR2(100 BYTE),
  ADJ_COST               NUMBER(20,10),
  CHANGED_BY_ID          VARCHAR2(80 BYTE),
  CHANGED_ON_DT          DATE,
  CREATED_BY_ID          VARCHAR2(80 BYTE),
  CREATED_ON_DT          DATE,
  DATASOURCE_NUM_ID      NUMBER(10),
  DELETE_FLG             CHAR(1 BYTE),
  ETL_THREAD_VAL         NUMBER(4),
  INTEGRATION_ID         VARCHAR2(80 BYTE),
  AUX1_CHANGED_ON_DT     DATE,
  AUX2_CHANGED_ON_DT     DATE,
  AUX3_CHANGED_ON_DT     DATE,
  AUX4_CHANGED_ON_DT     DATE,
  DOC_CURR_CODE          VARCHAR2(30 BYTE),
  GLOBAL1_EXCHANGE_RATE  NUMBER(22),
  GLOBAL2_EXCHANGE_RATE  NUMBER(22),
  GLOBAL3_EXCHANGE_RATE  NUMBER(22),
  LOC_CURR_CODE          VARCHAR2(30 BYTE),
  LOC_EXCHANGE_RATE      NUMBER(22),
  TENANT_ID              VARCHAR2(80 BYTE),
  X_CUSTOM               VARCHAR2(10 BYTE),
  BBG_REFERENCE_DO1      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO2      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO3      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO4      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO5      VARCHAR2(250 BYTE),
  BBG_REFERENCE_FO1      NUMBER(20,4),
  BBG_REFERENCE_FO2      NUMBER(20,4),
  BBG_REFERENCE_FO3      NUMBER(20,4),
  BBG_REFERENCE_FO4      NUMBER(20,4),
  BBG_REFERENCE_FO5      NUMBER(20,4),
  BBG_REFERENCE_FO6      NUMBER(20,4),
  BBG_REFERENCE_FO7      NUMBER(20,4),
  BBG_REFERENCE_FO8      NUMBER(20,4),
  BBG_REFERENCE_FO9      NUMBER(20,4),
  BBG_REFERENCE_FO10     NUMBER(20,4),
  W_INSERT_DT            DATE,
  W_UPDATE_DT            DATE
)
TABLESPACE RETAIL_DATA
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX RADM.PK_BBG_RA_INVADJ_SC_LC_DY_A ON RADM.BBG_RA_INVADJ_SC_LC_DY_A
(DT_WID, PROD_DH_WID, ORG_WID, ADJUSTMENT_REASON_WID)
LOGGING
TABLESPACE RETAIL_DATA
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


ALTER TABLE RADM.BBG_RA_INVADJ_SC_LC_DY_A ADD (
  CONSTRAINT PK_BBG_RA_INVADJ_SC_LC_DY_A
  PRIMARY KEY
  (DT_WID, PROD_DH_WID, ORG_WID, ADJUSTMENT_REASON_WID)
  USING INDEX RADM.PK_BBG_RA_INVADJ_SC_LC_DY_A
  ENABLE VALIDATE);
	
--1.3.BBG_RA_INVADJ_CL_LC_DY_A
-- Create sequence 
create sequence BBG_RA_INVADJ_CL_LC_DY_A_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

CREATE TABLE RADM.BBG_RA_INVADJ_CL_LC_DY_A
(
  ROW_WID                NUMBER(15),
	PROD_DH_WID            NUMBER(10),
  DT_WID                 NUMBER(15),
  ORG_SCD1_WID           NUMBER(15),
  ORG_WID                NUMBER(15),
  ORG_DH_WID             NUMBER(10),
  ADJUSTMENT_REASON_WID  NUMBER(10),
  ADJ_QTY                NUMBER(20,4),
  ADJ_WEIGHT             NUMBER(20,4),
  ADJ_WEIGHT_UOM         VARCHAR2(100 BYTE),
  ADJ_COST               NUMBER(20,10),
  CHANGED_BY_ID          VARCHAR2(80 BYTE),
  CHANGED_ON_DT          DATE,
  CREATED_BY_ID          VARCHAR2(80 BYTE),
  CREATED_ON_DT          DATE,
  DATASOURCE_NUM_ID      NUMBER(10),
  DELETE_FLG             CHAR(1 BYTE),
  ETL_THREAD_VAL         NUMBER(4),
  INTEGRATION_ID         VARCHAR2(80 BYTE),
  AUX1_CHANGED_ON_DT     DATE,
  AUX2_CHANGED_ON_DT     DATE,
  AUX3_CHANGED_ON_DT     DATE,
  AUX4_CHANGED_ON_DT     DATE,
  DOC_CURR_CODE          VARCHAR2(30 BYTE),
  GLOBAL1_EXCHANGE_RATE  NUMBER(22),
  GLOBAL2_EXCHANGE_RATE  NUMBER(22),
  GLOBAL3_EXCHANGE_RATE  NUMBER(22),
  LOC_CURR_CODE          VARCHAR2(30 BYTE),
  LOC_EXCHANGE_RATE      NUMBER(22),
  TENANT_ID              VARCHAR2(80 BYTE),
  X_CUSTOM               VARCHAR2(10 BYTE),
  BBG_REFERENCE_DO1      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO2      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO3      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO4      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO5      VARCHAR2(250 BYTE),
  BBG_REFERENCE_FO1      NUMBER(20,4),
  BBG_REFERENCE_FO2      NUMBER(20,4),
  BBG_REFERENCE_FO3      NUMBER(20,4),
  BBG_REFERENCE_FO4      NUMBER(20,4),
  BBG_REFERENCE_FO5      NUMBER(20,4),
  BBG_REFERENCE_FO6      NUMBER(20,4),
  BBG_REFERENCE_FO7      NUMBER(20,4),
  BBG_REFERENCE_FO8      NUMBER(20,4),
  BBG_REFERENCE_FO9      NUMBER(20,4),
  BBG_REFERENCE_FO10     NUMBER(20,4),
  W_INSERT_DT            DATE,
  W_UPDATE_DT            DATE
)
TABLESPACE RETAIL_DATA
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX RADM.PK_BBG_RA_INVADJ_CL_LC_DY_A ON RADM.BBG_RA_INVADJ_CL_LC_DY_A
(DT_WID, PROD_DH_WID, ORG_WID, ADJUSTMENT_REASON_WID)
LOGGING
TABLESPACE RETAIL_DATA
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


ALTER TABLE RADM.BBG_RA_INVADJ_CL_LC_DY_A ADD (
  CONSTRAINT PK_BBG_RA_INVADJ_CL_LC_DY_A
  PRIMARY KEY
  (DT_WID, PROD_DH_WID, ORG_WID, ADJUSTMENT_REASON_WID)
  USING INDEX RADM.PK_BBG_RA_INVADJ_CL_LC_DY_A
  ENABLE VALIDATE);

--1.4.BBG_RA_INVADJ_DP_LC_DY_A
-- Create sequence 
create sequence BBG_RA_INVADJ_DP_LC_DY_A_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

CREATE TABLE RADM.BBG_RA_INVADJ_DP_LC_DY_A
(
  ROW_WID                NUMBER(15),
	PROD_DH_WID            NUMBER(10),
  DT_WID                 NUMBER(15),
  ORG_SCD1_WID           NUMBER(15),
  ORG_WID                NUMBER(15),
  ORG_DH_WID             NUMBER(10),
  ADJUSTMENT_REASON_WID  NUMBER(10),
  ADJ_QTY                NUMBER(20,4),
  ADJ_WEIGHT             NUMBER(20,4),
  ADJ_WEIGHT_UOM         VARCHAR2(100 BYTE),
  ADJ_COST               NUMBER(20,10),
  CHANGED_BY_ID          VARCHAR2(80 BYTE),
  CHANGED_ON_DT          DATE,
  CREATED_BY_ID          VARCHAR2(80 BYTE),
  CREATED_ON_DT          DATE,
  DATASOURCE_NUM_ID      NUMBER(10),
  DELETE_FLG             CHAR(1 BYTE),
  ETL_THREAD_VAL         NUMBER(4),
  INTEGRATION_ID         VARCHAR2(80 BYTE),
  AUX1_CHANGED_ON_DT     DATE,
  AUX2_CHANGED_ON_DT     DATE,
  AUX3_CHANGED_ON_DT     DATE,
  AUX4_CHANGED_ON_DT     DATE,
  DOC_CURR_CODE          VARCHAR2(30 BYTE),
  GLOBAL1_EXCHANGE_RATE  NUMBER(22),
  GLOBAL2_EXCHANGE_RATE  NUMBER(22),
  GLOBAL3_EXCHANGE_RATE  NUMBER(22),
  LOC_CURR_CODE          VARCHAR2(30 BYTE),
  LOC_EXCHANGE_RATE      NUMBER(22),
  TENANT_ID              VARCHAR2(80 BYTE),
  X_CUSTOM               VARCHAR2(10 BYTE),
  BBG_REFERENCE_DO1      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO2      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO3      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO4      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO5      VARCHAR2(250 BYTE),
  BBG_REFERENCE_FO1      NUMBER(20,4),
  BBG_REFERENCE_FO2      NUMBER(20,4),
  BBG_REFERENCE_FO3      NUMBER(20,4),
  BBG_REFERENCE_FO4      NUMBER(20,4),
  BBG_REFERENCE_FO5      NUMBER(20,4),
  BBG_REFERENCE_FO6      NUMBER(20,4),
  BBG_REFERENCE_FO7      NUMBER(20,4),
  BBG_REFERENCE_FO8      NUMBER(20,4),
  BBG_REFERENCE_FO9      NUMBER(20,4),
  BBG_REFERENCE_FO10     NUMBER(20,4),
  W_INSERT_DT            DATE,
  W_UPDATE_DT            DATE
)
TABLESPACE RETAIL_DATA
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX RADM.PK_BBG_RA_INVADJ_DP_LC_DY_A ON RADM.BBG_RA_INVADJ_DP_LC_DY_A
(DT_WID, PROD_DH_WID, ORG_WID, ADJUSTMENT_REASON_WID)
LOGGING
TABLESPACE RETAIL_DATA
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


ALTER TABLE RADM.BBG_RA_INVADJ_DP_LC_DY_A ADD (
  CONSTRAINT PK_BBG_RA_INVADJ_DP_LC_DY_A
  PRIMARY KEY
  (DT_WID, PROD_DH_WID, ORG_WID, ADJUSTMENT_REASON_WID)
  USING INDEX RADM.PK_BBG_RA_INVADJ_DP_LC_DY_A
  ENABLE VALIDATE);
	
--1.5.BBG_RA_INVADJ_IT_DY_A
CREATE TABLE RADM.BBG_RA_INVADJ_IT_DY_A
(
  ROW_WID                NUMBER(15),
  DT_WID                 NUMBER(15),
  PROD_WID               NUMBER(15),
  BBG_ITEM_LOC_WID       NUMBER(15),
  ADJUSTMENT_REASON_WID  NUMBER(10),
  ADJ_QTY                NUMBER(20,4),
  ADJ_WEIGHT             NUMBER(20,4),
  ADJ_WEIGHT_UOM         VARCHAR2(100 BYTE),
  ADJ_COST               NUMBER(20,10),
  CHANGED_BY_ID          VARCHAR2(80 BYTE),
  CHANGED_ON_DT          DATE,
  CREATED_BY_ID          VARCHAR2(80 BYTE),
  CREATED_ON_DT          DATE,
  DATASOURCE_NUM_ID      NUMBER(10),
  DELETE_FLG             CHAR(1 BYTE),
  ETL_THREAD_VAL         NUMBER(4),
  INTEGRATION_ID         VARCHAR2(80 BYTE),
  AUX1_CHANGED_ON_DT     DATE,
  AUX2_CHANGED_ON_DT     DATE,
  AUX3_CHANGED_ON_DT     DATE,
  AUX4_CHANGED_ON_DT     DATE,
  DOC_CURR_CODE          VARCHAR2(30 BYTE),
  GLOBAL1_EXCHANGE_RATE  NUMBER(22),
  GLOBAL2_EXCHANGE_RATE  NUMBER(22),
  GLOBAL3_EXCHANGE_RATE  NUMBER(22),
  LOC_CURR_CODE          VARCHAR2(30 BYTE),
  LOC_EXCHANGE_RATE      NUMBER(22),
  TENANT_ID              VARCHAR2(80 BYTE),
  X_CUSTOM               VARCHAR2(10 BYTE),
	W_INSERT_DT            DATE,
	W_UPDATE_DT            DATE,
  BBG_REFERENCE_DO1      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO2      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO3      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO4      VARCHAR2(250 BYTE),
  BBG_REFERENCE_DO5      VARCHAR2(250 BYTE),
  BBG_REFERENCE_FO1      NUMBER(20,4),
  BBG_REFERENCE_FO2      NUMBER(20,4),
  BBG_REFERENCE_FO3      NUMBER(20,4),
  BBG_REFERENCE_FO4      NUMBER(20,4),
  BBG_REFERENCE_FO5      NUMBER(20,4),
  BBG_REFERENCE_FO6      NUMBER(20,4),
  BBG_REFERENCE_FO7      NUMBER(20,4),
  BBG_REFERENCE_FO8      NUMBER(20,4),
  BBG_REFERENCE_FO9      NUMBER(20,4),
  BBG_REFERENCE_FO10     NUMBER(20,4)
)
TABLESPACE RETAIL_DATA
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;


CREATE UNIQUE INDEX RADM.PK_BBG_RA_INVADJ_IT_DY_A ON RADM.BBG_RA_INVADJ_IT_DY_A
(DT_WID, PROD_WID, ADJUSTMENT_REASON_WID)
LOGGING
TABLESPACE RETAIL_DATA
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


ALTER TABLE RADM.BBG_RA_INVADJ_IT_DY_A ADD (
  CONSTRAINT PK_BBG_RA_INVADJ_IT_DY_A
  PRIMARY KEY
  (DT_WID, PROD_WID, ADJUSTMENT_REASON_WID)
  USING INDEX RADM.PK_BBG_RA_INVADJ_IT_DY_A
  ENABLE VALIDATE);
	
--1.6.

--1.7.

--1.8.

--1.9.



--2.

--3.

--4.

--5.

--6.

--TMP
SELECT * FROM RADM.BBG_RA_INVADJ_IT_LC_DY_F t where t.dt_wid=120170110000;
SELECT * FROM RABATCHER.BBG_RA_INVADJ_IT_LC_DY_TMP;
SELECT * FROM RABATCHER.BBG_RA_INVADJ_SC_LC_DY_TMP;
SELECT * FROM RADM.BBG_RA_INVADJ_SC_LC_DY_A;
SELECT * FROM RADM.BBG_RA_INVADJ_CL_LC_DY_A;
SELECT * FROM RADM.BBG_RA_INVADJ_DP_LC_DY_A;
SELECT * FROM RADM.W_INT_ORG_D T;
SELECT * FROM RADM.W_INT_ORG_DH;
SELECT * FROM RMS.BBG_RA_INVADJ_IT_LC_DY_FV;

TRUNCATE TABLE RABATCHER.BBG_RA_INVADJ_SC_LC_DY_TMP;
TRUNCATE TABLE RADM.BBG_RA_INVADJ_SC_LC_DY_A;
TRUNCATE TABLE RADM.BBG_RA_INVADJ_CL_LC_DY_A;
TRUNCATE TABLE RADM.BBG_RA_INVADJ_DP_LC_DY_A;
