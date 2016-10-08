--SELECT *
--FROM t_xhdmxb tx

alter table t_bhgmxb DROP CONSTRAINT FK_bhgbh 
GO

DROP TABLE t_bhgmxb
GO

DROP TABLE t_bhgzb
GO


CREATE TABLE t_bhgzb
(
	bhgbh NVARCHAR(16) NOT NULL,
	dwbh  CHAR(3)	NOT NULL,
	rq	DATETIME NOT NULL,
	zbr CHAR(3) NOT NULL,
	shr CHAR(3) NULL,
	zxr CHAR(3) NULL,
	bz NVARCHAR(32) NULL,
	yxbz TINYINT DEFAULT 0 NOT NULL,
	PRIMARY KEY(bhgbh)
)
GO

CREATE TABLE t_bhgmxb
(
	id INT IDENTITY(1,1) NOT NULL,
	bhgbh NVARCHAR(16) NOT NULL,
	spbh  NVARCHAR(16)	NOT NULL,
	pcbh NVARCHAR(16) NOT NULL,
	yxrq DATETIME NOT NULL,
	sl DECIMAL(16,2) NOT  NULL,
	dqcl DECIMAL(16,2) NOT NULL,
	jg DECIMAL(16,4) NOT NULL,
	hwbh NVARCHAR(8) NOT NULL,
	bz NVARCHAR(64) NULL,
	PRIMARY KEY(id)
)
GO

alter table t_bhgmxb add constraint FK_bhgbh foreign key (bhgbh) references t_bhgzb(bhgbh)

GO

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(27,N'���ϸ�ҩƷ����',1,1,N'���ϸ�ҩƷ����','image\tom_wap.gif','w_bhglr',1,1,0,0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(13,N'��˲��ϸ�ҩƷ����',2,1,N'��˲��ϸ�ҩƷ����','image\tom_wap.gif','w_bhgsh',1,1,0,0)


--SELECT *
--FROM T_FUNCS tf
--WHERE tf.FUNTP = 2


-------�ֵ�ִ��

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id ,	pid,code,name,note,sort)
--VALUES(5,0,'TJML','�ؼ�ë��','��ʶ�ؼ۵�ë����',0)
--SET IDENTITY_INSERT t_options OFF
--INSERT INTO t_options(pid,code,name,note,sort)
--VALUES(5,'1','0.1','��ʶ�ؼ۵�ë����',0)

--SET IDENTITY_INSERT t_options ON
--INSERT INTO t_options(id ,	pid,code,name,note,sort)
--VALUES(6,0,'HYZK','��Ա�ջ�ۿ�','��Ա�ջ�ۿ���',0)
--SET IDENTITY_INSERT t_options OFF
--INSERT INTO t_options(pid,code,name,note,sort)
--VALUES(6,'1','95','��Ա�ջ��Ա���ۿ�',0)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--             parameter)
--VALUES(14,N'�ؼ���Ʒ',3,0,N'�ؼ���Ʒ','image\tom_wap.gif','w_tjsp',1,1,0)


--�ֵ�ִ�н���
