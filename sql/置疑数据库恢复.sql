/*���裺

һ�����ݡ����ɡ����ݿ�������ļ�����Ϊ��־�ļ�.ldf��������ֻ����.mdf�ļ���

��������ҵ��������SQL Server Enterprise Manager����ɾ�������ɡ����ݿ⣬�����ʾɾ�����󣬿����������ݿ��������Ȼ�����ԡ�

��������ҵ�������У��½�ͬ�����ݿ⣨�������ݿ�Ϊtest����ע�⽨�������ݿ����ƣ����������ļ���Ҫ���ֺ�ԭ���ݿ�һ�¡�

�ġ�ֹͣ���ݿ��������

�塢���ղ��½����ݿ����ɵ����ݿ����־�ļ�test_log.ldfɾ������Ҫ�ָ������ݿ�.mdf�ļ����Ǹղ����ɵ����ݿ������ļ�test_data.mdf��

�����������ݿ����������ʱ�ῴ�����ݿ�test��״̬Ϊ�����ɡ�����ʱ���ܶԴ����ݿ�����κβ�����

*/
use master
go
sp_configure 'allow updates',1
go
RECONFIGURE with override
GO
update sysdatabases set status=-32768 where dbid=DB_ID('test')
go
dbcc rebuild_log('test','d:\database\test_Log.LDF')
go
dbcc checkdb('test')
go
sp_dboption 'test','dbo use only','false'
go
sp_configure 'allow updates',0
go 
reconfigure with override
go