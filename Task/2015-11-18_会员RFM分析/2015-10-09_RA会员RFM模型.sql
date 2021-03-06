--消费(RECENCY)、消费频率(FREQUENCY)、消费金额(MONETARY)
--1.CREATE TABLE 
--1.1.BBG_RA_RFM_VIP_F
-- CREATE TABLE
CREATE TABLE BBG_RA_RFM_VIP_F
(
  ROW_WID            NUMBER(15) NOT NULL,
  HYK_NO             VARCHAR2(30) NOT NULL,
  SLS_TRX_ID         VARCHAR2(30) NOT NULL,
  DT_WID             NUMBER(15) NOT NULL,
	MIN_WID             NUMBER(10),
  ORG_WID            NUMBER(10) NOT NULL,
  ORG_DH_WID         NUMBER(10) NOT NULL,
  ORG_SCD1_WID       NUMBER(10) NOT NULL,
  DATASOURCE_NUM_ID  NUMBER(10) NOT NULL,
  ETL_THREAD_VAL     NUMBER(10) NOT NULL,
  INTEGRATION_ID     VARCHAR2(80) NOT NULL,
  W_INSERT_DT        DATE,
  W_UPDATE_DT        DATE,
  SLS_QTY            NUMBER(18,4),
  SLS_AMT_LCL        NUMBER(18,4),
  SLS_PROFIT_AMT_LCL NUMBER(18,4),
  SLS_TAX_AMT_LCL    NUMBER(18,4),
  RET_QTY            NUMBER(18,4),
  RET_AMT_LCL        NUMBER(18,4),
  RET_PROFIT_AMT_LCL NUMBER(18,4),
  RET_TAX_AMT_LCL    NUMBER(18,4),
  BBG_REFERENCE_DO1  VARCHAR2(250),
  BBG_REFERENCE_DO2  VARCHAR2(250),
  BBG_REFERENCE_DO3  VARCHAR2(250),
  BBG_REFERENCE_DO4  VARCHAR2(250),
  BBG_REFERENCE_DO5  VARCHAR2(250),
  BBG_REFERENCE_FO1  NUMBER(20,4),
  BBG_REFERENCE_FO2  NUMBER(20,4),
  BBG_REFERENCE_FO3  NUMBER(20,4),
  BBG_REFERENCE_FO4  NUMBER(20,4),
  BBG_REFERENCE_FO5  NUMBER(20,4),
  BBG_REFERENCE_FO6  NUMBER(20,4),
  BBG_REFERENCE_FO7  NUMBER(20,4),
  BBG_REFERENCE_FO8  NUMBER(20,4),
  BBG_REFERENCE_FO9  NUMBER(20,4),
  BBG_REFERENCE_FO10 NUMBER(20,4)
)
TABLESPACE RETAIL_DATA
  PCTFREE 10
  INITRANS 1
  MAXTRANS 255
  STORAGE
  (
    INITIAL 64K
    NEXT 8K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  );
-- ADD COMMENTS TO THE COLUMNS 
COMMENT ON COLUMN BBG_RA_RFM_VIP_F.INTEGRATION_ID
  IS 'hyk_no~sls_trx_id~dt_wid~org_num';
-- CREATE/RECREATE INDEXES 
CREATE UNIQUE INDEX PK_BBG_RA_RFM_VIP_F ON BBG_RA_RFM_VIP_F (DT_WID, ORG_WID, HYK_NO, SLS_TRX_ID)
  TABLESPACE RETAIL_INDEX
  PCTFREE 10
  INITRANS 2
  MAXTRANS 255
  STORAGE
  (
    INITIAL 64K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  );

--1.2.BBG_RA_RFM_VIP_MN_A
-- CREATE TABLE
-- Create table
create table BBG_RA_RFM_VIP_MN_A
(
  row_wid                      NUMBER(15) not null,
  hyk_no                       VARCHAR2(30) not null,
  mn_wid                       NUMBER(15) not null,
  datasource_num_id            NUMBER(10) not null,
  integration_id               VARCHAR2(80) not null,
  w_insert_dt                  DATE,
  w_update_dt                  DATE,
  vip_recency_date             DATE,
  vip_month_freq               NUMBER(10),
  vip_year_freq                NUMBER(10),
  vip_month_sls_qty            NUMBER(18,4),
  vip_month_sls_amt_lcl        NUMBER(18,4),
  vip_month_sls_profit_amt_lcl NUMBER(18,4),
  vip_month_sls_tax_amt_lcl    NUMBER(18,4),
  vip_month_ret_qty            NUMBER(18,4),
  vip_month_ret_amt_lcl        NUMBER(18,4),
  vip_month_ret_profit_amt_lcl NUMBER(18,4),
  vip_month_ret_tax_amt_lcl    NUMBER(18,4),
  vip_year_sls_qty             NUMBER(18,4),
  vip_year_sls_amt_lcl         NUMBER(18,4),
  vip_year_sls_profit_amt_lcl  NUMBER(18,4),
  vip_year_sls_tax_amt_lcl     NUMBER(18,4),
  vip_year_ret_qty             NUMBER(18,4),
  vip_year_ret_amt_lcl         NUMBER(18,4),
  vip_year_ret_profit_amt_lcl  NUMBER(18,4),
  vip_year_ret_tax_amt_lcl     NUMBER(18,4),
  bbg_reference_do1            VARCHAR2(250),
  bbg_reference_do2            VARCHAR2(250),
  bbg_reference_do3            VARCHAR2(250),
  bbg_reference_do4            VARCHAR2(250),
  bbg_reference_do5            VARCHAR2(250),
  bbg_reference_fo1            NUMBER(20,4),
  bbg_reference_fo2            NUMBER(20,4),
  bbg_reference_fo3            NUMBER(20,4),
  bbg_reference_fo4            NUMBER(20,4),
  bbg_reference_fo5            NUMBER(20,4),
  bbg_reference_fo6            NUMBER(20,4),
  bbg_reference_fo7            NUMBER(20,4),
  bbg_reference_fo8            NUMBER(20,4),
  bbg_reference_fo9            NUMBER(20,4),
  bbg_reference_fo10           NUMBER(20,4)
)
tablespace RETAIL_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column BBG_RA_RFM_VIP_MN_A.vip_recency_date
  is '会员最后消费日期';
comment on column BBG_RA_RFM_VIP_MN_A.vip_month_freq
  is '会员月消费频率';
comment on column BBG_RA_RFM_VIP_MN_A.vip_year_freq
  is '会员年消费频率';
-- Create/Recreate indexes 
create unique index PK_BBG_RA_RFM_VIP_MN_A on BBG_RA_RFM_VIP_MN_A (MN_WID, HYK_NO)
  tablespace RETAIL_INDEX
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


--1.3.BBG_RA_RFM_LC_MN_A
-- CREATE TABLE
CREATE TABLE BBG_RA_RFM_LC_MN_A
(
  ROW_WID            NUMBER(15) NOT NULL,
  ORG_WID            NUMBER(10) NOT NULL,
  ORG_DH_WID         NUMBER(10) NOT NULL,
  ORG_SCD1_WID       NUMBER(10) NOT NULL,
  MN_WID             NUMBER(15) NOT NULL,
  DATASOURCE_NUM_ID  NUMBER(10) NOT NULL,
  ETL_THREAD_VAL     NUMBER(10) NOT NULL,
  INTEGRATION_ID     VARCHAR2(80) NOT NULL,
  W_INSERT_DT        DATE,
  W_UPDATE_DT        DATE,
  VIP_COUNT          NUMBER(10),
  VIP_SLS_TRX_COUNT  NUMBER(10),
  BBG_REFERENCE_DO1  VARCHAR2(250),
  BBG_REFERENCE_DO2  VARCHAR2(250),
  BBG_REFERENCE_DO3  VARCHAR2(250),
  BBG_REFERENCE_DO4  VARCHAR2(250),
  BBG_REFERENCE_DO5  VARCHAR2(250),
  BBG_REFERENCE_FO1  NUMBER(20,4),
  BBG_REFERENCE_FO2  NUMBER(20,4),
  BBG_REFERENCE_FO3  NUMBER(20,4),
  BBG_REFERENCE_FO4  NUMBER(20,4),
  BBG_REFERENCE_FO5  NUMBER(20,4),
  BBG_REFERENCE_FO6  NUMBER(20,4),
  BBG_REFERENCE_FO7  NUMBER(20,4),
  BBG_REFERENCE_FO8  NUMBER(20,4),
  BBG_REFERENCE_FO9  NUMBER(20,4),
  BBG_REFERENCE_FO10 NUMBER(20,4)
)
TABLESPACE RETAIL_DATA
  PCTFREE 10
  INITRANS 1
  MAXTRANS 255
  STORAGE
  (
    INITIAL 64K
    NEXT 8K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  );
-- ADD COMMENTS TO THE COLUMNS 
COMMENT ON COLUMN BBG_RA_RFM_LC_MN_A.VIP_COUNT
  IS '会员卡数目';
COMMENT ON COLUMN BBG_RA_RFM_LC_MN_A.VIP_SLS_TRX_COUNT
  IS '会员交易笔数';
-- CREATE/RECREATE INDEXES 
CREATE UNIQUE INDEX PK_BBG_RA_RFM_LC_MN_A ON BBG_RA_RFM_LC_MN_A (MN_WID, ORG_WID)
  TABLESPACE RETAIL_INDEX
  PCTFREE 10
  INITRANS 2
  MAXTRANS 255
  STORAGE
  (
    INITIAL 64K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  );

--2.CREATE SEQUENCES
--2.1.BBG_RA_RFM_VIP_F_SEQ
-- CREATE SEQUENCE 
CREATE SEQUENCE BBG_RA_RFM_VIP_F_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20000;

--2.2.BBG_RA_RFM_VIP_MN_A_SEQ
-- CREATE SEQUENCE 
CREATE SEQUENCE BBG_RA_RFM_VIP_MN_A_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20000;

--2.3.BBG_RA_RFM_LC_MN_A_SEQ
-- CREATE SEQUENCE 
CREATE SEQUENCE BBG_RA_RFM_LC_MN_A_SEQ
MINVALUE 1
MAXVALUE 9999999999999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20000;

--3.INSERT HISTORY DATA
--3.1.BBG_RA_RFM_VIP_F
MERGE /*+APPEND PARALLEL(T,16) PARALLEL(S,16)*/
INTO RADM.BBG_RA_RFM_VIP_F T
USING (
  WITH A AS
   (SELECT /*+PARALLEL(16)*/
     T.HYK_NO,
     T.SLS_TRX_ID,
     T.DT_WID,
     T.MIN_WID,
     T.ORG_WID,
     T.ORG_DH_WID,
     T.ORG_SCD1_WID,
     MAX(T.DATASOURCE_NUM_ID) DATASOURCE_NUM_ID,
     T.HYK_NO || '~' || RTRIM(T.SLS_TRX_ID) || '~' ||
     TO_CHAR(TO_DATE(SUBSTR(T.DT_WID, 2, 8), 'YYYYMMDD'),
             'DD-MON-YY',
             'NLS_DATE_LANGUAGE=AMERICAN') INTEGRATION_ID,
     SUM(T.SLS_QTY) SLS_QTY,
     SUM(T.SLS_AMT_LCL) SLS_AMT_LCL,
     SUM(T.SLS_PROFIT_AMT_LCL) SLS_PROFIT_AMT_LCL,
     SUM(T.SLS_TAX_AMT_LCL) SLS_TAX_AMT_LCL,
     SUM(T.RET_QTY) RET_QTY,
     SUM(T.RET_AMT_LCL) RET_AMT_LCL,
     SUM(T.RET_PROFIT_AMT_LCL) RET_PROFIT_AMT_LCL,
     SUM(T.RET_TAX_AMT_LCL) RET_TAX_AMT_LCL,
     MAX(T.BBG_REFERENCE_DO1) BBG_REFERENCE_DO1,
     MAX(T.BBG_REFERENCE_DO2) BBG_REFERENCE_DO2,
     MAX(T.BBG_REFERENCE_DO3) BBG_REFERENCE_DO3,
     MAX(T.BBG_REFERENCE_DO4) BBG_REFERENCE_DO4,
     MAX(T.BBG_REFERENCE_DO5) BBG_REFERENCE_DO5,
     SUM(T.BBG_REFERENCE_FO1) BBG_REFERENCE_FO1,
     SUM(T.BBG_REFERENCE_FO2) BBG_REFERENCE_FO2,
     SUM(T.BBG_REFERENCE_FO3) BBG_REFERENCE_FO3,
     SUM(T.BBG_REFERENCE_FO4) BBG_REFERENCE_FO4,
     SUM(T.BBG_REFERENCE_FO5) BBG_REFERENCE_FO5,
     SUM(T.BBG_REFERENCE_FO6) BBG_REFERENCE_FO6,
     SUM(T.BBG_REFERENCE_FO7) BBG_REFERENCE_FO7,
     SUM(T.BBG_REFERENCE_FO8) BBG_REFERENCE_FO8,
     SUM(T.BBG_REFERENCE_FO9) BBG_REFERENCE_FO9,
     SUM(T.BBG_REFERENCE_FO10) BBG_REFERENCE_FO10
      FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
     WHERE T.HYK_NO IS NOT NULL
       AND T.DT_WID = 120151122000
     GROUP BY T.HYK_NO,
              T.SLS_TRX_ID,
              T.DT_WID,
              T.MIN_WID,
              T.ORG_WID,
              T.ORG_DH_WID,
              T.ORG_SCD1_WID),
  B AS
   (SELECT /*+PARALLEL(16)*/
     *
      FROM RA_RMS.RA_RESTART_LOC@RA_RMS_DBLINK
     WHERE SCENARIO_NAME = 'SDE_BBG_RETAIL_SALESTRANSACTIONFACT'),
  O AS
   (SELECT /*+PARALLEL(16)*/
     ROW_WID, ORG_NUM
      FROM RADM.W_INT_ORG_D)
  SELECT /*+PARALLEL(16)*/
   A.HYK_NO,
   A.SLS_TRX_ID,
   A.DT_WID,
   A.MIN_WID,
   A.ORG_WID,
   A.ORG_DH_WID,
   A.ORG_SCD1_WID,
   A.DATASOURCE_NUM_ID,
   B.THREAD_VAL ETL_THREAD_VAL,
   A.INTEGRATION_ID,
   A.SLS_QTY,
   A.SLS_AMT_LCL,
   A.SLS_PROFIT_AMT_LCL,
   A.SLS_TAX_AMT_LCL,
   A.RET_QTY,
   A.RET_AMT_LCL,
   A.RET_PROFIT_AMT_LCL,
   A.RET_TAX_AMT_LCL,
   A.BBG_REFERENCE_DO1,
   A.BBG_REFERENCE_DO2,
   A.BBG_REFERENCE_DO3,
   A.BBG_REFERENCE_DO4,
   A.BBG_REFERENCE_DO5,
   A.BBG_REFERENCE_FO1,
   A.BBG_REFERENCE_FO2,
   A.BBG_REFERENCE_FO3,
   A.BBG_REFERENCE_FO4,
   A.BBG_REFERENCE_FO5,
   A.BBG_REFERENCE_FO6,
   A.BBG_REFERENCE_FO7,
   A.BBG_REFERENCE_FO8,
   A.BBG_REFERENCE_FO9,
   A.BBG_REFERENCE_FO10
    FROM A, B, O
   WHERE A.ORG_WID = O.ROW_WID
     AND B.DRIVER_VALUE = O.ORG_NUM) S ON (T.HYK_NO = S.HYK_NO AND T.SLS_TRX_ID = S.SLS_TRX_ID AND T.DT_WID = S.DT_WID AND T.MIN_WID = S.MIN_WID AND T.ORG_WID = S.ORG_WID) WHEN MATCHED THEN
    UPDATE
       SET T.SLS_QTY            = S.SLS_QTY,
           T.SLS_AMT_LCL        = S.SLS_AMT_LCL,
           T.SLS_PROFIT_AMT_LCL = S.SLS_PROFIT_AMT_LCL,
           T.SLS_TAX_AMT_LCL    = S.SLS_TAX_AMT_LCL,
           T.RET_QTY            = S.RET_QTY,
           T.RET_AMT_LCL        = S.RET_AMT_LCL,
           T.RET_PROFIT_AMT_LCL = S.RET_PROFIT_AMT_LCL,
           T.RET_TAX_AMT_LCL    = S.RET_TAX_AMT_LCL,
           T.BBG_REFERENCE_FO1  = S.BBG_REFERENCE_FO1,
           T.BBG_REFERENCE_FO2  = S.BBG_REFERENCE_FO2,
           T.BBG_REFERENCE_FO3  = S.BBG_REFERENCE_FO3,
           T.BBG_REFERENCE_FO4  = S.BBG_REFERENCE_FO4,
           T.BBG_REFERENCE_FO5  = S.BBG_REFERENCE_FO5,
           T.BBG_REFERENCE_FO6  = S.BBG_REFERENCE_FO6,
           T.BBG_REFERENCE_FO7  = S.BBG_REFERENCE_FO7,
           T.BBG_REFERENCE_FO8  = S.BBG_REFERENCE_FO8,
           T.BBG_REFERENCE_FO9  = S.BBG_REFERENCE_FO9,
           T.BBG_REFERENCE_FO10 = S.BBG_REFERENCE_FO10,
           T.W_UPDATE_DT        = SYSDATE
  WHEN NOT MATCHED THEN
    INSERT
      (T.ROW_WID,
       T.HYK_NO,
       T.SLS_TRX_ID,
       T.DT_WID,
       T.MIN_WID,
       T.ORG_WID,
       T.ORG_DH_WID,
       T.ORG_SCD1_WID,
       T.DATASOURCE_NUM_ID,
       T.ETL_THREAD_VAL,
       T.INTEGRATION_ID,
       T.W_INSERT_DT,
       T.W_UPDATE_DT,
       T.SLS_QTY,
       T.SLS_AMT_LCL,
       T.SLS_PROFIT_AMT_LCL,
       T.SLS_TAX_AMT_LCL,
       T.RET_QTY,
       T.RET_AMT_LCL,
       T.RET_PROFIT_AMT_LCL,
       T.RET_TAX_AMT_LCL,
       T.BBG_REFERENCE_DO1,
       T.BBG_REFERENCE_DO2,
       T.BBG_REFERENCE_DO3,
       T.BBG_REFERENCE_DO4,
       T.BBG_REFERENCE_DO5,
       T.BBG_REFERENCE_FO1,
       T.BBG_REFERENCE_FO2,
       T.BBG_REFERENCE_FO3,
       T.BBG_REFERENCE_FO4,
       T.BBG_REFERENCE_FO5,
       T.BBG_REFERENCE_FO6,
       T.BBG_REFERENCE_FO7,
       T.BBG_REFERENCE_FO8,
       T.BBG_REFERENCE_FO9,
       T.BBG_REFERENCE_FO10)
    VALUES
      (RADM.BBG_RA_RFM_VIP_F_SEQ.NEXTVAL,
       S.HYK_NO,
       S.SLS_TRX_ID,
       S.DT_WID,
       S.MIN_WID,
       S.ORG_WID,
       S.ORG_DH_WID,
       S.ORG_SCD1_WID,
       S.DATASOURCE_NUM_ID,
       S.ETL_THREAD_VAL,
       S.INTEGRATION_ID,
       SYSDATE,
       SYSDATE,
       S.SLS_QTY,
       S.SLS_AMT_LCL,
       S.SLS_PROFIT_AMT_LCL,
       S.SLS_TAX_AMT_LCL,
       S.RET_QTY,
       S.RET_AMT_LCL,
       S.RET_PROFIT_AMT_LCL,
       S.RET_TAX_AMT_LCL,
       S.BBG_REFERENCE_DO1,
       S.BBG_REFERENCE_DO2,
       S.BBG_REFERENCE_DO3,
       S.BBG_REFERENCE_DO4,
       S.BBG_REFERENCE_DO5,
       S.BBG_REFERENCE_FO1,
       S.BBG_REFERENCE_FO2,
       S.BBG_REFERENCE_FO3,
       S.BBG_REFERENCE_FO4,
       S.BBG_REFERENCE_FO5,
       S.BBG_REFERENCE_FO6,
       S.BBG_REFERENCE_FO7,
       S.BBG_REFERENCE_FO8,
       S.BBG_REFERENCE_FO9,
       S.BBG_REFERENCE_FO10);

		
--3.2.BBG_RA_RFM_VIP_MN_A
  --BBG_RA_RFM_VIP_MN_A
  MERGE /*+APPEND*/
  INTO RADM.BBG_RA_RFM_VIP_MN_A T
  USING (SELECT /*+PARALLEL(16)*/
          A.HYK_NO,
          TO_CHAR(&DAY, 'YYYYMM') MN_WID,
          MAX(A.DATASOURCE_NUM_ID) DATASOURCE_NUM_ID,
          MAX(A.ETL_THREAD_VAL) ETL_THREAD_VAL,
          A.HYK_NO || '~' || TO_CHAR(&DAY, 'YYYYMM') INTEGRATION_ID,
          MAX(TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD')) VIP_RECENCY,
          COUNT(CASE
                  WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                       TRUNC(&DAY, 'MM') THEN
                   1
                  ELSE
                   NULL
                END) VIP_MONTH_FREQ,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'MM') THEN
                 A.SLS_QTY
                ELSE
                 NULL
              END) VIP_MONTH_SLS_QTY,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'MM') THEN
                 A.SLS_AMT_LCL
                ELSE
                 NULL
              END) VIP_MONTH_SLS_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'MM') THEN
                 A.SLS_PROFIT_AMT_LCL
                ELSE
                 NULL
              END) VIP_MONTH_SLS_PROFIT_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'MM') THEN
                 A.SLS_TAX_AMT_LCL
                ELSE
                 NULL
              END) VIP_MONTH_SLS_TAX_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'MM') THEN
                 A.RET_QTY
                ELSE
                 NULL
              END) VIP_MONTH_RET_QTY,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'MM') THEN
                 A.RET_AMT_LCL
                ELSE
                 NULL
              END) VIP_MONTH_RET_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'MM') THEN
                 A.RET_PROFIT_AMT_LCL
                ELSE
                 NULL
              END) VIP_MONTH_RET_PROFIT_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'MM') THEN
                 A.RET_TAX_AMT_LCL
                ELSE
                 NULL
              END) VIP_MONTH_RET_TAX_AMT_LCL,
          ----------------------------------------------------------------------
          COUNT(CASE
                  WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                       TRUNC(&DAY, 'YY') THEN
                   1
                  ELSE
                   NULL
                END) VIP_YEAR_FREQ,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'YY') THEN
                 A.SLS_QTY
                ELSE
                 NULL
              END) VIP_YEAR_SLS_QTY,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'YY') THEN
                 A.SLS_AMT_LCL
                ELSE
                 NULL
              END) VIP_YEAR_SLS_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'YY') THEN
                 A.SLS_PROFIT_AMT_LCL
                ELSE
                 NULL
              END) VIP_YEAR_SLS_PROFIT_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'YY') THEN
                 A.SLS_TAX_AMT_LCL
                ELSE
                 NULL
              END) VIP_YEAR_SLS_TAX_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'YY') THEN
                 A.RET_QTY
                ELSE
                 NULL
              END) VIP_YEAR_RET_QTY,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'YY') THEN
                 A.RET_AMT_LCL
                ELSE
                 NULL
              END) VIP_YEAR_RET_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'YY') THEN
                 A.RET_PROFIT_AMT_LCL
                ELSE
                 NULL
              END) VIP_YEAR_RET_PROFIT_AMT_LCL,
          SUM(CASE
                WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >=
                     TRUNC(&DAY, 'YY') THEN
                 A.RET_TAX_AMT_LCL
                ELSE
                 NULL
              END) VIP_YEAR_RET_TAX_AMT_LCL
           FROM RADM.BBG_RA_RFM_VIP_F A
          GROUP BY A.HYK_NO) S
  ON (T.HYK_NO = S.HYK_NO AND T.MN_WID = S.MN_WID)
  WHEN MATCHED THEN
    UPDATE
       SET T.VIP_RECENCY                  = S.VIP_RECENCY,
           T.VIP_MONTH_FREQ               = S.VIP_MONTH_FREQ,
           T.VIP_YEAR_FREQ                = S.VIP_YEAR_FREQ,
           T.VIP_MONTH_SLS_QTY            = S.VIP_MONTH_SLS_QTY,
           T.VIP_MONTH_SLS_AMT_LCL        = S.VIP_MONTH_SLS_AMT_LCL,
           T.VIP_MONTH_SLS_PROFIT_AMT_LCL = S.VIP_MONTH_SLS_PROFIT_AMT_LCL,
           T.VIP_MONTH_SLS_TAX_AMT_LCL    = S.VIP_MONTH_SLS_TAX_AMT_LCL,
           T.VIP_MONTH_RET_QTY            = S.VIP_MONTH_RET_QTY,
           T.VIP_MONTH_RET_AMT_LCL        = S.VIP_MONTH_RET_AMT_LCL,
           T.VIP_MONTH_RET_PROFIT_AMT_LCL = S.VIP_MONTH_RET_PROFIT_AMT_LCL,
           T.VIP_MONTH_RET_TAX_AMT_LCL    = S.VIP_MONTH_RET_TAX_AMT_LCL,
           T.VIP_YEAR_SLS_QTY             = S.VIP_YEAR_SLS_QTY,
           T.VIP_YEAR_SLS_AMT_LCL         = S.VIP_YEAR_SLS_AMT_LCL,
           T.VIP_YEAR_SLS_PROFIT_AMT_LCL  = S.VIP_YEAR_SLS_PROFIT_AMT_LCL,
           T.VIP_YEAR_SLS_TAX_AMT_LCL     = S.VIP_YEAR_SLS_TAX_AMT_LCL,
           T.VIP_YEAR_RET_QTY             = S.VIP_YEAR_RET_QTY,
           T.VIP_YEAR_RET_AMT_LCL         = S.VIP_YEAR_RET_AMT_LCL,
           T.VIP_YEAR_RET_PROFIT_AMT_LCL  = S.VIP_YEAR_RET_PROFIT_AMT_LCL,
           T.VIP_YEAR_RET_TAX_AMT_LCL     = S.VIP_YEAR_RET_TAX_AMT_LCL,
           T.W_UPDATE_DT                  = SYSDATE
  WHEN NOT MATCHED THEN
    INSERT
      (T.ROW_WID,
       T.HYK_NO,
       T.MN_WID,
       T.DATASOURCE_NUM_ID,
       T.INTEGRATION_ID,
       T.W_INSERT_DT,
       T.W_UPDATE_DT,
       T.VIP_RECENCY,
       T.VIP_MONTH_FREQ,
       T.VIP_YEAR_FREQ,
       T.VIP_MONTH_SLS_QTY,
       T.VIP_MONTH_SLS_AMT_LCL,
       T.VIP_MONTH_SLS_PROFIT_AMT_LCL,
       T.VIP_MONTH_SLS_TAX_AMT_LCL,
       T.VIP_MONTH_RET_QTY,
       T.VIP_MONTH_RET_AMT_LCL,
       T.VIP_MONTH_RET_PROFIT_AMT_LCL,
       T.VIP_MONTH_RET_TAX_AMT_LCL,
       T.VIP_YEAR_SLS_QTY,
       T.VIP_YEAR_SLS_AMT_LCL,
       T.VIP_YEAR_SLS_PROFIT_AMT_LCL,
       T.VIP_YEAR_SLS_TAX_AMT_LCL,
       T.VIP_YEAR_RET_QTY,
       T.VIP_YEAR_RET_AMT_LCL,
       T.VIP_YEAR_RET_PROFIT_AMT_LCL,
       T.VIP_YEAR_RET_TAX_AMT_LCL,
       T.BBG_REFERENCE_DO1,
       T.BBG_REFERENCE_DO2,
       T.BBG_REFERENCE_DO3,
       T.BBG_REFERENCE_DO4,
       T.BBG_REFERENCE_DO5,
       T.BBG_REFERENCE_FO1,
       T.BBG_REFERENCE_FO2,
       T.BBG_REFERENCE_FO3,
       T.BBG_REFERENCE_FO4,
       T.BBG_REFERENCE_FO5,
       T.BBG_REFERENCE_FO6,
       T.BBG_REFERENCE_FO7,
       T.BBG_REFERENCE_FO8,
       T.BBG_REFERENCE_FO9,
       T.BBG_REFERENCE_FO10)
    VALUES
      (RADM.BBG_RA_RFM_VIP_MN_A_SEQ.NEXTVAL,
       S.HYK_NO,
       S.MN_WID,
       S.DATASOURCE_NUM_ID,
       S.INTEGRATION_ID,
       SYSDATE,
       SYSDATE,
       S.VIP_RECENCY,
       S.VIP_MONTH_FREQ,
       S.VIP_YEAR_FREQ,
       S.VIP_MONTH_SLS_QTY,
       S.VIP_MONTH_SLS_AMT_LCL,
       S.VIP_MONTH_SLS_PROFIT_AMT_LCL,
       S.VIP_MONTH_SLS_TAX_AMT_LCL,
       S.VIP_MONTH_RET_QTY,
       S.VIP_MONTH_RET_AMT_LCL,
       S.VIP_MONTH_RET_PROFIT_AMT_LCL,
       S.VIP_MONTH_RET_TAX_AMT_LCL,
       S.VIP_YEAR_SLS_QTY,
       S.VIP_YEAR_SLS_AMT_LCL,
       S.VIP_YEAR_SLS_PROFIT_AMT_LCL,
       S.VIP_YEAR_SLS_TAX_AMT_LCL,
       S.VIP_YEAR_RET_QTY,
       S.VIP_YEAR_RET_AMT_LCL,
       S.VIP_YEAR_RET_PROFIT_AMT_LCL,
       S.VIP_YEAR_RET_TAX_AMT_LCL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL);
  COMMIT;
	
		
--3.3.BBG_RA_RFM_LC_MN_A
MERGE INTO RADM.BBG_RA_RFM_LC_MN_A T
USING () S
ON ()
WHEN MATCHED THEN 
	UPDATE
	SET
	WHEN NOT MATCHED THEN 
		INSERT () 
		VALUES();


---临时刷新MIN_WID
CREATE TABLE RADM.YJ_SLSTRX_MINWID_TMP AS
  SELECT /*+PARALLEL(32)*/
  DISTINCT T.SLS_TRX_ID, T.MIN_WID, T.DT_WID
    FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
   WHERE T.DT_WID >= 120140101000
     AND T.HYK_NO IS NOT NULL;

SELECT COUNT(1) FROM RADM.YJ_SLSTRX_MINWID_TMP;

UPDATE RADM.BBG_RA_RFM_VIP_F A
   SET A.MIN_WID =
       (SELECT B.MIN_WID
          FROM RADM.YJ_SLSTRX_MINWID_TMP B
         WHERE A.SLS_TRX_ID = B.SLS_TRX_ID
           AND A.DT_WID = B.DT_WID
           AND B.DT_WID = 120140101000)
 WHERE EXISTS (SELECT 1
          FROM RADM.YJ_SLSTRX_MINWID_TMP C
         WHERE A.SLS_TRX_ID = C.SLS_TRX_ID
           AND A.DT_WID = C.DT_WID
           AND C.DT_WID = 120140101000)
   AND A.MIN_WID IS NULL
   AND A.DT_WID = 120140101000;
	 
--4.中文字段说明
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_HYK_NO
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_HYK_NO
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_RECENCY_DATE
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_RECENCY_DATE
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_MONTH_FREQ
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_MONTH_FREQ
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_YEAR_FREQ
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_YEAR_FREQ
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_Month_Sales_Amt
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_Month_Sales_Amt
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_Month_Net_Sales_Amt
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_Month_Net_Sales_Amt
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_Year_Sales_Amt
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_Year_Sales_Amt
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_Year_Net_Sales_Amt
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_VIP_Year_Net_Sales_Amt
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_R_LEVEL
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_R_LEVEL
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_F_LEVEL
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_F_LEVEL
--CN_Retail_As-Was_BBG_VIP_RFM_Analysis_M_LEVEL
--CD_Retail_As-Was_BBG_VIP_RFM_Analysis_M_LEVEL
SELECT * FROM RADM.W_LOCALIZED_STRING_G T WHERE T.MSG_NUM LIKE '%Retail_As-Was_BBG_VIP_RFM_Analysis%' FOR UPDATE;

--*******************************************************************************************************
--*******************************************************************************************************
--*******************************************************************************************************
--*******************************************************************************************************
--old
--1.会员卡号、交易小票号、日期维度、ORG_WID、ORG_DH_WID、ORG_SCD1_WID、消费金额
SELECT /*+PARALLEL(20)*/
 T.HYK_NO,
 T.SLS_TRX_ID,
 T.DT_WID,
 T.ORG_WID,
 T.ORG_DH_WID,
 T.ORG_SCD1_WID,
 SUM((T.SLS_AMT_LCL - T.SLS_TAX_AMT_LCL) -
     (T.RET_AMT_LCL - T.RET_TAX_AMT_LCL)) MONETARY
  FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
 WHERE T.HYK_NO IS NOT NULL
 GROUP BY T.HYK_NO,
          T.SLS_TRX_ID,
          T.DT_WID,
          T.ORG_WID,
          T.ORG_DH_WID,
          T.ORG_SCD1_WID;

--2.按照会员卡统计RMF
SELECT /*+PARALLEL(20)*/
 A.HYK_NO,
 TRUNC(SYSDATE) - TO_DATE(SUBSTR(MAX(DT_WID), 2, 8), 'YYYYMMDD') RECENCY,
 COUNT(CASE
         WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >= TRUNC(SYSDATE - 30) THEN
          1
         ELSE
          NULL
       END) FREQUENCY,
 SUM(CASE
       WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') >= TRUNC(SYSDATE - 30) THEN
        ROUND(A.MONETARY, 2)
       ELSE
        0
     END) MONETARY
  FROM (SELECT /*+PARALLEL(20)*/
         T.HYK_NO,
         T.SLS_TRX_ID,
         T.DT_WID,
         SUM((T.SLS_AMT_LCL - T.SLS_TAX_AMT_LCL) -
             (T.RET_AMT_LCL - T.RET_TAX_AMT_LCL)) MONETARY
          FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
         WHERE T.HYK_NO IS NOT NULL
         GROUP BY T.HYK_NO, T.SLS_TRX_ID, T.DT_WID) A
 GROUP BY A.HYK_NO;

--3.按门店统计RFM会员数


--4.写入RFM指标分级数据。
/*
R
一级:400+
二级:121-400
三级:0-120

F
一级:0-1
二级:2-3
三级:4+

M
一级:0-130
二级:131-330
三级:331+
*/
ALTER TABLE RADM.BBG_RA_RFM_VIP_MN_A NOLOGGING;
ALTER SESSION ENABLE PARALLEL DML;
UPDATE /*+PARALLEL(16)*/ RADM.BBG_RA_RFM_VIP_MN_A T
   SET T.R_LEVEL = (CASE
                     WHEN TRUNC(&DATE) - T.VIP_RECENCY_DATE BETWEEN 0 AND 120 THEN
                      3
                     WHEN TRUNC(&DATE) - T.VIP_RECENCY_DATE BETWEEN 121 AND 400 THEN
                      2
                     WHEN TRUNC(&DATE) - T.VIP_RECENCY_DATE >= 401 THEN
                      3
                   END),
       T.F_LEVEL = (CASE
                     WHEN T.VIP_MONTH_FREQ BETWEEN 0 AND 1 THEN
                      1
                     WHEN T.VIP_MONTH_FREQ BETWEEN 2 AND 3 THEN
                      2
                     WHEN T.VIP_MONTH_FREQ >= 4 THEN
                      3
                   END),
       T.M_LEVEL = (CASE
                     WHEN T.VIP_MONTH_SLS_AMT_LCL BETWEEN 0 AND 130 THEN
                      1
                     WHEN T.VIP_MONTH_SLS_AMT_LCL BETWEEN 131 AND 330 THEN
                      2
                     WHEN T.VIP_MONTH_SLS_AMT_LCL >= 331 THEN
                      3
                   END)
 WHERE T.MN_WID = SUBSTR(TO_CHAR(&DATE, 'YYYYMMDD'), 1, 6)
   AND T.HYK_NO = '006062113685';
ALTER TABLE RADM.BBG_RA_RFM_VIP_MN_A LOGGING;
