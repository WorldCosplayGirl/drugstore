create proc dbbf_test
as
declare 
@dbname varchar(20),
@cmd1 nvarchar(120),
@cmd2 varchar(120),
@cmd3 varchar(120),
@i int,
@filename varchar(80),
@path varchar(80)
set @dbname='TEST'--\\�������ݿ�����ʹ��ʱֻ��Ҫ�����ĳ�����Ҫ���ݵ����ݿ������ɣ���������޸�\\--
----ɾ����ǰ����ǰ15-ǰ10���ڵ����ݿⱸ��,�ɸ���Ҫ�����޸�----
set @i=10
while @i<15 
begin 
set @cmd1 ='if exist E:\DATABACKUP\'+@dbname+convert(varchar(10),DATEADD(day,-@i,getdate()),112) +'*' +' del '+'E:\DATABACKUP\'+@dbname+convert(varchar(10),DATEADD(day,-@i,getdate()),112) +'*'
exec master..xp_cmdshell @cmd1----ɾ��10��֮ǰ�����ݿⱸ��    
set @i=@i+1
END

----�������ݿ�----
exec master..xp_cmdshell 'if not exist E:\DATABACKUP (md E:\DATABACKUP)'--���E�̸�Ŀ¼û��DATABACKUP�ļ��У����½����ļ���
SELECT @filename=@dbname+replace(replace(replace(CONVERT(varchar(16), getdate(), 120 ),'-',''),' ','-'),':','') 
SET @path='E:\DATABACKUP\'+@filename
BACKUP DATABASE @dbname TO DISK=@path

----ѹ�����ݿⱸ�ݣ�ɾ��ԭ�����ļ�
set @cmd2='C:\PROGRA~1\WinRAR\winrar.exe a -ibck E:\DATABACKUP\'+@filename+'.rar E:\DATABACKUP\'+@filename
exec master..xp_cmdshell @cmd2----ѹ�����ݿ�
set @cmd3='DEL E:\DATABACKUP\'+@filename

exec master..xp_cmdshell @cmd3----ɾ��ԭ�����ļ���ֻ����ѹ������
                              --
go
