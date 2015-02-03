--1.外部表备份
CREATE TABLE RA_RMS.XTERN_RDWT_20141224 AS
select * from RA_RMS.XTERN_RDWT t;

--2.插入RA_RMS.BBG_XTERN_RDWT
TRUNCATE TABLE RA_RMS.BBG_XTERN_RDWT;

insert into RA_RMS.BBG_XTERN_RDWT T
  (BUSINESS_DT,
   TRANSACTION_DT,
   LOCATION,
   REGISTER_ID,
   BANNER_ID,
   LINE_MEDIA_ID,
   SELLING_ITEM_ID,
   CUST_ORDER_HEADER_ID,
   CUST_ORDER_LINE_ID,
   CUST_ORDER_CREATE_DT,
   CASHIER_IDENT,
   SALES_PERSON_IDENT,
   CUST_ID_TYPE,
   CUST_ID_NO,
   TRANSACTION_NO,
   ORIG_REGISTER_ID,
   ORIG_TRANSACTION_NO,
   TRANSACTION_HEADER_NO,
   REVISION_NO,
   SALES_SIGN,
   TRANSACTION_TYPE,
   SUB_TRANSACTION_TYPE,
   RETAIL_TYPE,
   ITEM_SEQ_NO,
   EMPLOYEE_NO,
   RECEIPT_IND,
   REASON_CD,
   VENDOR_NO,
   ITEM_TYPE,
   ITEM,
   REF_ITEM,
   TAXABLE_IND,
   ENTRY_MODE,
   DEPARTMENT,
   CLASS,
   SUBCLASS,
   TOT_SALES_QUANTITY,
   TOT_TRANSACTION_VAL,
   OVERRIDE_REASON,
   RETURN_REASON,
   TOT_ORIG_SIGN,
   TOT_ORIG_SALES_VAL,
   WEATHER,
   TEMPERATURE,
   TRAFFIC,
   CONSTRUCTION,
   DROP_SHIPMENT_IND,
   DISCOUNT_TYPE,
   PROMO_TRANSACTION_TYPE,
   PROMO_NO,
   PROMO_COMPONENT_NO,
   COUPON_NO,
   COUPON_REF_NO,
   SALES_QUANTITY,
   TRANSACTION_SIGN,
   TRANSACTION_VAL,
   DISCOUNT_VAL,
   UNIT_RETAIL,
   W_INSERT_DT)
  select S.BUSINESS_DT,
         S.TRANSACTION_DT,
         S.LOCATION,
         S.REGISTER_ID,
         S.BANNER_ID,
         S.LINE_MEDIA_ID,
         S.SELLING_ITEM_ID,
         S.CUST_ORDER_HEADER_ID,
         S.CUST_ORDER_LINE_ID,
         S.CUST_ORDER_CREATE_DT,
         S.CASHIER_IDENT,
         S.SALES_PERSON_IDENT,
         S.CUST_ID_TYPE,
         S.CUST_ID_NO,
         S.TRANSACTION_NO,
         S.ORIG_REGISTER_ID,
         S.ORIG_TRANSACTION_NO,
         S.TRANSACTION_HEADER_NO,
         S.REVISION_NO,
         S.SALES_SIGN,
         S.TRANSACTION_TYPE,
         S.SUB_TRANSACTION_TYPE,
         S.RETAIL_TYPE,
         S.ITEM_SEQ_NO,
         S.EMPLOYEE_NO,
         S.RECEIPT_IND,
         S.REASON_CD,
         S.VENDOR_NO,
         S.ITEM_TYPE,
         S.ITEM,
         S.REF_ITEM,
         S.TAXABLE_IND,
         S.ENTRY_MODE,
         S.DEPARTMENT,
         S.CLASS,
         S.SUBCLASS,
         S.TOT_SALES_QUANTITY,
         S.TOT_TRANSACTION_VAL,
         S.OVERRIDE_REASON,
         S.RETURN_REASON,
         S.TOT_ORIG_SIGN,
         S.TOT_ORIG_SALES_VAL,
         S.WEATHER,
         S.TEMPERATURE,
         S.TRAFFIC,
         S.CONSTRUCTION,
         S.DROP_SHIPMENT_IND,
         S.DISCOUNT_TYPE,
         S.PROMO_TRANSACTION_TYPE,
         S.PROMO_NO,
         S.PROMO_COMPONENT_NO,
         S.COUPON_NO,
         S.COUPON_REF_NO,
         S.SALES_QUANTITY,
         S.TRANSACTION_SIGN,
         S.TRANSACTION_VAL,
         S.DISCOUNT_VAL,
         S.UNIT_RETAIL,
         SYSDATE
    from (select TRIM(XTERN_RDWT.BUSINESS_DT) BUSINESS_DT,
                 TRIM(XTERN_RDWT.TRANSACTION_DT) TRANSACTION_DT,
                 TRIM(XTERN_RDWT.LOCATION) LOCATION,
                 TRIM(XTERN_RDWT.REGISTER_ID) REGISTER_ID,
                 TRIM(XTERN_RDWT.BANNER_ID) BANNER_ID,
                 TRIM(XTERN_RDWT.LINE_MEDIA_ID) LINE_MEDIA_ID,
                 TRIM(XTERN_RDWT.SELLING_ITEM_ID) SELLING_ITEM_ID,
                 TRIM(XTERN_RDWT.CUST_ORDER_HEADER_ID) CUST_ORDER_HEADER_ID,
                 TRIM(XTERN_RDWT.CUST_ORDER_LINE_ID) CUST_ORDER_LINE_ID,
                 TRIM(XTERN_RDWT.CUST_ORDER_CREATE_DT) CUST_ORDER_CREATE_DT,
                 TRIM(XTERN_RDWT.CASHIER_IDENT) CASHIER_IDENT,
                 TRIM(XTERN_RDWT.SALES_PERSON_IDENT) SALES_PERSON_IDENT,
                 TRIM(XTERN_RDWT.CUST_ID_TYPE) CUST_ID_TYPE,
                 TRIM(XTERN_RDWT.CUST_ID_NO) CUST_ID_NO,
                 TRIM(XTERN_RDWT.TRANSACTION_NO) TRANSACTION_NO,
                 TRIM(XTERN_RDWT.ORIG_REGISTER_ID) ORIG_REGISTER_ID,
                 TRIM(XTERN_RDWT.ORIG_TRANSACTION_NO) ORIG_TRANSACTION_NO,
                 TRIM(XTERN_RDWT.TRANSACTION_HEADER_NO) TRANSACTION_HEADER_NO,
                 TRIM(XTERN_RDWT.REVISION_NO) REVISION_NO,
                 TRIM(XTERN_RDWT.SALES_SIGN) SALES_SIGN,
                 TRIM(XTERN_RDWT.TRANSACTION_TYPE) TRANSACTION_TYPE,
                 TRIM(XTERN_RDWT.SUB_TRANSACTION_TYPE) SUB_TRANSACTION_TYPE,
                 TRIM(XTERN_RDWT.RETAIL_TYPE) RETAIL_TYPE,
                 TRIM(XTERN_RDWT.ITEM_SEQ_NO) ITEM_SEQ_NO,
                 TRIM(XTERN_RDWT.EMPLOYEE_NO) EMPLOYEE_NO,
                 TRIM(XTERN_RDWT.RECEIPT_IND) RECEIPT_IND,
                 TRIM(XTERN_RDWT.REASON_CD) REASON_CD,
                 TRIM(XTERN_RDWT.VENDOR_NO) VENDOR_NO,
                 TRIM(XTERN_RDWT.ITEM_TYPE) ITEM_TYPE,
                 TRIM(XTERN_RDWT.ITEM) ITEM,
                 TRIM(XTERN_RDWT.REF_ITEM) REF_ITEM,
                 TRIM(XTERN_RDWT.TAXABLE_IND) TAXABLE_IND,
                 TRIM(XTERN_RDWT.ENTRY_MODE) ENTRY_MODE,
                 TRIM(XTERN_RDWT.DEPARTMENT) DEPARTMENT,
                 TRIM(XTERN_RDWT.CLASS) CLASS,
                 TRIM(XTERN_RDWT.SUBCLASS) SUBCLASS,
                 TRIM(XTERN_RDWT.TOT_SALES_QUANTITY) TOT_SALES_QUANTITY,
                 TRIM(XTERN_RDWT.TOT_TRANSACTION_VAL) TOT_TRANSACTION_VAL,
                 TRIM(XTERN_RDWT.OVERRIDE_REASON) OVERRIDE_REASON,
                 TRIM(XTERN_RDWT.RETURN_REASON) RETURN_REASON,
                 TRIM(XTERN_RDWT.TOT_ORIG_SIGN) TOT_ORIG_SIGN,
                 TRIM(XTERN_RDWT.TOT_ORIG_SALES_VAL) TOT_ORIG_SALES_VAL,
                 TRIM(XTERN_RDWT.WEATHER) WEATHER,
                 TRIM(XTERN_RDWT.TEMPERATURE) TEMPERATURE,
                 TRIM(XTERN_RDWT.TRAFFIC) TRAFFIC,
                 TRIM(XTERN_RDWT.CONSTRUCTION) CONSTRUCTION,
                 TRIM(XTERN_RDWT.DROP_SHIPMENT_IND) DROP_SHIPMENT_IND,
                 TRIM(XTERN_RDWT.DISCOUNT_TYPE) DISCOUNT_TYPE,
                 TRIM(XTERN_RDWT.PROMO_TRANSACTION_TYPE) PROMO_TRANSACTION_TYPE,
                 TRIM(XTERN_RDWT.PROMO_NO) PROMO_NO,
                 TRIM(XTERN_RDWT.PROMO_COMPONENT_NO) PROMO_COMPONENT_NO,
                 TRIM(XTERN_RDWT.COUPON_NO) COUPON_NO,
                 TRIM(XTERN_RDWT.COUPON_REF_NO) COUPON_REF_NO,
                 TRIM(XTERN_RDWT.SALES_QUANTITY) SALES_QUANTITY,
                 TRIM(XTERN_RDWT.TRANSACTION_SIGN) TRANSACTION_SIGN,
                 TRIM(XTERN_RDWT.TRANSACTION_VAL) TRANSACTION_VAL,
                 TRIM(XTERN_RDWT.DISCOUNT_VAL) DISCOUNT_VAL,
                 TRIM((XTERN_RDWT.TOT_TRANSACTION_VAL +
                      nvl(XTERN_RDWT.DISCOUNT_VAL, 0)) /
                      XTERN_RDWT.TOT_SALES_QUANTITY) UNIT_RETAIL
            from RA_RMS.XTERN_RDWT_20141224 XTERN_RDWT
           where (1 = 1)) S;
COMMIT;

--3.清空ODI日志
TRUNCATE TABLE RA_RMS.C_LOAD_DATES;
TRUNCATE TABLE RADM.C_LOAD_DATES;

--4.修改BBG_RA_ITEM_LOC_SOH_V的日期为重导日期
SELECT * FROM RA_RMS.BBG_RA_ITEM_LOC_SOH_V;

--5.检查W_RTL_SLS_TRX_IT_LC_DY_FS数据
SELECT DISTINCT T.DAY_DT FROM W_RTL_SLS_TRX_IT_LC_DY_FS T;

--6.检查W_RTL_SLS_TRX_IT_LC_DY_TMP数据
SELECT DISTINCT T.DT_WID FROM RABATCHER.W_RTL_SLS_TRX_IT_LC_DY_TMP T;

--7.备份到RA_RMS.BBG_XTERN_RDWT_HIST
INSERT INTO RA_RMS.BBG_XTERN_RDWT_HIST
SELECT * FROM RA_RMS.BBG_XTERN_RDWT;
COMMIT;

