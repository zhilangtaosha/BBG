CREATE OR REPLACE VIEW BBG_RA_SLS_MBA_LC_DY_FV AS
WITH ALL_TRX AS
--门店交易笔数
 (SELECT T.DT_WID,
         T.ORG_WID,
         T.ORG_DH_WID,
         T.ORG_SCD1_WID,
         COUNT(T.SLS_TRX_ID) LOC_CNT
    FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
   GROUP BY T.DT_WID, T.ORG_WID, T.ORG_DH_WID, T.ORG_SCD1_WID),
A_TRX AS
--包含A的交易笔数
 (SELECT T.DT_WID,
         T.PROD_WID,
         T.PROD_SCD1_WID,
         T.ORG_WID,
         T.ORG_DH_WID,
         T.ORG_SCD1_WID,
         COUNT(T.SLS_TRX_ID) A_CNT
    FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
   GROUP BY T.DT_WID,
            T.PROD_WID,
            T.PROD_SCD1_WID,
            T.ORG_WID,
            T.ORG_DH_WID,
            T.ORG_SCD1_WID
  HAVING COUNT(T.SLS_TRX_ID) > 1),
B_TRX AS
--包含B的交易笔数
 (SELECT T.DT_WID,
         T.PROD_WID,
         T.PROD_SCD1_WID,
         T.ORG_WID,
         T.ORG_DH_WID,
         T.ORG_SCD1_WID,
         COUNT(T.SLS_TRX_ID) B_CNT
    FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
   GROUP BY T.DT_WID,
            T.PROD_WID,
            T.PROD_SCD1_WID,
            T.ORG_WID,
            T.ORG_DH_WID,
            T.ORG_SCD1_WID
  HAVING COUNT(T.SLS_TRX_ID) > 1)
--------------------------------------------------
SELECT MBA.DT_WID,
       MBA.ORG_WID,
       MBA.ORG_DH_WID,
       MBA.ORG_SCD1_WID,
       A_PROD.PROD_NUM     A_PROD_NUM,
       A_PROD.PRODUCT_NAME A_PROD_NAME,
       B_PROD.PROD_NUM     B_PROD_NUM,
       B_PROD.PRODUCT_NAME B_PROD_NAME,
       MBA.A_CNT,
       MBA.B_CNT,
       MBA.AB_CNT,
       MBA.LOC_CNT
  FROM (SELECT TT1.DT_WID,
               TT1.ORG_WID,
               TT1.ORG_DH_WID,
               TT1.ORG_SCD1_WID,
               TT1.A_PROD_WID,
               TT1.A_PROD_SCD1_WID,
               TT1.B_PROD_WID,
               TT1.B_PROD_SCD1_WID,
               A_TRX.A_CNT,
               B_TRX.B_CNT,
               TT1.AB_CNT,
               ATR.LOC_CNT
          FROM (SELECT AB.DT_WID,
                       AB.ORG_WID,
                       AB.ORG_DH_WID,
                       AB.ORG_SCD1_WID,
                       AB.A_PROD_WID,
                       AB.A_PROD_SCD1_WID,
                       AB.B_PROD_WID,
                       AB.B_PROD_SCD1_WID,
                       COUNT(AB.SLS_TRX_ID) AB_CNT
                  FROM --购物篮AB关联
                       (SELECT A.DT_WID,
                               A.ORG_WID,
                               A.ORG_DH_WID,
                               A.ORG_SCD1_WID,
                               A.SLS_TRX_ID,
                               A.PROD_WID      A_PROD_WID,
                               A.PROD_SCD1_WID A_PROD_SCD1_WID,
                               B.PROD_WID      B_PROD_WID,
                               B.PROD_SCD1_WID B_PROD_SCD1_WID
                          FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F A,
                               RADM.W_RTL_SLS_TRX_IT_LC_DY_F B
                         WHERE A.SLS_TRX_ID = B.SLS_TRX_ID
                           AND A.DT_WID = B.DT_WID
                           AND A.ORG_WID = B.ORG_WID
                           AND A.ORG_DH_WID = B.ORG_DH_WID
                           AND A.ORG_SCD1_WID = B.ORG_SCD1_WID
                           AND A.PROD_WID <> B.PROD_WID) AB
                 GROUP BY AB.DT_WID,
                          AB.ORG_WID,
                          AB.ORG_DH_WID,
                          AB.ORG_SCD1_WID,
                          AB.A_PROD_WID,
                          AB.A_PROD_SCD1_WID,
                          AB.B_PROD_WID,
                          AB.B_PROD_SCD1_WID
                HAVING COUNT(AB.SLS_TRX_ID) > 1) TT1,
               A_TRX,
               B_TRX,
               ALL_TRX ATR
         WHERE TT1.DT_WID = ATR.DT_WID
           AND TT1.ORG_WID = ATR.ORG_WID
           AND TT1.ORG_DH_WID = ATR.ORG_DH_WID
           AND TT1.ORG_SCD1_WID = ATR.ORG_SCD1_WID
              --
           AND TT1.DT_WID = A_TRX.DT_WID
           AND TT1.ORG_WID = A_TRX.ORG_WID
           AND TT1.ORG_DH_WID = A_TRX.ORG_DH_WID
           AND TT1.ORG_SCD1_WID = A_TRX.ORG_SCD1_WID
           AND TT1.A_PROD_WID = A_TRX.PROD_WID
           AND TT1.A_PROD_SCD1_WID = A_TRX.PROD_SCD1_WID
              --
           AND TT1.DT_WID = B_TRX.DT_WID
           AND TT1.ORG_WID = B_TRX.ORG_WID
           AND TT1.ORG_DH_WID = B_TRX.ORG_DH_WID
           AND TT1.ORG_SCD1_WID = B_TRX.ORG_SCD1_WID
           AND TT1.A_PROD_WID = B_TRX.PROD_WID
           AND TT1.A_PROD_SCD1_WID = B_TRX.PROD_SCD1_WID) MBA,
       (SELECT P.ROW_WID PROD_WID, P.PROD_NUM, L.PRODUCT_NAME
          FROM RADM.W_PRODUCT_D P, RADM.W_PRODUCT_D_TL L
         WHERE P.INTEGRATION_ID = L.INTEGRATION_ID
           AND P.DATASOURCE_NUM_ID = L.DATASOURCE_NUM_ID
           AND L.LANGUAGE_CODE = 'ZHS') A_PROD, --A商品编码+名称
       (SELECT P.ROW_WID PROD_WID, P.PROD_NUM, L.PRODUCT_NAME
          FROM RADM.W_PRODUCT_D P, RADM.W_PRODUCT_D_TL L
         WHERE P.INTEGRATION_ID = L.INTEGRATION_ID
           AND P.DATASOURCE_NUM_ID = L.DATASOURCE_NUM_ID
           AND L.LANGUAGE_CODE = 'ZHS') B_PROD --B商品编码+名称
 WHERE MBA.A_PROD_WID = A_PROD.PROD_WID
   AND MBA.B_PROD_WID = B_PROD.PROD_WID
	 ORDER BY MBA.AB_CNT DESC
;
