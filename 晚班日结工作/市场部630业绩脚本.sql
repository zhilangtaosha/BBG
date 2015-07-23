--POSU完成后发1027935346@qq.com
--406123100@qq.com

select t.tran_date 营业日期,
       t.location 门店,
       s.store_name 门店名称,
       t.dept   大类,
       d.dept_name 大类名称,
       sum(t.total_retail) 销售金额
  from tran_data t, store s, deps d
 where t.location = s.store
   and t.dept = d.dept
   and t.tran_code in (1,3)
 group by t.tran_date,t.location,s.store_name,t.dept,d.dept_name
 order by 1,2,4;
