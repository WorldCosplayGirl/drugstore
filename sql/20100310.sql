
--��Ա���ֶһ�
drop table t_member_jfdh
go
create table t_member_jfdh
(
T_Member_jfdhId int identity(1,1) not null,
code varchar(10) not null,	--��Ա����
dhjf decimal(10,2) not null,			--�һ�����
memo nvarchar(256),			--����
dhrq datetime not null,		--�һ�ʱ��
zxr	 varchar(10) not null,	--ִ����
Primary Key (t_member_jfdhId)
)
go