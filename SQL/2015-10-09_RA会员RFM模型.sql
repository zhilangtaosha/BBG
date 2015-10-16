--消费(Recency)、消费频率(Frequency)、消费金额(Monetary)
--1.会员卡号、交易小票号、日期维度、ORG_WID、ORG_DH_WID、ORG_SCD1_WID、消费金额
SELECT /*+PARALLEL(20)*/
 T.HYK_NO,
 T.SLS_TRX_ID,
 T.DT_WID,
 T.ORG_WID,
 T.ORG_DH_WID,
 T.ORG_SCD1_WID,
 SUM((T.SLS_AMT_LCL - T.SLS_TAX_AMT_LCL) -
     (T.RET_AMT_LCL - T.RET_TAX_AMT_LCL)) Monetary
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
        ROUND(A.Monetary, 2)
       ELSE
        0
     END) MONETARY
  FROM (SELECT /*+PARALLEL(20)*/
         T.HYK_NO,
         T.SLS_TRX_ID,
         T.DT_WID,
         SUM((T.SLS_AMT_LCL - T.SLS_TAX_AMT_LCL) -
             (T.RET_AMT_LCL - T.RET_TAX_AMT_LCL)) Monetary
          FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
         WHERE T.HYK_NO IS NOT NULL
         GROUP BY T.HYK_NO, T.SLS_TRX_ID, T.DT_WID) A
 GROUP BY A.HYK_NO;

--3.按门店统计RFM会员数
