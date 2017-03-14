UPDATE /*+PARALLEL(32)*/ RADM.W_PRODUCT_D E
   SET E.BBG_ITEM_BRAND =
       (SELECT F.DOMAIN_MEMBER_NAME
          FROM (SELECT D.PROD_WID, D.DOMAIN_MEMBER_CODE, C.DOMAIN_MEMBER_NAME
                  FROM (SELECT A.DOMAIN_MEMBER_CODE, A.DOMAIN_MEMBER_NAME
                          FROM W_DOMAIN_MEMBER_LKP_TL A
                         WHERE A.DOMAIN_CODE = 'ITEM_UDA'
                           AND A.DOMAIN_TYPE_CODE = 'S'
                           AND A.LANGUAGE_CODE = 'ZHS') C,
                       (SELECT B.PROD_WID,
                               B.FLEX_ATTRIB_1_CHAR || '~' ||
                               B.FLEX_ATTRIB_3_CHAR DOMAIN_MEMBER_CODE
                          FROM RADM.W_RTL_ITEM_GRP1_D B
                         WHERE B.PROD_GRP_TYPE = 'ITEMUDA'
                           AND B.FLEX_ATTRIB_1_CHAR = 3) D
                 WHERE C.DOMAIN_MEMBER_CODE = D.DOMAIN_MEMBER_CODE) F
         WHERE E.ROW_WID = F.PROD_WID)
 WHERE EXISTS
 (SELECT 1
          FROM (SELECT D.PROD_WID, D.DOMAIN_MEMBER_CODE, C.DOMAIN_MEMBER_NAME
                  FROM (SELECT A.DOMAIN_MEMBER_CODE, A.DOMAIN_MEMBER_NAME
                          FROM W_DOMAIN_MEMBER_LKP_TL A
                         WHERE A.DOMAIN_CODE = 'ITEM_UDA'
                           AND A.DOMAIN_TYPE_CODE = 'S'
                           AND A.LANGUAGE_CODE = 'ZHS') C,
                       (SELECT B.PROD_WID,
                               B.FLEX_ATTRIB_1_CHAR || '~' ||
                               B.FLEX_ATTRIB_3_CHAR DOMAIN_MEMBER_CODE
                          FROM RADM.W_RTL_ITEM_GRP1_D B
                         WHERE B.PROD_GRP_TYPE = 'ITEMUDA'
                           AND B.FLEX_ATTRIB_1_CHAR = 3) D
                 WHERE C.DOMAIN_MEMBER_CODE = D.DOMAIN_MEMBER_CODE) G
         WHERE E.ROW_WID = G.PROD_WID
           AND E.BBG_ITEM_BRAND <> G.DOMAIN_MEMBER_NAME);
