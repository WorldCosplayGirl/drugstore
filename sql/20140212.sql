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

--�ܵ�ִ��
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES('06', N'ϵͳ��־', 7, 1, N'ϵͳ��־', 'image\tom_wap.gif', 'w_log', 1, 1)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('06', N'�����ӪƷ��[��������Ա]', 2, 3, N'�����ӪƷ��[��������Ա]', 'image\tom_wap.gif', 'w_sypzspb_sp', 1, 1,1)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('10', N'������ӪƷ��[����������]', 2, 3, N'������ӪƷ��[����������]', 'image\tom_wap.gif', 'w_sypzspb_sp', 1, 1,2)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('11', N'�����Ӫ��ҵ[��������Ա]', 2, 3, N'�����Ӫ��ҵ[��������Ա]', 'image\tom_wap.gif', 'w_syqyspb_sp', 1, 1,1)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('12', N'������Ӫ��ҵ[����������]', 2, 3, N'������Ӫ��ҵ[����������]', 'image\tom_wap.gif', 'w_syqyspb_sp', 1, 1,2)
GO

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('24', N'��Ʒ����', 1, 0, N'��Ʒ����', 'image\tom_wap.gif', 'w_splock', 1, 1,0)
GO

--�ֵ�ִ��
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('23', N'��Ʒ����', 1, 0, N'��Ʒ����', 'image\tom_wap.gif', 'w_splock', 1, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES('07', N'ϵͳ��־', 4, 1, N'ϵͳ��־', 'image\tom_wap.gif', 'w_log', 1, 1)
GO


--��ӪƷ��������
DROP TABLE T_SYPZSPB
GO

CREATE TABLE T_SYPZSPB
(
	id INT IDENTITY(1,1) NOT NULL,
	pm NVARCHAR(64) NOT NULL,	--Ʒ��
	gg NVARCHAR(32) NULL,		--���
	pzwh NVARCHAR(64) NULL,		--��׼�ĺ�
	sccj NVARCHAR(64) NULL,		--��������
	cctj NVARCHAR(64) NULL,		--��������
	lb NVARCHAR(32) NULL,		--���
	pjbh NVARCHAR(32) NULL,		--�������	
	pjyxrq DATETIME NULL,		--������Ч����	
	cgyj NVARCHAR(64) NULL,	--�ɹ�Ա���
	cgr NVARCHAR(16) NULL,	--�ɹ�Ա
	cgrq DATETIME NULL,		--�ɹ�Աǩ������
	zlglyyj NVARCHAR(64) NULL,		--��������Ա���
	zlgly NVARCHAR(16) NULL,	--��������Աǩ��
	zlglyrq DATETIME NULL,		--��������Աǩ������
	zlglybz TINYINT NOT NULL DEFAULT 0,	--��������Ա������־	9������ͨ�� 8����ͨ��
	zlfzryj NVARCHAR(64) NULL,		--�������������
	zlfzr NVARCHAR(16) NULL,	--����������ǩ��
	zlfzrrq DATETIME NULL,	--����������ǩ������
	zlfzrbz TINYINT NOT NULL DEFAULT 0,	--����������������־	9������ͨ�� 8����ͨ��                          	--
	flag TINYINT DEFAULT 0,   	--��˱�־ 0δ�ύ 1��������Ա������ 2���������������� 8����ͨ�� 9������ͨ�� 255ɾ��
	PRIMARY KEY(id)
)
GO

ALTER TABLE T_SYQYSPB
ADD gysmc NVARCHAR(64) NULL
GO

ALTER TABLE T_SYQYSPB
ALTER COLUMN gysbh NVARCHAR(10) NULL
GO

ALTER TABLE T_SYQYSPB
ADD sqrq DATETIME NULL
GO
ALTER TABLE T_SYQYSPB
DROP COLUMN shrq,sprq,kcrq
GO
ALTER TABLE T_SYQYSPB
ADD shrq DATETIME NULL
GO
ALTER TABLE T_SYQYSPB
ADD sprq DATETIME NULL
GO

--�ܵꡢ�ֵ궼ִ�� ����
ALTER TABLE T_CHXX
ADD islock TINYINT NULL
GO

UPDATE t_chxx 
SET islock = 0
GO


if object_id('SP_GETSPXX_CH') is not null
	drop procedure SP_GETSPXX_CH
go
CREATE PROCEDURE SP_GETSPXX_CH @spbh varchar(16) AS
SELECT  T_SPXX.SPBH, T_SPXX.PM,T_SPXX.GG, T_JLDW.JLDW, T_SPXX.JC, T_SCCJ.JC as SCCJ,T_JGXX.LSJ, T_JGXX.PFJ, T_JGXX.GBJ
FROM t_chxx JOIN 
T_SPXX ON t_chxx.spbh=t_spxx.spbh LEFT OUTER JOIN
T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
T_SCCJ ON T_SPXX.CJBH = T_SCCJ.CJBH LEFT OUTER JOIN
T_JGXX ON T_SPXX.SPBH = T_JGXX.SPBH
WHERE t_chxx.CHSL >0 AND (T_SPXX.SPBH like '%' + @spbh + '%' OR T_SPXX.PM like '%' + @spbh + '%' OR T_SPXX.JC like '%' + @spbh + '%')
order by t_spxx.spbh
GO

--��Ӧ���޸���־
DROP TABLE t_gysxx_log
GO
CREATE TABLE t_gysxx_log
(
	id INT IDENTITY(1,1) NOT NULL,
	gysbh NVARCHAR(16) NOT NULL,
	xgnr NVARCHAR(32) NOT NULL,
	xgq NVARCHAR(128) NULL,
	xgh NVARCHAR(128) NULL,
	xgr NVARCHAR(3) not NULL,
	xgrq DATETIME NOT NULL DEFAULT GETDATE(),
	PRIMARY KEY(id)
)
GO

--��¼��Ӧ����־
if (object_id('tri_gysxx_update', 'TR') is not null)
    drop trigger tri_gysxx_update_column
go
create trigger tri_gysxx_update_column
on t_gysxx
    for update
AS
	if exists(select * from inserted a join deleted b on a.gysbh=b.gysbh
		where (a.jyxkzrq <> b.jyxkzrq OR a.gsprq <> b.gsprq OR 
		a.gsyzrq <> b.gsyzrq OR a.xyrq <> b.xyrq OR a.frrq <> b.frrq))
	BEGIN
		declare @oldjyxkzrq DATETIME , @newjyxkzrq DATETIME,@user CHAR(3),@gysbh NVARCHAR(16)
		DECLARE @oldgsprq DATETIME,@newgsprq DATETIME,@oldgsyzrq DATETIME,@newgsyzrq DATETIME
		DECLARE @oldxyrq DATETIME,@newxyrq DATETIME
		DECLARE @oldfrrq DATETIME,@newfrrq DATETIME
		
		--����ǰ������
		select @oldjyxkzrq = jyxkzrq,@oldgsprq=gsprq,@oldgsyzrq=gsyzrq,@oldxyrq=xyrq,@oldfrrq=frrq from deleted;
		
		--���º������
		select @newjyxkzrq = jyxkzrq,@newgsprq=gsprq,@newgsyzrq=gsyzrq,@newxyrq=xyrq,@newfrrq=frrq,@user=gxz,@gysbh=gysbh from inserted;
			
		IF (@oldjyxkzrq <> @newjyxkzrq) --�޸������֤����		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldjyxkzrq,120),CONVERT(char(10),@newjyxkzrq,120),@user,@gysbh,N'ҩƷ��Ӫ���֤��Ч��')
		END
		
		IF (@oldgsprq <> @newgsprq) --�޸���GSP��Ч����		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldgsprq,120),CONVERT(char(10),@newgsprq,120),@user,@gysbh,N'GSP��Ч��')
		END
		
		IF (@oldgsyzrq <> @newgsyzrq) --�޸��˹���Ӫҵִ����Ч��		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldgsyzrq,120),CONVERT(char(10),@newgsyzrq,120),@user,@gysbh,N'����Ӫҵִ����Ч��')
		END
		
		IF (@oldxyrq <> @newxyrq) --�޸����ʱ�Э����Ч��		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldxyrq,120),CONVERT(char(10),@newxyrq,120),@user,@gysbh,N'�ʱ�Э����Ч��')
		END
		
		IF (@oldfrrq <> @newfrrq) --�޸��˷���ί������Ч��		
		begin
			
			INSERT INTO t_gysxx_log(xgq,xgh,xgr,gysbh,xgnr)
			VALUES(CONVERT(char(10),@oldfrrq,120),CONVERT(char(10),@newfrrq,120),@user,@gysbh,N'����ί������Ч��')
		end
    END
go

ALTER TABLE T_FUNCS
ADD parameter TINYINT NULL DEFAULT 0
GO
UPDATE T_FUNCS
SET parameter = 0
GO

--�ܵ�ִ��
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	1,3,N'ҩƷ������¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	2,3,N'ҩƷ������ռ�¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	3,3,N'ҩƷ���⸴�˼�¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	4,3,N'��Ƭװ�����˼�¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	5,3,N'�����˻�ҩƷ���ռ�¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	6,3,N'ҩƷ�¼��˿������')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	7,3,N'����ҩƷ�˳�֪ͨ��')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	8,3,N'����ҩƷ�˳���¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	9,3,N'��Ч��ҩƷ������')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	10,3,N'����ҩƷ��������¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	14,3,N'�ɹ���¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	11,3,N'����ҩƷ�ǼǱ�')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	12,3,N'ҩƷ�����¼')
INSERT INTO T_Options(	ID,	OptionID,Name)
VALUES(	13,3,N'���ϸ�ҩƷ���ټ�¼')
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

--�ܵ깩Ӧ�̾�Ӫ���
DROP TABLE T_GYSXX_JYLB
CREATE TABLE T_GYSXX_JYLB
(
	id INT IDENTITY(1,1) NOT NULL,
	gysbh NVARCHAR(10),NOT NULL,
	ypflbh NVARCHAR(8),NOT NULL,
	PRIMARY KEY(id)
)

--�����ܵ���
----SELECT a.*,s.pm,s.gg,s.cjmc
--UPDATE a
--SET a.FLAG=0
--FROM T_CHXX a JOIN v_spxx s ON a.SPBH=s.spbh
--WHERE a.spbh NOT IN('106864','102774','11185','105642','105113','10564','102033','10067','101357',
--'40163','40098','41313','40996','102755','401755','401516','41449','11313','400812','407501','41424',
--'40490','11315','100851','112013')


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
end

end 


GO



--�ֵ���ⵥ��������Ҫ����ѡ��
ALTER TABLE T_CKDZB
ADD yhdbh NVARCHAR(15) NULL
GO

--�ֵ�ִ��
--UPDATE T_FUNCS
--SET	FUNNM = '���ϸ���Ʒ�˿�'
--WHERE funnm = '���ϸ���Ʒ����'

--�ܵ�ִ��
UPDATE T_FUNCS
SET	FUNNM = '��˲��ϸ���Ʒ'
WHERE funnm = '������ٵ�'


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

--�ܵ�ִ��
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('25', N'��Ʒ����', 1, 0, N'��Ʒ����', 'image\tom_wap.gif', 'w_sp_deblock', 1, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('07', N'ϵͳ����ά��', 7, 1, N'ϵͳ����ά��', 'image\tom_wap.gif', 'w_funcs_wh', 0, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('08', N'ϵͳѡ��ά��', 7, 1, N'ϵͳѡ��ά��', 'image\tom_wap.gif', 'w_gsp_rep_titleedit', 0, 1,0)
GO


--�ֵ�ִ��
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('24', N'��Ʒ����', 1, 0, N'��Ʒ����', 'image\tom_wap.gif', 'w_sp_deblock', 1, 1,0)
GO
INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG],parameter)
VALUES('08', N'ϵͳ����ά��', 4, 0, N'ϵͳ����ά��', 'image\tom_wap.gif', 'w_funcs_wh', 0, 1,0)
GO
UPDATE a
SET a.FUNNM='����ϴ�'
FROM T_funcs a
WHERE FUNNM='�����ϴ�'
GO
UPDATE a
SET a.FUNNM='ͬ����Ϣ'
FROM T_funcs a
WHERE FUNNM='ͬ��������Ϣ'
GO
ALTER TABLE T_CKDMXb
ADD ysjl NVARCHAR(32) NULL
GO


















