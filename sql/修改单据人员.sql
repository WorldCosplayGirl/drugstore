-----����-------------------
--������
SELECT *
--UPDATE z SET ysr = '042' ---'019'
FROM t_ckdzb z
WHERE ckrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET ysr = '124' ---'042'
FROM t_ckdzb z
WHERE ckrq BETWEEN '2014-11-08' AND GETDATE()

--Ч�ڴ�����
SELECT *
--UPDATE z SET z.zgr = '042'  ---'019'
FROM T_CXZB z
WHERE cxrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET z.zgr = '124'  ---'042'
FROM T_CXZB z
WHERE cxrq BETWEEN '2014-11-08' AND GETDATE()

----�����
SELECT *
--UPDATE z SET pzr = '042' --'019'
FROM t_bsdzb z
WHERE bsrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET pzr = '124' --'042'
FROM t_bsdzb z
WHERE bsrq BETWEEN '2014-11-08' AND GETDATE()


-----�㰲��-------------------------------
--������
--SELECT *
----UPDATE z SET ysr = '042' ---'019'
--FROM t_ckdzb z
--WHERE ckrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET ysr = '124' ---'042'
FROM t_ckdzb z
WHERE ckrq BETWEEN '2012-01-01' AND GETDATE()

--Ч�ڴ�����
SELECT *
--UPDATE z SET z.zgr = '042'  ---'019'
FROM T_CXZB z
WHERE cxrq BETWEEN '2012-01-01' AND '2014-11-07 23:59:59'
SELECT *
--UPDATE z SET z.zgr = '124'  ---'042'
FROM T_CXZB z
WHERE cxrq BETWEEN '2014-11-08' AND GETDATE()