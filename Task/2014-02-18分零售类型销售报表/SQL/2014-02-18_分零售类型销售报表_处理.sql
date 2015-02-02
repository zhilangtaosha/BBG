--201312/201401损耗数据_tran_data_history
SELECT T.LOCATION,
       T.DEPT,
       SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6) MONTH,
       SUM(T.UNITS) LOSS_QTY,
       SUM(T.TOTAL_COST) LOSS_COST
  FROM TRAN_DATA_HISTORY@RA_RMS_DBLINK T
 WHERE T.tran_code = 22
   and T.gl_ref_no is not null
   AND T.TRAN_DATE BETWEEN DATE '2013-12-01' AND DATE '2014-01-31'
 GROUP BY T.LOCATION,
          T.DEPT,
          SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6);
--201312/201401WAC调整_tran_data_history
SELECT T.LOCATION,
       T.DEPT,
       SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6) MONTH,
       SUM(T.UNITS) WAC_QTY,
       SUM(T.TOTAL_COST) WAC_COST
  FROM TRAN_DATA_HISTORY@RA_RMS_DBLINK T
 WHERE tran_code in (70, 72, 73)
   and pgm_name <> 'cmx_fund_sql.fund_inv_wac'
   AND T.TRAN_DATE BETWEEN DATE '2013-12-01' AND DATE '2014-01-31'
 GROUP BY T.LOCATION,
          T.DEPT,
          SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6);
--201312/201401补差
CREATE TABLE YJ_DP_LC_BUCHA(ORG_NUM NUMBER(15),
                            DEPT NUMBER(15),
                            MONTH NUMBER(15),
                            AMT NUMBER(20, 4));
SELECT * FROM YJ_DP_LC_BUCHA FOR UPDATE;

--201212/201301门店大类补差数据
CREATE TABLE YJ_DP_LC_MACKUP_HISTORY(ORG_NUM NUMBER(15),
                                     DEPT NUMBER(15),
                                     MONTH NUMBER(15),
                                     AMT NUMBER(20, 4));
SELECT * FROM YJ_DP_LC_MACKUP_HISTORY FOR UPDATE;
--统一店代码
UPDATE YJ_DP_LC_MACKUP_HISTORY T
   SET T.ORG_NUM = SUBSTR(T.ORG_NUM, 1, 2) || 0 || SUBSTR(T.ORG_NUM, 3, 3);

--201212/201301门店大类报损数据
CREATE TABLE YJ_DP_LC_INVADJ_HISTORY(ORG_NUM NUMBER(15),
                                     DEPT NUMBER(15),
                                     MONTH NUMBER(15),
                                     AMT NUMBER(20, 4));
SELECT * FROM YJ_DP_LC_INVADJ_HISTORY FOR UPDATE;
--统一店代码
UPDATE YJ_DP_LC_INVADJ_HISTORY T
   SET T.ORG_NUM = SUBSTR(T.ORG_NUM, 1, 2) || 0 || SUBSTR(T.ORG_NUM, 3, 3);

--201212/201301门店大类盘点数据
CREATE TABLE YJ_DP_LC_Inventory_HISTORY(ORG_NUM NUMBER(15),
                                        DEPT NUMBER(15),
                                        MONTH NUMBER(15),
                                        QTY NUMBER(20, 4),
                                        AMT NUMBER(20, 4));
SELECT * FROM YJ_DP_LC_Inventory_HISTORY FOR UPDATE;

--201212/201301损耗数据为：报损+盘点
SELECT SH.ORG_NUM,SH.DEPT,SH.MONTH,SUM(SH.QTY) SH_QTY,SUM(SH.AMT) SH_AMT
FROM (
SELECT * FROM YJ_DP_LC_INVADJ_HISTORY ADJ
UNION ALL
SELECT * FROM YJ_DP_LC_Inventory_HISTORY ENT) SH
GROUP BY SH.ORG_NUM,SH.DEPT,SH.MONTH;


--统一店代码
UPDATE YJ_DP_LC_Inventory_HISTORY T
   SET T.ORG_NUM = SUBSTR(T.ORG_NUM, 1, 2) || 0 || SUBSTR(T.ORG_NUM, 3, 3);

--零售类型销售_不区分经营属性
SELECT TL.INTEGRATION_ID LOCATION,
       TL.ORG_NAME LOCATION_NAME,
       A.MN_WID MONTH,
       DH.LVL6ANC_PRODCAT_ID DEPT,
       R.RETAIL_TYPE_ID 零售类型编码,
       R.RETAIL_TYPE_DESC 零售类型,
       SUM(A.SLS_QTY) 销售数量,
       SUM(A.SLS_AMT_LCL) 销售金额
  FROM RADM.W_RTL_SLS_DP_LC_MN_A A,
       RADM.W_INT_ORG_D          ORG,
       RADM.W_INT_ORG_D_TL       TL,
       RADM.BBG_RA_RETAIL_TYPE_D R,
       RADM.W_PROD_CAT_DH        DH
 WHERE A.ORG_WID = ORG.ROW_WID
   AND ORG.ORG_NUM = TL.INTEGRATION_ID
   AND R.ROW_WID = A.BBG_RETAIL_TYPE_WID
   AND DH.ROW_WID = A.PROD_DH_WID
   AND A.MN_WID IN (201312, 201401)
 GROUP BY TL.INTEGRATION_ID,
          TL.ORG_NAME,
          A.MN_WID,
          DH.LVL6ANC_PRODCAT_ID,
          R.RETAIL_TYPE_ID,
          R.RETAIL_TYPE_DESC;

--零售类型销售_分经营属性
SELECT TL.INTEGRATION_ID LOCATION,
       TL.ORG_NAME LOCATION_NAME,
       A.MN_WID MONTH,
       PROD.PROD_DP_NUM DEPT,
       R.RETAIL_TYPE_ID 零售类型编码,
       R.RETAIL_TYPE_DESC 零售类型,
       IL.BUSINESS_MODE,
       SUM(A.SLS_QTY) 销售数量,
       SUM(A.SLS_AMT_LCL) 销售金额
  FROM RADM.W_RTL_SLS_IT_LC_MN_A     A,
       RADM.W_INT_ORG_D              ORG,
       RADM.W_INT_ORG_D_TL           TL,
       RADM.BBG_RA_RETAIL_TYPE_D     R,
       RADM.BBG_RA_ITEM_LOC_D        IL,
       RABATCHER.W_PRODUCT_D_RTL_TMP PROD
 WHERE A.ORG_WID = ORG.ROW_WID
   AND ORG.ORG_NUM = TL.INTEGRATION_ID
   AND R.ROW_WID = A.BBG_RETAIL_TYPE_WID
   AND A.BBG_ITEM_LOC_WID = IL.ROW_WID
   AND A.PROD_WID = PROD.PROD_IT_WID
   AND A.MN_WID IN (201312, 201401)
 GROUP BY TL.INTEGRATION_ID,
          TL.ORG_NAME,
          A.MN_WID,
          PROD.PROD_DP_NUM,
          R.RETAIL_TYPE_ID,
          R.RETAIL_TYPE_DESC,
          IL.BUSINESS_MODE;
--零售类型转换成列_不区分经营属性
SELECT T1.LOCATION,
       T1.LOCATION_NAME,
       T1.MONTH,
       T1.DEPT,
       SUM(DECODE(零售类型编码,
                  1,
                  销售数量,
                  6,
                  销售数量,
                  11,
                  销售数量,
                  NULL)) 正常销售数量,
       SUM(DECODE(零售类型编码,
                  1,
                  销售金额,
                  6,
                  销售金额,
                  11,
                  销售金额,
                  NULL)) 正常销售金额,
       -----------
       SUM(DECODE(零售类型编码,
                  2,
                  销售数量,
                  3,
                  销售数量,
                  4,
                  销售数量,
                  5,
                  销售数量,
                  8,
                  销售数量,
                  12,
                  销售数量,
                  13,
                  销售数量,
                  15,
                  销售数量,
                  16,
                  销售数量,
                  17,
                  销售数量,
                  19,
                  销售数量,
                  22,
                  销售数量,
                  23,
                  销售数量,
                  24,
                  销售数量,
                  26,
                  销售数量,
                  27,
                  销售数量,
                  28,
                  销售数量,
                  29,
                  销售数量,
                  30,
                  销售数量,
                  31,
                  销售数量,
                  32,
                  销售数量,
                  33,
                  销售数量,
                  34,
                  销售数量,
                  35,
                  销售数量,
                  36,
                  销售数量,
                  38,
                  销售数量,
                  39,
                  销售数量,
                  40,
                  销售数量,
                  NULL)) 促销销售数量,
       SUM(DECODE(零售类型编码,
                  2,
                  销售金额,
                  3,
                  销售金额,
                  4,
                  销售金额,
                  5,
                  销售金额,
                  8,
                  销售金额,
                  12,
                  销售金额,
                  13,
                  销售金额,
                  15,
                  销售金额,
                  16,
                  销售金额,
                  17,
                  销售金额,
                  19,
                  销售金额,
                  22,
                  销售金额,
                  23,
                  销售金额,
                  24,
                  销售金额,
                  26,
                  销售金额,
                  27,
                  销售金额,
                  28,
                  销售金额,
                  29,
                  销售金额,
                  30,
                  销售金额,
                  31,
                  销售金额,
                  32,
                  销售金额,
                  33,
                  销售金额,
                  34,
                  销售金额,
                  35,
                  销售金额,
                  36,
                  销售金额,
                  38,
                  销售金额,
                  39,
                  销售金额,
                  40,
                  销售金额,
                  NULL)) 促销销售金额,
       -----------
       SUM(DECODE(零售类型编码,
                  9,
                  销售数量,
                  21,
                  销售数量,
                  25,
                  销售数量,
                  NULL)) 折价销售数量,
       SUM(DECODE(零售类型编码,
                  9,
                  销售金额,
                  21,
                  销售金额,
                  25,
                  销售金额,
                  NULL)) 折价销售金额,
       -----------
       SUM(DECODE(零售类型编码, 10, 销售数量, NULL)) 大宗销售数量,
       SUM(DECODE(零售类型编码, 10, 销售金额, NULL)) 大宗销售金额,
       -----------
       SUM(DECODE(零售类型编码, 20, 销售数量, NULL)) DM销售数量,
       SUM(DECODE(零售类型编码, 20, 销售金额, NULL)) DM销售金额
  FROM (SELECT TL.INTEGRATION_ID LOCATION,
               TL.ORG_NAME LOCATION_NAME,
               A.MN_WID MONTH,
               DH.LVL6ANC_PRODCAT_ID DEPT,
               R.RETAIL_TYPE_ID 零售类型编码,
               R.RETAIL_TYPE_DESC 零售类型,
               SUM(A.SLS_QTY) 销售数量,
               SUM(A.SLS_AMT_LCL) 销售金额
          FROM RADM.W_RTL_SLS_DP_LC_MN_A A,
               RADM.W_INT_ORG_D          ORG,
               RADM.W_INT_ORG_D_TL       TL,
               RADM.BBG_RA_RETAIL_TYPE_D R,
               RADM.W_PROD_CAT_DH        DH
         WHERE A.ORG_WID = ORG.ROW_WID
           AND ORG.ORG_NUM = TL.INTEGRATION_ID
           AND R.ROW_WID = A.BBG_RETAIL_TYPE_WID
           AND DH.ROW_WID = A.PROD_DH_WID
           AND A.MN_WID IN (201312, 201401)
         GROUP BY TL.INTEGRATION_ID,
                  TL.ORG_NAME,
                  A.MN_WID,
                  DH.LVL6ANC_PRODCAT_ID,
                  R.RETAIL_TYPE_ID,
                  R.RETAIL_TYPE_DESC) T1
 GROUP BY T1.LOCATION, T1.LOCATION_NAME, T1.MONTH, T1.DEPT
 ORDER BY T1.LOCATION, T1.MONTH, T1.DEPT;

--零售类型转换成列_分经营属性
SELECT T1.LOCATION,
       T1.LOCATION_NAME,
       T1.MONTH,
       T1.DEPT,
       SUM(DECODE(零售类型编码,
                  1,
                  销售数量,
                  6,
                  销售数量,
                  11,
                  销售数量,
                  NULL)) 正常销售数量,
       SUM(DECODE(零售类型编码,
                  1,
                  销售金额,
                  6,
                  销售金额,
                  11,
                  销售金额,
                  NULL)) 正常销售金额,
       -----------
       SUM(DECODE(零售类型编码,
                  2,
                  销售数量,
                  3,
                  销售数量,
                  4,
                  销售数量,
                  5,
                  销售数量,
                  8,
                  销售数量,
                  12,
                  销售数量,
                  13,
                  销售数量,
                  15,
                  销售数量,
                  16,
                  销售数量,
                  17,
                  销售数量,
                  19,
                  销售数量,
                  22,
                  销售数量,
                  23,
                  销售数量,
                  24,
                  销售数量,
                  26,
                  销售数量,
                  27,
                  销售数量,
                  28,
                  销售数量,
                  29,
                  销售数量,
                  30,
                  销售数量,
                  31,
                  销售数量,
                  32,
                  销售数量,
                  33,
                  销售数量,
                  34,
                  销售数量,
                  35,
                  销售数量,
                  36,
                  销售数量,
                  38,
                  销售数量,
                  39,
                  销售数量,
                  40,
                  销售数量,
                  NULL)) 促销销售数量,
       SUM(DECODE(零售类型编码,
                  2,
                  销售金额,
                  3,
                  销售金额,
                  4,
                  销售金额,
                  5,
                  销售金额,
                  8,
                  销售金额,
                  12,
                  销售金额,
                  13,
                  销售金额,
                  15,
                  销售金额,
                  16,
                  销售金额,
                  17,
                  销售金额,
                  19,
                  销售金额,
                  22,
                  销售金额,
                  23,
                  销售金额,
                  24,
                  销售金额,
                  26,
                  销售金额,
                  27,
                  销售金额,
                  28,
                  销售金额,
                  29,
                  销售金额,
                  30,
                  销售金额,
                  31,
                  销售金额,
                  32,
                  销售金额,
                  33,
                  销售金额,
                  34,
                  销售金额,
                  35,
                  销售金额,
                  36,
                  销售金额,
                  38,
                  销售金额,
                  39,
                  销售金额,
                  40,
                  销售金额,
                  NULL)) 促销销售金额,
       -----------
       SUM(DECODE(零售类型编码,
                  9,
                  销售数量,
                  21,
                  销售数量,
                  25,
                  销售数量,
                  NULL)) 折价销售数量,
       SUM(DECODE(零售类型编码,
                  9,
                  销售金额,
                  21,
                  销售金额,
                  25,
                  销售金额,
                  NULL)) 折价销售金额,
       -----------
       SUM(DECODE(零售类型编码, 10, 销售数量, NULL)) 大宗销售数量,
       SUM(DECODE(零售类型编码, 10, 销售金额, NULL)) 大宗销售金额,
       -----------
       SUM(DECODE(零售类型编码, 20, 销售数量, NULL)) DM销售数量,
       SUM(DECODE(零售类型编码, 20, 销售金额, NULL)) DM销售金额
  FROM (SELECT TL.INTEGRATION_ID LOCATION,
               TL.ORG_NAME LOCATION_NAME,
               A.MN_WID MONTH,
               PROD.PROD_DP_NUM DEPT,
               R.RETAIL_TYPE_ID 零售类型编码,
               R.RETAIL_TYPE_DESC 零售类型,
               IL.BUSINESS_MODE,
               SUM(A.SLS_QTY) 销售数量,
               SUM(A.SLS_AMT_LCL) 销售金额
          FROM RADM.W_RTL_SLS_IT_LC_MN_A     A,
               RADM.W_INT_ORG_D              ORG,
               RADM.W_INT_ORG_D_TL           TL,
               RADM.BBG_RA_RETAIL_TYPE_D     R,
               RADM.BBG_RA_ITEM_LOC_D        IL,
               RABATCHER.W_PRODUCT_D_RTL_TMP PROD
         WHERE A.ORG_WID = ORG.ROW_WID
           AND ORG.ORG_NUM = TL.INTEGRATION_ID
           AND R.ROW_WID = A.BBG_RETAIL_TYPE_WID
           AND A.BBG_ITEM_LOC_WID = IL.ROW_WID
           AND A.PROD_WID = PROD.PROD_IT_WID
           AND IL.BUSINESS_MODE IN ('JX', 'DX') --经营属性
           AND A.MN_WID IN (201312, 201401)
         GROUP BY TL.INTEGRATION_ID,
                  TL.ORG_NAME,
                  A.MN_WID,
                  PROD.PROD_DP_NUM,
                  R.RETAIL_TYPE_ID,
                  R.RETAIL_TYPE_DESC,
                  IL.BUSINESS_MODE) T1
 GROUP BY T1.LOCATION, T1.LOCATION_NAME, T1.MONTH, T1.DEPT
 ORDER BY T1.LOCATION, T1.MONTH, T1.DEPT;
--201312/201401损耗数据_tran_data_history
SELECT T.LOCATION,
       T.DEPT,
       SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6) MONTH,
       SUM(T.UNITS) LOSS_QTY,
       SUM(T.TOTAL_COST) LOSS_COST
  FROM TRAN_DATA_HISTORY@RA_RMS_DBLINK T
 WHERE T.tran_code = 22
   and T.gl_ref_no is not null
   AND T.TRAN_DATE BETWEEN DATE '2013-12-01' AND DATE '2014-01-31'
 GROUP BY T.LOCATION,
          T.DEPT,
          SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6);
--201312/201401WAC调整_tran_data_history
SELECT T.LOCATION,
       T.DEPT,
       SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6) MONTH,
       SUM(T.UNITS) WAC_QTY,
       SUM(T.TOTAL_COST) WAC_COST
  FROM TRAN_DATA_HISTORY@RA_RMS_DBLINK T
 WHERE tran_code in (70, 72, 73)
   and pgm_name <> 'cmx_fund_sql.fund_inv_wac'
   AND T.TRAN_DATE BETWEEN DATE '2013-12-01' AND DATE '2014-01-31'
 GROUP BY T.LOCATION,
          T.DEPT,
          SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6);
--201312/201401补差
CREATE TABLE YJ_DP_LC_BUCHA(ORG_NUM NUMBER(15),
                            DEPT NUMBER(15),
                            MONTH NUMBER(15),
                            AMT NUMBER(20, 4));
SELECT * FROM YJ_DP_LC_BUCHA FOR UPDATE;

--201212/201301门店大类补差数据
CREATE TABLE YJ_DP_LC_MACKUP_HISTORY(ORG_NUM NUMBER(15),
                                     DEPT NUMBER(15),
                                     MONTH NUMBER(15),
                                     AMT NUMBER(20, 4));
SELECT * FROM YJ_DP_LC_MACKUP_HISTORY FOR UPDATE;
--统一店代码
UPDATE YJ_DP_LC_MACKUP_HISTORY T
   SET T.ORG_NUM = SUBSTR(T.ORG_NUM, 1, 2) || 0 || SUBSTR(T.ORG_NUM, 3, 3);

--201212/201301门店大类报损数据
CREATE TABLE YJ_DP_LC_INVADJ_HISTORY(ORG_NUM NUMBER(15),
                                     DEPT NUMBER(15),
                                     MONTH NUMBER(15),
                                     AMT NUMBER(20, 4));
SELECT * FROM YJ_DP_LC_INVADJ_HISTORY FOR UPDATE;
--统一店代码
UPDATE YJ_DP_LC_INVADJ_HISTORY T
   SET T.ORG_NUM = SUBSTR(T.ORG_NUM, 1, 2) || 0 || SUBSTR(T.ORG_NUM, 3, 3);

--201212/201301门店大类盘点数据
CREATE TABLE YJ_DP_LC_Inventory_HISTORY(ORG_NUM NUMBER(15),
                                        DEPT NUMBER(15),
                                        MONTH NUMBER(15),
                                        QTY NUMBER(20, 4),
                                        AMT NUMBER(20, 4));
SELECT * FROM YJ_DP_LC_Inventory_HISTORY FOR UPDATE;

--201212/201301损耗数据为：报损+盘点
SELECT SH.ORG_NUM,SH.DEPT,SH.MONTH,SUM(SH.QTY) SH_QTY,SUM(SH.AMT) SH_AMT
FROM (
SELECT * FROM YJ_DP_LC_INVADJ_HISTORY ADJ
UNION ALL
SELECT * FROM YJ_DP_LC_Inventory_HISTORY ENT) SH
GROUP BY SH.ORG_NUM,SH.DEPT,SH.MONTH;


--统一店代码
UPDATE YJ_DP_LC_Inventory_HISTORY T
   SET T.ORG_NUM = SUBSTR(T.ORG_NUM, 1, 2) || 0 || SUBSTR(T.ORG_NUM, 3, 3);

--201312/201401报表合并_不区分经营属性
SELECT SLS.LOCATION,
       SLS.LOCATION_NAME,
       SLS.MONTH,
       SLS.DEPT,
       SLS.正常销售数量,
       SLS.正常销售金额,
       SLS.促销销售数量,
       SLS.促销销售金额,
       SLS.折价销售数量,
       SLS.折价销售金额,
       SLS.大宗销售数量,
       SLS.大宗销售金额,
       SLS.DM销售数量,
       SLS.DM销售金额,
       INVADJ.LOSS_QTY,
       INVADJ.LOSS_COST,
       WAC.WAC_QTY,
       WAC.WAC_COST
  FROM (SELECT T1.LOCATION,
               T1.LOCATION_NAME,
               T1.MONTH,
               T1.DEPT,
               SUM(DECODE(零售类型编码,
                          1,
                          销售数量,
                          6,
                          销售数量,
                          11,
                          销售数量,
                          NULL)) 正常销售数量,
               SUM(DECODE(零售类型编码,
                          1,
                          销售金额,
                          6,
                          销售金额,
                          11,
                          销售金额,
                          NULL)) 正常销售金额,
               -----------
               SUM(DECODE(零售类型编码,
                          2,
                          销售数量,
                          3,
                          销售数量,
                          4,
                          销售数量,
                          5,
                          销售数量,
                          8,
                          销售数量,
                          12,
                          销售数量,
                          13,
                          销售数量,
                          15,
                          销售数量,
                          16,
                          销售数量,
                          17,
                          销售数量,
                          19,
                          销售数量,
                          22,
                          销售数量,
                          23,
                          销售数量,
                          24,
                          销售数量,
                          26,
                          销售数量,
                          27,
                          销售数量,
                          28,
                          销售数量,
                          29,
                          销售数量,
                          30,
                          销售数量,
                          31,
                          销售数量,
                          32,
                          销售数量,
                          33,
                          销售数量,
                          34,
                          销售数量,
                          35,
                          销售数量,
                          36,
                          销售数量,
                          38,
                          销售数量,
                          39,
                          销售数量,
                          40,
                          销售数量,
                          NULL)) 促销销售数量,
               SUM(DECODE(零售类型编码,
                          2,
                          销售金额,
                          3,
                          销售金额,
                          4,
                          销售金额,
                          5,
                          销售金额,
                          8,
                          销售金额,
                          12,
                          销售金额,
                          13,
                          销售金额,
                          15,
                          销售金额,
                          16,
                          销售金额,
                          17,
                          销售金额,
                          19,
                          销售金额,
                          22,
                          销售金额,
                          23,
                          销售金额,
                          24,
                          销售金额,
                          26,
                          销售金额,
                          27,
                          销售金额,
                          28,
                          销售金额,
                          29,
                          销售金额,
                          30,
                          销售金额,
                          31,
                          销售金额,
                          32,
                          销售金额,
                          33,
                          销售金额,
                          34,
                          销售金额,
                          35,
                          销售金额,
                          36,
                          销售金额,
                          38,
                          销售金额,
                          39,
                          销售金额,
                          40,
                          销售金额,
                          NULL)) 促销销售金额,
               -----------
               SUM(DECODE(零售类型编码,
                          9,
                          销售数量,
                          21,
                          销售数量,
                          25,
                          销售数量,
                          NULL)) 折价销售数量,
               SUM(DECODE(零售类型编码,
                          9,
                          销售金额,
                          21,
                          销售金额,
                          25,
                          销售金额,
                          NULL)) 折价销售金额,
               -----------
               SUM(DECODE(零售类型编码, 10, 销售数量, NULL)) 大宗销售数量,
               SUM(DECODE(零售类型编码, 10, 销售金额, NULL)) 大宗销售金额,
               -----------
               SUM(DECODE(零售类型编码, 20, 销售数量, NULL)) DM销售数量,
               SUM(DECODE(零售类型编码, 20, 销售金额, NULL)) DM销售金额
          FROM (SELECT TL.INTEGRATION_ID LOCATION,
                       TL.ORG_NAME LOCATION_NAME,
                       A.MN_WID MONTH,
                       DH.LVL6ANC_PRODCAT_ID DEPT,
                       R.RETAIL_TYPE_ID 零售类型编码,
                       R.RETAIL_TYPE_DESC 零售类型,
                       SUM(A.SLS_QTY) 销售数量,
                       SUM(A.SLS_AMT_LCL) 销售金额
                  FROM RADM.W_RTL_SLS_DP_LC_MN_A A,
                       RADM.W_INT_ORG_D          ORG,
                       RADM.W_INT_ORG_D_TL       TL,
                       RADM.BBG_RA_RETAIL_TYPE_D R,
                       RADM.W_PROD_CAT_DH        DH
                 WHERE A.ORG_WID = ORG.ROW_WID
                   AND ORG.ORG_NUM = TL.INTEGRATION_ID
                   AND R.ROW_WID = A.BBG_RETAIL_TYPE_WID
                   AND DH.ROW_WID = A.PROD_DH_WID
                   AND A.MN_WID IN (201312, 201401)
                 GROUP BY TL.INTEGRATION_ID,
                          TL.ORG_NAME,
                          A.MN_WID,
                          DH.LVL6ANC_PRODCAT_ID,
                          R.RETAIL_TYPE_ID,
                          R.RETAIL_TYPE_DESC) T1
         GROUP BY T1.LOCATION, T1.LOCATION_NAME, T1.MONTH, T1.DEPT
         ORDER BY T1.LOCATION, T1.MONTH, T1.DEPT) SLS,
       --INVADJ
       (SELECT T.LOCATION,
               T.DEPT,
               SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6) MONTH,
               SUM(T.UNITS) LOSS_QTY,
               SUM(T.TOTAL_COST) LOSS_COST
          FROM TRAN_DATA_HISTORY@RA_RMS_DBLINK T
         WHERE T.tran_code = 22
           and T.gl_ref_no is not null
           AND T.TRAN_DATE BETWEEN DATE '2013-12-01' AND DATE
         '2014-01-31'
         GROUP BY T.LOCATION,
                  T.DEPT,
                  SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6)) INVADJ,
       --WAC
       (SELECT T.LOCATION,
               T.DEPT,
               SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6) MONTH,
               SUM(T.UNITS) WAC_QTY,
               SUM(T.TOTAL_COST) WAC_COST
          FROM TRAN_DATA_HISTORY@RA_RMS_DBLINK T
         WHERE tran_code in (70, 72, 73)
           and pgm_name <> 'cmx_fund_sql.fund_inv_wac'
           AND T.TRAN_DATE BETWEEN DATE '2013-12-01' AND DATE
         '2014-01-31'
         GROUP BY T.LOCATION,
                  T.DEPT,
                  SUBSTR(TO_CHAR(T.TRAN_DATE, 'YYYYMMDD'), 1, 6)) WAC
 WHERE SLS.LOCATION = INVADJ.LOCATION(+)
   AND SLS.DEPT = INVADJ.DEPT(+)
   AND SLS.MONTH = INVADJ.MONTH(+)
   AND SLS.LOCATION = WAC.LOCATION(+)
   AND SLS.DEPT = WAC.DEPT(+)
   AND SLS.MONTH = WAC.MONTH(+);

--temp
SELECT * FROM ALL_ALL_TABLES T WHERE T.table_name LIKE '%ADJ%';

SELECT * FROM BBG_RA_INVADJ_IT_LC_DY_F T;
SELECT * FROM BBG_RA_AJUSTMENT_REASON_D;
SELECT * FROM RABATCHER.W_PRODUCT_D_RTL_TMP;
SELECT *
  FROM W_RTL_SLS_DP_LC_MN_A T
 WHERE T.MN_WID = '201312'
   AND T.ORG_WID = 17;

SELECT DISTINCT T.BBG_RETAIL_TYPE_WID
  FROM W_RTL_SLS_DP_LC_MN_A T
 WHERE T.MN_WID IN (201312, 201401);
SELECT * FROM W_PROD_CAT_DH;
SELECT * FROM W_INT_ORG_D;
SELECT * FROM W_INT_ORG_DH;
SELECT * FROM W_INT_ORG_D_TL;
SELECT * FROM W_INT_ORG_ATTR_D;

SELECT DISTINCT R.RETAIL_TYPE_ID 零售类型编码, R.RETAIL_TYPE_DESC 零售类型
  FROM W_RTL_SLS_DP_LC_MN_A A,
       W_INT_ORG_D          ORG,
       W_INT_ORG_D_TL       TL,
       BBG_RA_RETAIL_TYPE_D R,
       W_PROD_CAT_DH        DH
 WHERE A.ORG_WID = ORG.ROW_WID
   AND ORG.ORG_NUM = TL.INTEGRATION_ID
   AND R.ROW_WID = A.BBG_RETAIL_TYPE_WID
   AND DH.ROW_WID = A.PROD_DH_WID
   AND A.MN_WID IN (201312, 201401)
 GROUP BY TL.INTEGRATION_ID,
          TL.ORG_NAME,
          A.MN_WID,
          DH.LVL6ANC_PRODCAT_ID,
          R.RETAIL_TYPE_ID,
          R.RETAIL_TYPE_DESC;
