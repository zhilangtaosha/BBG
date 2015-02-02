--****************************************************************************************
--TOTAL
--****************************************************************************************
--PF.ORACLE_ANALYTICS_TOP_LEVEL
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'PF.ORACLE_ANALYTICS_TOP_LEVEL')
 ORDER BY 1 desc, 2;
--****************************************************************************************
--PHASE
--****************************************************************************************
--PF.SDE_DIMENSION_LOAD
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'PF.SDE_DIMENSION_LOAD')
 ORDER BY 1 desc, 2;
--CMX_RA_DIMENSION_CHECK.KSH
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'CMX_RA_DIMENSION_CHECK.KSH')
 ORDER BY 1 desc, 2;
--PF.SIL_DIMENSION_LOAD
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'PF.SIL_DIMENSION_LOAD')
 ORDER BY 1 desc, 2;
--PF.SDE_FACT_LOAD
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'PF.SDE_FACT_LOAD')
 ORDER BY 1 desc, 2;
--CMX_RA_FACT_CHECK.KSH
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'CMX_RA_FACT_CHECK.KSH')
 ORDER BY 1 desc, 2;
--PF.SIL_FACT_LOAD
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'PF.SIL_FACT_LOAD')
 ORDER BY 1 desc, 2;
--PF.PLP_AGGREGATE_LOADING
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'PF.PLP_AGGREGATE_LOADING')
 ORDER BY 1 desc, 2;
--BBG_ETL_MONTH_DATA.KSH
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'BBG_ETL_MONTH_DATA.KSH')
 ORDER BY 1 desc, 2;
--BATCH_RESA2DW_BACKUP.KSH
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'BATCH_RESA2DW_BACKUP.KSH')
 ORDER BY 1 desc, 2;
--****************************************************************************************
--DETAIL
--****************************************************************************************
--BBG_PRCILSIL.KSH
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'BBG_PRCILSIL.KSH')
 ORDER BY 1 desc, 2;
--PLP_SALES_TRANSACTION
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'PF.PLP_SALES_TRANSACTION')
 ORDER BY 1 desc, 2;
--BBG_RA_SUPP_INV_SIL.KSH
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'BBG_RA_SUPP_INV_SIL.KSH')
 ORDER BY 1 desc, 2;
--BBG_RA_ITEM_LOC_SUPP_SIL.KSH
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'BBG_RA_ITEM_LOC_SUPP_SIL.KSH')
 ORDER BY 1 desc, 2;
--BBG_INVILDSIL.KSH
SELECT *
  FROM (SELECT trunc(ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) days,
               ah_name,
               TRUNC((ah_timestamp4 - ah_timestamp2) * 24) || ':' ||
               RPAD('0' ||
                    TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 -
                          60 * TRUNC((ah_timestamp4 - ah_timestamp2) * 24)),
                    2) || ':' || RPAD('0' ||
                                      TRUNC((ah_timestamp4 - ah_timestamp2) * 24 * 60 * 60 - 60 *
                                            TRUNC((ah_timestamp4 -
                                                                                                   ah_timestamp2) * 24 * 60)),
                                      2) run_time,
               (ah_timestamp2 + NUMTODSINTERVAL(8, 'hour')) start_time,
               (ah_timestamp4 + NUMTODSINTERVAL(8, 'hour')) end_time
          FROM ah@rms_uc4
         WHERE ah_client = 80
           AND ah_timestamp1 >= SYSDATE - &DAYS
           AND ah_name = 'BBG_INVILDSIL.KSH')
 ORDER BY 1 desc, 2;
--
