--drop indexes
drop index PK_W_RTL_SLS_TRX_IT_LC_DY_F;

-- Create/Recreate indexes 
create unique index PK_W_RTL_SLS_TRX_IT_LC_DY_F on W_RTL_SLS_TRX_IT_LC_DY_F (PROD_WID, SLS_TRX_ID, VOUCHER_ID, DT_WID, RTL_TYPE_WID, SRC_REF_NO6, BBG_ITEM_LOC_WID, BBG_RETAIL_TYPE_WID, ORG_WID)
  tablespace DM_FACT_INDEX
  pctfree 10
  initrans 12
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
  nologging parallel 10;
	
--����BBG_RA2CSMB
CALL bbg_ra2csmb();
