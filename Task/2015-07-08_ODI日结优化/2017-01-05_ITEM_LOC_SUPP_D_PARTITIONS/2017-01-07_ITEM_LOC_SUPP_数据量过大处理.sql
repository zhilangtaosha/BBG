--1.
TRUNCATE TABLE RADM.BBG_RA_ITEM_LOC_SUPP_DS;

insert into RADM.BBG_RA_ITEM_LOC_SUPP_DS T
  (ITEM,
   SUPPLIER,
   ORIGIN_COUNTRY_ID,
   LOC,
   LOGISTICS_DELIVERY_MODEL,
   DESC_CHINESE,
   DESC_ENGLISH,
   REF_NO2,
   SRC_EFF_FROM_DT,
   DATASOURCE_NUM_ID,
   ETL_PROC_WID,
   INTEGRATION_ID)

  select S.ITEM,
         S.SUPPLIER,
         S.ORIGIN_COUNTRY_ID,
         S.LOC,
         S.LOGISTICS_DELIVERY_MODEL,
         S.DESC_CHINESE,
         S.DESC_ENGLISH,
         S.REF_NO2,
         TO_DATE('2017-01-06', 'YYYY-MM-DD'),
         1,
         100,
         to_char(ITEM) || '~' || to_char(SUPPLIER) || '~' ||
         to_char(ORIGIN_COUNTRY_ID) || '~' || to_char(LOC)
    from (select C1_ITEM                     ITEM,
                 C2_SUPPLIER                 SUPPLIER,
                 C3_ORIGIN_COUNTRY_ID        ORIGIN_COUNTRY_ID,
                 C4_LOC                      LOC,
                 C5_LOGISTICS_DELIVERY_MODEL LOGISTICS_DELIVERY_MODEL,
                 C6_DESC_CHINESE             DESC_CHINESE,
                 C7_DESC_ENGLISH             DESC_ENGLISH,
                 C8_REF_NO2                  REF_NO2
            from (select BBG_RA_ITEM_LOC_SUPP_D_V.ITEM                     C1_ITEM,
                         BBG_RA_ITEM_LOC_SUPP_D_V.SUPPLIER                 C2_SUPPLIER,
                         BBG_RA_ITEM_LOC_SUPP_D_V.ORIGIN_COUNTRY_ID        C3_ORIGIN_COUNTRY_ID,
                         BBG_RA_ITEM_LOC_SUPP_D_V.LOC                      C4_LOC,
                         BBG_RA_ITEM_LOC_SUPP_D_V.LOGISTICS_DELIVERY_MODEL C5_LOGISTICS_DELIVERY_MODEL,
                         BBG_RA_ITEM_LOC_SUPP_D_V.DESC_CHINESE             C6_DESC_CHINESE,
                         BBG_RA_ITEM_LOC_SUPP_D_V.DESC_ENGLISH             C7_DESC_ENGLISH,
                         BBG_RA_ITEM_LOC_SUPP_D_V.ORDERABLE_IND            C8_REF_NO2
                    from RMS.BBG_RA_ITEM_LOC_SUPP_D_V@RA_RMS_DBLINK BBG_RA_ITEM_LOC_SUPP_D_V
                   where (1 = 1)
                     And (TRUNC(BBG_RA_ITEM_LOC_SUPP_D_V.LAST_UPDATE_DATE) >=
                         TO_DATE('2017-01-06', 'YYYY-MM-DD')))
           where (1 = 1)
          
          ) S;
COMMIT;

--2.
DROP TABLE RADM.BBG_RA_ITEM_LOC_SUPP_DS_170106;
CREATE TABLE RADM.BBG_RA_ITEM_LOC_SUPP_DS_170106 AS
  select S.ITEM,
         S.SUPPLIER,
         S.ORIGIN_COUNTRY_ID,
         S.LOC,
         S.LOGISTICS_DELIVERY_MODEL,
         S.DESC_CHINESE,
         S.DESC_ENGLISH,
         S.REF_NO2,
         TO_DATE('2017-01-06', 'YYYY-MM-DD') SRC_EFF_FROM_DT,
         1 DATASOURCE_NUM_ID,
         100 ETL_PROC_WID,
         to_char(ITEM) || '~' || to_char(SUPPLIER) || '~' ||
         to_char(ORIGIN_COUNTRY_ID) || '~' || to_char(LOC) INTEGRATION_ID
    from (select C1_ITEM                     ITEM,
                 C2_SUPPLIER                 SUPPLIER,
                 C3_ORIGIN_COUNTRY_ID        ORIGIN_COUNTRY_ID,
                 C4_LOC                      LOC,
                 C5_LOGISTICS_DELIVERY_MODEL LOGISTICS_DELIVERY_MODEL,
                 C6_DESC_CHINESE             DESC_CHINESE,
                 C7_DESC_ENGLISH             DESC_ENGLISH,
                 C8_REF_NO2                  REF_NO2
            from (select BBG_RA_ITEM_LOC_SUPP_D_V.ITEM                     C1_ITEM,
                         BBG_RA_ITEM_LOC_SUPP_D_V.SUPPLIER                 C2_SUPPLIER,
                         BBG_RA_ITEM_LOC_SUPP_D_V.ORIGIN_COUNTRY_ID        C3_ORIGIN_COUNTRY_ID,
                         BBG_RA_ITEM_LOC_SUPP_D_V.LOC                      C4_LOC,
                         BBG_RA_ITEM_LOC_SUPP_D_V.LOGISTICS_DELIVERY_MODEL C5_LOGISTICS_DELIVERY_MODEL,
                         BBG_RA_ITEM_LOC_SUPP_D_V.DESC_CHINESE             C6_DESC_CHINESE,
                         BBG_RA_ITEM_LOC_SUPP_D_V.DESC_ENGLISH             C7_DESC_ENGLISH,
                         BBG_RA_ITEM_LOC_SUPP_D_V.ORDERABLE_IND            C8_REF_NO2
                    from RMS.BBG_RA_ITEM_LOC_SUPP_D_V@RA_RMS_DBLINK BBG_RA_ITEM_LOC_SUPP_D_V
                   where (1 = 1)
                     And (TRUNC(BBG_RA_ITEM_LOC_SUPP_D_V.LAST_UPDATE_DATE) >=
                         TO_DATE('2017-01-06', 'YYYY-MM-DD')))
           where (1 = 1)
          
          ) S;
  COMMIT;
--3.
CREATE TABLE RADM.BBG_RA_ITEM_LOC_SUPP_DS_DIFF AS
SELECT *
  FROM RADM.BBG_RA_ITEM_LOC_SUPP_DS_170106 A
 WHERE NOT EXISTS (SELECT 1
          FROM RADM.BBG_RA_ITEM_LOC_SUPP_DS B
         WHERE A.ITEM = B.ITEM
           AND A.SUPPLIER = B.SUPPLIER
           AND A.LOC = B.LOC
           AND A.ORIGIN_COUNTRY_ID = B.ORIGIN_COUNTRY_ID);
--4.
TRUNCATE TABLE RADM.C_LOAD_DATES;
TRUNCATE TABLE RADM.BBG_RA_ITEM_LOC_SUPP_DS;
INSERT INTO RADM.BBG_RA_ITEM_LOC_SUPP_DS
  (ITEM,
   SUPPLIER,
   ORIGIN_COUNTRY_ID,
   LOC,
   LOGISTICS_DELIVERY_MODEL,
   DESC_CHINESE,
   DESC_ENGLISH,
   REF_NO2,
   SRC_EFF_FROM_DT,
   DATASOURCE_NUM_ID,
   ETL_PROC_WID,
   INTEGRATION_ID)
  SELECT * FROM RADM.BBG_RA_ITEM_LOC_SUPP_DS_DIFF;
COMMIT;
