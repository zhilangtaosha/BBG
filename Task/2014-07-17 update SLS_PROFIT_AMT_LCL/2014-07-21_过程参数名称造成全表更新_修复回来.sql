--参数名和列名一样，全表被更新，修复回来。。。。
/*
1.W_RTL_SLS_CL_DY_CUR_A       FIX
2.W_RTL_SLS_CL_LC_DY_A        FIX
3.W_RTL_SLS_CL_LC_DY_CUR_A    FIX
4.W_RTL_SLS_DP_DY_CUR_A       FIX
5.W_RTL_SLS_DP_LC_DY_A        FIX
6.W_RTL_SLS_DP_LC_DY_CUR_A    FIX
7.W_RTL_SLS_IT_DY_A           FIX
8.W_RTL_SLS_IT_DY_SN_A        FIX
W_RTL_SLS_IT_LC_DY_A        OK
W_RTL_SLS_IT_LC_DY_SN_A     OK
W_RTL_SLS_LC_DY_A           OK
W_RTL_SLS_SC_DY_A           OK
W_RTL_SLS_SC_DY_CUR_A       OK
W_RTL_SLS_SC_LC_DY_A        OK
W_RTL_SLS_SC_LC_DY_CUR_A    OK
W_RTL_SLS_TRX_IT_LC_DY_F    OK
*/
--1
SELECT COUNT(*)
  FROM RADM.W_RTL_SLS_CL_DY_CUR_A T
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
--2
SELECT COUNT(*)
  FROM RADM.W_RTL_SLS_CL_LC_DY_A T
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
--3
SELECT COUNT(*)
  FROM RADM.W_RTL_SLS_CL_LC_DY_CUR_A T
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
--4
SELECT COUNT(*)
  FROM RADM.W_RTL_SLS_DP_DY_CUR_A T
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
--5 
SELECT COUNT(*)
  FROM RADM.W_RTL_SLS_DP_LC_DY_A T
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
--6 
SELECT COUNT(*)
  FROM RADM.W_RTL_SLS_DP_LC_DY_CUR_A T
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
--7
SELECT COUNT(*)
  FROM RADM.W_RTL_SLS_IT_DY_A T
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
--8
SELECT COUNT(*)
  FROM RADM.W_RTL_SLS_IT_DY_SN_A T
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
--修护语句
--1
UPDATE W_RTL_SLS_CL_DY_CUR_A T
   SET T.SLS_PROFIT_AMT_LCL = T.BBG_REFERENCE_FO10,
       T.BBG_REFERENCE_FO10 = NULL
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
COMMIT;
--2
UPDATE W_RTL_SLS_CL_LC_DY_A T
   SET T.SLS_PROFIT_AMT_LCL = T.BBG_REFERENCE_FO10,
       T.BBG_REFERENCE_FO10 = NULL
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
COMMIT;
--3
UPDATE W_RTL_SLS_CL_LC_DY_CUR_A T
   SET T.SLS_PROFIT_AMT_LCL = T.BBG_REFERENCE_FO10,
       T.BBG_REFERENCE_FO10 = NULL
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
COMMIT;
--4
UPDATE W_RTL_SLS_DP_DY_CUR_A T
   SET T.SLS_PROFIT_AMT_LCL = T.BBG_REFERENCE_FO10,
       T.BBG_REFERENCE_FO10 = NULL
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
COMMIT;
--5
UPDATE W_RTL_SLS_DP_LC_DY_A T
   SET T.SLS_PROFIT_AMT_LCL = T.BBG_REFERENCE_FO10,
       T.BBG_REFERENCE_FO10 = NULL
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
COMMIT;
--6
UPDATE W_RTL_SLS_DP_LC_DY_CUR_A T
   SET T.SLS_PROFIT_AMT_LCL = T.BBG_REFERENCE_FO10,
       T.BBG_REFERENCE_FO10 = NULL
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
COMMIT;
--7
UPDATE W_RTL_SLS_IT_DY_A T
   SET T.SLS_PROFIT_AMT_LCL = T.BBG_REFERENCE_FO10,
       T.BBG_REFERENCE_FO10 = NULL
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
COMMIT;
--8
UPDATE W_RTL_SLS_IT_DY_SN_A T
   SET T.SLS_PROFIT_AMT_LCL = T.BBG_REFERENCE_FO10,
       T.BBG_REFERENCE_FO10 = NULL
 WHERE T.BBG_REFERENCE_FO10 IS NOT NULL;
COMMIT;
