---------2017��3��8�� 15:52:45-----------
----�ֵ���ⵥ���Ӳ����ֶΣ���¼��Ƭ�Ĳ���
--ALTER TABLE t_ckdmxb 
--ADD cd NVARCHAR(16) NULL

----��Ʒ��Ϣ���ӹ�������
--ALTER TABLE T_SPXX
--ADD gnzz NVARCHAR(64) NULL	--��������

---------2017��1��8�� 17:53:25-----------
------�ֵ����Ӿ����ѯ����-------------------
--INSERT INTO T_FUNCS(FUNCID,	FUNNM,FUNTP,GRPID,FUNMS,TPLJ,FUNFM,FLAG,UFLAG,parameter)
--VALUES(11,'�����ѯ',4,2,'�����ѯ','image\tom_wap.gif','w_jlcx',1,1,0)


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



                          