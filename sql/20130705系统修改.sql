ALTER TABLE t_spxx
ADD IsMHJ BIT DEFAULT 0
GO

UPDATE t_spxx 
SET IsMHJ = 0
GO

ALTER TABLE T_GYSXX
ADD email NVARCHAR(32) NULL

ALTER TABLE T_GYSXX
ADD lb NVARCHAR(32) NULL
GO

ALTER TABLE T_GYSXX
ADD gyfw NVARCHAR(256) NULL
GO

UPDATE t_gysxx
SET lb = 'ҩƷ��Ӫ��ҵ'
GO


--��Ӫ��ҵ������
DROP TABLE T_SYQYSPB
CREATE TABLE T_SYQYSPB
(
	id INT IDENTITY(1,1) NOT NULL,
	gysbh NVARCHAR(10) NOT NULL,
	ngpz NVARCHAR(512) NULL,	--�⹩Ʒ��
	xkzmc NVARCHAR(64) NULL,	--���֤����
	xkzh NVARCHAR(64) NULL,	--���֤��
	xkzqymc NVARCHAR(64) NULL,	--��ҵ����
	xkzfzr NVARCHAR(16) NULL,	--������
	xkfw	NVARCHAR(128) NULL,		--��ɷ�Χ
	xkzqydz NVARCHAR(64) NULL,	--���֤��ҵ��ַ
	xkzyxq NVARCHAR(16) NULL,	--���֤��Ч��
	xkzfzjg	NVARCHAR(64) NULL,	--��֤����
	xkzfzrq NVARCHAR(16) NULL,	--��֤����
	yyzzqymc NVARCHAR(64) NULL,	--Ӫҵִ����ҵ����
	zczh	NVARCHAR(32) NULL,	--ע��֤��
	frdbr	NVARCHAR(32) NULL,	--���˴�����
	jjxz	NVARCHAR(32) NULL,	--��������
	zczj	NVARCHAR(16) NULL,	--ע���ʽ�
	jyfw	NVARCHAR(64) NULL,	--��Ӫ��Χ
	jyfs	NVARCHAR(32) NULL,	--��Ӫ��ʽ
	yyzzqydz NVARCHAR(64) NULL,	--Ӫҵִ����ҵ��ַ
	yyzzfzjg NVARCHAR(64) NULL,	--Ӫҵִ�շ�֤����
	yyzzfzrq NVARCHAR(16) NULL,	--Ӫҵִ�շ�֤����
	zlzsybh NVARCHAR(64) NULL,	--������֤֤������
	yxqx NVARCHAR(16) NULL,		--��Ч����
	ywbmyj NVARCHAR(64) NULL,	--ҵ�������
	ywbmfzr NVARCHAR(16) NULL,	--ҵ���Ÿ�����
	ywbmrq NVARCHAR(16) NULL,	--ҵ��������
	zlxy	NVARCHAR(64) NULL,	--��������Ա���
	kcr	NVARCHAR(16) NULL,	--��������Ա
	kcrq NVARCHAR(16) NULL,	-- �������
	shyj NVARCHAR(64) NULL,	--������
	zlglfzr NVARCHAR(16) NULL,	--����������
	shrq NVARCHAR(16) NULL,	--�������
	spyj NVARCHAR(32) NULL,	--�������
	zjl NVARCHAR(16) NULL,	--�ܾ���	
	sprq NVARCHAR(16) NULL,	--����ʱ��
	flag TINYINT DEFAULT 0,--��˱�־ 0 δ��ˣ�1�����
	zbrq DATETIME DEFAULT GETDATE() null, --�Ʊ�ʱ��
	zbr NVARCHAR(3),--�Ʊ���                                                        	                   	
	xgr NVARCHAR(3),--����޸���
	xgrq DATETIME DEFAULT GETDATE() NULL,  -- ����޸�ʱ��                                                                     	                   	
	PRIMARY KEY(id)	
)

--��ӪƷ��������
DROP TABLE T_SYPZSPB
CREATE TABLE T_SYPZSPB
(
	id INT IDENTITY(1,1) NOT NULL,
	spbh NVARCHAR(16) NOT NULL,		--ҩƷ
	note NVARCHAR(512) NULL,	--ҩƷ���ܡ���������;����Ч�����
	zlbz NVARCHAR(16) NULL,		--������׼
	zxgg NVARCHAR(16) NULL,		--װ����
	yxq NVARCHAR(16) NULL,		--��Ч��
	gmpzsh NVARCHAR(32) NULL,	--GMP֤���
	rzsj NVARCHAR(32) NULL,		--��֤ʱ��
	cctj NVARCHAR(32) NULL,		--�洢����
	ccj DECIMAL(14,4) DEFAULT 0 NULL,	--������
	cgj DECIMAL(14,4) DEFAULT 0 NULL,	--�ɹ���
	pfj DECIMAL(14,4) DEFAULT 0 NULL,	--������
	lsj DECIMAL(14,2) DEFAULT 0 NULL,	--���ۼ�
	sqyy NVARCHAR(64) NULL,		--����ԭ��
	cgyyj NVARCHAR(32) NULL,	--�ɹ�Ա���
	cgfzr NVARCHAR(16) NULL,	--�ɹ�Ա
	cgrq NVARCHAR(16) NULL,		--�ɹ�Աǩ������
	ywyj NVARCHAR(16) NULL,		--ҵ�����������
	ywfzr NVARCHAR(16) NULL,	--ҵ������ǩ��
	ywrq NVARCHAR(16) NULL,		--ҵ����ǩ������
	wjyj NVARCHAR(16) NULL,		--��۲������
	wjfzr NVARCHAR(16) NULL,	--��۲��Ÿ�����ǩ��
	wjrq NVARCHAR(16) NULL,		--��۲���ǩ������
	zlyj NVARCHAR(16) NULL,		--�������������
	zlfzr NVARCHAR(16) NULL,	--����������ǩ��
	zlrq NVARCHAR(16) NULL,	--����������ǩ������
	jlspyj NVARCHAR(16) NULL,	--�����������: ͬ����� ��ͬ�����
	fzr NVARCHAR(16) NULL,	--����ǩ��
	jlsprq NVARCHAR(16) NULL,	--������������
	flag TINYINT DEFAULT 0,   	--��˱�־
	zbrq DATETIME DEFAULT GETDATE() null, --�Ʊ�ʱ��
	zbr NVARCHAR(3),--�Ʊ���  
	xgr NVARCHAR(3),--����޸���
	xgrq DATETIME DEFAULT GETDATE() NULL,  -- ����޸�ʱ��                                                                     	                   	
	PRIMARY KEY(id)
)

--������Ʒ
CREATE TABLE t_clspjl
(
	id INT IDENTITY(1,1) NOT NULL,
	qsrq DATETIME DEFAULT GETDATE() NOT NULL,
	spbh NVARCHAR(16) NOT NULL,
	pcbh NVARCHAR(32) NOT NULL,
	yxrq DATETIME NULL,
	xl INT DEFAULT 0 NULL,
	xsrq DATETIME NULL,
	fhr NVARCHAR(3) NULL,
	PRIMARY KEY(id)
	)

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES(17, N'��ӪƷ��������', 6, 0, N'��ӪƷ��������', 'image\tom_wap.gif', 'w_sypzspb', 1, 1)

INSERT INTO [T_FUNCS]([FUNCID], [FUNNM], [FUNTP], [GRPID], [FUNMS], [TPLJ], [FUNFM], [FLAG], [UFLAG])
VALUES(18, N'��Ӫ��ҵ������', 6, 0, N'��Ӫ��ҵ������', 'image\tom_wap.gif', 'w_syqyspb', 1, 1)

INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG)
VALUES(25,N'���ʲ�ѯ',4,3,N'���ʲ�ѯ','image\tom_wap.gif','w_zzcx',1,1)


--�ֵ�ִ��
INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG)
VALUES(22,N'����ҩƷ',1,1,N'����ҩƷ','image\tom_wap.gif','w_clspjl',1,1)

--��Ʒ��Ϣ���Ӵ�������
ALTER TABLE t_spxx 
ADD cctj NVARCHAR(32) NULL
GO








