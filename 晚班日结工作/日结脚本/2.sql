select *
  from sa_tran_head
 where rowid in
       (select rowid
          from (select store,
                       day,
                       store_day_seq_no,
                       register,
                       tran_no,
                       ROWID,
                       RANK() OVER(PARTITION BY store, day, store_day_seq_no, register, tran_no ORDER BY ROWID) AS RANK1
                  from sa_tran_head
                 where (store, day, store_day_seq_no, register, tran_no) in
                       (select sth.store,
                               sth.day,
                               sth.store_day_seq_no,
                               sth.register,
                               sth.tran_no
                          from sa_tran_head sth, sa_store_day ssd
                         where sth.store_day_seq_no = ssd.store_day_seq_no
                           and ssd.BUSINESS_DATE = get_vdate
                         group by sth.store,
                                  sth.day,
                                  sth.store_day_seq_no,
                                  sth.register,
                                  sth.tran_no
                        having count(*) > 1))
         where rank1 = 1)
 order by tran_seq_no;
