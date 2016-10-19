--1.
SELECT SE.SESS_NO,
       TRUNC(SE.SESS_BEG) DATES,
       SE.SESS_NAME,
       ST.STEP_NAME,
       TS.TASK_NAME3,
			 TS.TASK_BEG,
			 TS.TASK_END,
       TS.TASK_DUR,
       TS.NB_ROW,
       TS.NB_INS,
       TS.NB_UPD,
       TS.NB_DEL,
       TS.NB_ERR,
			 TS.COL_TXT,
			 TS.DEF_TXT
  FROM ODI_WREP_USER.SNP_SESSION       SE,
       ODI_WREP_USER.SNP_SESS_STEP     ST,
       ODI_WREP_USER.SNP_SESS_TASK_LOG TS
 WHERE SE.SESS_NO = ST.SESS_NO
   AND SE.SESS_NO = TS.SESS_NO
   AND ST.NNO = TS.NNO
   AND ST.NB_RUN = TS.NB_RUN
      --AND SE.SESS_NO = 616049001
   AND ST.STEP_NAME = 'BBG_SIL_BBG_RA_ITEM_LOC_SUPP_Dload'
   AND TS.TASK_NAME3 = 'Insert new rows'
 ORDER BY SE.SESS_BEG DESC;

--2.
SELECT TRUNC(SE.SESS_BEG) DATES,
       SE.SESS_NAME,
       TS.TASK_NAME3,
       TS.TASK_DUR,
       TS.NB_UPD,
       DECODE(TS.NB_UPD, 0, 0, TS.TASK_DUR / TS.NB_UPD) UPD_PER_SECOND,
       DECODE(MAX(TS.TASK_DUR)
              OVER(PARTITION BY SE.SESS_NAME) - MIN(TS.TASK_DUR)
              OVER(PARTITION BY SE.SESS_NAME),
              0,
              0,
              TS.TASK_DUR /
              (MAX(TS.TASK_DUR)
               OVER(PARTITION BY SE.SESS_NAME) - MIN(TS.TASK_DUR)
               OVER(PARTITION BY SE.SESS_NAME))) DUR_PER,
       DECODE(MAX(TS.NB_UPD)
              OVER(PARTITION BY SE.SESS_NAME) - MIN(TS.NB_UPD)
              OVER(PARTITION BY SE.SESS_NAME),
              0,
              0,
              TS.NB_UPD / (MAX(TS.NB_UPD)
               OVER(PARTITION BY SE.SESS_NAME) - MIN(TS.NB_UPD)
               OVER(PARTITION BY SE.SESS_NAME))) UPD_PER
  FROM ODI_WREP_USER.SNP_SESSION       SE,
       ODI_WREP_USER.SNP_SESS_STEP     ST,
       ODI_WREP_USER.SNP_SESS_TASK_LOG TS
 WHERE SE.SESS_NO = ST.SESS_NO
   AND SE.SESS_NO = TS.SESS_NO
   AND ST.NNO = TS.NNO
   AND ST.NB_RUN = TS.NB_RUN
      --AND SE.SESS_NO = 616049001
   AND ST.STEP_NAME = 'BBG_SIL_BBG_RA_ITEM_LOC_SUPP_DLoad'
   AND TS.TASK_NAME3 = 'Merge Rows'
 GROUP BY TRUNC(SE.SESS_BEG),
          SE.SESS_NAME,
          TS.TASK_NAME3,
          TS.TASK_DUR,
          TS.NB_UPD
 ORDER BY TRUNC(SE.SESS_BEG) DESC;

--3.查找最耗时的Analyze target table步骤
SELECT SE.SESS_NO,
       TRUNC(SE.SESS_BEG) DATES,
       SE.SESS_NAME,
       ST.STEP_NAME,
       TS.TASK_NAME3,
       TS.TASK_BEG,
       TS.TASK_END,
       TS.TASK_DUR,
       TS.NB_ROW,
       TS.NB_INS,
       TS.NB_UPD,
       TS.NB_DEL,
       TS.NB_ERR
  FROM ODI_WREP_USER.SNP_SESSION       SE,
       ODI_WREP_USER.SNP_SESS_STEP     ST,
       ODI_WREP_USER.SNP_SESS_TASK_LOG TS
 WHERE SE.SESS_NO = ST.SESS_NO
   AND SE.SESS_NO = TS.SESS_NO
   AND ST.NNO = TS.NNO
   AND ST.NB_RUN = TS.NB_RUN
      --AND SE.SESS_NO = 616049001
   --AND ST.STEP_NAME = 'BBG_SIL_BBG_RA_ITEM_LOC_SUPP_DLoad'
   AND TS.TASK_NAME3 = 'Analyze target table'
	 AND TRUNC(SE.SESS_BEG)=DATE'2016-08-04'
 ORDER BY TS.TASK_DUR DESC;


SELECT * FROM ODI_WREP_USER.SNP_SESS_TASK_LOG;
SELECT * FROM ODI_WREP_USER.SNP_STEP_LOG;
SELECT * FROM ODI_WREP_USER.SNP_SESS_STEP;


