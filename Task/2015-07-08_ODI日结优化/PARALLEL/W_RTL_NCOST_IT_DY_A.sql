/* Formatted on 2016/8/9 5:57:17 (QP5 v5.256.13226.35510) */
INSERT INTO RADM.W_RTL_NCOST_IT_DY_A T
  (PROD_WID,
   PROD_SCD1_WID,
   DT_WID,
   SUPPLIER_WID,
   BASE_COST_AMT_LCL,
   BASE_COST_AMT,
   BASE_COST_AMT_GLOBAL1,
   BASE_COST_AMT_GLOBAL2,
   BASE_COST_AMT_GLOBAL3,
   NET_COST_AMT_LCL,
   NET_COST_AMT,
   NET_COST_AMT_GLOBAL1,
   NET_COST_AMT_GLOBAL2,
   NET_COST_AMT_GLOBAL3,
   NET_NET_COST_AMT_LCL,
   NET_NET_COST_AMT,
   NET_NET_COST_AMT_GLOBAL1,
   NET_NET_COST_AMT_GLOBAL2,
   NET_NET_COST_AMT_GLOBAL3,
   DEAD_NET_COST_AMT_LCL,
   DEAD_NET_COST_AMT,
   DEAD_NET_COST_AMT_GLOBAL1,
   DEAD_NET_COST_AMT_GLOBAL2,
   DEAD_NET_COST_AMT_GLOBAL3,
   DATASOURCE_NUM_ID,
   DELETE_FLG,
   ETL_PROC_WID,
   INTEGRATION_ID,
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
   BBG_REFERENCE_FO10,
   ROW_WID,
   W_INSERT_DT,
   W_UPDATE_DT)
  SELECT S.PROD_WID,
         S.PROD_SCD1_WID,
         S.DT_WID,
         S.SUPPLIER_WID,
         S.BASE_COST_AMT_LCL,
         S.BASE_COST_AMT,
         S.BASE_COST_AMT_GLOBAL1,
         S.BASE_COST_AMT_GLOBAL2,
         S.BASE_COST_AMT_GLOBAL3,
         S.NET_COST_AMT_LCL,
         S.NET_COST_AMT,
         S.NET_COST_AMT_GLOBAL1,
         S.NET_COST_AMT_GLOBAL2,
         S.NET_COST_AMT_GLOBAL3,
         S.NET_NET_COST_AMT_LCL,
         S.NET_NET_COST_AMT,
         S.NET_NET_COST_AMT_GLOBAL1,
         S.NET_NET_COST_AMT_GLOBAL2,
         S.NET_NET_COST_AMT_GLOBAL3,
         S.DEAD_NET_COST_AMT_LCL,
         S.DEAD_NET_COST_AMT,
         S.DEAD_NET_COST_AMT_GLOBAL1,
         S.DEAD_NET_COST_AMT_GLOBAL2,
         S.DEAD_NET_COST_AMT_GLOBAL3,
         S.DATASOURCE_NUM_ID,
         S.DELETE_FLG,
         S.ETL_PROC_WID,
         S.INTEGRATION_ID,
         S.TENANT_ID,
         S.X_CUSTOM,
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
         S.BBG_REFERENCE_FO10,
         RADM.W_RTL_NCOST_IT_DY_A_SEQ.NEXTVAL,
         SYSDATE,
         SYSDATE
    FROM (SELECT /*+PARALLEL(8)*/
           RTL_NCOST_IT_DY_TMP.PROD_IT_WID PROD_WID,
           RTL_NCOST_IT_DY_TMP.PROD_SCD1_WID PROD_SCD1_WID,
           RTL_NCOST_IT_DY_TMP.DT_WID DT_WID,
           RTL_NCOST_IT_DY_TMP.SUPPLIER_WID SUPPLIER_WID,
           RTL_NCOST_IT_DY_TMP.BASE_COST_AMT_LCL BASE_COST_AMT_LCL,
           RTL_NCOST_IT_DY_TMP.BASE_COST_AMT BASE_COST_AMT,
           RTL_NCOST_IT_DY_TMP.BASE_COST_AMT_GLOBAL1 BASE_COST_AMT_GLOBAL1,
           RTL_NCOST_IT_DY_TMP.BASE_COST_AMT_GLOBAL2 BASE_COST_AMT_GLOBAL2,
           RTL_NCOST_IT_DY_TMP.BASE_COST_AMT_GLOBAL3 BASE_COST_AMT_GLOBAL3,
           RTL_NCOST_IT_DY_TMP.NET_COST_AMT_LCL NET_COST_AMT_LCL,
           RTL_NCOST_IT_DY_TMP.NET_COST_AMT NET_COST_AMT,
           RTL_NCOST_IT_DY_TMP.NET_COST_AMT_GLOBAL1 NET_COST_AMT_GLOBAL1,
           RTL_NCOST_IT_DY_TMP.NET_COST_AMT_GLOBAL2 NET_COST_AMT_GLOBAL2,
           RTL_NCOST_IT_DY_TMP.NET_COST_AMT_GLOBAL3 NET_COST_AMT_GLOBAL3,
           RTL_NCOST_IT_DY_TMP.NET_NET_COST_AMT_LCL NET_NET_COST_AMT_LCL,
           RTL_NCOST_IT_DY_TMP.NET_NET_COST_AMT NET_NET_COST_AMT,
           RTL_NCOST_IT_DY_TMP.NET_NET_COST_AMT_GLOBAL1 NET_NET_COST_AMT_GLOBAL1,
           RTL_NCOST_IT_DY_TMP.NET_NET_COST_AMT_GLOBAL2 NET_NET_COST_AMT_GLOBAL2,
           RTL_NCOST_IT_DY_TMP.NET_NET_COST_AMT_GLOBAL3 NET_NET_COST_AMT_GLOBAL3,
           RTL_NCOST_IT_DY_TMP.DEAD_NET_COST_AMT_LCL DEAD_NET_COST_AMT_LCL,
           RTL_NCOST_IT_DY_TMP.DEAD_NET_COST_AMT DEAD_NET_COST_AMT,
           RTL_NCOST_IT_DY_TMP.DEAD_NET_COST_AMT_GLOBAL1 DEAD_NET_COST_AMT_GLOBAL1,
           RTL_NCOST_IT_DY_TMP.DEAD_NET_COST_AMT_GLOBAL2 DEAD_NET_COST_AMT_GLOBAL2,
           RTL_NCOST_IT_DY_TMP.DEAD_NET_COST_AMT_GLOBAL3 DEAD_NET_COST_AMT_GLOBAL3,
           RTL_NCOST_IT_DY_TMP.DATASOURCE_NUM_ID DATASOURCE_NUM_ID,
           RTL_NCOST_IT_DY_TMP.DELETE_FLG DELETE_FLG,
           100 ETL_PROC_WID,
           RTL_NCOST_IT_DY_TMP.PROD_IT_NUM || '~' ||
           RTL_NCOST_IT_DY_TMP.DAY_DT || '~' ||
           RTL_NCOST_IT_DY_TMP.SUPPLIER_NUM INTEGRATION_ID,
           RTL_NCOST_IT_DY_TMP.TENANT_ID TENANT_ID,
           RTL_NCOST_IT_DY_TMP.X_CUSTOM X_CUSTOM,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_DO1 BBG_REFERENCE_DO1,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_DO2 BBG_REFERENCE_DO2,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_DO3 BBG_REFERENCE_DO3,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_DO4 BBG_REFERENCE_DO4,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_DO5 BBG_REFERENCE_DO5,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO1 BBG_REFERENCE_FO1,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO2 BBG_REFERENCE_FO2,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO3 BBG_REFERENCE_FO3,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO4 BBG_REFERENCE_FO4,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO5 BBG_REFERENCE_FO5,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO6 BBG_REFERENCE_FO6,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO7 BBG_REFERENCE_FO7,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO8 BBG_REFERENCE_FO8,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO9 BBG_REFERENCE_FO9,
           RTL_NCOST_IT_DY_TMP.BBG_REFERENCE_FO10 BBG_REFERENCE_FO10
            FROM RABATCHER.W_RTL_NCOST_IT_DY_TMP RTL_NCOST_IT_DY_TMP
           WHERE (1 = 1)) S
