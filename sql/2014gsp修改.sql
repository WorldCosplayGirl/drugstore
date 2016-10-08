--��־��
DROP TABLE T_SYS_LOG 
GO
CREATE TABLE T_SYS_LOG
(
	ID INT IDENTITY(1,1) NOT NULL,
	UserID NVARCHAR(12) NOT NULL,
	OperationDatetime DATETIME NOT NULL DEFAULT GETDATE(),	
	DataNo NVARCHAR(32) NULL,
	OperationDesc NVARCHAR(128) NOT NULL,
	FuncID INT NULL,
	PRIMARY KEY (id)
)
GO

--�ܵꡢ�ֵ�ִ��
ALTER TABLE T_FUNCS
ADD ID INT IDENTITY(1,1) NOT NULL
GO

ALTER TABLE T_FUNCS
ADD parameter TINYINT NULL DEFAULT 0
GO
UPDATE T_FUNCS
SET parameter = 0
GO
--�ֵ�ִ��
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('23', N'��Ʒ����', 1, 0, N'��Ʒ����', 'image\tom_wap.gif', 'w_splock', 1, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES('07', N'ϵͳ��־', 4, 1, N'ϵͳ��־', 'image\tom_wap.gif', 'w_log', 1, 1)
GO

--�ܵꡢ�ֵ궼ִ�� ����
ALTER TABLE T_CHXX
ADD islock TINYINT NULL
GO

UPDATE t_chxx 
SET islock = 0
GO

--�ֵ�ִ��
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	1,3,N'�����������ռ�¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	2,3,N'��Ƭװ�����˼�¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	3,3,N'ҩƷ�¼��˿������')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	4,3,N'��Ч��ҩƷ������')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	5,3,N'ҩƷ������¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	6,3,N'���ۼ�¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	7,3,N'����ҩƷ�˻����ռ�¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	8,3,N'ҩƷ������¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	9,3,N'ҩƷ�����¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	10,3,N'���ϸ�ҩƷ���ټ�¼')
GO

--�ֵ�ִ��

/******************* ����˵�� *****************************************************************
  ����Ч�ڴ�����¼
  ����	@cxr	������
		@zgr   	�ʹ�Ա
        @yhr	������
        @day	��Ч������
  ���	����Ч�ڴ�����¼��Ϣ
**********************************************************************************************/
ALTER PROCEDURE [dbo].[SP_JXQCX] @cxr char(3), @zgr char(3),@yhr char(3),@day int AS
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
	select @dh, a.spbh,a.pcbh,a.chsl,a.yxrq,''
	from t_chxx a
	join v_spxx b on b.spbh = a.spbh
	where dateadd(day,@day,getdate()) >= yxrq and b.lbbh <> '07' and b.flag = 1
	
	IF NOT EXISTS (SELECT 1 FROM t_cxmxb WHERE cxdbh=@dh)
		DELETE FROM t_cxzb WHERE cxdbh = @dh
end

end 
GO

--�ֵ���ⵥ��������Ҫ����ѡ��
ALTER TABLE T_CKDZB
ADD yhdbh NVARCHAR(15) NULL
GO

--��Ʒ������־
DROP TABLE t_chxx_lock_log
GO
CREATE TABLE t_chxx_lock_log
(
	id INT IDENTITY(1,1) NOT NULL,
	spbh NVARCHAR(15) NOT NULL,
	pcbh NVARCHAR(32) NOT NULL,
	yxrq DATETIME NOT NULL,
	shul DECIMAL(18,2) NOT NULL,
	hwbh NVARCHAR(8) NULL,
	userid NVARCHAR(3) NOT NULL,
	islock TINYINT NOT NULL DEFAULT 0, -- 0���� 1����
	czsj DATETIME NOT NULL DEFAULT GETDATE(),
	PRIMARY KEY(id)
)


--�ֵ�ִ��
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('24', N'��Ʒ����', 1, 0, N'��Ʒ����', 'image\tom_wap.gif', 'w_sp_deblock', 1, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('08', N'ϵͳ����ά��', 4, 0, N'ϵͳ����ά��', 'image\tom_wap.gif', 'w_funcs_wh', 0, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('09', N'ϵͳѡ��ά��', 4, 0, N'ϵͳѡ��ά��', 'image\tom_wap.gif', 'w_gsp_rep_titleedit', 0, 1,0)
GO

ALTER TABLE T_CKDMXb
ADD ysjl NVARCHAR(32) NULL
GO

--------------------------------------------------
--һ����ִ��
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	16,4,N'Ҫ���ƻ���ϸ��')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	17,4,N'�����ϸ��')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	18,4,N'������ϸ��')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	22,4,N'������ϸ��')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	23,4,N'������ϸ��')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	24,4,N'�˿���ϸ��')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	80,4,N'���ϸ�ҩƷ��ϸ��')
GO

SELECT *
INTO t_options_old
FROM t_options to1
GO
DROP TABLE t_options
GO
CREATE TABLE t_options
(
	id int IDENTITY(1,1) NOT NULL,
	pid INT DEFAULT 0 NOT NULL,
	code NVARCHAR(8) NOT NULL,
	name NVARCHAR(16) NOT NULL,
	note NVARCHAR(32) NULL,
	sort INT NULL DEFAULT 0,
	PRIMARY KEY(id)
)
GO

dbcc checkident(t_options,reseed,100)
GO

SET IDENTITY_INSERT t_options ON 
INSERT INTO t_options(id,pid,code,NAME,note)
VALUES(1,0,'djlb',N'�������',N'����������ڲ�ֳ��ⵥ')
INSERT INTO t_options(id,pid,code,NAME,note)
VALUES(2,0,'yplb',N'ҩƷ���',N'ҩƷ���')
INSERT INTO t_options(id,pid,code,NAME,note)
VALUES(3,0,'GSP',N'gsp����',N'gsp�������')
INSERT INTO t_options(id,pid,code,NAME,note)
VALUES(4,0,'dj',N'����',N'���ݱ���')
SET IDENTITY_INSERT t_options OFF
 
INSERT INTO t_options(pid,code,name,note)
SELECT optionid,id,NAME,name
FROM t_options_old

DROP TABLE t_options_old
GO
--һ����ִ�н���---------------------------------------------

INSERT INTO t_options(pid, code, name, note, sort)
VALUES(2,'08','�ٻ�','�ٻ���������Ʒ',0)


DELETE tf
FROM T_FUNCS tf
WHERE tf.FUNNM = '���ļ۸���Ϣ'
GO

UPDATE a
SET a.flag = 0
FROM t_funcs a
WHERE a.FUNNM='���Ĳ���Ա'
GO
UPDATE a
SET a.flag = 0
FROM t_funcs a
WHERE a.FUNNM='�޸������ۿ�����'
GO

ALTER VIEW [dbo].[V_SPXX]
AS
SELECT dbo.T_SPXX.SPBH, dbo.T_SPXX.LBBH, dbo.T_SPXX.SBBZ, dbo.T_SPXX.XQBJ, dbo.T_SPXX.TZM, dbo.T_SPXX.PM, dbo.T_SPXX.JC, dbo.T_SPXX.SB, 
dbo.T_SPXX.PZWH, dbo.T_SPXX.GG, dbo.T_SPXX.JLDWBH, dbo.T_SPXX.CJBH, dbo.T_SPXX.YXQX, dbo.T_SPXX.ZDJL, dbo.T_SPXX.BZ, dbo.T_SPXX.GXRQ, 
dbo.T_SPXX.GXZ, dbo.T_SPXX.FLAG, dbo.T_SPXX.YHBZ, dbo.T_SPXX.JX, dbo.T_SPXX.GMP, dbo.T_SPXX.GB, dbo.T_SPXX.CD, dbo.T_SPXX.yplb, dbo.T_SPXX.hxmc, 
dbo.T_SPXX.lb, dbo.T_SPXX.jky, dbo.T_SPXX.jgzt, dbo.T_SPXX.ypztbh, dbo.T_SPXX.jfbz, dbo.T_SPXX.yhlx, dbo.T_SPXX.IsMHJ, dbo.T_SPXX.cctj, dbo.T_SPLB.SPLB, 
dbo.T_JLDW.JLDW, dbo.T_SCCJ.JC AS CJJC, dbo.T_SCCJ.CJMC, dbo.T_JX.MC AS jxmc, dbo.T_YPZT.MC AS ypztmc,dbo.t_spxx.ypfl,dbo.t_options.Name AS YPFLMC
FROM         dbo.T_SCCJ RIGHT OUTER JOIN
dbo.T_SPXX ON dbo.T_SCCJ.CJBH = dbo.T_SPXX.CJBH LEFT OUTER JOIN
dbo.T_SPLB ON dbo.T_SPXX.LBBH = dbo.T_SPLB.SPLBBH LEFT OUTER JOIN
dbo.T_JLDW ON dbo.T_SPXX.JLDWBH = dbo.T_JLDW.JLDWBH LEFT OUTER JOIN
dbo.T_JX ON dbo.T_SPXX.JX = dbo.T_JX.ID LEFT OUTER JOIN
dbo.T_YPZT ON dbo.T_SPXX.ypztbh = dbo.T_YPZT.BH LEFT OUTER JOIN 
dbo.t_options ON dbo.t_options.code = dbo.t_spxx.ypfl AND dbo.t_options.pid = 2

GO

insert into t_options(pid,code,name)
values(3,'11',N'Ҫ����¼')

INSERT INTO t_options(pid, code, name, note, sort)
VALUES(3,'12','����Ƽ�ҩƷ���ۼ�¼','����Ƽ�ҩƷ���ۼ�¼',0)

go

ALTER TABLE T_YHJLMX
ADD hw VARCHAR(8) NULL
GO


/****** Object:  StoredProcedure [dbo].[SP_YHJL]    Script Date: 03/02/2014 20:14:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	
	INSERT INTO t_yhjlmx(yhjlbh,hwbh,PCBH,sl,yxrq,yhsl,jl,bz,CCTJ,bhgsl,yhlx,hw)
	SELECT @dh,c.spbh,c.PCBH,c.CHSL, c.yxrq,c.CHSL,N'�ϸ�','',N'����Ҫ��',0,1,c.hwbh
	FROM t_chxx c
	JOIN T_SPXX ts ON c.spbh=ts.spbh
	WHERE ts.yhlx <> 0
end

end 


GO


ALTER TABLE t_yhjhmx
ADD dhsl DECIMAL(10,2) NULL DEFAULT 0
GO

ALTER VIEW [dbo].[V_SPXX]
AS
SELECT dbo.T_SPXX.SPBH, dbo.T_SPXX.LBBH, dbo.T_SPXX.SBBZ, dbo.T_SPXX.XQBJ, dbo.T_SPXX.TZM, dbo.T_SPXX.PM, dbo.T_SPXX.JC, dbo.T_SPXX.SB, 
dbo.T_SPXX.PZWH, dbo.T_SPXX.GG, dbo.T_SPXX.JLDWBH, dbo.T_SPXX.CJBH, dbo.T_SPXX.YXQX, dbo.T_SPXX.ZDJL, dbo.T_SPXX.BZ, dbo.T_SPXX.GXRQ, 
dbo.T_SPXX.GXZ, dbo.T_SPXX.FLAG, dbo.T_SPXX.YHBZ, dbo.T_SPXX.JX, dbo.T_SPXX.GMP, dbo.T_SPXX.GB, dbo.T_SPXX.CD, dbo.T_SPXX.yplb, dbo.T_SPXX.hxmc, 
dbo.T_SPXX.lb, dbo.T_SPXX.jky, dbo.T_SPXX.jgzt, dbo.T_SPXX.ypztbh, dbo.T_SPXX.jfbz, dbo.T_SPXX.yhlx, dbo.T_SPXX.IsMHJ, dbo.T_SPXX.cctj, dbo.T_SPLB.SPLB, 
dbo.T_JLDW.JLDW, dbo.T_SCCJ.JC AS CJJC, dbo.T_SCCJ.CJMC, dbo.T_JX.MC AS jxmc, dbo.T_YPZT.MC AS ypztmc,dbo.t_spxx.ypfl,dbo.t_options.Name AS YPFLMC,
CASE isnull(T_SPXX.hxmc,'') WHEN '' THEN T_SPXX.pm ELSE T_SPXX.hxmc END AS xspm
FROM         dbo.T_SCCJ RIGHT OUTER JOIN
dbo.T_SPXX ON dbo.T_SCCJ.CJBH = dbo.T_SPXX.CJBH LEFT OUTER JOIN
dbo.T_SPLB ON dbo.T_SPXX.LBBH = dbo.T_SPLB.SPLBBH LEFT OUTER JOIN
dbo.T_JLDW ON dbo.T_SPXX.JLDWBH = dbo.T_JLDW.JLDWBH LEFT OUTER JOIN
dbo.T_JX ON dbo.T_SPXX.JX = dbo.T_JX.ID LEFT OUTER JOIN
dbo.T_YPZT ON dbo.T_SPXX.ypztbh = dbo.T_YPZT.BH LEFT OUTER JOIN 
dbo.t_options ON dbo.t_options.code = dbo.t_spxx.ypfl AND dbo.t_options.pid = 2

