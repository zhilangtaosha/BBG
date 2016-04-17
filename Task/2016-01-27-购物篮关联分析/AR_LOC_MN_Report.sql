WITH ALL_TRX AS
--门店交易笔数
 (SELECT SUBSTR(T.DT_WID, 2, 6) MN_WID,
         T.ORG_WID,
         T.ORG_DH_WID,
         T.ORG_SCD1_WID,
         COUNT(DISTINCT T.SLS_TRX_ID) LOC_CNT
    FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
   WHERE T.DT_WID BETWEEN &BEGIN_DT_WID AND &END_DT_WID
     AND EXISTS (SELECT 1
            FROM RADM.W_INT_ORG_D O
           WHERE O.ROW_WID = T.ORG_WID
             AND O.ORG_NUM = &ORG_NUM)
   GROUP BY SUBSTR(T.DT_WID, 2, 6), T.ORG_WID, T.ORG_DH_WID, T.ORG_SCD1_WID),
A_TRX AS
--包含A的交易笔数
 (SELECT SUBSTR(T.DT_WID, 2, 6) MN_WID,
         T.PROD_WID,
         T.PROD_SCD1_WID,
         T.ORG_WID,
         T.ORG_DH_WID,
         T.ORG_SCD1_WID,
         COUNT(DISTINCT T.SLS_TRX_ID) A_CNT
    FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
   WHERE T.DT_WID BETWEEN &BEGIN_DT_WID AND &END_DT_WID
     AND EXISTS (SELECT 1
            FROM RADM.W_INT_ORG_D O
           WHERE O.ROW_WID = T.ORG_WID
             AND O.ORG_NUM = &ORG_NUM)
   GROUP BY SUBSTR(T.DT_WID, 2, 6),
            T.PROD_WID,
            T.PROD_SCD1_WID,
            T.ORG_WID,
            T.ORG_DH_WID,
            T.ORG_SCD1_WID
  HAVING COUNT(T.SLS_TRX_ID) > 1),
B_TRX AS
--包含B的交易笔数
 (SELECT SUBSTR(T.DT_WID, 2, 6) MN_WID,
         T.PROD_WID,
         T.PROD_SCD1_WID,
         T.ORG_WID,
         T.ORG_DH_WID,
         T.ORG_SCD1_WID,
         COUNT(DISTINCT T.SLS_TRX_ID) B_CNT
    FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F T
   WHERE T.DT_WID BETWEEN &BEGIN_DT_WID AND &END_DT_WID
     AND EXISTS (SELECT 1
            FROM RADM.W_INT_ORG_D O
           WHERE O.ROW_WID = T.ORG_WID
             AND O.ORG_NUM = &ORG_NUM)
   GROUP BY SUBSTR(T.DT_WID, 2, 6),
            T.PROD_WID,
            T.PROD_SCD1_WID,
            T.ORG_WID,
            T.ORG_DH_WID,
            T.ORG_SCD1_WID
  HAVING COUNT(T.SLS_TRX_ID) > 1)
--------------------------------------------------
SELECT AR.MN_WID,
       AR.ORG_NUM,
       AR.A_DEPT,
       AR.A_CLASS,
       AR.A_SUBCLASS,
       AR.A_PROD_NUM,
       AR.A_PROD_NAME,
       AR.B_DEPT,
       AR.B_CLASS,
       AR.B_SUBCLASS,
       AR.B_PROD_NUM,
       AR.B_PROD_NAME,
       AR.A_CNT,
       AR.B_CNT,
       AR.AB_CNT,
       AR.LOC_CNT,
       AR.AB_SUPPORT,
       AR.A_CONFIDENCE,
       AR.B_CONFIDENCE,
       AR.UPGRADES,
       CASE
         WHEN AR.A_DEPT = AR.B_DEPT THEN
          1
         ELSE
          0
       END SAME_CATEGORY
  FROM (SELECT MBA.MN_WID,
               O.ORG_NUM,
               MBA.ORG_WID,
               MBA.ORG_DH_WID,
               MBA.ORG_SCD1_WID,
               A_PROD.DEPT A_DEPT,
               A_PROD.CLASS A_CLASS,
               A_PROD.SUBCLASS A_SUBCLASS,
               A_PROD.PROD_NUM A_PROD_NUM,
               A_PROD.PRODUCT_NAME A_PROD_NAME,
               B_PROD.DEPT B_DEPT,
               B_PROD.CLASS B_CLASS,
               B_PROD.SUBCLASS B_SUBCLASS,
               B_PROD.PROD_NUM B_PROD_NUM,
               B_PROD.PRODUCT_NAME B_PROD_NAME,
               MBA.A_CNT,
               MBA.B_CNT,
               MBA.AB_CNT,
               MBA.LOC_CNT,
               ROUND((MBA.AB_CNT / MBA.LOC_CNT), 4) AB_SUPPORT,
               ROUND((MBA.AB_CNT / MBA.A_CNT), 4) A_CONFIDENCE,
               ROUND((MBA.AB_CNT / MBA.B_CNT), 4) B_CONFIDENCE,
               ROUND(((MBA.LOC_CNT * MBA.AB_CNT) / (MBA.A_CNT * MBA.B_CNT)),
                     4) UPGRADES
          FROM (SELECT TT1.MN_WID,
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
                  FROM (SELECT AB.MN_WID,
                               AB.ORG_WID,
                               AB.ORG_DH_WID,
                               AB.ORG_SCD1_WID,
                               AB.A_PROD_WID,
                               AB.A_PROD_SCD1_WID,
                               AB.B_PROD_WID,
                               AB.B_PROD_SCD1_WID,
                               COUNT(AB.SLS_TRX_ID) AB_CNT
                          FROM --购物篮AB关联
                               (SELECT DISTINCT SUBSTR(A.DT_WID, 2, 6) MN_WID,
                                                A.ORG_WID,
                                                A.ORG_DH_WID,
                                                A.ORG_SCD1_WID,
                                                A.SLS_TRX_ID,
                                                A.PROD_WID A_PROD_WID,
                                                A.PROD_SCD1_WID A_PROD_SCD1_WID,
                                                B.PROD_WID B_PROD_WID,
                                                B.PROD_SCD1_WID B_PROD_SCD1_WID
                                  FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_F A,
                                       RADM.W_RTL_SLS_TRX_IT_LC_DY_F B
                                 WHERE A.SLS_TRX_ID = B.SLS_TRX_ID
                                   AND A.DT_WID = B.DT_WID
                                   AND A.ORG_WID = B.ORG_WID
                                   AND A.ORG_DH_WID = B.ORG_DH_WID
                                   AND A.ORG_SCD1_WID = B.ORG_SCD1_WID
                                   AND A.PROD_WID < B.PROD_WID
                                   AND A.DT_WID BETWEEN &BEGIN_DT_WID AND
                                       &END_DT_WID
                                   AND EXISTS
                                 (SELECT 1
                                          FROM RADM.W_INT_ORG_D O
                                         WHERE O.ROW_WID = A.ORG_WID
                                           AND O.ORG_NUM = &ORG_NUM)) AB
                         GROUP BY AB.MN_WID,
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
                 WHERE TT1.MN_WID = ATR.MN_WID
                   AND TT1.ORG_WID = ATR.ORG_WID
                   AND TT1.ORG_DH_WID = ATR.ORG_DH_WID
                   AND TT1.ORG_SCD1_WID = ATR.ORG_SCD1_WID
                      --
                   AND TT1.MN_WID = A_TRX.MN_WID
                   AND TT1.ORG_WID = A_TRX.ORG_WID
                   AND TT1.ORG_DH_WID = A_TRX.ORG_DH_WID
                   AND TT1.ORG_SCD1_WID = A_TRX.ORG_SCD1_WID
                   AND TT1.A_PROD_WID = A_TRX.PROD_WID
                   AND TT1.A_PROD_SCD1_WID = A_TRX.PROD_SCD1_WID
                      --
                   AND TT1.MN_WID = B_TRX.MN_WID
                   AND TT1.ORG_WID = B_TRX.ORG_WID
                   AND TT1.ORG_DH_WID = B_TRX.ORG_DH_WID
                   AND TT1.ORG_SCD1_WID = B_TRX.ORG_SCD1_WID
                   AND TT1.B_PROD_WID = B_TRX.PROD_WID
                   AND TT1.B_PROD_SCD1_WID = B_TRX.PROD_SCD1_WID
                   AND TT1.AB_CNT >= 5) MBA,
               (SELECT P.ROW_WID PROD_WID,
                       SUBSTR(P.PROD_CAT5,
                              INSTR(P.PROD_CAT5, '~', 1, 2) + 1,
                              INSTR(P.PROD_CAT5, '~', 1, 3) -
                              (INSTR(P.PROD_CAT5, '~', 1, 2) + 1)) DEPT,
                       SUBSTR(P.PROD_CAT5,
                              INSTR(P.PROD_CAT5, '~', 1, 3) + 1,
                              INSTR(P.PROD_CAT5, '~', 1, 4) -
                              (INSTR(P.PROD_CAT5, '~', 1, 3) + 1)) CLASS,
                       SUBSTR(P.PROD_CAT5,
                              INSTR(P.PROD_CAT5, '~', 1, 4) + 1,
                              LENGTH(P.PROD_CAT5) -
                              (INSTR(P.PROD_CAT5, '~', 1, 4))) SUBCLASS,
                       P.PROD_NUM,
                       L.PRODUCT_NAME
                  FROM RADM.W_PRODUCT_D P, RADM.W_PRODUCT_D_TL L
                 WHERE P.INTEGRATION_ID = L.INTEGRATION_ID
                   AND P.DATASOURCE_NUM_ID = L.DATASOURCE_NUM_ID
                   AND L.LANGUAGE_CODE = 'ZHS') A_PROD, --A商品编码+名称+DEPT+CLASS+SUBCLASS
               (SELECT P.ROW_WID PROD_WID,
                       SUBSTR(P.PROD_CAT5,
                              INSTR(P.PROD_CAT5, '~', 1, 2) + 1,
                              INSTR(P.PROD_CAT5, '~', 1, 3) -
                              (INSTR(P.PROD_CAT5, '~', 1, 2) + 1)) DEPT,
                       SUBSTR(P.PROD_CAT5,
                              INSTR(P.PROD_CAT5, '~', 1, 3) + 1,
                              INSTR(P.PROD_CAT5, '~', 1, 4) -
                              (INSTR(P.PROD_CAT5, '~', 1, 3) + 1)) CLASS,
                       SUBSTR(P.PROD_CAT5,
                              INSTR(P.PROD_CAT5, '~', 1, 4) + 1,
                              LENGTH(P.PROD_CAT5) -
                              (INSTR(P.PROD_CAT5, '~', 1, 4))) SUBCLASS,
                       P.PROD_NUM,
                       L.PRODUCT_NAME
                  FROM RADM.W_PRODUCT_D P, RADM.W_PRODUCT_D_TL L
                 WHERE P.INTEGRATION_ID = L.INTEGRATION_ID
                   AND P.DATASOURCE_NUM_ID = L.DATASOURCE_NUM_ID
                   AND L.LANGUAGE_CODE = 'ZHS') B_PROD, --B商品编码+名称+DEPT+CLASS+SUBCLASS
               (SELECT ROW_WID, ORG_NUM FROM RADM.W_INT_ORG_D) O
         WHERE MBA.A_PROD_WID = A_PROD.PROD_WID
           AND MBA.B_PROD_WID = B_PROD.PROD_WID
           AND MBA.ORG_WID = O.ROW_WID
         ORDER BY MBA.AB_CNT / MBA.LOC_CNT DESC,
                  (MBA.LOC_CNT * MBA.AB_CNT) / (MBA.A_CNT * MBA.B_CNT) DESC) AR;
