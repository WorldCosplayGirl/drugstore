--�ܵ�ִ��
if object_id('T_JKYPDJB') is not null
	drop table T_JKYPDJB
go
--����ҩƷ�ǼǱ�
CREATE TABLE T_JKYPDJB
(
	[ID] int identity(1,1) not null,
	SPBH NVARCHAR(30) NOT NULL,
	PCBH NVARCHAR(30) NOT NULL,
	YXQ DATETIME NOT NULL,
	SL DECIMAL(10,2) NOT NULL DEFAULT(0),
	JHRQ DATETIME  NOT NULL,
	JHDBH NVARCHAR(15) NOT NULL,
	GYSBH NVARCHAR(15) NOT NULL,
	DJZBH NVARCHAR(15) NULL DEFAULT(''),
	BZ    NVARCHAR(64) NULL,
	GXRQ  DATETIME null default getdate(),
	GXZ   CHAR(3) NULL,
	FLAG  TINYINT NOT NULL DEFAULT 0
	PRIMARY KEY ( [ID] )
)

alter table T_JHDMXB
add DJZBH nvarchar(15) null default('')


INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'18',	N'����ҩƷ�ǼǱ�',	1,	1,	N'����ҩƷ�ǼǱ�',	'image\tom_wap.gif',	'w_jkypdjb',	1,	1)
GO

--�ֵ�ִ��
if object_id('T_JKYPDJB') is not null
	drop table T_JKYPDJB
go
--����ҩƷ�ǼǱ�
CREATE TABLE T_JKYPDJB
(
	[ID] int identity(1,1) not null,
	SPBH NVARCHAR(30) NOT NULL,
	PCBH NVARCHAR(30) NOT NULL,
	YXQ DATETIME NOT NULL,
	SL DECIMAL(10,2) NOT NULL DEFAULT(0),
	JHRQ DATETIME  NOT NULL,
	CKDBH NVARCHAR(15) NOT NULL,
	GYSBH NVARCHAR(15) NOT NULL,
	DJZBH NVARCHAR(15) NULL DEFAULT(''),
	BZ    NVARCHAR(64) NULL,
	GXRQ  DATETIME null default getdate(),
	GXZ   CHAR(3) NULL,
	FLAG  TINYINT NOT NULL DEFAULT 0
	PRIMARY KEY ( [ID] )
)

alter table T_CKDMXB
add DJZBH nvarchar(15) null default('')


INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'10',	N'����ҩƷ�ǼǱ�',	1,	2,	N'����ҩƷ�ǼǱ�',	'image\tom_wap.gif',	'w_jkypdjb',	1,	1)
GO






