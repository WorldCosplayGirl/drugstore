DROP TABLE T_FYSP
GO

CREATE TABLE T_FYSP
(
	[ID] int identity(1,1) not null,
	SPBH1 NVARCHAR(30) NOT NULL,
	SPBH2 NVARCHAR(30) NOT NULL,
	BZ    NVARCHAR(64) NULL,
	GXRQ  DATETIME null default getdate(),
	GXZ   CHAR(3) NULL,
	PRIMARY KEY ( [ID] )	
)





INSERT INTO T_FUNCS(	FUNCID,	FUNNM,	FUNTP,	GRPID,	FUNMS,	TPLJ,	FUNFM,	FLAG,	UFLAG)
VALUES(	'13',	N'��ҩ��Ʒ',	6,	0,	N'��ҩ��Ʒ',	'image\tom_wap.gif',	'w_fyxx',	1,	1)
GO