DROP TABLE T_JX
GO
CREATE TABLE T_JX
(
	[ID] VARCHAR(3),
	MC NVARCHAR(32)
)

insert into t_jx([id],mc) values('01',N'Ƭ��')
insert into t_jx([id],mc) values('02',N'���Ҽ�')
insert into t_jx([id],mc) values('03',N'����')
insert into t_jx([id],mc) values('04',N'����')
insert into t_jx([id],mc) values('05',N'���')
insert into t_jx([id],mc) values('06',N'���')
insert into t_jx([id],mc) values('07',N'�����')
insert into t_jx([id],mc) values('08',N'��Һ��')
insert into t_jx([id],mc) values('09',N'�ͼ�')
insert into t_jx([id],mc) values('10',N'������')
insert into t_jx([id],mc) values('11',N'�����')
insert into t_jx([id],mc) values('12',N'ϴ��')
insert into t_jx([id],mc) values('13',N'�齺��')
insert into t_jx([id],mc) values('14',N'�ǽ���')
insert into t_jx([id],mc) values('15',N'���')
insert into t_jx([id],mc) values('16',N'�����')
insert into t_jx([id],mc) values('17',N'�����')
insert into t_jx([id],mc) values('18',N'ɢ��')
insert into t_jx([id],mc) values('19',N'ˮ��')
insert into t_jx([id],mc) values('20',N'�Ƽ�')
insert into t_jx([id],mc) values('21',N'˨��')
insert into t_jx([id],mc) values('22',N'������')
insert into t_jx([id],mc) values('23',N'�ϼ�')
insert into t_jx([id],mc) values('24',N'����')
insert into t_jx([id],mc) values('25',N'������Һ��')
insert into t_jx([id],mc) values('26',N'��������')
insert into t_jx([id],mc) values('27',N'�αǼ�')
insert into t_jx([id],mc) values('28',N'������Һ��')
insert into t_jx([id],mc) values('29',N'���')
insert into t_jx([id],mc) values('30',N'����')
insert into t_jx([id],mc) values('31',N'������')
insert into t_jx([id],mc) values('32',N'��Һ��')
insert into t_jx([id],mc) values('33',N'������')
insert into t_jx([id],mc) values('34',N'�ǽ���')
insert into t_jx([id],mc) values('35',N'�����')
insert into t_jx([id],mc) values('36',N'Ĥ��')
insert into t_jx([id],mc) values('37',N'����')
insert into t_jx([id],mc) values('38',N'Ӳ���Ҽ�')
go


DROP VIEW [dbo].[V_SPXX]
GO

CREATE VIEW [dbo].[V_SPXX]
AS
SELECT T_SPXX.SPBH, T_SPXX.LBBH, T_SPLB.SPLB, T_SPXX.SBBZ, T_SPXX.TZM, 
      T_SPXX.PM, T_SPXX.JC, T_SPXX.SB, T_SPXX.PZWH, T_SPXX.GG, T_JLDW.JLDW, 
      T_SCCJ.JC AS CJJC, T_SPXX.YXQX, T_SPXX.ZDJL, T_SPXX.BZ, T_SCCJ.CJMC, 
      T_JX.MC AS jx, T_SPXX.GMP, T_SPXX.FLAG, T_SPXX.YHBZ
FROM T_SCCJ RIGHT OUTER JOIN
      T_SPXX ON T_SCCJ.CJBH = T_SPXX.CJBH LEFT OUTER JOIN
      T_SPLB ON T_SPXX.LBBH = T_SPLB.SPLBBH LEFT OUTER JOIN
      T_JLDW ON T_SPXX.JLDWBH = T_JLDW.JLDWBH LEFT OUTER JOIN
      T_JX ON T_SPXX.JX = T_JX.ID
GO



	