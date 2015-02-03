120021  100620805
120021  100622472
120021  100622501
120036  100614835
120097  100622472
120097  100622501
120103  100622376
120103  100622472
120113  100620389
120113  100620418
120144  100622472
120144  100622501
120151  100622341
120151  100622376
120151  100622472
120188  100622472
120188  100622501

--RMS下运行
TRUNCATE TABLE RA_RMS.BBG_XTERN_RDWT;
--120021
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120021' AND ITEM='100620805';
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120021' AND ITEM='100622472';
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120021' AND ITEM='100622501';
--120036
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120036' AND ITEM='100614835';
--120097
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120097' AND ITEM='100622472';
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120097' AND ITEM='100622501';
--120103
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120103' AND ITEM='100622376';
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120103' AND ITEM='100622472';
--120113
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120113' AND ITEM='100620389';
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120113' AND ITEM='100620418';
--120144
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120144' AND ITEM='100622472';
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120144' AND ITEM='100622501';
--120151
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120151' AND ITEM='100622341';
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120151' AND ITEM='100622376';
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120151' AND ITEM='100622472';
--120188
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120188' AND ITEM='100622472';
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST T WHERE T.BUSINESS_DT='20130901' AND T.LOCATION='0000120188' AND ITEM='100622501';

--9月1日数据备份
CREATE TABLE RA_RMS.BBG_XTERN_RDWT_20130901 AS
SELECT * FROM RA_RMS.BBG_XTERN_RDWT;

INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_20130901;

SELECT DISTINCT T.LOCATION,T.ITEM
FROM RA_RMS.BBG_XTERN_RDWT T;

TRUNCATE TABLE RA_RMS.C_LOAD_DATES;

--修改视图日期条件
RA_RMS.BBG_RA_ITEM_LOC_SOH_V;


--RADM
--检查销售没有传过来的商品在RA商品维度中是否存在
100620805
100614835
100620389
100620418


SELECT * FROM W_PRODUCT_D T WHERE T.PROD_NUM IN ('100620805','100614835','100620389','100620418');
SELECT * FROM RABATCHER.W_PRODUCT_D_RTL_TMP T WHERE T.PROD_IT_NUM IN ('100620805','100614835','100620389','100620418') FOR UPDATE;


120021	100620805
120036	100614835
120113	100620389
120113	100620418
SELECT DISTINCT DAY_DT FROM W_RTL_SLS_TRX_IT_LC_DY_FS;
CREATE TABLE W_RTL_SLS_TRX_IT_LC_DY_FS_0901 AS
SELECT * FROM W_RTL_SLS_TRX_IT_LC_DY_FS FOR UPDATE;
SELECT COUNT(*)  FROM W_RTL_SLS_TRX_IT_LC_DY_FS WHERE DAY_DT=DATE'2013-08-23';

DELETE W_RTL_SLS_TRX_IT_LC_DY_FS WHERE DAY_DT=DATE'2013-09-05';

TRUNCATE TABLE RADM.C_LOAD_DATES;
