-- �޸Ĺ�Ӧ����Ϣ�����ӹ�����֤����Ӫ���֤��GSP��֤��Ч��
alter table t_gysxx
add jyxkzrq datetime null

alter table t_gysxx
add gsprq datetime null

alter table t_gysxx
add gsyzrq datetime null

alter table t_gysxx
drop zzyxq

--Э������
alter table t_gysxx
add xyrq date null

--����ί������
alter table t_gysxx
add frrq date null

--�޸���Ʒ��Ϣ�����ӽ���ҩ��ʶ
alter table T_SPXX
add jky tinyint default 0 null
go

update t_spxx
set jky = 0