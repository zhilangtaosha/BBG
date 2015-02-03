--TRAN_CODE定义
select * from tran_data_codes

--VAT_TYPE 增值税类型：C进项税R销项税B进项与销项一个税率
----RA数据比对
--按店汇总
SELECT T.LOCATION LOC,
              /* T.ITEM,*/
               SUM( T.UNITS) QTY,
               SUM( T.TOTAL_RETAIL / ( 1 + (CASE
                     WHEN T.TRAN_CODE = 3 THEN
                      T.VAT_RATE / 100
                     ELSE
                      0
                   END))) AMT,
               SUM( T.TOTAL_COST / ( 1 + (CASE
                     WHEN T.TRAN_CODE = 3 THEN
                      (SELECT VAT_RATE / 100
                         FROM VAT_ITEM
                        WHERE ACTIVE_DATE =
                              (SELECT MAX (V.ACTIVE_DATE )
                                 FROM VAT_ITEM V
                                WHERE V.ITEM = T.ITEM
                                  AND V.VAT_REGION = 1000
                                  AND V.VAT_TYPE IN ('C' , 'B')
                                  AND V.ACTIVE_DATE <= T.TRAN_DATE)
                          AND ITEM = T.ITEM
                          AND VAT_REGION = 1000
                          AND VAT_TYPE IN ('C' , 'B'))
                     ELSE
                      0
                   END))) COST
          FROM RA_RMS.TRAN_DATA_HISTORY_PACK_V T
         WHERE T.TRAN_CODE IN (2 , 3)
           AND T.TRAN_DATE = DATE '2013-06-19'
         GROUP BY T.LOCATION /*, T.ITEM*/
        
--按部门汇总
SELECT T.DEPT DEPT,
              /* T.ITEM,*/
               SUM( T.UNITS) QTY,
               SUM( T.TOTAL_RETAIL / ( 1 + (CASE
                     WHEN T.TRAN_CODE = 3 THEN
                      T.VAT_RATE / 100
                     ELSE
                      0
                   END))) AMT,
               SUM( T.TOTAL_COST / ( 1 + (CASE
                     WHEN T.TRAN_CODE = 3 THEN
                      (SELECT VAT_RATE / 100
                         FROM VAT_ITEM
                        WHERE ACTIVE_DATE =
                              (SELECT MAX (V.ACTIVE_DATE )
                                 FROM VAT_ITEM V
                                WHERE V.ITEM = T.ITEM
                                  AND V.VAT_REGION = 1000
                                  AND V.VAT_TYPE IN ('C' , 'B')
                                  AND V.ACTIVE_DATE <= T.TRAN_DATE)
                          AND ITEM = T.ITEM
                          AND VAT_REGION = 1000
                          AND VAT_TYPE IN ('C' , 'B'))
                     ELSE
                      0
                   END))) COST
          FROM RA_RMS.TRAN_DATA_HISTORY_PACK_V T
         WHERE T.TRAN_CODE IN (2 , 3)
           AND T.TRAN_DATE = DATE '2013-06-20'
         GROUP BY T.DEPT /*, T.ITEM*/
         ORDER BY T.DEPT ;
         
--按商品汇总
SELECT T.ITEM ITEM,
              /* T.ITEM,*/
               SUM( T.UNITS) QTY,
               SUM( T.TOTAL_RETAIL / ( 1 + (CASE
                     WHEN T.TRAN_CODE = 3 THEN
                      T.VAT_RATE / 100
                     ELSE
                      0
                   END))) AMT,
               SUM( T.TOTAL_COST / ( 1 + (CASE
                     WHEN T.TRAN_CODE = 3 THEN
                      (SELECT VAT_RATE / 100
                         FROM VAT_ITEM
                        WHERE ACTIVE_DATE =
                              (SELECT MAX (V.ACTIVE_DATE )
                                 FROM VAT_ITEM V
                                WHERE V.ITEM = T.ITEM
                                  AND V.VAT_REGION = 1000
                                  AND V.VAT_TYPE IN ('C' , 'B')
                                  AND V.ACTIVE_DATE <= T.TRAN_DATE)
                          AND ITEM = T.ITEM
                          AND VAT_REGION = 1000
                          AND VAT_TYPE IN ('C' , 'B'))
                     ELSE
                      0
                   END))) COST
          FROM RA_RMS.TRAN_DATA_HISTORY_PACK_V T
         WHERE T.TRAN_CODE IN (2 , 3)
           AND T.TRAN_DATE = DATE '2013-06-20'
           AND T.DEPT='14'
         GROUP BY T.ITEM /*, T.ITEM*/
         ORDER BY T.ITEM ;
