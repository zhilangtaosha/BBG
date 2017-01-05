--1.
INSERT INTO RADM.BBG_RA_SUPP_SLS_IT_LC_DY_F_BAK
  SELECT /*+PARALLEL(16)*/
   *
    FROM RADM.BBG_RA_SUPP_SALES_IT_LC_DY_F T
   WHERE T.DT_WID = 120161231000;
COMMIT;

INSERT INTO /*+PARALLEL(20)*/
RABATCHER.BBG_RA_SUPP_SLS_IT_LC_DY_TMP T
  (ORG_WID,
   ORG_SCD1_WID,
   PROD_IT_WID,
   PROD_SCD1_WID,
   ORG_LC_WID,
   ORG_DS_WID,
   ORG_RG_WID,
   ORG_AR_WID,
   ORG_CH_WID,
   PROD_DV_WID,
   PROD_GP_WID,
   PROD_DP_WID,
   PROD_CL_WID,
   PROD_SC_WID,
   DT_WID,
   WK_WID,
   PR_WID,
   QT_WID,
   DAY_DT,
   WK_NUM,
   PR_NUM,
   QT_NUM,
   ORG_NUM,
   ORG_DS_NUM,
   ORG_RG_NUM,
   ORG_AR_NUM,
   ORG_CH_NUM,
   PROD_IT_NUM,
   PROD_SC_NUM,
   PROD_CL_NUM,
   PROD_DP_NUM,
   PROD_GP_NUM,
   PROD_DV_NUM,
   SUPPLIER_WID,
   SUPPLIER_NUM,
   BBG_ITEM_LOC_WID,
   BBG_ITEM_LOC_SUPP_WID,
   SUPP_SALES_QTY,
   SUPP_SALES_COST,
   SUPP_SALES_AMT,
   AUX1_CHANGED_ON_DT,
   AUX2_CHANGED_ON_DT,
   AUX3_CHANGED_ON_DT,
   AUX4_CHANGED_ON_DT,
   CHANGED_BY_ID,
   CHANGED_ON_DT,
   CREATED_BY_ID,
   CREATED_ON_DT,
   DATASOURCE_NUM_ID,
   DELETE_FLG,
   DOC_CURR_CODE,
   GLOBAL1_EXCHANGE_RATE,
   GLOBAL2_EXCHANGE_RATE,
   GLOBAL3_EXCHANGE_RATE,
   LOC_CURR_CODE,
   LOC_EXCHANGE_RATE,
   TENANT_ID,
   X_CUSTOM,
   INTEGRATION_ID,
   BBG_REFERENCE_DO1,
   BBG_REFERENCE_DO2,
   BBG_REFERENCE_DO3,
   BBG_REFERENCE_DO4,
   BBG_REFERENCE_DO5,
   BBG_REFERENCE_FO1,
   BBG_REFERENCE_FO2,
   BBG_REFERENCE_FO3,
   BBG_REFERENCE_FO4,
   BBG_REFERENCE_FO5,
   BBG_REFERENCE_FO6,
   BBG_REFERENCE_FO7,
   BBG_REFERENCE_FO8,
   BBG_REFERENCE_FO9,
   BBG_REFERENCE_FO10,
   ETL_THREAD_VAL)
  SELECT /*+PARALLEL(20)*/
   W_INT_ORG_D_RTL_TMP.ORG_WID,
   W_INT_ORG_DH_RTL_TMP.ORG_SCD1_WID,
   W_PRODUCT_D_RTL_TMP.PROD_IT_WID,
   W_PRODUCT_D_RTL_TMP.PROD_SCD1_WID,
   W_INT_ORG_DH_RTL_TMP.ORG_LC_WID,
   W_INT_ORG_DH_RTL_TMP.ORG_DS_WID,
   W_INT_ORG_DH_RTL_TMP.ORG_RG_WID,
   W_INT_ORG_DH_RTL_TMP.ORG_AR_WID,
   W_INT_ORG_DH_RTL_TMP.ORG_CH_WID,
   W_PRODUCT_D_RTL_TMP.PROD_DV_WID,
   W_PRODUCT_D_RTL_TMP.PROD_GP_WID,
   W_PRODUCT_D_RTL_TMP.PROD_DP_WID,
   W_PRODUCT_D_RTL_TMP.PROD_CL_WID,
   W_PRODUCT_D_RTL_TMP.PROD_SC_WID,
   W_MCAL_DAY_D.ROW_WID,
   W_MCAL_WEEK_D.ROW_WID,
   W_MCAL_DAY_D.MCAL_PERIOD_WID,
   W_MCAL_DAY_D.MCAL_QTR_WID,
   TO_DATE(SUBSTR(STG_BBG_RA_SLS_IT_LC_DY_FS.DT_WID, 2, 8), 'YYYYMMDD'),
   W_MCAL_WEEK_D.MCAL_YEAR || W_MCAL_WEEK_D.MCAL_WEEK,
   W_MCAL_DAY_D.MCAL_YEAR || W_MCAL_DAY_D.MCAL_PERIOD,
   W_MCAL_DAY_D.MCAL_YEAR || W_MCAL_DAY_D.MCAL_QTR,
   W_INT_ORG_DH_RTL_TMP.ORG_NUM,
   W_INT_ORG_DH_RTL_TMP.ORG_DS_NUM,
   W_INT_ORG_DH_RTL_TMP.ORG_RG_NUM,
   W_INT_ORG_DH_RTL_TMP.ORG_AR_NUM,
   W_INT_ORG_DH_RTL_TMP.ORG_CH_NUM,
   W_PRODUCT_D_RTL_TMP.PROD_IT_NUM,
   W_PRODUCT_D_RTL_TMP.PROD_SC_NUM,
   W_PRODUCT_D_RTL_TMP.PROD_CL_NUM,
   W_PRODUCT_D_RTL_TMP.PROD_DP_NUM,
   W_PRODUCT_D_RTL_TMP.PROD_GP_NUM,
   W_PRODUCT_D_RTL_TMP.PROD_DV_NUM,
   W_PARTY_ORG_D.ROW_WID,
   W_PARTY_ORG_D.SUPPLIER_NUM,
   BBG_RA_ITEM_LOC_D.ROW_WID,
   NVL(BBG_RA_ITEM_LOC_SUPP_D.ROW_WID, -1),
   STG_BBG_RA_SLS_IT_LC_DY_FS.SUPP_SALES_QTY,
   STG_BBG_RA_SLS_IT_LC_DY_FS.SUPP_SALES_COST,
   STG_BBG_RA_SLS_IT_LC_DY_FS.SUPP_SALES_AMT,
   STG_BBG_RA_SLS_IT_LC_DY_FS.AUX1_CHANGED_ON_DT,
   STG_BBG_RA_SLS_IT_LC_DY_FS.AUX2_CHANGED_ON_DT,
   STG_BBG_RA_SLS_IT_LC_DY_FS.AUX3_CHANGED_ON_DT,
   STG_BBG_RA_SLS_IT_LC_DY_FS.AUX4_CHANGED_ON_DT,
   STG_BBG_RA_SLS_IT_LC_DY_FS.CHANGED_BY_ID,
   STG_BBG_RA_SLS_IT_LC_DY_FS.CHANGED_ON_DT,
   STG_BBG_RA_SLS_IT_LC_DY_FS.CREATED_BY_ID,
   STG_BBG_RA_SLS_IT_LC_DY_FS.CREATED_ON_DT,
   STG_BBG_RA_SLS_IT_LC_DY_FS.DATASOURCE_NUM_ID,
   STG_BBG_RA_SLS_IT_LC_DY_FS.DELETE_FLG,
   STG_BBG_RA_SLS_IT_LC_DY_FS.DOC_CURR_CODE,
   STG_BBG_RA_SLS_IT_LC_DY_FS.GLOBAL1_EXCHANGE_RATE,
   STG_BBG_RA_SLS_IT_LC_DY_FS.GLOBAL2_EXCHANGE_RATE,
   STG_BBG_RA_SLS_IT_LC_DY_FS.GLOBAL3_EXCHANGE_RATE,
   STG_BBG_RA_SLS_IT_LC_DY_FS.LOC_CURR_CODE,
   1.0,
   STG_BBG_RA_SLS_IT_LC_DY_FS.TENANT_ID,
   STG_BBG_RA_SLS_IT_LC_DY_FS.X_CUSTOM,
   STG_BBG_RA_SLS_IT_LC_DY_FS.INTEGRATION_ID,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_DO1,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_DO2,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_DO3,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_DO4,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_DO5,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO1,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO2,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO3,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO4,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO5,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO6,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO7,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO8,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO9,
   STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_REFERENCE_FO10,
   STG_BBG_RA_SLS_IT_LC_DY_FS.ETL_THREAD_VAL
    FROM RADM.W_MCAL_DAY_D                   W_MCAL_DAY_D,
         RABATCHER.W_PRODUCT_D_RTL_TMP       W_PRODUCT_D_RTL_TMP,
         RABATCHER.W_INT_ORG_DH_RTL_TMP      W_INT_ORG_DH_RTL_TMP,
         RABATCHER.W_INT_ORG_D_RTL_TMP       W_INT_ORG_D_RTL_TMP,
         RADM.W_PARTY_ORG_D                  W_PARTY_ORG_D,
         RADM.BBG_RA_ITEM_LOC_D              BBG_RA_ITEM_LOC_D,
         RADM.BBG_RA_ITEM_LOC_SUPP_D         BBG_RA_ITEM_LOC_SUPP_D,
         RADM.W_MCAL_WEEK_D                  W_MCAL_WEEK_D,
         RADM.BBG_RA_SUPP_SLS_IT_LC_DY_F_BAK STG_BBG_RA_SLS_IT_LC_DY_FS
   WHERE (1 = 1)
     AND (W_MCAL_DAY_D.MCAL_DAY_DT =
         TO_DATE(SUBSTR(STG_BBG_RA_SLS_IT_LC_DY_FS.DT_WID, 2, 8),
                  'YYYYMMDD'))
     AND (W_PRODUCT_D_RTL_TMP.PROD_IT_WID =
         STG_BBG_RA_SLS_IT_LC_DY_FS.PROD_WID)
     AND (W_INT_ORG_DH_RTL_TMP.ORG_LC_WID =
         STG_BBG_RA_SLS_IT_LC_DY_FS.ORG_DH_WID)
     AND (W_INT_ORG_D_RTL_TMP.ORG_WID = STG_BBG_RA_SLS_IT_LC_DY_FS.ORG_WID)
     AND (W_PARTY_ORG_D.ROW_WID = STG_BBG_RA_SLS_IT_LC_DY_FS.SUPPLIER_WID)
     AND (BBG_RA_ITEM_LOC_D.ROW_WID =
         STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_ITEM_LOC_WID)
     AND (BBG_RA_ITEM_LOC_SUPP_D.ROW_WID(+) =
         STG_BBG_RA_SLS_IT_LC_DY_FS.BBG_ITEM_LOC_SUPP_WID)
     AND ((((W_MCAL_DAY_D.MCAL_DAY_DT BETWEEN
         W_MCAL_WEEK_D.MCAL_WEEK_START_DT AND
         W_MCAL_WEEK_D.MCAL_WEEK_END_DT)) AND
         W_MCAL_DAY_D.DATASOURCE_NUM_ID = W_MCAL_WEEK_D.DATASOURCE_NUM_ID))
     AND (W_PARTY_ORG_D.SUPPLIER_FLG = 'Y');
COMMIT;

--2.
SELECT DISTINCT T.DT_WID
  FROM RADM.BBG_RA_SLS_IT_DY_A T
 WHERE T.DT_WID BETWEEN 120161225000 AND T.120170102000
 ORDER BY T.DT_WID;
--3.

--4.

--5.

--6.

--7.

SELECT * FROM RABATCHER.BBG_RA_SUPP_SLS_IT_LC_DY_TMP;
