--create table #t
--(
--hwbh nvarchar(8),
--spbh nvarchar(32),
--pcbh nvarchar(32),
--chsl int
--)

--create table #tt
--(
--hwbh nvarchar(8),
--spbh nvarchar(32),
--pcbh nvarchar(32),
--chsl int
--)

DECLARE @hw nvarchar(8), @spbh NVARCHAR(32),@pcbh NVARCHAR(32),
@hwbh NVARCHAR(8),	--��ȷ��λ
@cwhw NVARCHAR(8)	--�����λ

SELECT @hwbh='J0305',@cwhw='G0102'

--�鿴˫��λ
declare cur cursor FORWARD_ONLY for
select tc.hwbh,tc.spbh,tc.pcbh
from t_chxx tc
where tc.spbh in(
		select a.spbh
		from   t_chxx a,
				 t_sphw h
		where  a.spbh=h.spbh and
				 a.hwbh<>h.jhhw)
order by tc.spbh

open cur
fetch next from cur into @hw,@spbh,@pcbh
while @@FETCH_STATUS = 0
begin
	if @hw = @hwbh
	begin
		UPDATE tc
		SET tc.CHSL = tc.CHSL + tt.chsl
		--insert into #t(hwbh,spbh,pcbh,chsl)
		--select tc.hwbh,tc.spbh,tc.pcbh,tc.CHSL + tt.chsl
		FROM T_CHXX tc
		join (SELECT chsl FROM t_chxx WHERE spbh = @spbh AND pcbh = @pcbh AND hwbh=@cwhw) tt on 1=1
		WHERE tc.spbh = @spbh AND pcbh = @pcbh AND hwbh=@hwbh 

		--DELETE tc 
		--insert into #tt(hwbh,spbh,pcbh,chsl)
		--select tc.hwbh,tc.spbh,tc.pcbh,tc.chsl
		update tc
		set tc.bz = '##&&##'
		FROM t_chxx tc 
		WHERE tc.spbh = @spbh AND pcbh = @pcbh AND hwbh=@cwhw
	end
	
	fetch next from cur into @hw,@spbh,@pcbh
end
close cur
DEALLOCATE cur

delete from T_chxx where bz = '##&&##'

--select * from #t
--select * from #tt

--drop table #t
--drop table #tt


