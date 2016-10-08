

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            parameter)
--VALUES('14','��Ӧ����Ϣ',3,0,'��Ӧ����Ϣ','image\tom_wap.gif','w_gysxxwh',1,1,0)          
--GO


CREATE TABLE [T_GYSXX] (
	[GYSBH] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[GYSMC] [varchar] (30) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[GYSJC] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[LXR] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[FKQX] [int] NULL ,
	[SH] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[YHZH] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[LXDZ] [varchar] (30) COLLATE Chinese_PRC_CI_AS NULL ,
	[YZBM] [char] (6) COLLATE Chinese_PRC_CI_AS NULL ,
	[DH1] [varchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[DH2] [varchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[CZ] [varchar] (15) COLLATE Chinese_PRC_CI_AS NULL ,
	[GXRQ] [datetime] NOT NULL CONSTRAINT [DF_T_GYSXX_GXRQ] DEFAULT (getdate()),
	[TYRQ] [datetime] NULL ,
	[GXZ] [char] (3) COLLATE Chinese_PRC_CI_AS NULL ,
	[FLAG] [tinyint] NULL CONSTRAINT [DF_T_GYSXX_FLAG] DEFAULT (1),
	[jyxkzrq] [datetime] NULL ,
	[gsprq] [datetime] NULL ,
	[gsyzrq] [datetime] NULL ,
	[xyrq] [datetime] NULL ,
	[frrq] [datetime] NULL ,
	[SFSYQY] [tinyint] NULL CONSTRAINT [DF__t_gysxx__SFSYQY__627A95E8] DEFAULT (0),
	[email] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NULL ,
	[lb] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NULL ,
	[gyfw] [nvarchar] (256) COLLATE Chinese_PRC_CI_AS NULL ,
	CONSTRAINT [PK__T_GYSXX__30F848ED] PRIMARY KEY  CLUSTERED 
	(
		[GYSBH],
		[GXRQ]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO



CREATE TABLE [T_GYSXX_JYLB] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[gysbh] [nvarchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ypflbh] [nvarchar] (8) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO





CREATE TABLE [t_gysxx_log] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[gysbh] [nvarchar] (16) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[xgnr] [nvarchar] (32) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[xgq] [nvarchar] (128) COLLATE Chinese_PRC_CI_AS NULL ,
	[xgh] [nvarchar] (128) COLLATE Chinese_PRC_CI_AS NULL ,
	[xgr] [nvarchar] (3) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[xgrq] [datetime] NOT NULL CONSTRAINT [DF__t_gysxx_lo__xgrq__6ADAD1BF] DEFAULT (getdate()),
	 PRIMARY KEY  CLUSTERED 
	(
		[id]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO






create trigger [dbo].[tri_gysxx_update_column]
on [dbo].[T_GYSXX]
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

GO





