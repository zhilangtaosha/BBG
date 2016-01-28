--1.提取昨日销售
SELECT TDH.TRAN_DATE 销售日期,
       TDH.LY_TRAN_DATE 去年同期日期,
       TDH.SUBCLASS 小类,
       (SELECT SC.SUB_NAME
          FROM RMS.SUBCLASS SC
         WHERE TDH.SUBCLASS = SC.SUBCLASS) 小类名称,
       (SELECT IL.PRIMARY_SUPP
          FROM RMS.ITEM_LOC IL
         WHERE IL.ITEM(+) = TDH.ITEM
           AND IL.LOC(+) = TDH.LOCATION) 供应商编码,
       (SELECT su.sup_name
          FROM rms.sups su, RMS.ITEM_LOC IL
         where IL.ITEM(+) = TDH.ITEM
           AND IL.LOC(+) = TDH.LOCATION
           and su.supplier(+) = IL.PRIMARY_SUPP) 供应商名称,
       TDH.LOCATION 门店编码,
       (SELECT S.STORE_NAME FROM STORE S WHERE TDH.LOCATION = S.STORE(+)) 门店名称,
       (SELECT DCV.chain_name
          FROM RMS.DISTRICT_CHAIN_V DCV
         WHERE DCV.store(+) = TDH.LOCATION) 业态,
       (SELECT DCV.region_name
          FROM RMS.DISTRICT_CHAIN_V DCV
         WHERE DCV.store(+) = TDH.LOCATION) 区域,
       TDH.ITEM 商品,
       (SELECT IM.ITEM_DESC
          FROM RMS.ITEM_MASTER IM
         WHERE IM.ITEM(+) = TDH.ITEM) 商品名称,
       TDH.UNITS 销售数量,
       TDH.TOTAL_COST 销售成本,
       TDH.TOTAL_RETAIL 销售金额,
       TDH.TOTAL_RETAIL - TDH.TOTAL_COST 毛利额,
       TDH.LY_UNITS 去年销售数量,
       TDH.LY_TOTAL_COST 去年销售成本,
       TDH.LY_TOTAL_RETAIL 去年销售金额,
       TDH.LY_TOTAL_RETAIL - TDH.LY_TOTAL_COST 去年毛利额
  FROM (SELECT T.TRAN_DATE TRAN_DATE,
               NVL(L.TRAN_DATE, &TODAY - 365) LY_TRAN_DATE,
               T.SUBCLASS,
               T.ITEM,
               T.LOCATION,
               T.UNITS,
               T.TOTAL_COST,
               T.TOTAL_RETAIL,
               NVL(L.UNITS, 0) LY_UNITS,
               NVL(L.TOTAL_COST, 0) LY_TOTAL_COST,
               NVL(L.TOTAL_RETAIL, 0) LY_TOTAL_RETAIL
          FROM (SELECT TDH.TRAN_DATE,
                       TDH.SUBCLASS,
                       TDH.ITEM,
                       TDH.LOCATION,
                       SUM(TDH.UNITS) UNITS,
                       SUM(TDH.TOTAL_COST) TOTAL_COST,
                       SUM(TDH.TOTAL_RETAIL) TOTAL_RETAIL
                  FROM RMS.TRAN_DATA_HISTORY TDH
                 WHERE TDH.TRAN_DATE = &TODAY
                   AND EXISTS (SELECT 1
                          FROM uda_item_lov UIL
                         WHERE UIL.UDA_ID = 3
                           AND UIL.UDA_VALUE IN (5057, 8430)
                           AND TDH.ITEM = UIL.ITEM)
                   AND TDH.TRAN_CODE IN (1, 3)
                   AND TDH.CLASS = 215
                 GROUP BY TDH.TRAN_DATE, TDH.ITEM, TDH.LOCATION, TDH.SUBCLASS) T,
               (SELECT TDH.TRAN_DATE,
                       TDH.SUBCLASS,
                       TDH.ITEM,
                       TDH.LOCATION,
                       SUM(TDH.UNITS) UNITS,
                       SUM(TDH.TOTAL_COST) TOTAL_COST,
                       SUM(TDH.TOTAL_RETAIL) TOTAL_RETAIL
                  FROM RMS.TRAN_DATA_HISTORY TDH
                 WHERE TDH.TRAN_DATE = &TODAY - 365
                   AND EXISTS (SELECT 1
                          FROM uda_item_lov UIL
                         WHERE UIL.UDA_ID = 3
                           AND UIL.UDA_VALUE IN (5057, 8430)
                           AND TDH.ITEM = UIL.ITEM)
                   AND TDH.TRAN_CODE IN (1, 3)
                   AND TDH.CLASS = 215
                 GROUP BY TDH.TRAN_DATE, TDH.ITEM, TDH.LOCATION, TDH.SUBCLASS) L
         WHERE T.ITEM = L.ITEM(+)
           AND T.LOCATION = L.LOCATION(+)
        UNION
        SELECT L.TRAN_DATE + 365 TRAN_DATE,
               NVL(L.TRAN_DATE, &TODAY - 365) LY_TRAN_DATE,
               L.SUBCLASS,
               L.ITEM,
               L.LOCATION,
               NVL(T.UNITS, 0) UNITS,
               NVL(T.TOTAL_COST, 0) TOTAL_COST,
               NVL(T.TOTAL_RETAIL, 0) TOTAL_RETAIL,
               L.UNITS LY_UNITS,
               L.TOTAL_COST LY_TOTAL_COST,
               L.TOTAL_RETAIL LY_TOTAL_RETAIL
          FROM (SELECT TDH.TRAN_DATE,
                       TDH.SUBCLASS,
                       TDH.ITEM,
                       TDH.LOCATION,
                       SUM(TDH.UNITS) UNITS,
                       SUM(TDH.TOTAL_COST) TOTAL_COST,
                       SUM(TDH.TOTAL_RETAIL) TOTAL_RETAIL
                  FROM RMS.TRAN_DATA_HISTORY TDH
                 WHERE TDH.TRAN_DATE = &TODAY
                   AND EXISTS (SELECT 1
                          FROM uda_item_lov UIL
                         WHERE UIL.UDA_ID = 3
                           AND UIL.UDA_VALUE IN (5057, 8430)
                           AND TDH.ITEM = UIL.ITEM)
                   AND TDH.TRAN_CODE IN (1, 3)
                   AND TDH.CLASS = 215
                 GROUP BY TDH.TRAN_DATE, TDH.ITEM, TDH.LOCATION, TDH.SUBCLASS) T,
               (SELECT TDH.TRAN_DATE,
                       TDH.SUBCLASS,
                       TDH.ITEM,
                       TDH.LOCATION,
                       SUM(TDH.UNITS) UNITS,
                       SUM(TDH.TOTAL_COST) TOTAL_COST,
                       SUM(TDH.TOTAL_RETAIL) TOTAL_RETAIL
                  FROM RMS.TRAN_DATA_HISTORY TDH
                 WHERE TDH.TRAN_DATE = &TODAY - 365
                   AND EXISTS (SELECT 1
                          FROM uda_item_lov UIL
                         WHERE UIL.UDA_ID = 3
                           AND UIL.UDA_VALUE IN (5057, 8430)
                           AND TDH.ITEM = UIL.ITEM)
                   AND TDH.TRAN_CODE IN (1, 3)
                   AND TDH.CLASS = 215
                 GROUP BY TDH.TRAN_DATE, TDH.ITEM, TDH.LOCATION, TDH.SUBCLASS) L
         WHERE T.ITEM(+) = L.ITEM
           AND T.LOCATION(+) = L.LOCATION) TDH
 ORDER BY TDH.TRAN_DATE, TDH.LOCATION, TDH.ITEM;

--2.提取一段时间的销售
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------

SELECT TDH.TRAN_DATE 销售日期,
       TDH.SUBCLASS 小类,
       (SELECT SC.SUB_NAME
          FROM RMS.SUBCLASS SC
         WHERE TDH.SUBCLASS = SC.SUBCLASS) 小类名称,
       (SELECT IL.PRIMARY_SUPP
          FROM RMS.ITEM_LOC IL
         WHERE IL.ITEM(+) = TDH.ITEM
           AND IL.LOC(+) = TDH.LOCATION) 供应商编码,
       (SELECT su.sup_name
          FROM rms.sups su, RMS.ITEM_LOC IL
         where IL.ITEM(+) = TDH.ITEM
           AND IL.LOC(+) = TDH.LOCATION
           and su.supplier(+) = IL.PRIMARY_SUPP) 供应商名称,
       TDH.LOCATION 门店编码,
       (SELECT S.STORE_NAME FROM STORE S WHERE TDH.LOCATION = S.STORE(+)) 门店名称,
       (SELECT DCV.chain_name
          FROM RMS.DISTRICT_CHAIN_V DCV
         WHERE DCV.store(+) = TDH.LOCATION) 业态,
       (SELECT DCV.region_name
          FROM RMS.DISTRICT_CHAIN_V DCV
         WHERE DCV.store(+) = TDH.LOCATION) 区域,
       TDH.ITEM 商品,
       (SELECT IM.ITEM_DESC
          FROM RMS.ITEM_MASTER IM
         WHERE IM.ITEM(+) = TDH.ITEM) 商品名称,
       SUM(TDH.UNITS) 销售数量,
       SUM(TDH.TOTAL_COST) 销售成本,
       SUM(TDH.TOTAL_RETAIL) 销售金额,
       SUM(TDH.TOTAL_RETAIL) - SUM(TDH.TOTAL_COST) 毛利额
  FROM RMS.TRAN_DATA_HISTORY TDH
 WHERE TDH.TRAN_DATE BETWEEN &BDATE AND &EDATE
   AND EXISTS (SELECT 1
          FROM uda_item_lov UIL
         WHERE UIL.UDA_ID = 3
           AND UIL.UDA_VALUE IN (5057, 8430)
           AND TDH.ITEM = UIL.ITEM)
   AND TDH.TRAN_CODE IN (1, 3)
   AND TDH.CLASS = 215
 GROUP BY TDH.ITEM, TDH.SUBCLASS, TDH.LOCATION, TDH.TRAN_DATE
 ORDER BY TDH.TRAN_DATE, TDH.LOCATION, TDH.ITEM;

--3.月累计销售
SELECT TO_CHAR(TDH.TRAN_DATE, 'YYYYMM') 销售日期,
       TDH.SUBCLASS 小类,
       (SELECT SC.SUB_NAME
          FROM RMS.SUBCLASS SC
         WHERE TDH.SUBCLASS = SC.SUBCLASS) 小类名称,
       (SELECT IL.PRIMARY_SUPP
          FROM RMS.ITEM_LOC IL
         WHERE IL.ITEM(+) = TDH.ITEM
           AND IL.LOC(+) = TDH.LOCATION) 供应商编码,
       (SELECT su.sup_name
          FROM rms.sups su, RMS.ITEM_LOC IL
         where IL.ITEM(+) = TDH.ITEM
           AND IL.LOC(+) = TDH.LOCATION
           and su.supplier(+) = IL.PRIMARY_SUPP) 供应商名称,
       TDH.LOCATION 门店编码,
       (SELECT S.STORE_NAME FROM STORE S WHERE TDH.LOCATION = S.STORE(+)) 门店名称,
       (SELECT DCV.chain_name
          FROM RMS.DISTRICT_CHAIN_V DCV
         WHERE DCV.store(+) = TDH.LOCATION) 业态,
       (SELECT DCV.region_name
          FROM RMS.DISTRICT_CHAIN_V DCV
         WHERE DCV.store(+) = TDH.LOCATION) 区域,
       TDH.ITEM 商品,
       (SELECT IM.ITEM_DESC
          FROM RMS.ITEM_MASTER IM
         WHERE IM.ITEM(+) = TDH.ITEM) 商品名称,
       SUM(TDH.UNITS) 销售数量,
       SUM(TDH.TOTAL_COST) 销售成本,
       SUM(TDH.TOTAL_RETAIL) 销售金额,
       SUM(TDH.TOTAL_RETAIL) - SUM(TDH.TOTAL_COST) 毛利额
  FROM RMS.TRAN_DATA_HISTORY TDH
 WHERE TDH.TRAN_DATE BETWEEN &BDATE AND &EDATE
   AND EXISTS (SELECT 1
          FROM uda_item_lov UIL
         WHERE UIL.UDA_ID = 3
           AND UIL.UDA_VALUE IN (5057, 8430)
           AND TDH.ITEM = UIL.ITEM)
   AND TDH.TRAN_CODE IN (1, 3)
   AND TDH.CLASS = 215
 GROUP BY TDH.ITEM,
          TDH.SUBCLASS,
          TDH.LOCATION,
          TO_CHAR(TDH.TRAN_DATE, 'YYYYMM')
 ORDER BY TO_CHAR(TDH.TRAN_DATE, 'YYYYMM'), TDH.LOCATION, TDH.ITEM;

--4.档期销售的数据
SELECT --TDH.TRAN_DATE 销售日期,
 TDH.LOCATION 门店编码,
 (SELECT S.STORE_NAME FROM STORE S WHERE TDH.LOCATION = S.STORE(+)) 门店名称,
 TDH.ITEM 商品,
 (SELECT IM.ITEM_DESC FROM RMS.ITEM_MASTER IM WHERE IM.ITEM(+) = TDH.ITEM) 商品名称,
 (SELECT IL.PRIMARY_SUPP
    FROM RMS.ITEM_LOC IL
   WHERE IL.ITEM(+) = TDH.ITEM
     AND IL.LOC(+) = TDH.LOCATION) 供应商编码,
 (SELECT su.sup_name
    FROM rms.sups su, RMS.ITEM_LOC IL
   where IL.ITEM(+) = TDH.ITEM
     AND IL.LOC(+) = TDH.LOCATION
     and su.supplier(+) = IL.PRIMARY_SUPP) 供应商名称,
 SUM(TDH.UNITS) 销售数量,
 SUM(TDH.TOTAL_COST) 销售成本,
 SUM(TDH.TOTAL_RETAIL) 销售金额,
 SUM(TDH.TOTAL_RETAIL) - SUM(TDH.TOTAL_COST) 毛利额
  FROM RMS.TRAN_DATA_HISTORY TDH
 WHERE TDH.TRAN_DATE BETWEEN &BDATE AND &EDATE
   AND TDH.ITEM IN (800215920,
                    800215921,
                    800212743,
                    800212742,
                    800346241,
                    800346242,
                    800416670,
                    800416669,
                    101183117,
                    800394726,
                    101942582,
                    102704228)
   AND TDH.TRAN_CODE IN (1, 3)
 GROUP BY TDH.ITEM, TDH.SUBCLASS, TDH.LOCATION --, TDH.TRAN_DATE
 ORDER BY /*TDH.TRAN_DATE,*/ TDH.LOCATION, TDH.ITEM;

--5.档期销售的数据(伊利)
SELECT --TDH.TRAN_DATE 销售日期,
 TDH.LOCATION 门店编码,
 (SELECT S.STORE_NAME FROM STORE S WHERE TDH.LOCATION = S.STORE(+)) 门店名称,
 TDH.ITEM 商品,
 (SELECT IM.ITEM_DESC FROM RMS.ITEM_MASTER IM WHERE IM.ITEM(+) = TDH.ITEM) 商品名称,
 (SELECT IL.PRIMARY_SUPP
    FROM RMS.ITEM_LOC IL
   WHERE IL.ITEM(+) = TDH.ITEM
     AND IL.LOC(+) = TDH.LOCATION) 供应商编码,
 (SELECT su.sup_name
    FROM rms.sups su, RMS.ITEM_LOC IL
   where IL.ITEM(+) = TDH.ITEM
     AND IL.LOC(+) = TDH.LOCATION
     and su.supplier(+) = IL.PRIMARY_SUPP) 供应商名称,
 SUM(TDH.UNITS) 销售数量,
 SUM(TDH.TOTAL_COST) 销售成本,
 SUM(TDH.TOTAL_RETAIL) 销售金额,
 SUM(TDH.TOTAL_RETAIL) - SUM(TDH.TOTAL_COST) 毛利额
  FROM RMS.TRAN_DATA_HISTORY TDH
 WHERE TDH.TRAN_DATE BETWEEN &BDATE AND &EDATE
   AND EXISTS (SELECT 1
          FROM uda_item_lov UIL
         WHERE UIL.UDA_ID = 3
           AND UIL.UDA_VALUE = 8430
           AND TDH.ITEM = UIL.ITEM)
   AND TDH.CLASS = 215
   AND TDH.TRAN_CODE IN (1, 3)
 GROUP BY TDH.ITEM, TDH.SUBCLASS, TDH.LOCATION --, TDH.TRAN_DATE
 ORDER BY /*TDH.TRAN_DATE,*/ TDH.LOCATION, TDH.ITEM;

--6.时段销售
SELECT STI.STORE 门店编码,
       (SELECT S.STORE_NAME FROM STORE S WHERE STI.STORE = S.STORE(+)) 门店名称,
       STI.ITEM 商品编码,
       (SELECT IM.ITEM_DESC
          FROM RMS.ITEM_MASTER IM
         WHERE IM.ITEM(+) = STI.ITEM) 商品名称,
       (SELECT IL.PRIMARY_SUPP
          FROM RMS.ITEM_LOC IL
         WHERE IL.ITEM(+) = STI.ITEM
           AND IL.LOC(+) = STI.STORE) 供应商编码,
       (SELECT su.sup_name
          FROM rms.sups su, RMS.ITEM_LOC IL
         where IL.ITEM(+) = STI.ITEM
           AND IL.LOC(+) = STI.STORE
           and su.supplier(+) = IL.PRIMARY_SUPP) 供应商名称,
       --H.TRAN_DATETIME,
       SUM(NVL(STI.QTY, 0)) 销售数量,
       SUM(NVL(STI.QTY, 0) * NVL(STI.UNIT_RETAIL, 0) -
           NVL(DISC.DISC_AMT, 0)) 销售金额
  FROM SA_TRAN_ITEM STI,
       SA_TRAN_HEAD H,
       SA_STORE_DAY D,
       (SELECT TRAN_SEQ_NO,
               ITEM_SEQ_NO,
               STORE,
               DAY,
               SUM(NVL(STD.QTY, 0) * NVL(STD.UNIT_DISCOUNT_AMT, 0)) DISC_AMT
          FROM SA_TRAN_DISC STD
         GROUP BY TRAN_SEQ_NO, ITEM_SEQ_NO, STORE, DAY) DISC
 WHERE STI.TRAN_SEQ_NO = H.TRAN_SEQ_NO
   AND STI.STORE = H.STORE
   AND STI.DAY = H.DAY
   AND H.STORE_DAY_SEQ_NO = D.STORE_DAY_SEQ_NO
   AND D.BUSINESS_DATE = DATE
 '2015-06-30'
   AND STI.TRAN_SEQ_NO = DISC.TRAN_SEQ_NO(+)
   AND STI.ITEM_SEQ_NO = DISC.ITEM_SEQ_NO(+)
   AND STI.STORE = DISC.STORE(+)
   AND STI.DAY = DISC.DAY(+)
   AND STI.ITEM IN
       (800388984, 800388986, 800388985, 800185746, 800185745, 800354715)
      --AND D.STORE = 120033
   AND TO_CHAR(H.TRAN_DATETIME, 'HH24MI') >= '2130'
 GROUP BY STI.ITEM, STI.STORE --, H.TRAN_DATETIME
;

--7.到货率
SELECT (SELECT IM.DEPT FROM ITEM_MASTER IM WHERE T.ITEM = IM.ITEM) 大类,
       T.ORDER_NO 订单号,
       TRUNC(T.ORIG_APPROVAL_DATE) 审核日期,
       T.SUPPLIER 供应商编码,
       (SELECT SUP_NAME FROM SUPS WHERE SUPPLIER = T.SUPPLIER) 供应商名称,
       T.LOC 收货机构,
       (SELECT LOC_NAME FROM LOC_V WHERE LOC = T.LOC) 收货机构名称,
       T.ITEM 商品编码,
       (SELECT ITEM_DESC FROM ITEM_MASTER WHERE ITEM = T.ITEM) 商品名称,
       T.AMT_ORDERED 订货金额,
       NVL(T.AMT_RECEIVED, 0) 收货金额,
       NVL(T.AMT_RECEIVED / AMT_ORDERED, 0) 金额到货率
  FROM (SELECT OH.ORDER_NO,
               MAX(OH.SUPPLIER) SUPPLIER,
               MAX(OH.ORIG_APPROVAL_DATE) ORIG_APPROVAL_DATE,
               OD.LOCATION LOC,
               OD.ITEM,
               AVG(OD.QTY_ORDERED + NVL(OD.QTY_CANCELLED, 0)) QTY_ORDERED,
               AVG(NVL(OD.QTY_RECEIVED, 0)) QTY_RECEIVED,
               AVG(NVL(OD.QTY_CANCELLED, 0)) QTY_CANCELED,
               AVG(NVL((SELECT UNIT_COST
                         FROM SHIPSKU
                        WHERE SHIPMENT = SH.SHIPMENT
                          AND ITEM = OD.ITEM),
                       OD.UNIT_COST) *
                   (OD.QTY_ORDERED + NVL(OD.QTY_CANCELLED, 0))) AMT_ORDERED,
               SUM((SELECT UNIT_COST * QTY_RECEIVED
                     FROM SHIPSKU
                    WHERE SHIPMENT = SH.SHIPMENT
                      AND ITEM = OD.ITEM)) AMT_RECEIVED
          FROM ORDHEAD OH, ORDLOC OD, SHIPMENT SH
         WHERE OH.ORDER_NO = OD.ORDER_NO
           AND OH.ORDER_NO = SH.ORDER_NO(+)
           AND OH.ORIG_APPROVAL_DATE >= &STD
           AND OH.ORIG_APPROVAL_DATE < &EDD + 1
           AND OH.SUPPLIER = DECODE(&SUPPLIER, '', OH.SUPPLIER, &SUPPLIER)
         GROUP BY OH.ORDER_NO, OD.LOCATION, OD.ITEM) T;

SELECT * FROM ORDLOC T;
