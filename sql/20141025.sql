
--����Ʊ����
DROP TABLE t_jhpfd
DROP TABLE t_jhpfdmx
CREATE TABLE t_jhpfd
(
	id INT IDENTITY(1,1) NOT NULL,
	gysbh NVARCHAR(8) NULL,	--��Ӧ�̱��
	gysmc NVARCHAR(32) NULL,	--��Ӧ������
	jhrq DATETIME NULL,		--��������
	lpzs INT NULL,		--��Ʊ����
	pmje DECIMAL(18,2) NULL,	--Ʊ����
	ghpz INT NULL,		--����Ʒ��
	cjje DECIMAL(18,2) NULL,	--��۽��
	wsje DECIMAL(18,2) NULL,	--δ�ս��
	wspzs INT NULL,				--δ��Ʒ��
	flag INT DEFAULT 0 NOT NULL,                				--
	PRIMARY KEY(id)	
)
CREATE TABLE t_jhpfdmx
(
	id INT IDENTITY(1,1) NOT NULL,
	jhpfdid INT NOT NULL,	
	jhdbh NVARCHAR(16) NOT null,	--��������
	ysje DECIMAL(18,2) NULL,	--���ս��
	wsje DECIMAL(18,2) NULL,	--δ�ս��
	PRIMARY KEY(id)	
)
