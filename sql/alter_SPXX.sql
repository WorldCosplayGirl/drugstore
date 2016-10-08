-- ҩƷ���
alter table t_spxx
add yplb nvarchar(16) null

-- ҩƷ��ѧ����
alter table t_spxx
add hxmc nvarchar(64) null


INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES(12, N'��Ʒ��ǩ��ӡ', 3, 2, N'��Ʒ��ǩ��ӡ', 'image\tom_wap.gif', 'w_printjq', 0, 1)

update t_spxx
set yplb = N'ҩƷ'

update t_spxx
set hxmc = replace(replace(substring(pm, charindex('(',pm),200),'(',''),')','')
where ltrim(rtrim(left(pm,charindex('(',pm)))) <> ''

--��������ֶΣ�����������ֵ���
alter table t_spxx
add lb varchar(20)


--����ϵͳѡ������籣��ҩƷ���ȵ���Ϣ
CREATE TABLE [T_Options] (
	[ID] [varchar] (4) NOT NULL ,
	[OptionID] tinyint NOT NULL ,	--���1 ҩƷ��� 2 ���
	[Name] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	CONSTRAINT [PK_T_Options] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO

insert into T_Options(id,optionid,name)
values('A',1,N'ҩƷ')

insert into T_Options(id,optionid,name)
values('B',1,N'����ʳƷ')

insert into T_Options(id,optionid,name)
values('C',1,N'��е')

insert into T_Options(id,optionid,name)
values('D',1,N'����')

--���������ʱ�(���������ʱ�)
CREATE TABLE [T_LSLRL] (
	[ID] tinyint NOT NULL ,
	[NameText] varchar(2) NOT NULL ,	--���ƣ����磺A��B
	[SX] decimal(6,2) not  NULL , --��������
	[XX] decimal(6,2) not  NULL , --��������
	CONSTRAINT [PK_T_LSLRL] PRIMARY KEY  NONCLUSTERED 
	(
		[ID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO

--delete from T_LSLRL

insert into T_LSLRL(id,NameText,sx,xx)
values(1,'A',0,0.10)

insert into T_LSLRL(id,NameText,sx,xx)
values(2,'B',0.11,0.2)

--���ӳ��ⵥ��ϸ��ʱ��Ϊ�˽��������ݺϲ�ʱ��ordr�ֶ�����
create table t_ckdmxb_temp
(
ckdbh varchar(32),
ordr int Identity(1,1) NOT NULL,
spbh varchar(32),
pcbh varchar(32),
yxrq datetime,
jhj decimal(9,4),
lsj decimal(9,4),
kcl int,
shul decimal(9,4),
yxkw nvarchar(16),
note nvarchar(32),
flag int
)

--ɾ����������ϸ��û����Ʒ�Ľ�����
delete a
from t_jhdzb a
left join t_jhdmxb b on a.jhdbh = b.jhdbh 
where b.jhdbh is null

--��Ʒ�������������ʸ����ֶΣ����ĳһ���ҩƷ���������󸡶���
alter table t_splb
add rate decimal(5,2)

update t_splb
set rate = 0.05

--������Ʒ�۸��ѯ�˵�
INSERT INTO [T_FUNCS]
           ([FUNCID]
           ,[FUNNM]
           ,[FUNTP]
           ,[GRPID]
           ,[FUNMS]
           ,[TPLJ]
           ,[FUNFM]
           ,[FLAG]
           ,[UFLAG])
     VALUES
           ('14'
           ,'��Ʒ�۸�'
           ,2
           ,0
           ,''
           ,'image\tom_wap.gif'
           ,'w_lsrate'
           ,0
           ,1)

--������ͼ�������Ʒ�۸�
drop view v_spxx_jhj 
go

create view v_spxx_jhj
as
select m.spbh,m.pcbh,sum(m.jhj*m.shul)/sum(m.shul) as jhj
from t_ckdmxb m
where m.shul > 0
group by m.spbh,m.pcbh
go


--��ȡ��������
  SELECT T_LSDZB.LSDBH,   
         T_LSDZB.RQ,   
         T_LSDZB.BC,   
         T_LSDZB.JS,            
         T_LSDZB.ZDZK,  
         T_LSDZB.BZ,   
         T_LSDZB.KPR,
	 T_LSDMXB.SPBH,   
         T_LSDMXB.SL,   
         T_LSDMXB.LSJ,   
         T_LSDMXB.YYYBH,   
         T_LSDMXB.ZK, 
	 T_LSDMXB.PCBH,  
         V_SPXX_QTCX.PM,   
         V_SPXX_QTCX.GG,   
         V_SPXX_QTCX.JLDW,
	 V_SPXX_QTCX.SCCJ,
	 round(( t_lsdzb.zdzk / 100.0 ) *  t_lsdmxb.lsj * t_lsdmxb.sl * (t_lsdmxb.zk/100.0) * t_lsdzb.js ,2) as hjje
	,(v_spxx_jhj.jhj + v_spxx_jhj.jhj *t_splb.rate) * T_LSDMXB.sl
	,v_spxx_jhj.jhj + v_spxx_jhj.jhj *t_splb.rate as jhj
    FROM T_LSDZB,   
         T_LSDMXB,   
         V_SPXX_QTCX
	,v_spxx_jhj,
	t_splb  
   WHERE ( T_LSDZB.LSDBH = T_LSDMXB.LSDBH ) and  
         ( T_LSDMXB.SPBH = V_SPXX_QTCX.SPBH ) 
	and 	 T_LSDMXB.SPBH = v_spxx_jhj.SPBH and
	 T_LSDMXB.pcbh = v_spxx_jhj.pcbh and
	 v_spxx_qtcx.lbbh = t_splb.splbbh
and T_LSDZB.rq between '2009-02-14' and '2009-03-31'







