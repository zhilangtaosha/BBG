--备份修改之前的信息
CREATE TABLE RADM.JIN_CHANGE_LOC_20140901 AS
SELECT *
  FROM RADM.W_INT_ORG_DH T
 WHERE EXISTS
 (SELECT 1
          FROM RADM.W_INT_ORG_DH D
         GROUP BY D.INTEGRATION_ID
        HAVING COUNT(*) > 1 AND T.INTEGRATION_ID = D.INTEGRATION_ID)
 ORDER BY T.INTEGRATION_ID, T.EFFECTIVE_FROM_DT;

--修改信息
SELECT T.ROW_WID,
       T.INTEGRATION_ID， T.ORG_HIER13_NUM, --业态
       T.ORG_HIER12_NUM, --省份
       T.ORG_HIER11_NUM, --区域
       T.ORG_HIER10_NUM, --城市
       T.ORG_HIER9_NUM, --门店
       T.EFFECTIVE_FROM_DT,
       T.EFFECTIVE_TO_DT,
       T.CURRENT_FLG
  FROM RADM.W_INT_ORG_DH T
 WHERE EXISTS
 (SELECT 1
          FROM RADM.W_INT_ORG_DH D
         GROUP BY D.INTEGRATION_ID
        HAVING COUNT(*) > 1 AND T.INTEGRATION_ID = D.INTEGRATION_ID)
 ORDER BY T.INTEGRATION_ID, T.EFFECTIVE_FROM_DT
   FOR UPDATE;

SELECT * FROM RADM.W_INT_ORG_DH T WHERE T.LEVEL_NAME='REGION';
SELECT * FROM RADM.JIN_CHANGE_LOC_20140901 
