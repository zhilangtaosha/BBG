--********************************************************************************************
--接口定义
--********************************************************************************************
--商品资料接口
SELECT * FROM BBG_RA_PRODUCT_JL_V@RA_JL;
--商品地点接口
SELECT * FROM BBG_RA_ITEM_LOC_JL_V@RA_JL;
--销售接口
SELECT * FROM BBG_RA_SLS_TRX_JL_V@RA_JL;
--供应商销售接口
SELECT * FROM BBG_RA_SUPP_SLS_JL_V@RA_JL;

--*********************************************************************************************

--检查商品资料是否重复
SELECT *
  FROM BBG_RA_PRODUCT_JL_REF_V T
 WHERE EXISTS (SELECT 1 FROM W_PRODUCT_D D WHERE D.PROD_NUM = T.PROD_NUM);

--金力商品导入RA_RMS.W_RTL_ITEM_D_TMP for SDE_RetailItemDimension
INSERT INTO RA_RMS.W_RTL_ITEM_D_TMP D
  (D.PROD_IT_NUM,
   D.ITEM_DESC,
   D.PACK_IND,
   D.ITEM_SHRT_DESC,
   D.ITEM_SECND_DESC,
   D.STND_UOM_CODE,
   D.SUBCLASS,
   D.INV_IND,
   D.MRCH_IND,
   D.SELLABLE_IND,
   D.PACK_SELLABLE_CDE,
   D.PACK_SIMPLE_CDE,
   D.PACK_ORDERABLE_CDE,
   D.PACKAGE_SIZE,
   D.PACKAGE_UOM,
   D.ITEM_NBR_TYPE_CODE,
   D.ITEM_LEVEL,
   D.TRAN_LEVEL,
   D.LEVEL1_NUM,
   D.LEVEL2_NUM,
   D.LEVEL3_NUM,
   D.DIFF1_NUM,
   D.DIFF2_NUM,
   D.DIFF3_NUM,
   D.DIFF4_NUM,
   D.INTEGRATION_ID,
   D.DATASOURCE_NUM_ID,
   D.TENANT_ID,
   D.CREATED_BY_WID,
   D.CHANGED_BY_WID,
   D.CREATED_ON_DT,
   D.CHANGED_ON_DT,
   D.AUX1_CHANGED_ON_DT,
   D.AUX2_CHANGED_ON_DT,
   D.AUX3_CHANGED_ON_DT,
   D.AUX4_CHANGED_ON_DT,
   D.W_INSERT_DT,
   D.W_UPDATE_DT,
   D.ETL_PROC_WID,
   D.PRODUCT_ATTR1_NUM_VALUE,
   D.X_CUSTOM,
   D.PRODUCT_ATTR2_NUM_VALUE,
   D.LANGUAGE_CODE,
   D.PRODUCT_ATTR3_NUM_VALUE,
   D.BBG_ITEM_BRAND,
   D.BBG_ITEM_PLACE_OF_ORIGIN,
   D.BBG_ITEM_UOM_DESC,
   D.BBG_REFERENCE_NO1,
   D.BBG_REFERENCE_NO2,
   D.BBG_REFERENCE_NO3,
   D.BBG_REFERENCE_NO4,)
  SELECT J.PROD_NUM PROD_IT_NUM,
         J.ITEM_DESC ITEM_DESC,
         J.PACK_FLG PACK_IND,
         J.ITEM_DESC ITEM_SHRT_DESC,
         J.ITEM_DESC ITEM_SECND_DESC,
         (SELECT CASE
                   WHEN U.UOM IS NOT NULL THEN
                    U.UOM
                   ELSE
                    'TAI'
                 END
            FROM RMS.UOM_CLASS U
           WHERE U.UOM_DESC = J.BBG_ITEM_UOM_DESC) STND_UOM_CODE,
         J.PROD_CAT5 SUBCLASS,
         'Y' INV_IND,
         'Y' MRCH_IND,
         'Y' SELLABLE_IND,
         -1 PACK_SELLABLE_CDE,
         -1 PACK_SIMPLE_CDE,
         -1 PACK_ORDERABLE_CDE,
         1 PACKAGE_SIZE,
         (SELECT CASE
                   WHEN U.UOM IS NOT NULL THEN
                    U.UOM
                   ELSE
                    'TAI'
                 END
            FROM RMS.UOM_CLASS U
           WHERE U.UOM_DESC = J.BBG_ITEM_UOM_DESC) PACKAGE_UOM,
         'ITEM' ITEM_NBR_TYPE_CODE,
         2 ITEM_LEVEL,
         2 TRAN_LEVEL,
         -1 LEVEL1_NUM,
         -1 LEVEL2_NUM,
         -1 LEVEL3_NUM,
         NULL DIFF1_NUM,
         NULL DIFF2_NUM,
         NULL DIFF3_NUM,
         NULL DIFF4_NUM,
         J.PROD_NUM INTEGRATION_ID,
         1 DATASOURCE_NUM_ID,
         NULL TENANT_ID,
         NULL CREATED_BY_WID,
         NULL CHANGED_BY_WID,
         NULL CREATED_ON_DT,
         NULL CHANGED_ON_DT,
         NULL AUX1_CHANGED_ON_DT,
         NULL AUX2_CHANGED_ON_DT,
         NULL AUX3_CHANGED_ON_DT,
         NULL AUX4_CHANGED_ON_DT,
         NULL W_INSERT_DT,
         NULL W_UPDATE_DT,
         NULL ETL_PROC_WID,
         1 PRODUCT_ATTR1_NUM_VALUE,
         NULL X_CUSTOM,
         1 PRODUCT_ATTR2_NUM_VALUE,
         LANG.LANG LANGUAGE_CODE,
         1 PRODUCT_ATTR3_NUM_VALUE,
         J.BBG_ITEM_BRAND BBG_ITEM_BRAND,
         J.BBG_ITEM_PLACE_OF_ORIGIN BBG_ITEM_PLACE_OF_ORIGIN,
         J.BBG_ITEM_UOM_DESC BBG_ITEM_UOM_DESC,
         J.BBG_REFERENCE_NO1,
         J.BBG_REFERENCE_NO2,
         J.BBG_REFERENCE_NO3,
         J.BBG_REFERENCE_NO4
    FROM BBG_RA_PRODUCT_JL_V@RMS_JL J,
         (SELECT 'US' LANG FROM DUAL UNION ALL SELECT 'ZHS' LANG FROM DUAL) LANG;

SELECT * FROM RA_RMS.W_RTL_ITEM_D_TMP;
SELECT * FROM BBG_RA_PRODUCT_JL_V@RMS_JL;
