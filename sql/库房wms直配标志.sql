ALTER TABLE t_jhdzb 
ADD zpflag TINYINT

ALTER TABLE t_ckdzb 
ADD zpflag TINYINT

------2016.6.18
--���ӽ�����ϸ���˱�־��1����ͨ�� 0����δͨ�� null δ����
ALTER TABLE t_jhdmxb 
ADD fhflag TINYINT

---���ӽ�������⹦�ܣ������г�
INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
            fdbz, parameter)
VALUES('03','����Աȷ�����',1,0,'����Աȷ�����','image\tom_wap.gif','w_jhdrk',1,1,1,0)

----2016.06.27----------------------
--�ܵ���������ӵ���ʱ�䣬Ĭ�ϵ���
ALTER TABLE t_jhdzb 
ADD dhrq DATETIME NULL




