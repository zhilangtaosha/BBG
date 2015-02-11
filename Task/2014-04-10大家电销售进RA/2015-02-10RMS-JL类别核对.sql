--RMS SUBCLASS
SELECT 'SBC' || '|' || S.DEPT || '|' || S.CLASS || '|' || S.SUBCLASS SBC
  FROM SUBCLASS S
 WHERE S.DEPT LIKE '7%'
 ORDER BY S.SUBCLASS;
--JL SUBCLASS
SELECT DISTINCT 'SBC' || '|' || SUBSTR(T.PROD_CAT5, 6, 2) || '|' ||
                SUBSTR(T.PROD_CAT5, 9, 3) || '|' ||
                SUBSTR(T.PROD_CAT5, 13, 4) SBC,
                T.PROD_CAT5
  FROM BBG_RA_PRODUCT_JL_V@RMS_JL T
 ORDER BY SUBSTR(T.PROD_CAT5, 13, 4);

--������,rms��
SELECT *
  FROM (SELECT DISTINCT 'SBC' || '|' || SUBSTR(T.PROD_CAT5, 6, 2) || '|' ||
                        SUBSTR(T.PROD_CAT5, 9, 3) || '|' ||
                        SUBSTR(T.PROD_CAT5, 13, 4) SBC,
                        T.PROD_CAT5
          FROM BBG_RA_PRODUCT_JL_V@RMS_JL T
         ORDER BY SUBSTR(T.PROD_CAT5, 13, 4)) JL
 WHERE NOT EXISTS (SELECT 1
          FROM (SELECT 'SBC' || '|' || S.DEPT || '|' || S.CLASS || '|' ||
                       S.SUBCLASS SBC
                  FROM SUBCLASS S
                 WHERE S.DEPT LIKE '7%'
                 ORDER BY S.SUBCLASS) RMS
         WHERE RMS.SBC = JL.SBC);

SELECT DISTINCT T.PROD_CAT5 FROM BBG_RA_PRODUCT_JL_V@RMS_JL T;

SELECT * FROM RADM.W_PROD_CAT_DH@RMS_RA T WHERE T.LEVEL_NAME = 'SBC';
