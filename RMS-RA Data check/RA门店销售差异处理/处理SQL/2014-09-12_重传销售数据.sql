--2013.8.14 AND 2013.8.19 120014有差异
--清空BBG_XTERN_RDWT
TRUNCATE TABLE RA_RMS.BBG_XTERN_RDWT;
--从BBG_XTERN_RDWT_HIST插入BBG_XTERN_RDWT
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_HIST WHERE BUSINESS_DT= '20140912';
COMMIT;
--清空ODI日志
TRUNCATE TABLE RA_RMS.C_LOAD_DATES;
--修改BBG_RA_ITEM_LOC_SOH_V的日期为重导日期
SELECT * FROM RA_RMS.BBG_RA_ITEM_LOC_SOH_V;

--检查W_RTL_SLS_TRX_IT_LC_DY_FS数据
SELECT DISTINCT T.DAY_DT FROM W_RTL_SLS_TRX_IT_LC_DY_FS T;
--检查W_RTL_SLS_TRX_IT_LC_DY_TMP数据
SELECT DISTINCT T.DT_WID FROM RABATCHER.W_RTL_SLS_TRX_IT_LC_DY_TMP T;

TRUNCATE TABLE RADM.C_LOAD_DATES;
