--1.
TRUNCATE TABLE RA_RMS.BBG_XTERN_RDWT;
INSERT INTO RA_RMS.BBG_XTERN_RDWT
SELECT * FROM RA_RMS.BBG_XTERN_RDWT_BAK T WHERE T.BUSINESS_DT=20161129 AND T.LOCATION='0000139186' AND T.ITEM='102818727';
COMMIT;
--2.
TRUNCATE TABLE RA_RMS.C_LOAD_DATES;
--3.
SELECT * FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_FS;
DELETE RADM.W_RTL_SLS_TRX_IT_LC_DY_FS T WHERE T.BBG_SERVICE_SATISFACTION=3.5;
COMMIT;
--4.
SELECT SUM(T.SLS_QTY - T.RET_QTY) QTY,
       SUM((T.SLS_AMT_LCL - T.SLS_TAX_AMT_LCL) -
           (T.RET_AMT_LCL - T.RET_TAX_AMT_LCL)),
       SUM((T.SLS_AMT_LCL - T.SLS_TAX_AMT_LCL - T.SLS_PROFIT_AMT_LCL) -
           (T.RET_AMT_LCL - T.RET_TAX_AMT_LCL - T.RET_PROFIT_AMT_LCL))
  FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_FS T;
SELECT T.SLS_QTY,
       T.SLS_AMT_LCL,
       T.SLS_PROFIT_AMT_LCL,
       T.SLS_TAX_AMT_LCL,
       T.RET_QTY,
       T.RET_AMT_LCL,
       T.RET_PROFIT_AMT_LCL,
       T.RET_TAX_AMT_LCL
  FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_FS T;
--5.
SELECT * FROM RADM.W_RTL_SLS_TRX_IT_LC_DY_FS FOR UPDATE;
UPDATE RADM.W_RTL_SLS_TRX_IT_LC_DY_FS T
   SET T.SLS_QTY                 = 0,
       T.SLS_AMT_LCL             = 0,
       T.SLS_PROFIT_AMT_LCL      = 0,
       T.SLS_MANUAL_MKDN_AMT_LCL = 0,
       T.SLS_MANUAL_MKUP_AMT_LCL = 0,
       T.SLS_TAX_AMT_LCL         = 0,
       T.SLS_EMP_DISC_AMT_LCL    = 0,
       T.SLS_MANUAL_COUNT        = 0,
       T.SLS_SCAN_COUNT          = 0,
       T.RET_QTY                 = 0,
       T.RET_AMT_LCL             = 0,
       T.RET_PROFIT_AMT_LCL      = 45.3846,
       T.RET_MANUAL_MKDN_AMT_LCL = 0,
       T.RET_MANUAL_MKUP_AMT_LCL = 0,
       T.RET_TAX_AMT_LCL         = 0,
       T.RET_EMP_DISC_AMT_LCL    = 0,
       T.RET_MANUAL_COUNT        = 0,
       T.RET_SCAN_COUNT          = 0,
       T.SLS_COUPON_AMT_LCL      = 0,
       T.RET_COUPON_AMT_LCL      = 0,
       T.SLS_TAX_COUPON_AMT_LCL  = 0,
       T.RET_TAX_COUPON_AMT_LCL  = 0;
COMMIT;
--6.
TRUNCATE TABLE RADM.C_LOAD_DATES;

--7.
SELECT * FROM RABATCHER.W_RTL_SLS_TRX_IT_LC_DY_TMP;
--8.

--9.
