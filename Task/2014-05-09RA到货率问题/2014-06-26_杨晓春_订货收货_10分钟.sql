--订货部分--时间6m22s------------------------------------------------------------------------------------------
/* Formatted on 2014/6/26 9:12:52 (QP5 v5.256.13226.35510) */
/* 5d256218 */

  SELECT SUM (T963294.BBG_REFERENCE_FO2) AS c1,
         SUM (T963294.BBG_REFERENCE_FO1) AS c2,
         CONCAT (CONCAT (CAST (T954755.SUPPLIER_NUM AS VARCHAR (20)), '-'),
                 T954755.ORG_NAME)
            AS c3
    FROM W_MCAL_DAY_DV T960506 /* Dim_W_MCAL_DAY_D_Retail_Gregorian_Calendar */
                              ,
         W_PARTY_ORG_D T954755         /* Dim_W_PARTY_ORG_D_Retail_Supplier */
                              ,
         (SELECT T.*
            FROM W_PRODUCT_D T, W_PRODUCT_ATTR_D A
           WHERE     T.SCD1_WID = A.SCD1_WID
                 AND A.PRODUCT_ATTR12_NAME = A.PRODUCT_ATTR11_NAME) T14449,
         W_PROD_CAT_DH T955085                  /* Dim_W_PROD_CAT_DH_As_Was */
                              ,
         W_RTL_SUPPCM_IT_LC_DY_FV T963294   /* Fact_W_RTL_SUPPCM_IT_LC_ED_F */
   WHERE (    T954755.ROW_WID = T963294.SUPPLIER_WID
          AND T14449.ROW_WID = T963294.PROD_WID
          AND T14449.PROD_CAT5_WID_AS_WAS = T955085.ROW_WID
          AND T960506.ROW_WID = T963294.DT_WID
          AND T960506.MCAL_CAL_WID = 1.0
          AND T960506.PER_NAME_MONTH = '2014 / 03'
          AND CONCAT (CONCAT ('DEPT', '~'), T955085.LVL6ANC_PRODCAT_ID) =
                 'DEPT~29'
          AND '2010' < T960506.CAL_YEAR)
GROUP BY CONCAT (CONCAT (CAST (T954755.SUPPLIER_NUM AS VARCHAR (20)), '-'),
                 T954755.ORG_NAME)
ORDER BY c3;
--销售部分--时间1m16s---------------------------------------------------------------------------------------------
/* Formatted on 2014/6/26 9:13:08 (QP5 v5.256.13226.35510) */
/* 61086c90 */

  SELECT SUM (
            NVL (T956321.SLS_TAX_AMT_LCL, 0) - NVL (T956321.RET_TAX_AMT_LCL, 0))
            AS c1,
         SUM (NVL (T956321.SLS_AMT_LCL, 0) - NVL (T956321.RET_AMT_LCL, 0))
            AS c2,
         SUM (
              NVL (T956321.SLS_PROFIT_AMT_LCL, 0)
            - NVL (T956321.RET_PROFIT_AMT_LCL, 0))
            AS c3,
         CONCAT (CONCAT (CAST (T954755.SUPPLIER_NUM AS VARCHAR (20)), '-'),
                 T954755.ORG_NAME)
            AS c4
    FROM W_MCAL_DAY_DV T960506 /* Dim_W_MCAL_DAY_D_Retail_Gregorian_Calendar */
                              ,
         (SELECT T.*
            FROM W_PRODUCT_D T, W_PRODUCT_ATTR_D A
           WHERE     T.SCD1_WID = A.SCD1_WID
                 AND A.PRODUCT_ATTR12_NAME = A.PRODUCT_ATTR11_NAME) T14449,
         W_PROD_CAT_DH T955085                  /* Dim_W_PROD_CAT_DH_As_Was */
                              ,
         W_RTL_SLS_IT_DY_A T956321                /* Fact_W_RTL_SLS_IT_DY_A */
                                  ,
         W_RTL_IT_SUPPLIER_D T956380             /* Dim_W_RTL_IT_SUPPLIER_D */
                                    ,
         W_PARTY_ORG_D T954755         /* Dim_W_PARTY_ORG_D_Retail_Supplier */
   WHERE (    T954755.SCD1_WID = T956380.SUPPLIER_SCD1_WID
          AND T14449.ROW_WID = T956321.PROD_WID
          AND T14449.SCD1_WID = T956380.PROD_SCD1_WID
          AND T14449.PROD_CAT5_WID_AS_WAS = T955085.ROW_WID
          AND T956321.DT_WID = T960506.ROW_WID
          AND T960506.MCAL_CAL_WID = 1.0
          AND T960506.PER_NAME_MONTH = '2014 / 04'
          AND CONCAT (CONCAT ('DEPT', '~'), T955085.LVL6ANC_PRODCAT_ID) =
                 'DEPT~29'
          AND '2010' < T960506.CAL_YEAR)
GROUP BY CONCAT (CONCAT (CAST (T954755.SUPPLIER_NUM AS VARCHAR (20)), '-'),
                 T954755.ORG_NAME)
ORDER BY c4;
