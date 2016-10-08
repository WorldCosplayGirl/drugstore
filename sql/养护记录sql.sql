
ALTER TABLE T_YHJLMX
ADD SPBH NVARCHAR(16) NULL
GO

UPDATE t_yhjlmx SET spbh=hwbh WHERE ISNUMERIC(hwbh)>0
GO

UPDATE m 
SET m.hwbh=h.JHHW
FROM t_yhjlmx m
JOIN t_sphw h ON m.spbh=h.spbh
WHERE ISNUMERIC(hwbh)>0
GO

ALTER TABLE t_yhjlmx 
DROP COLUMN hw
GO


/******************* ����˵�� *****************************************************************
  ����������¼
  ����	@dh	�������
        @yhr	������
  ���	����������¼��Ϣ
**********************************************************************************************/
ALTER PROCEDURE [dbo].[SP_YHJL] @dh char(6),@yhr char(3) AS
begin

if not exists(
select *
from t_yhjlzb
where convert(char(6), yhrq,112) = @dh
)
begin

	insert into t_yhjlzb(yhjlbh,yhrq,yhr,bz)
	values(@dh,getdate(),@yhr,'')
	
	insert into t_yhjlmx(yhjlbh,hwbh,sl,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	select @dh,hwbh,count(distinct spbh),0,N'�ϸ�','',N'����Ҫ��',0,0
	from t_chxx
	group by hwbh
	order by hwbh
	
	update t_yhjlmx
	set yhsl = sl
	where yhjlbh = @dh
	
	INSERT INTO t_yhjlmx(yhjlbh,hwbh,spbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx)
	SELECT @dh,c.hwbh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','',N'����Ҫ��',0,1
	FROM t_chxx c
	JOIN T_SPXX ts ON c.spbh=ts.spbh
	WHERE ts.yhlx <> 0
end

end 



GO


