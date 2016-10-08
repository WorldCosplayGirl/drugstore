if object_id('SP_JHD2THD') is not null
	DROP PROCEDURE SP_JHD2THD
GO
/******************* ����˵�� *****************************************************************
  �ɽ����������˻�����һ����������Ӧһ���˻���������������д���δ������ʶ����Ʒ��������Ӧ�˻���
  ����	@thdbh   �˻������
        @jhdbh   ���������
	@bsr	 ������
  ���	����һ���˻���
**********************************************************************************************/
CREATE PROCEDURE SP_JHD2THD @thdbh varchar(15),@jhdbh varchar(15),@bsr nvarchar(15) AS
begin

	create table #t
	(
	ordr int identity(1,1),
	thdbh Nvarchar(30),
	spbh Nvarchar(30),
	pcbh Nvarchar(30),
	gysbh nvarchar(30),
	jhj decimal(14,4),
	thsl decimal(14,2),
	yhkw varchar(8)
	)
	
	insert into #t( thdbh,spbh,pcbh,jhj,thsl,yhkw,gysbh)
	select @thdbh,m.spbh,m.pcbh,m.jhj,m.sl,'T01',z.gysbh
	from t_jhdmxb m
	join t_jhdzb z on z.jhdbh = m.jhdbh
	where z.jhdbh = @jhdbh and m.wlhbs = 1
	
	
	insert into t_thdzb(THDBH, THRQ, THR, KPR, YXBZ, BZ)
	values(@thdbh,getdate(),@bsr,@bsr,10,'������'+@jhdbh)

	insert into t_thdmxb(ordr,thdbh,spbh,pcbh,gysbh,thsl,jhj,yxkw,bz)
	select ordr,thdbh,spbh,pcbh,gysbh,thsl,jhj,yhkw,'δ����'
	from #t
	
	drop table #t
end 
go