update sa_store_day d
   set d.store_status = 'C', d.data_status = 'F'
 where d.files_loaded > 0
   and d.store_status = 'W';
commit;
