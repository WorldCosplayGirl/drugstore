--
--1>
select top 1 id from sysobjects where  name='T_spxx' --���Բ�����Objectid
--2>
exec  sp_lock   --�Ϳ����ҵ� spid
--3>
kill spid  --����
