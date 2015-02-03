--RMS下运行
TRUNCATE TABLE RA_RMS.BBG_XTERN_RDWT;
--插入临时表
CREATE TABLE  RA_RMS.BBG_XTERN_RDWT_20130830 AS
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130910' ;
120159	800261235

--120113
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_20130830 T WHERE T.BUSINESS_DT='20130910' AND T.LOCATION='0000120159' AND ITEM='800261235';


TRUNCATE TABLE RA_RMS.C_LOAD_DATES;


--RADM
--检查销售没有传过来的商品在RA商品维度中是否存在

SELECT * FROM W_PRODUCT_D T WHERE T.PROD_NUM IN ('100620389','100620418');
SELECT * FROM RABATCHER.W_PRODUCT_D_RTL_TMP T 
WHERE T.PROD_IT_NUM IN ('100620389','100620418') FOR UPDATE;

CREATE TABLE W_RTL_SLS_TRX_IT_LC_DY_FS_0910 AS
SELECT * FROM W_RTL_SLS_TRX_IT_LC_DY_FS T WHERE T.ORG_NUM='120159' AND T.PROD_IT_NUM='800261235';

TRUNCATE TABLE W_RTL_SLS_TRX_IT_LC_DY_FS;

INSERT INTO W_RTL_SLS_TRX_IT_LC_DY_FS
SELECT * FROM W_RTL_SLS_TRX_IT_LC_DY_FS_0910;

TRUNCATE TABLE RADM.C_LOAD_DATES;
