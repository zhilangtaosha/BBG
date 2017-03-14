--1.
SELECT * FROM V_CMX_FUND_ALL H ;

--2.create table radm.bbg_ra_fund_it_lc_supp_dy_fs
CREATE TABLE RADM.BBG_RA_FUND_IT_LC_SUPP_DY_FS
(
  PROD_NUM                   VARCHAR2(25),
	ORG_NUM                    NUMBER(10),
	SUPPLIER_NUM               NUMBER(10),
	DAY_DT                     DATE,
	FUND_NO                    VARCHAR2(250),
	PROMO_MIX_ID               VARCHAR2(250),
	PROMO_EVENT_DISPLAY_ID     VARCHAR2(100),
	PROMO_TYPE_ID              VARCHAR2(10),
	FUND_METHOD                VARCHAR2(10),
	FUND_SOURCE                VARCHAR2(10),
  COST_CODE                  NUMBER(10),
  FUND_AMOUNT_ID             NUMBER(20,4),
  FUND_AMOUNT                NUMBER(20,4),
  ETL_THREAD_VAL             NUMBER(4),
  INTEGRATION_ID             VARCHAR2(80),
  W_INSERT_DT                DATE,
  W_UPDATE_DT                DATE,
  BBG_REFERENCE_DO1          VARCHAR2(250),
  BBG_REFERENCE_DO2          VARCHAR2(250),
  BBG_REFERENCE_DO3          VARCHAR2(250),
  BBG_REFERENCE_DO4          VARCHAR2(250),
  BBG_REFERENCE_DO5          VARCHAR2(250),
  BBG_REFERENCE_FO1          NUMBER(20,4),
  BBG_REFERENCE_FO2          NUMBER(20,4),
  BBG_REFERENCE_FO3          NUMBER(20,4),
  BBG_REFERENCE_FO4          NUMBER(20,4),
  BBG_REFERENCE_FO5          NUMBER(20,4),
  BBG_REFERENCE_FO6          NUMBER(20,4),
  BBG_REFERENCE_FO7          NUMBER(20,4),
  BBG_REFERENCE_FO8          NUMBER(20,4),
  BBG_REFERENCE_FO9          NUMBER(20,4),
  BBG_REFERENCE_FO10         NUMBER(20,4)
)
partition by range (ETL_THREAD_VAL)
(
  partition P_01 values less than (2)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_02 values less than (3)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_03 values less than (4)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_04 values less than (5)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_05 values less than (6)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_06 values less than (7)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_07 values less than (8)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_08 values less than (9)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_09 values less than (10)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_10 values less than (MAXVALUE)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    )
);


--3.create table rabatcher.bbg_ra_fund_it_lc_supp_dy_tmp
CREATE TABLE RABATCHER.BBG_RA_FUND_IT_LC_SUPP_DY_TMP
(
	PROD_IT_NUM                VARCHAR2(30),
  PROD_SC_NUM                VARCHAR2(30),
  PROD_CL_NUM                VARCHAR2(30),
  PROD_DP_NUM                VARCHAR2(30),
  PROD_GP_NUM                VARCHAR2(30),
  PROD_DV_NUM                VARCHAR2(30),
	prod_it_wid                NUMBER(10),
  prod_scd1_wid              NUMBER(10),
	PROD_SC_WID                NUMBER(10),
	PROD_CL_WID                NUMBER(10),
	PROD_DP_WID                NUMBER(10),
	PROD_GP_WID                NUMBER(10),
	PROD_DV_WID                NUMBER(10),
	org_num                    VARCHAR2(30),
  org_ds_num                 VARCHAR2(30),
  org_rg_num                 VARCHAR2(30),
  org_ar_num                 VARCHAR2(30),
  org_ch_num                 VARCHAR2(30),
  org_lc_wid                 NUMBER(10),
  org_ds_wid                 NUMBER(10),
  org_rg_wid                 NUMBER(10),
  org_ar_wid                 NUMBER(10),
  org_ch_wid                 NUMBER(10),
	SUPPLIER_NUM               VARCHAR2(80),
	SUPPLIER_WID               NUMBER(10),
	DAY_DT                     DATE,
	DT_WID                     NUMBER(15),
  bbg_item_loc_wid           NUMBER(10),
  bbg_item_loc_supp_wid      NUMBER(10),
	FUND_NO                    VARCHAR2(250),
	PROMO_MIX_ID               VARCHAR2(250),
	PROMO_EVENT_DISPLAY_ID     VARCHAR2(100),
	PROMO_TYPE_ID              VARCHAR2(10),
	FUND_METHOD                VARCHAR2(10),
	FUND_SOURCE                VARCHAR2(10),
  COST_CODE                  NUMBER(10),
  FUND_AMOUNT_IN             NUMBER(20,4),
  FUND_AMOUNT                NUMBER(20,4),
  ETL_THREAD_VAL             NUMBER(4),
  INTEGRATION_ID             VARCHAR2(80),
  W_INSERT_DT                DATE,
  W_UPDATE_DT                DATE,
  BBG_REFERENCE_DO1          VARCHAR2(250),
  BBG_REFERENCE_DO2          VARCHAR2(250),
  BBG_REFERENCE_DO3          VARCHAR2(250),
  BBG_REFERENCE_DO4          VARCHAR2(250),
  BBG_REFERENCE_DO5          VARCHAR2(250),
  BBG_REFERENCE_FO1          NUMBER(20,4),
  BBG_REFERENCE_FO2          NUMBER(20,4),
  BBG_REFERENCE_FO3          NUMBER(20,4),
  BBG_REFERENCE_FO4          NUMBER(20,4),
  BBG_REFERENCE_FO5          NUMBER(20,4),
  BBG_REFERENCE_FO6          NUMBER(20,4),
  BBG_REFERENCE_FO7          NUMBER(20,4),
  BBG_REFERENCE_FO8          NUMBER(20,4),
  BBG_REFERENCE_FO9          NUMBER(20,4),
  BBG_REFERENCE_FO10         NUMBER(20,4)
)
partition by range (ETL_THREAD_VAL)
(
  partition P_01 values less than (2)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_02 values less than (3)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_03 values less than (4)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_04 values less than (5)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_05 values less than (6)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_06 values less than (7)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_07 values less than (8)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_08 values less than (9)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_09 values less than (10)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_10 values less than (MAXVALUE)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    )
);

--4.create table radm.bbg_ra_fund_it_lc_supp_dy_f
CREATE TABLE RADM.BBG_RA_FUND_IT_LC_SUPP_DY_F
(
  ROW_WID                    NUMBER(10),
  prod_it_wid                NUMBER(10),
  prod_scd1_wid              NUMBER(10),
	org_lc_wid                 NUMBER(10),
  SUPPLIER_WID               NUMBER(10),
  DT_WID                     NUMBER(15),
  bbg_item_loc_wid           NUMBER(10),
  bbg_item_loc_supp_wid      NUMBER(10),
  FUND_NO                    VARCHAR2(250),
  PROMO_MIX_ID               VARCHAR2(250),
  PROMO_EVENT_DISPLAY_ID     VARCHAR2(100),
  PROMO_TYPE_ID              VARCHAR2(10),
  FUND_METHOD                VARCHAR2(10),
  FUND_SOURCE                VARCHAR2(10),
  COST_CODE                  NUMBER(10),
  FUND_AMOUNT_IN             NUMBER(20,4),
  FUND_AMOUNT                NUMBER(20,4),
  ETL_THREAD_VAL             NUMBER(4),
  INTEGRATION_ID             VARCHAR2(80),
  W_INSERT_DT                DATE,
  W_UPDATE_DT                DATE,
  BBG_REFERENCE_DO1          VARCHAR2(250),
  BBG_REFERENCE_DO2          VARCHAR2(250),
  BBG_REFERENCE_DO3          VARCHAR2(250),
  BBG_REFERENCE_DO4          VARCHAR2(250),
  BBG_REFERENCE_DO5          VARCHAR2(250),
  BBG_REFERENCE_FO1          NUMBER(20,4),
  BBG_REFERENCE_FO2          NUMBER(20,4),
  BBG_REFERENCE_FO3          NUMBER(20,4),
  BBG_REFERENCE_FO4          NUMBER(20,4),
  BBG_REFERENCE_FO5          NUMBER(20,4),
  BBG_REFERENCE_FO6          NUMBER(20,4),
  BBG_REFERENCE_FO7          NUMBER(20,4),
  BBG_REFERENCE_FO8          NUMBER(20,4),
  BBG_REFERENCE_FO9          NUMBER(20,4),
  BBG_REFERENCE_FO10         NUMBER(20,4)
)
partition by range (ETL_THREAD_VAL)
(
  partition P_01 values less than (2)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_02 values less than (3)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_03 values less than (4)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_04 values less than (5)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_05 values less than (6)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_06 values less than (7)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_07 values less than (8)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_08 values less than (9)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_09 values less than (10)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_10 values less than (MAXVALUE)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    )
);


--5.
-- Create sequence 
create sequence BBG_RA_FUND_IT_LC_SP_DY_F_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20000;


--6.aggregate table
--6.1.BBG_RA_FUND_IT_LC_DY_A
CREATE TABLE RADM.BBG_RA_FUND_IT_LC_DY_A
(
  ROW_WID                    NUMBER(10),
  prod_it_wid                NUMBER(10),
  prod_scd1_wid              NUMBER(10),
	org_lc_wid                 NUMBER(10),
  DT_WID                     NUMBER(15),
  bbg_item_loc_wid           NUMBER(10),
  FUND_AMOUNT_IN             NUMBER(20,4),
  FUND_AMOUNT                NUMBER(20,4),
  ETL_THREAD_VAL             NUMBER(4),
  INTEGRATION_ID             VARCHAR2(80),
  W_INSERT_DT                DATE,
  W_UPDATE_DT                DATE,
  BBG_REFERENCE_DO1          VARCHAR2(250),
  BBG_REFERENCE_DO2          VARCHAR2(250),
  BBG_REFERENCE_DO3          VARCHAR2(250),
  BBG_REFERENCE_DO4          VARCHAR2(250),
  BBG_REFERENCE_DO5          VARCHAR2(250),
  BBG_REFERENCE_FO1          NUMBER(20,4),
  BBG_REFERENCE_FO2          NUMBER(20,4),
  BBG_REFERENCE_FO3          NUMBER(20,4),
  BBG_REFERENCE_FO4          NUMBER(20,4),
  BBG_REFERENCE_FO5          NUMBER(20,4),
  BBG_REFERENCE_FO6          NUMBER(20,4),
  BBG_REFERENCE_FO7          NUMBER(20,4),
  BBG_REFERENCE_FO8          NUMBER(20,4),
  BBG_REFERENCE_FO9          NUMBER(20,4),
  BBG_REFERENCE_FO10         NUMBER(20,4)
)
partition by range (ETL_THREAD_VAL)
(
  partition P_01 values less than (2)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_02 values less than (3)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_03 values less than (4)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_04 values less than (5)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_05 values less than (6)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_06 values less than (7)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_07 values less than (8)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_08 values less than (9)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_09 values less than (10)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_10 values less than (MAXVALUE)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    )
);
-- Create sequence 
create sequence BBG_RA_FUND_IT_LC_DY_A_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20000;

--6.2.
CREATE TABLE RADM.BBG_RA_FUND_IT_LC_SUPP_DY_A
(
  ROW_WID                    NUMBER(10),
  prod_it_wid                NUMBER(10),
  prod_scd1_wid              NUMBER(10),
	org_lc_wid                 NUMBER(10),
  SUPPLIER_WID               NUMBER(10),
  DT_WID                     NUMBER(15),
  bbg_item_loc_wid           NUMBER(10),
  bbg_item_loc_supp_wid      NUMBER(10),
  FUND_AMOUNT_IN             NUMBER(20,4),
  FUND_AMOUNT                NUMBER(20,4),
  ETL_THREAD_VAL             NUMBER(4),
  INTEGRATION_ID             VARCHAR2(80),
  W_INSERT_DT                DATE,
  W_UPDATE_DT                DATE,
  BBG_REFERENCE_DO1          VARCHAR2(250),
  BBG_REFERENCE_DO2          VARCHAR2(250),
  BBG_REFERENCE_DO3          VARCHAR2(250),
  BBG_REFERENCE_DO4          VARCHAR2(250),
  BBG_REFERENCE_DO5          VARCHAR2(250),
  BBG_REFERENCE_FO1          NUMBER(20,4),
  BBG_REFERENCE_FO2          NUMBER(20,4),
  BBG_REFERENCE_FO3          NUMBER(20,4),
  BBG_REFERENCE_FO4          NUMBER(20,4),
  BBG_REFERENCE_FO5          NUMBER(20,4),
  BBG_REFERENCE_FO6          NUMBER(20,4),
  BBG_REFERENCE_FO7          NUMBER(20,4),
  BBG_REFERENCE_FO8          NUMBER(20,4),
  BBG_REFERENCE_FO9          NUMBER(20,4),
  BBG_REFERENCE_FO10         NUMBER(20,4)
)
partition by range (ETL_THREAD_VAL)
(
  partition P_01 values less than (2)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_02 values less than (3)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_03 values less than (4)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_04 values less than (5)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_05 values less than (6)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_06 values less than (7)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_07 values less than (8)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_08 values less than (9)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_09 values less than (10)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition P_10 values less than (MAXVALUE)
    tablespace DM_FACT_DATA
    pctfree 10
    initrans 6
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    )
);
-- Create sequence 
create sequence BBG_RA_FUND_IT_LC_SUP_DY_A_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20000;

--TMP
SELECT DISTINCT T.DT_WID FROM RADM.BBG_RA_FUND_IT_LC_SUPP_DY_F T;
SELECT * FROM V_CMX_FUND_ALL H WHERE H.post_date=DATE'2017-01-17';
SELECT H.post_date,COUNT(1) FROM V_CMX_FUND_ALL H GROUP BY H.post_date ORDER BY H.post_date;
SELECT H.BUSINESS_dATE,COUNT(1) FROM V_CMX_FUND_ALL H GROUP BY H.BUSINESS_dATE ORDER BY H.BUSINESS_dATE;
SELECT * FROM V_CMX_FUND_ALL T WHERE T.post_date IS NULL;
SELECT DISTINCT T.FUND_SOURCE FROM V_CMX_FUND_ALL T;
SELECT DISTINCT T.FUND_METHOD FROM V_CMX_FUND_ALL T;
SELECT * FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_FS;
SELECT * FROM RADM.BBG_RA_SLS_IT_LC_DY_FS;
SELECT * FROM RABATCHER.W_PRODUCT_D_RTL_TMP;
SELECT * FROM RABATCHER.BBG_RA_SUPP_SLS_IT_LC_DY_TMP;
SELECT MAX(LENGTH(T.PROD_IT_NUM)),
       MAX(LENGTH(T.PROD_SC_NUM)),
       MAX(LENGTH(T.PROD_CL_NUM)),
       MAX(LENGTH(T.PROD_DP_NUM)),
			 MAX(LENGTH(T.PROD_GP_NUM)),
			 MAX(LENGTH(T.PROD_DV_NUM))
  FROM RABATCHER.W_PRODUCT_D_RTL_TMP T;



drop table radm.test;
CREATE TABLE RADM.TEST(ID1 NUMBER NOT NULL,ID2 NUMBER NOT NULL,ID3 NUMBER,AMOUNT NUMBER(20,4));

INSERT INTO RADM.TEST values(1,1,1,5.4);
commit;
INSERT INTO RADM.TEST values(1,1,null,5.4);
commit;
