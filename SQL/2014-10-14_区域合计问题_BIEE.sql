--区域合计问题
--16行数据
/* Formatted on 2014/10/14 14:11:09 (QP5 v5.256.13226.35510) */
/* 5a753f61 */

SELECT D1.c1 AS c1,
       D1.c2 AS c2,
       D1.c3 AS c3,
       D1.c4 AS c4,
       D1.c5 AS c5,
       D1.c6 AS c6
  FROM (SELECT D1.c1 AS c1,
               D1.c2 AS c2,
               D1.c3 AS c3,
               D1.c4 AS c4,
               D1.c5 AS c5,
               D1.c6 AS c6,
               D1.c7 AS c7
          FROM (SELECT D1.c1 AS c1,
                       D1.c2 AS c2,
                       CONCAT(D1.c6, D2.c1) AS c3,
                       D1.c3 AS c4,
                       D1.c4 AS c5,
                       D1.c5 AS c6,
                       D1.c7 AS c7,
                       ROW_NUMBER() OVER(PARTITION BY D1.c2, D1.c3, D1.c7, CONCAT(D1.c6, D2.c1) ORDER BY D1.c2 ASC, D1.c3 ASC, D1.c7 ASC, CONCAT(D1.c6, D2.c1) ASC) AS c8
                  FROM (SELECT 0 AS c1,
                               D1.c3 AS c2,
                               D1.c4 AS c3,
                               D1.c2 - D1.c1 AS c4,
                               MAX(D2.c2) OVER() - MAX(D2.c1) OVER() AS c5,
                               D1.c5 AS c6,
                               D1.c6 AS c7
                          FROM (SELECT D1.c1 AS c1,
                                       D1.c2 AS c2,
                                       D1.c3 AS c3,
                                       D1.c4 AS c4,
                                       D1.c5 AS c5,
                                       D1.c6 AS c6
                                  FROM (SELECT SUM(NVL(T961218.SLS_TAX_AMT_LCL,
                                                       0) - NVL(T961218.RET_TAX_AMT_LCL,
                                                                0)) AS c1,
                                               SUM(NVL(T961218.SLS_AMT_LCL, 0) -
                                                   NVL(T961218.RET_AMT_LCL, 0)) AS c2,
                                               CONCAT(CONCAT(CAST(CAST(T964463.ORG_NUM AS
                                                                       INTEGER) AS
                                                                  VARCHAR(20)),
                                                             '-'),
                                                      T953980.ORG_NAME) AS c3,
                                               CONCAT(CONCAT(T964333.ORG_HIER11_NUM,
                                                             '~'),
                                                      'REGION') AS c4,
                                               CONCAT(CAST(CAST(T964333.ORG_HIER11_NUM AS
                                                                INTEGER) AS
                                                           VARCHAR(20)),
                                                      '-') AS c5,
                                               T964333.DATASOURCE_NUM_ID AS c6,
                                               ROW_NUMBER() OVER(PARTITION BY T964333.DATASOURCE_NUM_ID, CONCAT(CONCAT(T964333.ORG_HIER11_NUM, '~'), 'REGION') ORDER BY T964333.DATASOURCE_NUM_ID ASC, CONCAT(CONCAT(T964333.ORG_HIER11_NUM, '~'), 'REGION') ASC) AS c7
                                          FROM (SELECT DATASOURCE_NUM_ID,
                                                       INTEGRATION_ID,
                                                       ORG_DESCR,
                                                       ORG_NAME,
                                                       LANGUAGE_CODE
                                                  FROM W_INT_ORG_D_TL
                                                 WHERE LANGUAGE_CODE = 'ZHS') T953980,
                                               W_INT_ORG_DH T964333 /* Dim_W_INT_ORG_DH_Retail_As_Was */,
                                               W_INT_ORG_D T964463 /* Dim_W_INT_ORG_D_Retail_As_Was */,
                                               W_MCAL_DAY_DV T960506 /* Dim_W_MCAL_DAY_D_Retail_Gregorian_Calendar */,
                                               W_RTL_SLS_LC_DY_A T961218 /* Fact_W_RTL_SLS_LC_DY_A */
                                         WHERE (T953980.DATASOURCE_NUM_ID =
                                               T964463.DATASOURCE_NUM_ID AND
                                               T953980.INTEGRATION_ID =
                                               T964463.INTEGRATION_ID AND
                                               T960506.ROW_WID = T961218.DT_WID AND
                                               T960506.MCAL_CAL_WID = 1.0 AND
                                               T961218.ORG_SCD1_WID =
                                               T964463.SCD1_WID AND
                                               TRUNC(T960506.MCAL_DAY_DT) =
                                               TO_DATE('2014-10-12',
                                                        'YYYY-MM-DD') AND
                                               T961218.ORG_DH_WID =
                                               T964333.ROW_WID AND
                                               T964333.SCD1_WID =
                                               T964463.SCD1_WID AND
                                               '2010' < T960506.CAL_YEAR)
                                         GROUP BY T964333.DATASOURCE_NUM_ID,
                                                  CAST(T964333.ORG_HIER11_NUM AS
                                                       INTEGER),
                                                  CONCAT(CONCAT(T964333.ORG_HIER11_NUM,
                                                                '~'),
                                                         'REGION'),
                                                  CONCAT(CONCAT(CAST(CAST(T964463.ORG_NUM AS
                                                                          INTEGER) AS
                                                                     VARCHAR(20)),
                                                                '-'),
                                                         T953980.ORG_NAME)) D1
                                 WHERE (D1.c7 = 1)) D1,
                               (SELECT SUM(NVL(T956124.SLS_TAX_AMT_LCL, 0) -
                                           NVL(T956124.RET_TAX_AMT_LCL, 0)) AS c1,
                                       SUM(NVL(T956124.SLS_AMT_LCL, 0) -
                                           NVL(T956124.RET_AMT_LCL, 0)) AS c2
                                  FROM W_MCAL_DAY_DV     T960506 /* Dim_W_MCAL_DAY_D_Retail_Gregorian_Calendar */,
                                       W_RTL_SLS_SC_DY_A T956124 /* Fact_W_RTL_SLS_SC_DY_A */
                                 WHERE (T956124.DT_WID = T960506.ROW_WID AND
                                       T960506.MCAL_CAL_WID = 1.0 AND
                                       TRUNC(T960506.MCAL_DAY_DT) =
                                       TO_DATE('2014-10-12', 'YYYY-MM-DD') AND
                                       '2010' < T960506.CAL_YEAR)) D2) D1
                 INNER JOIN (SELECT T16687.DOMAIN_MEMBER_NAME AS c1,
                                   T16687.DOMAIN_MEMBER_CODE AS c2,
                                   T16687.DATASOURCE_NUM_ID  AS c3
                              FROM W_DOMAIN_MEMBER_LKP_TL T16687 /* Lookup_W_DOMAIN_MEMBER_LKP_TL */
                             WHERE (T16687.DOMAIN_CODE = 'RTL_ORG' AND
                                   T16687.DOMAIN_TYPE_CODE = 'S' AND
                                   T16687.LANGUAGE_CODE = 'ZHS')) D2
                    ON D1.c3 = D2.c2
                   AND D1.c7 = D2.c3) D1
         WHERE (D1.c8 = 1)) D1
 ORDER BY c1, c3, c2;

--区域编码173行 正常
/* Formatted on 2014/10/14 14:13:43 (QP5 v5.256.13226.35510) */
/* f47bfadc */

SELECT D1.c1 AS c1, D1.c2 AS c2, D1.c3 AS c3, D1.c4 AS c4, D1.c5 AS c5
  FROM (SELECT D1.c1 AS c1,
               D1.c2 AS c2,
               D1.c3 AS c3,
               D1.c4 AS c4,
               D1.c5 AS c5,
               D1.c6 AS c6
          FROM (SELECT D1.c1 AS c1,
                       D1.c2 AS c2,
                       CONCAT(D1.c5, D2.c1) AS c3,
                       D1.c3 AS c4,
                       D1.c4 AS c5,
                       D1.c6 AS c6,
                       ROW_NUMBER() OVER(PARTITION BY D1.c2, D1.c3, D1.c6, CONCAT(D1.c5, D2.c1) ORDER BY D1.c2 ASC, D1.c3 ASC, D1.c6 ASC, CONCAT(D1.c5, D2.c1) ASC) AS c7
                  FROM (SELECT 0 AS c1,
                               D1.c3 AS c2,
                               D1.c4 AS c3,
                               D1.c2 - D1.c1 AS c4,
                               D1.c5 AS c5,
                               D1.c6 AS c6
                          FROM (SELECT SUM(NVL(T961218.SLS_TAX_AMT_LCL, 0) -
                                           NVL(T961218.RET_TAX_AMT_LCL, 0)) AS c1,
                                       SUM(NVL(T961218.SLS_AMT_LCL, 0) -
                                           NVL(T961218.RET_AMT_LCL, 0)) AS c2,
                                       CONCAT(CONCAT(CAST(CAST(T964463.ORG_NUM AS
                                                               INTEGER) AS
                                                          VARCHAR(20)),
                                                     '-'),
                                              T953980.ORG_NAME) AS c3,
                                       CONCAT(CONCAT(T964333.ORG_HIER11_NUM,
                                                     '~'),
                                              'REGION') AS c4,
                                       CONCAT(CAST(CAST(T964333.ORG_HIER11_NUM AS
                                                        INTEGER) AS VARCHAR(20)),
                                              '-') AS c5,
                                       T964333.DATASOURCE_NUM_ID AS c6
                                  FROM (SELECT DATASOURCE_NUM_ID,
                                               INTEGRATION_ID,
                                               ORG_DESCR,
                                               ORG_NAME,
                                               LANGUAGE_CODE
                                          FROM W_INT_ORG_D_TL
                                         WHERE LANGUAGE_CODE = 'ZHS') T953980,
                                       W_INT_ORG_DH T964333 /* Dim_W_INT_ORG_DH_Retail_As_Was */,
                                       W_INT_ORG_D T964463 /* Dim_W_INT_ORG_D_Retail_As_Was */,
                                       W_MCAL_DAY_DV T960506 /* Dim_W_MCAL_DAY_D_Retail_Gregorian_Calendar */,
                                       W_RTL_SLS_LC_DY_A T961218 /* Fact_W_RTL_SLS_LC_DY_A */
                                 WHERE (T953980.DATASOURCE_NUM_ID =
                                       T964463.DATASOURCE_NUM_ID AND
                                       T953980.INTEGRATION_ID =
                                       T964463.INTEGRATION_ID AND
                                       T960506.ROW_WID = T961218.DT_WID AND
                                       T960506.MCAL_CAL_WID = 1.0 AND
                                       T961218.ORG_SCD1_WID = T964463.SCD1_WID AND
                                       TRUNC(T960506.MCAL_DAY_DT) =
                                       TO_DATE('2014-10-12', 'YYYY-MM-DD') AND
                                       T961218.ORG_DH_WID = T964333.ROW_WID AND
                                       T964333.SCD1_WID = T964463.SCD1_WID AND
                                       '2010' < T960506.CAL_YEAR)
                                 GROUP BY T964333.DATASOURCE_NUM_ID,
                                          CAST(T964333.ORG_HIER11_NUM AS
                                               INTEGER),
                                          CONCAT(CONCAT(T964333.ORG_HIER11_NUM,
                                                        '~'),
                                                 'REGION'),
                                          CONCAT(CONCAT(CAST(CAST(T964463.ORG_NUM AS
                                                                  INTEGER) AS
                                                             VARCHAR(20)),
                                                        '-'),
                                                 T953980.ORG_NAME)) D1) D1
                 INNER JOIN (SELECT T16687.DOMAIN_MEMBER_NAME AS c1,
                                   T16687.DOMAIN_MEMBER_CODE AS c2,
                                   T16687.DATASOURCE_NUM_ID  AS c3
                              FROM W_DOMAIN_MEMBER_LKP_TL T16687 /* Lookup_W_DOMAIN_MEMBER_LKP_TL */
                             WHERE (T16687.DOMAIN_CODE = 'RTL_ORG' AND
                                   T16687.DOMAIN_TYPE_CODE = 'S' AND
                                   T16687.LANGUAGE_CODE = 'ZHS')) D2
                    ON D1.c3 = D2.c2
                   AND D1.c6 = D2.c3) D1
         WHERE (D1.c7 = 1)) D1
 ORDER BY c1, c3, c2;
