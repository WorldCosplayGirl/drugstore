
if object_id('fn_SplitToTable') is not null
	DROP FUNCTION fn_SplitToTable
GO
CREATE FUNCTION fn_SplitToTable
/****************************************************************************************
'������룺fn_SplitToTable
'�������ƣ��ַ����ָ�
'Ŀ�����ģ�����Ҫ�ָ�����������ִ��и������TABLE
'����˵����
(
 @sInputString  VARCHAR(8000),  		  --�����ִ�
 @sSplitChar varchar(8000)		--�ָ��
)    
'����ֵ����Table
'�����á�����
'����ע�������в������贫��
'����������select * from dbo.fn_SplitToTable('C20041122000001,C20041122000002',',')
****************************************************************************************/
(@sInputString nvarchar(4000) , @sSplitChar varchar(10))
	RETURNS @tbl_List TABLE (idx INT IDENTITY(1,1),value nvarchar(4000))
AS

	BEGIN
		DECLARE	@lInputStringLength	Int ,
			@lPosition		Int ,
			@lSplitChar		Int 


		SET	@lInputStringLength = LEN ( @sInputString )
		SET 	@lPosition=1
		SET	@lSplitChar=1

		WHILE @lPosition <= @lInputStringLength
			BEGIN
				SET @lSplitChar = CHARINDEX ( @sSplitChar , @sInputString , @lPosition)
				IF @lSplitChar = 0
					BEGIN
						INSERT @tbl_List (value )
						SELECT RTRIM(LTRIM(SUBSTRING( @sInputString , @lPosition ,1+ @lInputStringLength - @lPosition)))
						SET @lPosition= @lInputStringLength + 1
					END
		
				ELSE
					BEGIN
						INSERT @tbl_List ( value )
						SELECT RTRIM(LTRIM(SUBSTRING( @sInputString , @lPosition , @lSplitChar - @lPosition)))
						SET @lPosition = @lSplitChar+1
			END
		END
		
        DELETE @tbl_List WHERE RTRIM(value)=''

		RETURN
	END
GO




if object_id('SP_CKD2YHD') is not null
	DROP PROCEDURE SP_CKD2YHD
GO
/******************* ����˵�� *****************************************************************
  ���ⵥ��Ҫ�����ȽϺ˶ԣ�Ҫ���������ڳ��������ĸ���Ҫ������Ϊ�������������ⵥ�д��ڶ�Ҫ������
  �����ڵ���Ʒ���ӵ�Ҫ���ƻ���
  ����	@yhdbh   Ҫ�������
		@ckdbhs  �˶Եĳ��ⵥ�ţ�������ţ����ŷָ�
  ���	
**********************************************************************************************/
CREATE PROCEDURE SP_CKD2YHD @yhdbh NVARCHAR(16), @ckdbhs Nvarchar(4000) AS
BEGIN
	--��ȡҪ���ƻ������ordrֵ
	DECLARE @id INT
	SELECT @id=MAX(ordr)+1 FROM t_yhjhmx WHERE yhdbh=@yhdbh
	DECLARE @sql NVARCHAR(4000)
	SET @sql = '
	create table #t
	(	
	id INT IDENTITY('+cast(@id AS VARCHAR(8))+',1), 
	SPBH NVARCHAR(16) , 
	ckSL DECIMAL(10,2)
	)		
	insert into #t(spbh,cksl)
	SELECT e.spbh,SUM(e.shul) sl
	FROM t_ckdmxb e 
	JOIN fn_SplitToTable('''+@ckdbhs+''','','') e1 ON e.ckDBH=e1.value
	GROUP BY e.spbh
	
	--���µ�������
	update e
	set e.flag = 255,e.dhsl = e1.cksl
	from t_yhjhmx e
	join #t e1 on e.spbh = e1.spbh
	
	--����Ҫ���ƻ���Ҫ������=�������� --Ҫ������<��������
	update e
	set e.yhsl = e1.cksl
	from t_yhjhmx e
	join #t e1 on e.spbh = e1.spbh 
	where e.yhsl < e1.cksl
	
	--����Ҫ���ƻ��в����ڵĳ�����Ʒ��¼
	insert into t_yhjhmx(YHDBH, YHRQ, ORDR, SPBH, KLOW, DCL, YHSL, LSJ, FLAG,dhsl)
	SELECT '''+@yhdbh+''',GETDATE(),e.id,e.SPBH,0,0,e.ckSL,e1.LSJ,255,e.ckSL
	FROM #t e
	JOIN v_spxx_qtcx e1 ON e.spbh = e1.SPBH
	LEFT JOIN t_yhjhmx e2 ON e.spbh = e2.SPBH AND e2.YHDBH='''+@yhdbh+'''
	WHERE e2.spbh IS NULL
		
	drop table #t'
	
	--PRINT @sql 
	
	EXEC(@sql)
	
end 
GO