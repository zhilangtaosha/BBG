
--VIEW
SELECT *
  FROM RABATCHER.BBG_RA_SLS_MBA_LC_DY_FV T
 WHERE T.DT_WID = 120160301000;

--CREATE TABLE 
--BBG_RA_SLS_MBA_LC_DY_TMP
CREATE TABLE RABATCHER.BBG_RA_SLS_MBA_LC_DY_TMP AS
  SELECT *
    FROM RABATCHER.BBG_RA_SLS_MBA_LC_DY_FV T
   WHERE T.DT_WID = 120160301000;
--BBG_RA_SLS_MBA_LC_DY_A
CREATE TABLE RADM.BBG_RA_SLS_MBA_LC_DY_A AS
  SELECT * FROM RABATCHER.BBG_RA_SLS_MBA_LC_DY_TMP;
--sequence
create sequence BBG_RA_SLS_MBA_LC_DY_A_SEQ minvalue 1 maxvalue 9999999999999999999999999999 start
  with 1 increment by 1 cache 20;

--BBG_RA_SLS_MBA_DY_A
CREATE TABLE RADM.BBG_RA_SLS_MBA_DY_A AS
  SELECT T.DT_WID,
         T.A_PROD_NUM,
         T.A_PROD_NAME,
         T.B_PROD_NUM,
         T.B_PROD_NAME,
         SUM(T.A_CNT) A_CNT,
         SUM(T.B_CNT) B_CNT,
         SUM(T.AB_CNT) AB_CNT,
         SUM(T.LOC_CNT) LOC_CNT
    FROM RABATCHER.BBG_RA_SLS_MBA_LC_DY_TMP T
   GROUP BY T.DT_WID,
            T.A_PROD_NUM,
            T.A_PROD_NAME,
            T.B_PROD_NUM,
            T.B_PROD_NAME;
--sequence
create sequence BBG_RA_SLS_MBA_DY_A_SEQ minvalue 1 maxvalue 9999999999999999999999999999 start
  with 1 increment by 1 cache 20;

--ODI
--interface1:source：RABATCHER.BBG_RA_SLS_MBA_LC_DY_FV           target:RABATCHER.BBG_RA_SLS_MBA_LC_DY_TMP   done
--interface2:source：RABATCHER.BBG_RA_SLS_MBA_LC_DY_TMP          target:RADM.BBG_RA_SLS_MBA_LC_DY_A          done
--interface3:source：RABATCHER.BBG_RA_SLS_MBA_LC_DY_TMP          target:RADM.BBG_RA_SLS_MBA_DY_A             done

--------------------
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_PROD_NUM
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_PROD_NUM
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_PROD_NAME
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_PROD_NAME
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_PROD_NUM
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_PROD_NUM
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_PROD_NAME
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_PROD_NAME
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_CNT
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_CNT
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_CNT
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_CNT
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_AB_CNT
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_AB_CNT
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_LOC_CNT
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_LOC_CNT

--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_Dept_Num
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_Dept_Num
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_Class_Num
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_Class_Num
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_Subclass_Num
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_A_Subclass_Num
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_Dept_Num
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_Dept_Num
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_Class_Num
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_Class_Num
--CN_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_Subclass_Num
--CD_Retail_As-Was_BBG_Sales_Market_Basket_Analysis_B_Subclass_Num

SELECT *
  FROM RADM.W_LOCALIZED_STRING_G T
 WHERE T.MSG_NUM LIKE '%Retail_As-Was_BBG_Sales_Market_Basket_Analysis%'
   FOR UPDATE;

--***************************************************************************************************************
--历史数据补入
--数据从2016.1.1开始
--***************************************************************************************************************

--数据调取
SELECT T.ORG_NUM,
       T.A_DEPT,
       T.A_CLASS,
       T.A_SUBCLASS,
       T.A_PROD_NUM,
       T.A_PROD_NAME,
       T.B_DEPT,
       T.B_CLASS,
       T.B_SUBCLASS,
       T.B_PROD_NUM,
       T.B_PROD_NAME,
       SUM(T.A_CNT) A_CNT,
       SUM(T.B_CNT) B_CNT,
       SUM(T.AB_CNT) AB_CNT,
       SUM(T.LOC_CNT) LOC_CNT
  FROM RADM.BBG_RA_SLS_MBA_LC_DY_A T
 WHERE T.ORG_NUM = '120056'
 GROUP BY T.ORG_NUM,
          T.A_DEPT,
          T.A_CLASS,
          T.A_SUBCLASS,
          T.A_PROD_NUM,
          T.A_PROD_NAME,
          T.B_DEPT,
          T.B_CLASS,
          T.B_SUBCLASS,
          T.B_PROD_NUM,
          T.B_PROD_NAME;
