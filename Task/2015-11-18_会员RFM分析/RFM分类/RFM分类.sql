--R
SELECT A.DAYS R, COUNT(1) CNT
  FROM (SELECT T.HYK_NO, TRUNC(&DAYS) - T.VIP_RECENCY_DATE DAYS
          FROM (WITH MAXR AS (SELECT /*+PARALLEL(16)*/
                               HYK_NO,
                               MAX(TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD')) RECENCY,
                               MAX(TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD')) - 30 MONTH_DAYS,
                               MAX(TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD')) - 365 YEAR_DAYS
                                FROM RADM.BBG_RA_RFM_VIP_F
                               WHERE TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD') <=
                                     &DAYS
                               GROUP BY HYK_NO), A AS (SELECT /*+PARALLEL(16)*/
                                                        *
                                                         FROM RADM.BBG_RA_RFM_VIP_F
                                                        WHERE TO_DATE(SUBSTR(DT_WID,
                                                                             2,
                                                                             8),
                                                                      'YYYYMMDD') <=
                                                              &DAYS)
                 SELECT /*+PARALLEL(16)*/
                  A.HYK_NO,
                  TO_CHAR(&DAYS, 'YYYYMM') MN_WID,
                  MAX(A.DATASOURCE_NUM_ID) DATASOURCE_NUM_ID,
                  MAX(A.ETL_THREAD_VAL) ETL_THREAD_VAL,
                  A.HYK_NO || '~' || TO_CHAR(&DAYS, 'YYYYMM') INTEGRATION_ID,
                  MAX(TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD')) VIP_RECENCY_DATE,
                  COUNT(CASE
                          WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                               B.MONTH_DAYS AND B.RECENCY THEN
                           1
                          ELSE
                           NULL
                        END) VIP_MONTH_FREQ,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_QTY
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_TAX_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_QTY
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_TAX_AMT_LCL,
                  ----------------------------------------------------------------------
                  COUNT(CASE
                          WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                               B.YEAR_DAYS AND B.RECENCY THEN
                           1
                          ELSE
                           NULL
                        END) VIP_YEAR_FREQ,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_QTY
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_TAX_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_QTY
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_TAX_AMT_LCL
                   FROM A, MAXR B
                  WHERE A.HYK_NO = B.HYK_NO
                  GROUP BY A.HYK_NO) T
        ) A
 --WHERE A.DAYS <= 300
 GROUP BY A.DAYS
 ORDER BY A.DAYS;

--F
SELECT A.FREQ F, COUNT(1) CNT
  FROM (SELECT T.HYK_NO, T.VIP_MONTH_FREQ FREQ
          FROM (WITH MAXR AS (SELECT /*+PARALLEL(16)*/
                               HYK_NO,
                               MAX(TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD')) RECENCY,
                               MAX(TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD')) - 30 MONTH_DAYS,
                               MAX(TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD')) - 365 YEAR_DAYS
                                FROM RADM.BBG_RA_RFM_VIP_F
                               WHERE TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD') <=
                                     &DAYS
                               GROUP BY HYK_NO), A AS (SELECT /*+PARALLEL(16)*/
                                                        *
                                                         FROM RADM.BBG_RA_RFM_VIP_F
                                                        WHERE TO_DATE(SUBSTR(DT_WID,
                                                                             2,
                                                                             8),
                                                                      'YYYYMMDD') <=
                                                              &DAYS)
                 SELECT /*+PARALLEL(16)*/
                  A.HYK_NO,
                  TO_CHAR(&DAYS, 'YYYYMM') MN_WID,
                  MAX(A.DATASOURCE_NUM_ID) DATASOURCE_NUM_ID,
                  MAX(A.ETL_THREAD_VAL) ETL_THREAD_VAL,
                  A.HYK_NO || '~' || TO_CHAR(&DAYS, 'YYYYMM') INTEGRATION_ID,
                  MAX(TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD')) VIP_RECENCY_DATE,
                  COUNT(CASE
                          WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                               B.MONTH_DAYS AND B.RECENCY THEN
                           1
                          ELSE
                           NULL
                        END) VIP_MONTH_FREQ,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_QTY
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_TAX_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_QTY
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_TAX_AMT_LCL,
                  ----------------------------------------------------------------------
                  COUNT(CASE
                          WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                               B.YEAR_DAYS AND B.RECENCY THEN
                           1
                          ELSE
                           NULL
                        END) VIP_YEAR_FREQ,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_QTY
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_TAX_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_QTY
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_TAX_AMT_LCL
                   FROM A, MAXR B
                  WHERE A.HYK_NO = B.HYK_NO
                  GROUP BY A.HYK_NO) T
        ) A
 /*WHERE A.FREQ <= 200
   AND A.FREQ > 0*/
 GROUP BY A.FREQ
 ORDER BY A.FREQ;

--M 
SELECT A.AMT M, COUNT(1) CNT
  FROM (SELECT T.HYK_NO, ROUND(NVL(T.VIP_MONTH_SLS_AMT_LCL, 0), 0) AMT
          FROM (WITH MAXR AS (SELECT /*+PARALLEL(16)*/
                               HYK_NO,
                               MAX(TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD')) RECENCY,
                               MAX(TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD')) - 30 MONTH_DAYS,
                               MAX(TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD')) - 365 YEAR_DAYS
                                FROM RADM.BBG_RA_RFM_VIP_F
                               WHERE TO_DATE(SUBSTR(DT_WID, 2, 8), 'YYYYMMDD') <=
                                     &DAYS
                               GROUP BY HYK_NO), A AS (SELECT /*+PARALLEL(16)*/
                                                        *
                                                         FROM RADM.BBG_RA_RFM_VIP_F
                                                        WHERE TO_DATE(SUBSTR(DT_WID,
                                                                             2,
                                                                             8),
                                                                      'YYYYMMDD') <=
                                                              &DAYS)
                 SELECT /*+PARALLEL(16)*/
                  A.HYK_NO,
                  TO_CHAR(&DAYS, 'YYYYMM') MN_WID,
                  MAX(A.DATASOURCE_NUM_ID) DATASOURCE_NUM_ID,
                  MAX(A.ETL_THREAD_VAL) ETL_THREAD_VAL,
                  A.HYK_NO || '~' || TO_CHAR(&DAYS, 'YYYYMM') INTEGRATION_ID,
                  MAX(TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD')) VIP_RECENCY_DATE,
                  COUNT(CASE
                          WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                               B.MONTH_DAYS AND B.RECENCY THEN
                           1
                          ELSE
                           NULL
                        END) VIP_MONTH_FREQ,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_QTY
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.SLS_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_SLS_TAX_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_QTY
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.MONTH_DAYS AND B.RECENCY THEN
                         A.RET_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_MONTH_RET_TAX_AMT_LCL,
                  ----------------------------------------------------------------------
                  COUNT(CASE
                          WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                               B.YEAR_DAYS AND B.RECENCY THEN
                           1
                          ELSE
                           NULL
                        END) VIP_YEAR_FREQ,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_QTY
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.SLS_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_SLS_TAX_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_QTY
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_QTY,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_PROFIT_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_PROFIT_AMT_LCL,
                  SUM(CASE
                        WHEN TO_DATE(SUBSTR(A.DT_WID, 2, 8), 'YYYYMMDD') BETWEEN
                             B.YEAR_DAYS AND B.RECENCY THEN
                         A.RET_TAX_AMT_LCL
                        ELSE
                         NULL
                      END) VIP_YEAR_RET_TAX_AMT_LCL
                   FROM A, MAXR B
                  WHERE A.HYK_NO = B.HYK_NO
                  GROUP BY A.HYK_NO) T
        ) A
 --WHERE A.AMT > 0
 GROUP BY A.AMT
 ORDER BY A.AMT;
