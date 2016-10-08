
DROP TABLE T_BankAccount
go
--�����ʺ���Ϣ
CREATE TABLE T_BankAccount
(
	ID INT IDENTITY(1,1) NOT NULL,
	BankAccountNo NVARCHAR(32) NOT NULL,
	BankAccountName NVARCHAR(32) NOT NULL,
	BankAccountDesc NVARCHAR(64) NULL,
	BankName NVARCHAR(16) NOT NULL,
	RecordStatus TINYINT DEFAULT 0,	-- 0���� 1ɾ��
	PRIMARY KEY(ID)
)

DROP TABLE T_BankAccountData
GO
CREATE TABLE T_BankAccountData
(
	id INT IDENTITY(1,1) NOT NULL,
	BankAccountNo NVARCHAR(32) NOT NULL,
	BusinessDate VARCHAR(8) NOT NULL,
	Addr	NVARCHAR(64) NULL,
	Mode	NVARCHAR(64) NULL,
	Amount	DECIMAL(18,2) DEFAULT 0 NULL,
	Balance DECIMAL(18,2) DEFAULT 0 NULL,
	PRIMARY KEY(id)	
)
DROP TABLE T_BankTemp
GO
CREATE TABLE T_BankTemp
(
	f1 NVARCHAR(32) NULL,
	f2 NVARCHAR(32) NULL,
	f3 NVARCHAR(32) NULL,
	f4 NVARCHAR(32) NULL,
	f5 NVARCHAR(32) NULL,
	f6 NVARCHAR(32) NULL,
	f7 NVARCHAR(32) NULL,
	f8 NVARCHAR(32) NULL,
	f9 NVARCHAR(32) NULL,
	f10 NVARCHAR(32) NULL,
	f11 NVARCHAR(32) NULL,
	f12 NVARCHAR(32) NULL,
	f13 NVARCHAR(32) NULL,
	f14 NVARCHAR(32) NULL,
	f15 NVARCHAR(32) NULL,
)

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6221386102068115538','С��','С�����ۿ��˻�','ũ������')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6221386102104849942','�����','��������ۿ��˻�','ũ������')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6210981000019033218','�㰲��','�㰲�����ۿ��˻�','��������')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6227000010340170366','����','�������ۿ��˻�','��������')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6227000010340170358','����','�������ۿ��˻�','��������')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6227000010340170374','����','�������ۿ��˻�','��������')

INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
VALUES('6221386102104978865','���','������ۿ��˻�','ũ������')


GO





