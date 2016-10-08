

alter table t_tkdmxb
add yxrq datetime null
go

if object_id('t_yhjlzb') is not null
	DROP table t_yhjlzb
GO
if object_id('t_yhjlmx') is not null
	DROP table t_yhjlmx
GO

create TABLE t_yhjlzb
(
YHJLBH NVARCHAR(16) NOT NULL,
YHRQ   datetime not null,
YHR	NVARCHAR(3) NOT NULL,
BZ	NVARCHAR(128) NULL,
PRIMARY KEY (YHJLBH)
)

CREATE TABLE [T_YHJLMX] (
	YHJLMXID INT IDENTITY(1,1) NOT NULL,
	[YHJLBH] [varchar] (16)NOT NULL ,
	[HWBH] [varchar] (8) NOT NULL ,
	[PCBH] [varchar] (32) NULL ,
	[SL] [INT] NOT NULL DEFAULT (0),
	[YHSL] INT NOT NULL DEFAULT(0),
	[JL] NVARCHAR(128) NULL ,
	[BZ] [Nvarchar] (128) NULL ,
PRIMARY KEY (YHJLMXID)
	)
GO


DROP TABLE [T_CXZB]
DROP TABLE [T_CXMXB]

CREATE TABLE [T_CXZB] (
	[CXDBH] [varchar] (15) NOT NULL ,
	[CXRQ] [datetime] NOT NULL ,
	[CXR] [varchar] (3) NULL ,
	[YXBZ] [int] NULL ,
	[BZ] [varchar] (64)  NULL ,
	[yhr] [varchar] (3)  NULL ,
	[zgr] [varchar] (3)  NULL ,
	PRIMARY KEY (CXDBH)
)
GO

CREATE TABLE [T_CXMXB] (
CXDMXBID INT IDENTITY(1,1) NOT NULL,
	[CXDBH] [varchar] (15) ,
	[SPBH] [varchar] (16)  ,
	[PCBH] [varchar] (32) ,
	[SL] [decimal](10, 2) NULL default 0 ,
	[YXRQ] [datetime] NULL ,
	[BZ] [varchar] (60) NULL ,
	PRIMARY KEY (CXDMXBID)
) 
GO



if object_id('SP_YHJL') is not null
	DROP PROCEDURE SP_YHJL
GO
/******************* ����˵�� *****************************************************************
  ����������¼
  ����	@dh	�������
        @yhr	������
  ���	����������¼��Ϣ
**********************************************************************************************/
CREATE PROCEDURE SP_YHJL @dh char(6),@yhr char(3) AS
begin

if not exists(
select *
from t_yhjlzb
where convert(char(6), yhrq,112) = @dh
)
begin

	insert into t_yhjlzb(yhjlbh,yhrq,yhr,bz)
	values(@dh,getdate(),@yhr,'')
	
	insert into t_yhjlmx(yhjlbh,hwbh,sl,yhsl,jl,bz)
	select @dh,hwbh,count(distinct spbh),0,'�ϸ�',''
	from t_chxx
	group by hwbh
	order by hwbh
	
	update t_yhjlmx
	set yhsl = sl
	where yhjlbh = @dh
end

end 

go


if object_id('SP_JXQCX') is not null
	DROP PROCEDURE SP_JXQCX
GO
/******************* ����˵�� *****************************************************************
  ����Ч�ڴ�����¼
  ����	@cxr	������
	@zgr   	�ʹ�Ա
        @yhr	������
  ���	����Ч�ڴ�����¼��Ϣ
**********************************************************************************************/
CREATE PROCEDURE SP_JXQCX @cxr char(3), @zgr char(3),@yhr char(3) AS
begin

declare @dh char(6)

select @dh = convert(char(6),getdate(),112)

--һ����ֻ������һ��������
if not exists(
select *
from t_cxzb
where cxdbh = @dh
)
begin
	insert into t_cxzb(cxdbh,cxrq,cxr,zgr,yhr,bz)
	values(@dh,getdate(),@cxr,@zgr,@yhr,'')
	
	insert into t_cxmxb(cxdbh,spbh,pcbh,sl,yxrq,bz)
	select @dh, a.spbh,a.pcbh,a.chsl,a.yxrq,'����'
	from t_chxx a
	join v_spxx b on b.spbh = a.spbh
	where dateadd(day,180,getdate()) >= yxrq and b.lbbh <> '07' and b.flag = 1
end

end 

go



--�ֵ�ִ��
insert into t_funcs(funcid,funnm,funtp,grpid,funms,tplj,funfm,flag,uflag)
values('11','GSP����',1,4,'GSP����','image\tom_wap.gif','w_gsp_report',1,1)

insert into t_funcs(funcid,funnm,funtp,grpid,funms,tplj,funfm,flag,uflag)
values('12','������¼',1,4,'������¼','image\tom_wap.gif','w_yhjl_wh',1,1)

insert into t_funcs(funcid,funnm,funtp,grpid,funms,tplj,funfm,flag,uflag)
values('13','Ч�ڴ���',1,4,'Ч�ڴ���','image\tom_wap.gif','w_xqcx_wh',1,1)





