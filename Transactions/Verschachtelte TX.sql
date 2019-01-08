drop table #t1
select top 10 * into #t1 from sysobjects


begin tran TAussen
update #t1 set xtype='A'
select * from #t1
save tran taussen

	Begin tran Tinnen1 with Mark 
	update #t1 set xtype = 'B'
	select * from #t1
	save tran Tinnen1

		Begin tran tinnen2 with Mark
		update #t1 set xtype= 'C'
		select * from #t1 --alle Werte auf 'C'
		save tran tinnen2

			begin tran tinnen3
			update #t1 set xtype='D'
			select * from #t1 --alle Werte auf 'D'
			save tran tinnen3


rollback tran tinnen2
select * from #t1 ----alles wieder auf 'C'
rollback tran tinnen1
select * from #t1 --alles wieder auf 'B'

rollback tran taussen
select * from #t1 --alles wieder auf 'A'

