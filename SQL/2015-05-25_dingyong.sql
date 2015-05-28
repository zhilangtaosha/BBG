/* Formatted on 2015/5/25 13:39:12 (QP5 v5.256.13226.35510) */
/* e0ddc813 */

SELECT A.C6  门店编码,
       A.C5  门店名称,
       A.C2  大类编码,
       A.C4  商品编码,
       A.C3  商品名称,
       A.C9  出清数量,
       A.C8  出清成本,
       A.C12 含税出清销售金额
  FROM (SELECT DISTINCT 0 AS c1,
                        D1.c5 AS c2,
                        D1.C4 AS C12,
                        D1.c6 AS c3,
                        D1.c7 AS c4,
                        D1.c8 AS c5,
                        D1.c9 AS c6,
                        D1.c7 AS c7,
                        D1.c4 - D1.c3 - D1.c2 AS c8,
                        D1.c1 AS c9,
                        D1.c10 AS c10,
                        D1.c11 AS c11
          FROM (SELECT SUM(NVL(T956076.SLS_QTY, 0) - NVL(T956076.RET_QTY, 0)) AS c1,
                       SUM(NVL(T956076.SLS_PROFIT_AMT_LCL, 0) -
                           NVL(T956076.RET_PROFIT_AMT_LCL, 0)) AS c2,
                       SUM(NVL(T956076.SLS_TAX_AMT_LCL, 0) -
                           NVL(T956076.RET_TAX_AMT_LCL, 0)) AS c3,
                       SUM(NVL(T956076.SLS_AMT_LCL, 0) -
                           NVL(T956076.RET_AMT_LCL, 0)) AS c4,
                       CAST(T955085.LVL6ANC_PRODCAT_ID AS INTEGER) AS c5,
                       T18745.PRODUCT_NAME AS c6,
                       T14449.PROD_NUM AS c7,
                       T953980.ORG_NAME AS c8,
                       CAST(T964463.ORG_NUM AS INTEGER) AS c9,
                       T964463.ROW_WID AS c10,
                       T14449.ROW_WID AS c11
                  FROM BBG_RA_RETAIL_TYPE_D T1009758 /* Dim_BBG_RA_RETAIL_TYPE_D */,
                       (SELECT T.DATASOURCE_NUM_ID,
                               T.INTEGRATION_ID,
                               T.ORG_DESCR,
                               T.ORG_NAME,
                               NVL(CASE
                                     WHEN T.INTEGRATION_ID NOT LIKE '12%' THEN
                                      T.ORG_NAME
                                     ELSE
                                      (SELECT A.ORG_NAME
                                         FROM RADM.W_INT_ORG_D_TL A
                                        WHERE A.INTEGRATION_ID =
                                              '139' ||
                                              SUBSTR(T.INTEGRATION_ID, -3, 3))
                                   END,
                                   T.ORG_NAME) BBG_EXT_ORG_NAME,
                               T.LANGUAGE_CODE
                          FROM W_INT_ORG_D_TL T
                         WHERE T.LANGUAGE_CODE = 'ZHS') T953980,
                       W_INT_ORG_DH T964333 /* Dim_W_INT_ORG_DH_Retail_As_Was */,
                       W_INT_ORG_D T964463 /* Dim_W_INT_ORG_D_Retail_As_Was */,
                       W_MCAL_DAY_DV T960506 /* Dim_W_MCAL_DAY_D_Retail_Gregorian_Calendar */,
                       (SELECT T.*
                          FROM W_PRODUCT_D T, W_PRODUCT_ATTR_D A
                         WHERE T.SCD1_WID = A.SCD1_WID
                           AND A.PRODUCT_ATTR12_NAME = A.PRODUCT_ATTR11_NAME) T14449,
                       (SELECT DATASOURCE_NUM_ID,
                               INTEGRATION_ID,
                               PRODUCT_DESCR,
                               PRODUCT_NAME,
                               LANGUAGE_CODE
                          FROM W_PRODUCT_D_TL
                         WHERE LANGUAGE_CODE = 'ZHS') T18745,
                       W_PROD_CAT_DH T955085 /* Dim_W_PROD_CAT_DH_As_Was */,
                       W_RTL_SLS_IT_LC_DY_A T956076 /* Fact_W_RTL_SLS_IT_LC_DY_A */
                 WHERE (T953980.DATASOURCE_NUM_ID = T964463.DATASOURCE_NUM_ID AND
                       T953980.INTEGRATION_ID = T964463.INTEGRATION_ID AND
                       T956076.ORG_WID = T964463.ROW_WID AND
                       T956076.DT_WID = T960506.ROW_WID AND
                       T956076.ORG_DH_WID = T964333.ROW_WID AND
                       T956076.BBG_RETAIL_TYPE_WID = T1009758.ROW_WID AND
                       T960506.MCAL_CAL_WID = 1.0 AND
                       T960506.PER_NAME_MONTH IN
                       ('2015 / 01', '2015 / 02', '2015 / 03', '2015 / 04') AND
                       T964333.SCD1_WID = T964463.SCD1_WID AND
                       T1009758.RETAIL_TYPE_ID = 21 AND
                       T14449.DATASOURCE_NUM_ID = T18745.DATASOURCE_NUM_ID AND
                       T14449.INTEGRATION_ID = T18745.INTEGRATION_ID AND
                       T14449.ROW_WID = T956076.PROD_WID AND
                       T14449.PROD_CAT5_WID_AS_WAS = T955085.ROW_WID AND
                       '2010' < T960506.CAL_YEAR)
                 GROUP BY T14449.ROW_WID,
                          T14449.PROD_NUM,
                          T18745.PRODUCT_NAME,
                          T953980.ORG_NAME,
                          T964463.ROW_WID,
                          CAST(T955085.LVL6ANC_PRODCAT_ID AS INTEGER),
                          CAST(T964463.ORG_NUM AS INTEGER)) D1
         ORDER BY c6, c5, c2, c4) A
