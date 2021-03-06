--2017-01-26,120251,29,102676757
--1.
DELETE /*+PARALLEL(16)*/
RADM.W_RTL_SLS_TRX_IT_LC_DY_FS T
 WHERE T.ORG_NUM <> 120251;
COMMIT;
DELETE /*+PARALLEL(16)*/
RADM.W_RTL_SLS_TRX_IT_LC_DY_FS T
 WHERE T.PROD_IT_NUM <> 102676757;
COMMIT;
--2.
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
       T.RET_PROFIT_AMT_LCL      = 449.5898,
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
--3.
TRUNCATE TABLE RADM.C_LOAD_DATES;
--4.
SELECT * FROM RABATCHER.W_RTL_SLS_TRX_IT_LC_DY_TMP;
