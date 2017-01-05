
update RADM.BBG_RA_ITEM_LOC_SUPP_D T
   set (DESC_CHINESE,
        DESC_ENGLISH,
        REF_NO1,
        REF_NO2,
        REF_NO3,
        REF_NO4,
        SRC_EFF_FROM_DT,
        SRC_EFF_TO_DT,
        ETL_PROC_WID,
        W_UPDATE_DT
        
        ) =
       (select S.DESC_CHINESE,
               S.DESC_ENGLISH,
               S.REF_NO1,
               S.REF_NO2,
               S.REF_NO3,
               S.REF_NO4,
               S.SRC_EFF_FROM_DT,
               S.SRC_EFF_TO_DT,
               S.ETL_PROC_WID,
               SYSDATE
        
          from (select /*+PARALLEL(16)*/
                 STG.ITEM ITEM,
                 STG.SUPPLIER SUPPLIER,
                 STG.ORIGIN_COUNTRY_ID ORIGIN_COUNTRY_ID,
                 STG.LOC LOC,
                 STG.LOGISTICS_DELIVERY_MODEL LOGISTICS_DELIVERY_MODEL,
                 STG.DESC_CHINESE DESC_CHINESE,
                 STG.DESC_ENGLISH DESC_ENGLISH,
                 STG.REF_NO1 REF_NO1,
                 STG.REF_NO2 REF_NO2,
                 STG.REF_NO3 REF_NO3,
                 STG.REF_NO4 REF_NO4,
                 STG.SRC_EFF_FROM_DT SRC_EFF_FROM_DT,
                 STG.SRC_EFF_TO_DT SRC_EFF_TO_DT,
                 STG.DATASOURCE_NUM_ID DATASOURCE_NUM_ID,
                 100 ETL_PROC_WID,
                 STG.INTEGRATION_ID INTEGRATION_ID,
                 COALESCE(STG.SRC_EFF_FROM_DT,
                          TO_DATE('2017-01-03',
                                  'YYYY-MM-DD')) EFFECTIVE_FROM_DT
                  from RADM.BBG_RA_ITEM_LOC_SUPP_DS STG
                 where (1 = 1)
                
                ) S
         where S.DATASOURCE_NUM_ID = T.DATASOURCE_NUM_ID
           and S.INTEGRATION_ID = T.INTEGRATION_ID
           AND NOT EXISTS
         (select 'X'
                  from RADM.BBG_RA_ITEM_LOC_SUPP_D T
                 where T.DATASOURCE_NUM_ID = S.DATASOURCE_NUM_ID
                   and T.INTEGRATION_ID = S.INTEGRATION_ID
                   and ((T.DESC_CHINESE = S.DESC_CHINESE) or
                       (T.DESC_CHINESE IS NULL and S.DESC_CHINESE IS NULL))
                   and ((T.DESC_ENGLISH = S.DESC_ENGLISH) or
                       (T.DESC_ENGLISH IS NULL and S.DESC_ENGLISH IS NULL))
                   and ((T.REF_NO1 = S.REF_NO1) or
                       (T.REF_NO1 IS NULL and S.REF_NO1 IS NULL))
                   and ((T.REF_NO2 = S.REF_NO2) or
                       (T.REF_NO2 IS NULL and S.REF_NO2 IS NULL))
                   and ((T.REF_NO3 = S.REF_NO3) or
                       (T.REF_NO3 IS NULL and S.REF_NO3 IS NULL))
                   and ((T.REF_NO4 = S.REF_NO4) or
                       (T.REF_NO4 IS NULL and S.REF_NO4 IS NULL))
                   and ((T.SRC_EFF_FROM_DT = S.SRC_EFF_FROM_DT) or
                       (T.SRC_EFF_FROM_DT IS NULL and
                       S.SRC_EFF_FROM_DT IS NULL))
                   and ((T.SRC_EFF_TO_DT = S.SRC_EFF_TO_DT) or
                       (T.SRC_EFF_TO_DT IS NULL and S.SRC_EFF_TO_DT IS NULL))
                      
                   and CURRENT_FLG = 'Y'
                   and EFFECTIVE_TO_DT =
                       to_date('2100-01-01',
                               'YYYY-MM-DD'))
        
        )
 where (T.DATASOURCE_NUM_ID, T.INTEGRATION_ID) in
       (select S.DATASOURCE_NUM_ID, S.INTEGRATION_ID
          from (select /*+PARALLEL(16)*/
                 STG.ITEM ITEM,
                 STG.SUPPLIER SUPPLIER,
                 STG.ORIGIN_COUNTRY_ID ORIGIN_COUNTRY_ID,
                 STG.LOC LOC,
                 STG.LOGISTICS_DELIVERY_MODEL LOGISTICS_DELIVERY_MODEL,
                 STG.DESC_CHINESE DESC_CHINESE,
                 STG.DESC_ENGLISH DESC_ENGLISH,
                 STG.REF_NO1 REF_NO1,
                 STG.REF_NO2 REF_NO2,
                 STG.REF_NO3 REF_NO3,
                 STG.REF_NO4 REF_NO4,
                 STG.SRC_EFF_FROM_DT SRC_EFF_FROM_DT,
                 STG.SRC_EFF_TO_DT SRC_EFF_TO_DT,
                 STG.DATASOURCE_NUM_ID DATASOURCE_NUM_ID,
                 100 ETL_PROC_WID,
                 STG.INTEGRATION_ID INTEGRATION_ID,
                 COALESCE(STG.SRC_EFF_FROM_DT,
                          TO_DATE('2017-01-03',
                                  'YYYY-MM-DD')) EFFECTIVE_FROM_DT
                  from RADM.BBG_RA_ITEM_LOC_SUPP_DS STG
                 where (1 = 1)
                
                ) S
         where S.DATASOURCE_NUM_ID = T.DATASOURCE_NUM_ID
           and S.INTEGRATION_ID = T.INTEGRATION_ID
           AND NOT EXISTS
         (select 'X'
                  from RADM.BBG_RA_ITEM_LOC_SUPP_D T
                 where T.DATASOURCE_NUM_ID = S.DATASOURCE_NUM_ID
                   and T.INTEGRATION_ID = S.INTEGRATION_ID
                   and ((T.DESC_CHINESE = S.DESC_CHINESE) or
                       (T.DESC_CHINESE IS NULL and S.DESC_CHINESE IS NULL))
                   and ((T.DESC_ENGLISH = S.DESC_ENGLISH) or
                       (T.DESC_ENGLISH IS NULL and S.DESC_ENGLISH IS NULL))
                   and ((T.REF_NO1 = S.REF_NO1) or
                       (T.REF_NO1 IS NULL and S.REF_NO1 IS NULL))
                   and ((T.REF_NO2 = S.REF_NO2) or
                       (T.REF_NO2 IS NULL and S.REF_NO2 IS NULL))
                   and ((T.REF_NO3 = S.REF_NO3) or
                       (T.REF_NO3 IS NULL and S.REF_NO3 IS NULL))
                   and ((T.REF_NO4 = S.REF_NO4) or
                       (T.REF_NO4 IS NULL and S.REF_NO4 IS NULL))
                   and ((T.SRC_EFF_FROM_DT = S.SRC_EFF_FROM_DT) or
                       (T.SRC_EFF_FROM_DT IS NULL and
                       S.SRC_EFF_FROM_DT IS NULL))
                   and ((T.SRC_EFF_TO_DT = S.SRC_EFF_TO_DT) or
                       (T.SRC_EFF_TO_DT IS NULL and S.SRC_EFF_TO_DT IS NULL))
                      
                   and CURRENT_FLG = 'Y'
                   and EFFECTIVE_TO_DT =
                       to_date('2100-01-01',
                               'YYYY-MM-DD'))
        
        )
   and T.CURRENT_FLG = 'Y'
   and EFFECTIVE_TO_DT =
       to_date('2100-01-01', 'YYYY-MM-DD');
