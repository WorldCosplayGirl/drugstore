------------wms�ⷿ�ӿڱ�------------
------��Ʒ��
----DROP TABLE wms_spxx
----GO
----CREATE TABLE wms_spxx
----(
----	spbh VARCHAR(32) NOT NULL,
----	jc NVARCHAR(32) NOT NULL,
----	pm NVARCHAR(64) NOT NULL,
----	gg NVARCHAR(32)  NULL,
----	sccj NVARCHAR(64) NULL,
----	jldw NVARCHAR(8) NULL,
----	pzwh NVARCHAR(32) NULL,
----	spbm NVARCHAR(32) NULL,		--������
----	zdbz INT NULL DEFAULT 0,	--����װ��
----	jx NVARCHAR(16) NULL,
----	wmslb NVARCHAR(16) NULL,	--����ʳƷ��ʳƷ����Ƭ��ҩƷ��ҽ����е������		
----	bz NVARCHAR(64) NULL,
----	wmsflag TINYINT NOT null DEFAULT 0,  ----��ʼ��Ϊ0
----	PRIMARY KEY(spbh)                     	
----)

------������λ ������Ӧ����Ϣ���ŵ���Ϣ ����
--DROP TABLE wms_wldwxx
--CREATE TABLE wms_wldwxx
--(
--	dwbh NVARCHAR(16) NOT NULL,
--	dwmc NVARCHAR(32) NOT NULL,
--	jc NVARCHAR(16) NULL,
--	dz NVARCHAR(64) NULL,
--	dh	NVARCHAR(32) NULL,
--	lxr NVARCHAR(32) NULL,
--	wmsflag TINYINT NOT null DEFAULT 0,  ----��ʼ��Ϊ0
--	PRIMARY KEY(dwbh)
--)

----�޸ĳ��ⵥ������wms״̬���û��Ϳⷿϵͳͬ������
ALTER TABLE t_ckdzb 
ADD wmsflag TINYINT NULL 
GO
----�޸��˿ⵥ������wms״̬���û��Ϳⷿϵͳͬ������
ALTER TABLE t_tkdzb 
ADD wmsflag TINYINT NULL 
GO
----�޸Ľ�����������wms״̬���û��Ϳⷿϵͳͬ������
ALTER TABLE t_jhdzb 
ADD wmsflag TINYINT NULL 
GO
----�޸��˻���������wms״̬���û��Ϳⷿϵͳͬ������
ALTER TABLE t_thdzb 
ADD wmsflag TINYINT NULL 
GO
----�޸����浥������wms״̬���û��Ϳⷿϵͳͬ������
ALTER TABLE t_bsdzb 
ADD wmsflag TINYINT NULL 
GO

------����
----t_chxx

----������Ʒ��Ϣ�������ֶβִ����wmslb--����ʳƷ��ʳƷ����Ƭ��ҩƷ��ҽ����е������������װ
ALTER TABLE T_SPXX
ADD wmslb NVARCHAR(16) NULL,zdbz INT NULL
GO

-----�޸���Ʒ��ͼ��������Ʒ������
ALTER VIEW [dbo].[V_SPXX]
AS
SELECT dbo.T_SPXX.SPBH, dbo.T_SPXX.LBBH, dbo.T_SPXX.SBBZ, dbo.T_SPXX.XQBJ, dbo.T_SPXX.TZM, dbo.T_SPXX.PM, dbo.T_SPXX.JC, dbo.T_SPXX.SB, 
dbo.T_SPXX.PZWH, dbo.T_SPXX.GG, dbo.T_SPXX.JLDWBH, dbo.T_SPXX.CJBH, dbo.T_SPXX.YXQX, dbo.T_SPXX.ZDJL, dbo.T_SPXX.BZ, dbo.T_SPXX.GXRQ, 
dbo.T_SPXX.GXZ, dbo.T_SPXX.FLAG, dbo.T_SPXX.YHBZ, dbo.T_SPXX.JX, dbo.T_SPXX.GMP, dbo.T_SPXX.GB, dbo.T_SPXX.CD, dbo.T_SPXX.yplb, dbo.T_SPXX.hxmc, 
dbo.T_SPXX.lb, dbo.T_SPXX.jky, dbo.T_SPXX.jgzt, dbo.T_SPXX.ypztbh, dbo.T_SPXX.jfbz, dbo.T_SPXX.yhlx, dbo.T_SPXX.IsMHJ, dbo.T_SPXX.cctj, dbo.T_SPLB.SPLB, 
dbo.T_JLDW.JLDW, dbo.T_SCCJ.jc AS CJJC, dbo.T_SCCJ.CJMC, dbo.T_JX.MC AS jxmc, dbo.T_YPZT.MC AS ypztmc,dbo.t_spxx.ypfl,dbo.t_options.Name AS YPFLMC,
CASE isnull(T_SPXX.hxmc,'') WHEN '' THEN T_SPXX.pm ELSE T_SPXX.hxmc END AS xspm,t_spxx.spbm,t_spxx.wmslb,t_spxx.zdbz
FROM         dbo.T_SCCJ RIGHT OUTER JOIN
dbo.T_SPXX ON dbo.T_SCCJ.CJBH = dbo.T_SPXX.CJBH LEFT OUTER JOIN
dbo.T_SPLB ON dbo.T_SPXX.LBBH = dbo.T_SPLB.SPLBBH LEFT OUTER JOIN
dbo.T_JLDW ON dbo.T_SPXX.JLDWBH = dbo.T_JLDW.JLDWBH LEFT OUTER JOIN
dbo.T_JX ON dbo.T_SPXX.JX = dbo.T_JX.ID LEFT OUTER JOIN
dbo.T_YPZT ON dbo.T_SPXX.ypztbh = dbo.T_YPZT.BH LEFT OUTER JOIN 
dbo.t_options ON dbo.t_options.code = dbo.t_spxx.ypfl AND dbo.t_options.pid = 2

GO

------������ ��Ʒ��Ϣ��ͬ����wms_spxx��
CREATE TRIGGER [dbo].[TR_SPXX_IN] ON [dbo].[T_SPXX]
FOR INSERT,UPDATE
AS
DECLARE @spbh VARCHAR(32),
	@jc NVARCHAR(32),
	@pm NVARCHAR(64) ,
	@gg NVARCHAR(32),
	@sccj NVARCHAR(64),
	@jldw NVARCHAR(8),
	@pzwh NVARCHAR(32),
	@spbm NVARCHAR(32),		--������
	@zdbz INT,	--����װ��
	@jx NVARCHAR(16),
	@wmslb NVARCHAR(16),
	@iordr int

SELECT @spbh = e.SPBH, @jc=e.jc,@pm=e.pm,@gg=e.gg,@sccj=e1.cjmc,@jldw=e1.JLDW,@pzwh=e.pzwh,
@spbm = e.spbm,@zdbz = e.zdbz,@jx = e1.jxmc,@wmslb=e.wmslb 
FROM INSERTED e
JOIN v_spxx e1 ON e.spbh=e1.SPBH

SELECT @iordr =  COUNT(*) FROM wms_spxx WHERE SPBH = @spbh 
IF @iordr > 0 
   UPDATE wms_spxx 
   SET pm = @pm, gg = @gg,jc=@jc,sccj=@sccj,jldw=@jldw,pzwh=@pzwh,spbm=@spbm,zdbz=@zdbz,jx=@jx,wmslb=@wmslb,wmsflag=0
   WHERE SPBH = @spbh
ELSE
   INSERT INTO wms_spxx(spbh, jc, pm, gg, sccj, jldw, pzwh, spbm, zdbz, jx, wmslb,
            wmsflag)
   VALUES(@spbh,@jc,@pm,@gg,@sccj,@jldw,@pzwh,@spbm,@zdbz,@jx,@wmslb,0)         

GO

-----��������Ӧ����Ϣ��ͬ����wms_wldwxx��
create TRIGGER [dbo].[TR_GysXX_IN] ON [dbo].[T_GYSXX]
FOR INSERT,UPDATE
AS
DECLARE @dwbh NVARCHAR(8),
	@dwmc NVARCHAR(32),
	@jc NVARCHAR(16),
	@dz NVARCHAR(64),
	@dh	NVARCHAR(32),
	@lxr NVARCHAR(8),
	@iordr int

SELECT @dwbh = e.gysBH, @dwmc=e.gysmc,@jc=e.gysjc,@dz=e.lxdz,@dh=e.dh1,@lxr=e.lxr 
FROM INSERTED e

SELECT @iordr =  COUNT(*) FROM wms_wldwxx WHERE dwbh = @dwbh 
IF @iordr > 0 
   UPDATE wms_wldwxx 
   SET dwmc = @dwmc, jc=@jc,dz=@dz,dh=@dh,lxr=@lxr,wmsflag=0
   WHERE dwBH = @dwbh
ELSE
   INSERT INTO wms_wldwxx(dwbh,dwmc,jc,dz,dh,lxr,wmsflag)
   VALUES(@dwbh,@dwmc,@jc,@dz,@dh,@lxr,0)         

GO

-----��������λ��Ϣ��ͬ����wms_wldwxx��
create TRIGGER [dbo].[TR_dwXX_IN] ON [dbo].[T_DWXX]
FOR INSERT,UPDATE
AS
DECLARE @dwbh NVARCHAR(8),
	@dwmc NVARCHAR(32),
	@jc NVARCHAR(16),
	@dz NVARCHAR(64),
	@dh	NVARCHAR(32),
	@lxr NVARCHAR(8),
	@iordr int

SELECT @dwbh = e.dwBH, @dwmc=e.dwmc,@jc=e.jc,@dz=e.dwdz,@dh=e.dh,@lxr=e1.xm 
FROM INSERTED e
left JOIN t_zgxx e1 ON e.fzr = e1.bh

SELECT @iordr =  COUNT(*) FROM wms_wldwxx WHERE dwbh = @dwbh 
IF @iordr > 0 
   UPDATE wms_wldwxx 
   SET dwmc = @dwmc, jc=@jc,dz=@dz,dh=@dh,lxr=@lxr,wmsflag=0
   WHERE dwBH = @dwbh
ELSE
   INSERT INTO wms_wldwxx(dwbh,dwmc,jc,dz,dh,lxr,wmsflag)
   VALUES(@dwbh,@dwmc,@jc,@dz,@dh,@lxr,0)         

GO


--�������� ��Ʒ��Ϣ
INSERT INTO wms_spxx(spbh, jc, pm, gg, sccj, jldw, pzwh, spbm, zdbz, jx, wmslb,bz,
            wmsflag)
SELECT spbh ,jc ,pm,gg ,s.cjmc,jldw,pzwh ,s.spbm ,s.zdbz ,jxmc,wmslb,	bz,	0  
FROM V_SPXX s

----�������� ������λ
INSERT into wms_wldwxx(	dwbh,dwmc,jc,dz,dh,lxr,	wmsflag)
SELECT s.GYSBH, s.GYSMC, s.GYSJC, s.LXDZ, s.DH1,s.LXR, 0
FROM t_gysxx s
UNION ALL
SELECT td.DWBH, td.DWMC, td.JC, td.DWDZ, td.DH, z.xm,0
FROM T_DWXX td
JOIN t_zgxx z ON td.fzr = z.bh










