--苏锦宏原SQL
SELECT T.ORDER_NO 订单号,
       trunc(T.orig_approval_date) 审核日期,
       T.SUPPLIER 供应商编码,
       (SELECT SUP_NAME FROM SUPS WHERE SUPPLIER = T.SUPPLIER) 供应商名称,
       T.LOC 收货机构,
       (SELECT LOC_NAME FROM LOC_V WHERE LOC = T.LOC) 收货机构名称,
       T.ITEM 商品编码,
       (SELECT ITEM_DESC FROM ITEM_MASTER WHERE ITEM = T.ITEM) 商品名称,
       T.QTY_ORDERED 订货数量,
       T.QTY_RECEIVED 收货数量,
       T.QTY_CANCELED 取消数量,
       T.AMT_ORDERED 订货金额,
       nvl(T.AMT_RECEIVED, 0) 收货金额,
       nvl(T.AMT_RECEIVED / AMT_ORDERED, 0) 金额到货率
  FROM (SELECT oh.order_no,
               MAX(OH.SUPPLIER) SUPPLIER,
               MAX(oh.orig_approval_date) orig_approval_date,
               od.location LOC,
               od.item,
               AVG(od.qty_ordered + NVL(od.qty_cancelled, 0)) QTY_ORDERED,
               AVG(nvl(od.qty_received, 0)) QTY_RECEIVED,
               AVG(NVL(od.qty_cancelled, 0)) QTY_CANCELED,
               avg(NVL((SELECT unit_cost
                         FROM shipsku
                        WHERE shipment = sh.shipment
                          AND item = od.item),
                       od.unit_cost) *
                   (od.qty_ordered + NVL(od.qty_cancelled, 0))) AMT_ORDERED,
               SUM((SELECT unit_cost * QTY_RECEIVED
                     FROM shipsku
                    WHERE shipment = sh.shipment
                      AND item = od.item)) AMT_RECEIVED
          FROM ORDHEAD OH, ORDLOC OD, SHIPMENT SH
         WHERE OH.Order_No = od.order_no
           AND oH.order_no = sh.order_no(+)
           AND OH.ORIG_APPROVAL_DATE >= &PM_ST
           AND OH.ORIG_APPROVAL_DATE < &PM_END + 1
           AND OH.SUPPLIER = DECODE(&PM_SUP, '', OH.SUPPLIER, &PM_SUP)
         GROUP BY oh.order_no, od.location, od.item) T;

--修改语句
SELECT SUBSTR(TO_CHAR(T.orig_approval_date, 'YYYYMMDD'),1,6) 月份,
       T.SUPPLIER 供应商名称,
       (SELECT SUP_NAME FROM SUPS WHERE SUPPLIER = T.SUPPLIER) 供应商名称,
       T.LOC 收货机构,
       (SELECT LOC_NAME FROM LOC_V WHERE LOC = T.LOC) 收货机构名称,
       T.ITEM 商品编码,
       (SELECT ITEM_DESC FROM ITEM_MASTER WHERE ITEM = T.ITEM) 商品名称,
       T.QTY_ORDERED 订货数量,
       T.QTY_RECEIVED 收货数量,
       T.AMT_ORDERED 订货金额,
       NVL(T.AMT_RECEIVED, 0) 收货金额,
       DECODE(T.AMT_ORDERED,0,0,NVL(T.AMT_RECEIVED, 0) / T.AMT_ORDERED) 到货率
  FROM (SELECT oh.order_no,
               MAX(OH.SUPPLIER) SUPPLIER,
               MAX(oh.orig_approval_date) orig_approval_date,
               od.location LOC,
               od.item,
               AVG(od.qty_ordered + NVL(od.qty_cancelled, 0)) QTY_ORDERED,
               AVG(nvl(od.qty_received, 0)) QTY_RECEIVED,
               AVG(NVL(od.qty_cancelled, 0)) QTY_CANCELED,
               avg(NVL((SELECT unit_cost
                         FROM shipsku
                        WHERE shipment = sh.shipment
                          AND item = od.item),
                       od.unit_cost) *
                   (od.qty_ordered + NVL(od.qty_cancelled, 0))) AMT_ORDERED,
               SUM((SELECT unit_cost * QTY_RECEIVED
                     FROM shipsku
                    WHERE shipment = sh.shipment
                      AND item = od.item)) AMT_RECEIVED
          FROM ORDHEAD OH, ORDLOC OD, SHIPMENT SH, ITEM_MASTER IM
         WHERE OH.Order_No = od.order_no
           AND oH.order_no = sh.order_no(+)
           AND OD.ITEM = IM.ITEM
           AND IM.DEPT = 23
           AND OH.ORIG_APPROVAL_DATE BETWEEN DATE
         '2014-05-01'
           AND DATE '2014-05-31'
        --AND OH.SUPPLIER = DECODE(&PM_SUP, '', OH.SUPPLIER, &PM_SUP)
         GROUP BY oh.order_no, od.location, od.item) T;
