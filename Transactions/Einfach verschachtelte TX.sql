select top 10 * into #t1 from sysobjects
select top 10 * into #t2 from sysmessages


begin tran
	select * from #t1
	update #t1 set xtype='A'
	Begin tran 
		select * from #t1
		select * from #t2
		update #t2 set error = 100
	commit --erster Teil wurde bestätigt
Rollback --alle Rückgängig gemacht worden


drop table #t1
drop table #t2