/*
WITH TRX_A AS
 (SELECT T.SLS_TRX_ID, T.PROD_WID
    FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
   WHERE T.DT_WID BETWEEN 120151101000 AND 120151130000),
TRX_B AS
 (SELECT T.SLS_TRX_ID, T.PROD_WID
    FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
   WHERE T.DT_WID BETWEEN 120151101000 AND 120151130000)
SELECT TT.A_PROD, TT.B_PROD, COUNT(TT.SLS_TRX_ID)
  FROM (SELECT A.PROD_WID A_PROD, A.SLS_TRX_ID, B.PROD_WID B_PROD
          FROM TRX_A A, TRX_B B
         WHERE A.SLS_TRX_ID = B.SLS_TRX_ID
           AND A.PROD_WID <> B.PROD_WID) TT
 GROUP BY TT.A_PROD, TT.B_PROD
HAVING COUNT (TT.SLS_TRX_ID) > 1
 ORDER BY COUNT(TT.SLS_TRX_ID) DESC;
*/

--VIEW
--RADM.BBG_RA_MBA_VIEW 

--   
SELECT * FROM RADM.BBG_RA_MBA_VIEW T WHERE T.DT_WID = 120160127000;
SELECT *
  FROM (SELECT T.DT_WID,
               T.A_PROD,
               T.B_PROD,
               SUM(T.AB_CNT) AB_CNT,
               SUM(T.CNT) CNT
          FROM RADM.BBG_RA_MBA_VIEW T
         WHERE T.DT_WID = 120160127000
         GROUP BY T.DT_WID, T.A_PROD, T.B_PROD)
 ORDER BY AB_CNT DESC;

SELECT *
  FROM RADM.BBG_RA_MBA_VIEW T
 WHERE T.DT_WID = 120160127000
   AND T.A_PROD IN (351893, 288576)
   AND T.B_PROD IN (351893, 288576);

SELECT *
  FROM (SELECT T.DT_WID,
               T.A_PROD,
               T.B_PROD,
               SUM(T.AB_CNT) AB_CNT,
               SUM(T.CNT) CNT
          FROM RADM.BBG_RA_MBA_VIEW T
         WHERE T.DT_WID = 120160127000
           AND T.A_PROD IN (351893, 288576)
           AND T.B_PROD IN (351893, 288576)
         GROUP BY T.DT_WID, T.A_PROD, T.B_PROD)
 ORDER BY AB_CNT DESC;
