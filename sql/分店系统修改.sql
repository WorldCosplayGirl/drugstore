---------2016��10��15��-------------------
----���ⵥ�����������ڡ����˱�־
--ALTER TABLE T_CKDMXB
--ADD scrq DATETIME NULL,fhflag TINYINT NULL

----�����Ϣ�����������ڡ�����ʱ��
--ALTER TABLE T_CHXX
--ADD scrq DATETIME NULL, dhrq DATETIME NULL

--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(26,'����Աȷ���ջ�',1,2,'����Աȷ���ջ�','image\tom_wap.gif','w_ckdrk',1,1,0)

------��ҩ��Ʒ����������������¼����������
--ALTER TABLE T_FYSP
--ADD sl INT NULL,	--������������		
--lx TINYINT NULL		--���� 1-��ҩ��¼ 2-��Ƭ��������������¼
--GO
--UPDATE T_FYSP
--SET lx = 1


------------------------------------------------------------------
--2016��8��24�� 08:46:39----------------------------------
---������ϸ���¼��Ӫ��𣬱��ڵ�����Ӫ���Ӱ����ʷ�ά����-----
--

--ALTER TABLE t_lsdmxb 
--ADD jylb NVARCHAR(2) NULL ----��Ӧt_spxx���lbbh
--GO

--UPDATE m SET jylb = s.LBBH
--FROM t_lsdmxb m
--JOIN t_spxx s ON m.spbh = s.SPBH
--JOIN t_lsdzb z ON z.LSDBH = m.LSDBH
--WHERE z.rq > '2016-8-23' AND m.jylb IS NULL



                          