--SELECT *
--FROM T_BankAccount tba

DROP PROCEDURE sp_BankAccountCheck
GO

--��������˶�
CREATE PROCEDURE sp_BankAccountCheck @ksrq CHAR(8),@jsrq CHAR(8)
AS 
BEGIN
	
DECLARE @jyrq CHAR(8),@kh VARCHAR(32),@amt DECIMAL(14,2),@name NVARCHAR(16)
CREATE TABLE #t 
(
	id INT IDENTITY(1,1),
	jyrq CHAR(8) NOT NULL,
	a1 DECIMAL(14,2) NULL ,	--�����
	a1a DECIMAL(14,2) NULL,	--����û�����
	a2 DECIMAL(14,2) NULL,	--���
	a2a DECIMAL(14,2) NULL,	--��û�����
	a3 DECIMAL(14,2) NULL,	--����
	a4 DECIMAL(14,2) NULL,	--����
	a4a DECIMAL(14,2) NULL,	--���������
	a5 DECIMAL(14,2) NULL,	--����
	a5a DECIMAL(14,2) NULL,	--���������
	a6 DECIMAL(14,2) NULL,	--С��
	a7 DECIMAL(14,2) NULL,	--�㰲��
	a9 DECIMAL(14,2) NULL,	--�ŵ�
	a10 DECIMAL(14,2) NULL,	--����
	a11 DECIMAL(14,2) NULL,	--ת��
	sort INT NULL DEFAULT 10		--����
)

DECLARE cur CURSOR fast_forward read_only FOR 
SELECT '00000000' businessdate,e.Balance,e.BankAccountNo,e2.BankAccountName
FROM T_BankAccountData e
JOIN (
SELECT tbad.BankAccountNo, max(id) id
FROM T_BankAccountData tbad
WHERE tbad.BusinessDate<@ksrq
GROUP BY tbad.BankAccountNo
) e1 ON e.BankAccountNo=e1.BankAccountNo AND e.id=e1.id
JOIN T_BankAccount e2 ON e.BankAccountNo=e2.BankAccountNo
UNION 
SELECT e.businessdate,e.Amount,e.BankAccountNo,e1.BankAccountName
FROM T_BankAccountData e
JOIN T_BankAccount e1 ON e.BankAccountNo=e1.BankAccountNo
WHERE e.BusinessDate BETWEEN @ksrq AND @jsrq
ORDER BY e.BusinessDate,e.BankAccountNo

OPEN cur
FETCH NEXT FROM cur INTO @jyrq,@amt,@kh,@name
WHILE @@FETCH_STATUS = 0
BEGIN
	if @name='�����' --�ж��Ƿ�����������ݣ����ھ������������ھ͸���
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a1,0)=0)
			UPDATE #t SET a1 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a1,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a1) VALUES(@jyrq,@amt)
	END
	ELSE IF @name='����û�����'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a1a,0)=0)
			UPDATE #t SET a1a = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a1a,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a1a) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='���'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a2,0)=0)
			UPDATE #t SET a2 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a2,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a2) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='��û�����'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a2a,0)=0)
			UPDATE #t SET a2a = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a2a,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a2a) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='����'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a3,0)=0)
			UPDATE #t SET a3 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a3,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a3) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='����'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a4,0)=0)
			UPDATE #t SET a4 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a4,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a4) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='���������'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a4a,0)=0)
			UPDATE #t SET a4a = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a4a,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a4a) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='����'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a5,0)=0)
			UPDATE #t SET a5 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a5,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a5) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='���������'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a5a,0)=0)
			UPDATE #t SET a5a = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a5a,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a5a) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='С��'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a6,0)=0)
			UPDATE #t SET a6 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a6,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a6) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='�㰲��'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a7,0)=0)
			UPDATE #t SET a7 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a7,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a7) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='�ŵ�'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a9,0)=0)
			UPDATE #t SET a9 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a9,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a9) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='����'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a10,0)=0)
			UPDATE #t SET a10 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a10,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a10) VALUES(@jyrq,@amt)			
	END
	ELSE IF @name='ת��'
	BEGIN
		IF EXISTS(SELECT 1 FROM #t WHERE jyrq=@jyrq AND isnull(a11,0)=0)
			UPDATE #t SET a11 = @amt WHERE jyrq=@jyrq AND id=(SELECT MIN(id) FROM #t WHERE jyrq=@jyrq AND isnull(a11,0)=0)			
		ELSE
			INSERT INTO #t(jyrq,a11) VALUES(@jyrq,@amt)			
	END
	
	FETCH NEXT FROM cur INTO @jyrq,@amt,@kh,@name
END
	
CLOSE cur
deallocate cur

--���������֧��
INSERT INTO #t(jyrq, a1,sort)
SELECT '����ϼ�',SUM(a1),5
FROM #t
WHERE ISNULL(a1,0) > 0
UPDATE #t 
SET a1a = (SELECT SUM(a1a) FROM #t WHERE ISNULL(a1a,0)>0),
a2 = (SELECT SUM(a2) FROM #t WHERE ISNULL(a2,0)>0),
a2a = (SELECT SUM(a2a) FROM #t WHERE ISNULL(a2a,0)>0),
a3 = (SELECT SUM(a3) FROM #t WHERE ISNULL(a3,0)>0),
a4 = (SELECT SUM(a4) FROM #t WHERE ISNULL(a4,0)>0),
a4a = (SELECT SUM(a4a) FROM #t WHERE ISNULL(a4a,0)>0),
a5 = (SELECT SUM(a5) FROM #t WHERE ISNULL(a5,0)>0),
a5a = (SELECT SUM(a5a) FROM #t WHERE ISNULL(a5a,0)>0),
a6 = (SELECT SUM(a6) FROM #t WHERE ISNULL(a6,0)>0),
a7 = (SELECT SUM(a7) FROM #t WHERE ISNULL(a7,0)>0),
a9 = (SELECT SUM(a9) FROM #t WHERE ISNULL(a9,0)>0),
a10 = (SELECT SUM(a10) FROM #t WHERE ISNULL(a10,0)>0),
a11 = (SELECT SUM(a11) FROM #t WHERE ISNULL(a11,0)>0)
WHERE jyrq='����ϼ�'


INSERT INTO #t(jyrq, a1,sort)
SELECT '֧���ϼ�',SUM(a1 ),6
FROM #t
WHERE ISNULL(a1,0) < 0
UPDATE #t 
SET a1a = (SELECT SUM(a1a) FROM #t WHERE ISNULL(a1a,0)<0),
a2 = (SELECT SUM(a2) FROM #t WHERE ISNULL(a2,0)<0),
a2a = (SELECT SUM(a2a) FROM #t WHERE ISNULL(a2a,0)<0),
a3 = (SELECT SUM(a3) FROM #t WHERE ISNULL(a3,0)<0),
a4 = (SELECT SUM(a4) FROM #t WHERE ISNULL(a4,0)<0),
a4a = (SELECT SUM(a4a) FROM #t WHERE ISNULL(a4a,0)<0),
a5 = (SELECT SUM(a5) FROM #t WHERE ISNULL(a5,0)<0),
a5a = (SELECT SUM(a5a) FROM #t WHERE ISNULL(a5a,0)<0),
a6 = (SELECT SUM(a6) FROM #t WHERE ISNULL(a6,0)<0),
a7 = (SELECT SUM(a7) FROM #t WHERE ISNULL(a7,0)<0),
a9 = (SELECT SUM(a9) FROM #t WHERE ISNULL(a9,0)<0),
a10 = (SELECT SUM(a10) FROM #t WHERE ISNULL(a10,0)<0),
a11 = (SELECT SUM(a11) FROM #t WHERE ISNULL(a11,0)<0)
WHERE jyrq='֧���ϼ�'

UPDATE #t
SET jyrq = '�ڳ�',sort=0
WHERE jyrq = '00000000'


SELECT e.jyrq AS '��������',
e.a1 as '�����',
e.a1a as '����û�����',
e.a2 as '���',
e.a2a as '��û�����',
e.a3 as '����',
e.a4 as '����',
e.a4a as '���������',
e.a5 as '����',
e.a5a as '���������',
e.a6 as 'С��',
e.a7 AS '�㰲��',
e.a9 AS '�ŵ�', 
e.a10 AS '����',
e.a11 AS 'ת��'
FROM #t e
ORDER BY e.sort

DROP TABLE #t

END