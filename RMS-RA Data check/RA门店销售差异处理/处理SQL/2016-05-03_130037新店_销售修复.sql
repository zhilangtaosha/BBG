--2016.4.29~2016.5.3_130037销售修复，原因：商品-地点维度缺失。

--1.找出未接入RA
SELECT /*+PARALLEL(16)*/
DISTINCT A.DAY_DT, A.ORG_NUM, A.PROD_IT_NUM
  FROM BBG_RA_SLS_TRX_JL_V@RA_JL A
 WHERE A.DAY_DT = DATE '2016-04-29'
   AND NOT EXISTS (SELECT /*+PARALLEL(16)*/
         1
          FROM RADM.W_RTL_SLS_IT_LC_DY_A B,
               RADM.W_PRODUCT_D          P,
               RADM.W_INT_ORG_D          O
         WHERE B.PROD_WID = P.ROW_WID
           AND B.ORG_WID = O.ROW_WID
           AND B.DT_WID = 120160429000
           AND A.ORG_NUM = O.ORG_NUM
           AND A.PROD_IT_NUM = P.PROD_NUM);

--2.销售数据插入(商品销售、供应商销售)
--2.1.商品销售
TRUNCATE TABLE RADM.W_RTL_SLS_TRX_IT_LC_DY_FS;
INSERT INTO RADM.W_RTL_SLS_TRX_IT_LC_DY_FS
  (SLS_TRX_ID,
   PROD_IT_NUM,
   ORG_NUM,
   DAY_DT,
   VOUCHER_ID,
   RTL_TYPE_CODE,
   MIN_NUM,
   EMPLOYEE_NUM,
   SLS_QTY,
   SLS_AMT_LCL,
   SLS_PROFIT_AMT_LCL,
   SLS_TAX_AMT_LCL,
   SLS_EMP_DISC_AMT_LCL,
   SLS_MANUAL_COUNT,
   SLS_SCAN_COUNT,
   RET_QTY,
   RET_AMT_LCL,
   RET_PROFIT_AMT_LCL,
   RET_TAX_AMT_LCL,
   RET_EMP_DISC_AMT_LCL,
   RET_MANUAL_COUNT,
   RET_SCAN_COUNT,
   REJECT_FLG,
   SLS_MANUAL_MKDN_AMT_LCL,
   SLS_MANUAL_MKUP_AMT_LCL,
   RET_MANUAL_MKDN_AMT_LCL,
   RET_MANUAL_MKUP_AMT_LCL,
   EXCHANGE_DT,
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
   ETL_THREAD_VAL,
   GLOBAL1_EXCHANGE_RATE,
   GLOBAL2_EXCHANGE_RATE,
   GLOBAL3_EXCHANGE_RATE,
   INTEGRATION_ID,
   LOC_CURR_CODE,
   LOC_EXCHANGE_RATE,
   TENANT_ID,
   X_CUSTOM,
   BBG_RETAIL_TYPE_ID,
   BBG_SERVICE_SATISFACTION,
   SRC_REF_NO1,
   SRC_REF_NO2,
   SRC_REF_NO3,
   SRC_REF_NO6,
   SRC_REF_NO7,
   SRC_REF_NO8,
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
   HYK_NO)
  SELECT /*+PARALLEL(16)*/
   T.SLS_TRX_ID,
   T.PROD_IT_NUM,
   T.ORG_NUM,
   T.DAY_DT,
   -1 VOUCHER_ID,
   T.RTL_TYPE_CODE,
   T.MIN_NUM,
   -1 EMPLOYEE_NUM,
   T.SLS_QTY,
   T.SLS_AMT_LCL,
   T.SLS_PROFIT_AMT_LCL,
   T.SLS_TAX_AMT_LCL,
   T.SLS_EMP_DISC_AMT_LCL,
   T.SLS_MANUAL_COUNT,
   T.SLS_SCAN_COUNT,
   T.RET_QTY RET_QTY,
   T.RET_AMT_LCL RET_AMT_LCL,
   T.RET_PROFIT_AMT_LCL,
   T.RET_TAX_AMT_LCL RET_TAX_AMT_LCL,
   T.RET_EMP_DISC_AMT_LCL,
   T.RET_MANUAL_COUNT,
   T.RET_SCAN_COUNT,
   NULL REJECT_FLG,
   T.SLS_MANUAL_MKDN_AMT_LCL,
   T.SLS_MANUAL_MKUP_AMT_LCL,
   T.RET_MANUAL_MKDN_AMT_LCL,
   T.RET_MANUAL_MKUP_AMT_LCL,
   T.DAY_DT EXCHANGE_DT,
   NULL AUX1_CHANGED_ON_DT,
   NULL AUX2_CHANGED_ON_DT,
   NULL AUX3_CHANGED_ON_DT,
   NULL AUX4_CHANGED_ON_DT,
   -1 CHANGED_BY_ID,
   SYSDATE CHANGED_ON_DT,
   -1 CREATED_BY_ID,
   SYSDATE CREATED_ON_DT,
   1 DATASOURCE_NUM_ID,
   NULL DELETE_FLG,
   'CNY' DOC_CURR_CODE,
   (SELECT L.THREAD_VAL
      FROM RA_RMS.RA_RESTART_LOC@RA_RMS_DBLINK L
     WHERE T.ORG_NUM = L.DRIVER_VALUE
       AND L.SCENARIO_NAME = 'SDE_BBG_RETAIL_SALESTRANSACTIONFACT') ETL_THREAD_VAL,
   NULL GLOBAL1_EXCHANGE_RATE,
   NULL GLOBAL2_EXCHANGE_RATE,
   NULL GLOBAL3_EXCHANGE_RATE,
   T.SLS_TRX_ID || '~' || T.PROD_IT_NUM || '~-1~' ||
   TO_CHAR(T.DAY_DT, 'DD-MON-YY', 'NLS_DATE_LANGUAGE = American') INTEGRATION_ID,
   'CNY' LOC_CURR_CODE,
   NULL LOC_EXCHANGE_RATE,
   NULL TENANT_ID,
   NULL X_CUSTOM,
   T.BBG_RETAIL_TYPE_ID,
   3.5 BBG_SERVICE_SATISFACTION,
   NULL SRC_REF_NO1,
   NULL SRC_REF_NO2,
   NULL SRC_REF_NO3,
   T.PROD_IT_NUM SRC_REF_NO6,
   NULL SRC_REF_NO7,
   NULL SRC_REF_NO8,
   NULL BBG_REFERENCE_DO1,
   NULL BBG_REFERENCE_DO2,
   NULL BBG_REFERENCE_DO3,
   NULL BBG_REFERENCE_DO4,
   NULL BBG_REFERENCE_DO5,
   NULL BBG_REFERENCE_FO1,
   NULL BBG_REFERENCE_FO2,
   NULL BBG_REFERENCE_FO3,
   NULL BBG_REFERENCE_FO4,
   NULL BBG_REFERENCE_FO5,
   NULL BBG_REFERENCE_FO6,
   NULL BBG_REFERENCE_FO7,
   NULL BBG_REFERENCE_FO8,
   NULL BBG_REFERENCE_FO9,
   NULL BBG_REFERENCE_FO10,
   T.HYK_NO HYK_NO
    FROM (SELECT /*+PARALLEL(16)*/
           B.SLS_TRX_ID,
           B.PROD_IT_NUM,
           B.ORG_NUM,
           B.DAY_DT,
           B.VOUCHER_ID,
           B.RTL_TYPE_CODE,
           B.MIN_NUM,
           B.SLS_QTY,
           B.SLS_AMT_LCL,
           B.SLS_PROFIT_AMT_LCL,
           B.SLS_TAX_AMT_LCL,
           B.SLS_EMP_DISC_AMT_LCL,
           B.SLS_MANUAL_COUNT,
           B.SLS_SCAN_COUNT,
           -B.RET_QTY                 RET_QTY,
           -B.RET_AMT_LCL             RET_AMT_LCL,
           -B.RET_PROFIT_AMT_LCL      RET_PROFIT_AMT_LCL,
           -B.RET_TAX_AMT_LCL         RET_TAX_AMT_LCL,
           -B.RET_EMP_DISC_AMT_LCL    RET_EMP_DISC_AMT_LCL,
           -B.RET_MANUAL_COUNT        RET_MANUAL_COUNT,
           -B.RET_SCAN_COUNT          RET_SCAN_COUNT,
           B.SLS_MANUAL_MKDN_AMT_LCL,
           B.SLS_MANUAL_MKUP_AMT_LCL,
           -B.RET_MANUAL_MKDN_AMT_LCL RET_MANUAL_MKDN_AMT_LCL,
           -B.RET_MANUAL_MKUP_AMT_LCL RET_MANUAL_MKUP_AMT_LCL,
           B.BBG_RETAIL_TYPE_ID,
           B.HYK_NO
            FROM BBG_RA_SLS_TRX_JL_V@RA_JL B
           WHERE B.DAY_DT = &DAY_DT
             AND EXISTS
           (SELECT /*+PARALLEL(16)*/
                   1
                    FROM (SELECT /*+PARALLEL(16)*/
                          DISTINCT A.DAY_DT, A.ORG_NUM, A.PROD_IT_NUM
                            FROM BBG_RA_SLS_TRX_JL_V@RA_JL A
                           WHERE A.DAY_DT = &DAY_DT
                             AND NOT EXISTS
                           (SELECT /*+PARALLEL(16)*/
                                   1
                                    FROM RADM.W_RTL_SLS_IT_LC_DY_A B,
                                         RADM.W_PRODUCT_D          P,
                                         RADM.W_INT_ORG_D          O
                                   WHERE B.PROD_WID = P.ROW_WID
                                     AND B.ORG_WID = O.ROW_WID
                                     AND B.DT_WID = &DT_WID
                                     AND A.ORG_NUM = O.ORG_NUM
                                     AND A.PROD_IT_NUM = P.PROD_NUM)) A
                   WHERE B.DAY_DT = A.DAY_DT
                     AND B.ORG_NUM = A.ORG_NUM
                     AND B.PROD_IT_NUM = A.PROD_IT_NUM)) T;
COMMIT;

--2.2.供应商销售
TRUNCATE TABLE RADM.BBG_RA_SLS_IT_LC_DY_FS;
INSERT INTO RADM.BBG_RA_SLS_IT_LC_DY_FS
  (DAY_DT,
   PROD_IT_NUM,
   ORG_NUM,
   SUPPLIER_NUM,
   SUPP_SALES_QTY,
   SUPP_SALES_COST,
   SUPP_SALES_AMT,
   CHANGED_BY_ID,
   CHANGED_ON_DT,
   CREATED_BY_ID,
   CREATED_ON_DT,
   DATASOURCE_NUM_ID,
   DELETE_FLG,
   ETL_THREAD_VAL,
   INTEGRATION_ID,
   AUX1_CHANGED_ON_DT,
   AUX2_CHANGED_ON_DT,
   AUX3_CHANGED_ON_DT,
   AUX4_CHANGED_ON_DT,
   DOC_CURR_CODE,
   GLOBAL1_EXCHANGE_RATE,
   GLOBAL2_EXCHANGE_RATE,
   GLOBAL3_EXCHANGE_RATE,
   LOC_CURR_CODE,
   LOC_EXCHANGE_RATE,
   TENANT_ID,
   X_CUSTOM,
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
   BBG_REFERENCE_FO10)
  SELECT /*+PARALLEL(16)*/
   T.DAY_DT,
   T.PROD_IT_NUM,
   T.ORG_NUM,
   T.SUPPLIER_NUM,
   T.SUPP_SALES_QTY,
   T.SUPP_SALES_COST,
   T.SUPP_SALES_AMT,
   -1 CHANGED_BY_ID,
   SYSDATE CHANGED_ON_DT,
   -1 CREATED_BY_ID,
   SYSDATE CREATED_ON_DT,
   1 DATASOURCE_NUM_ID,
   NULL DELETE_FLG,
   (SELECT L.THREAD_VAL
      FROM RA_RMS.RA_RESTART_LOC@RA_RMS_DBLINK L
     WHERE T.ORG_NUM = L.DRIVER_VALUE
       AND L.SCENARIO_NAME = 'SDE_BBG_RA_SUPP_SALES_IT_LC_DY_FS') ETL_THREAD_VAL,
   TO_CHAR(T.DAY_DT, 'DD-MON-YY', 'NLS_DATE_LANGUAGE = American') || '~' ||
   T.PROD_IT_NUM || '~' || T.ORG_NUM || '~' || T.SUPPLIER_NUM INTEGRATION_ID,
   NULL AUX1_CHANGED_ON_DT,
   NULL AUX2_CHANGED_ON_DT,
   NULL AUX3_CHANGED_ON_DT,
   NULL AUX4_CHANGED_ON_DT,
   'CNY' DOC_CURR_CODE,
   NULL GLOBAL1_EXCHANGE_RATE,
   NULL GLOBAL2_EXCHANGE_RATE,
   NULL GLOBAL3_EXCHANGE_RATE,
   'CNY' LOC_CURR_CODE,
   NULL LOC_EXCHANGE_RATE,
   NULL TENANT_ID,
   NULL X_CUSTOM,
   (SELECT IL.BUSINESS_MODE
      FROM RADM.BBG_RA_ITEM_LOC_D IL
     WHERE IL.ITEM = T.PROD_IT_NUM
       AND IL.LOC = T.ORG_NUM
       AND T.DAY_DT BETWEEN IL.EFFECTIVE_FROM_DT AND IL.EFFECTIVE_TO_DT) BBG_REFERENCE_DO1,
   'JINLI' BBG_REFERENCE_DO2,
   NULL BBG_REFERENCE_DO3,
   NULL BBG_REFERENCE_DO4,
   NULL BBG_REFERENCE_DO5,
   T.BBG_REFERENCE_FO1 BBG_REFERENCE_FO1,
   NULL BBG_REFERENCE_FO2,
   NULL BBG_REFERENCE_FO3,
   NULL BBG_REFERENCE_FO4,
   NULL BBG_REFERENCE_FO5,
   NULL BBG_REFERENCE_FO6,
   NULL BBG_REFERENCE_FO7,
   NULL BBG_REFERENCE_FO8,
   NULL BBG_REFERENCE_FO9,
   NULL BBG_REFERENCE_FO10
    FROM (SELECT /*+PARALLEL(16)*/
           A.DAY_DT,
           A.PROD_IT_NUM,
           A.ORG_NUM,
           A.SUPPLIER_NUM,
           A.SUPP_SALES_QTY,
           A.SUPP_SALES_COST,
           A.SUPP_SALES_AMT,
           A.BBG_REFERENCE_FO1
            FROM BBG_RA_SUPP_SLS_JL_V@RA_JL A
           WHERE A.DAY_DT = &DAY_DT
             AND EXISTS
           (SELECT 1
                    FROM (SELECT /*+PARALLEL(16)*/
                          DISTINCT A.DAY_DT, A.ORG_NUM, A.PROD_IT_NUM
                            FROM BBG_RA_SLS_TRX_JL_V@RA_JL A
                           WHERE A.DAY_DT = &DAY_DT
                             AND NOT EXISTS
                           (SELECT /*+PARALLEL(16)*/
                                   1
                                    FROM RADM.W_RTL_SLS_IT_LC_DY_A B,
                                         RADM.W_PRODUCT_D          P,
                                         RADM.W_INT_ORG_D          O
                                   WHERE B.PROD_WID = P.ROW_WID
                                     AND B.ORG_WID = O.ROW_WID
                                     AND B.DT_WID = &DT_WID
                                     AND A.ORG_NUM = O.ORG_NUM
                                     AND A.PROD_IT_NUM = P.PROD_NUM)) B
                   WHERE B.DAY_DT = A.DAY_DT
                     AND B.ORG_NUM = A.ORG_NUM
                     AND B.PROD_IT_NUM = A.PROD_IT_NUM)) T;
COMMIT;

--3.SIL
--Master_SIL_BBG_Retail_SalesTransactionFact

--Master_BBG_SIL_BBG_RA_SUPP_SALES_IT_LC_DY_F

--4.PLP
--PF.PLP_SALES_TRANSACTION

--BBG.CMX.RA.F20_SUPP_SALES




