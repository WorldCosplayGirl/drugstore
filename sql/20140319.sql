
ALTER TABLE t_yhjhzb 
ALTER COLUMN bz NVARCHAR(128) NULL
GO


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




if object_id('SP_HBYHD') is not null
	DROP PROCEDURE SP_HBYHD
GO
/******************* ����˵�� *****************************************************************
  �ϲ����Ҫ����Ϊһ�������ڽ�����֤
  ����	@yhdbh   Ҫ�������
		@hbyhdbh Ҫ�ϲ���Ҫ�����ţ�������ţ����ŷָ�
        @zbr   ������
	@bsr	 ������
  ���	����һ���˻���
**********************************************************************************************/
CREATE PROCEDURE SP_HBYHD @yhdbh NVARCHAR(16), @hbyhdbh Nvarchar(128),@zbr nvarchar(15) AS
begin
	create table #t
	(
	YHDBH NVARCHAR(16) null, 
	YHDW NVARCHAR(8) null,
	YHRQ DATETIME null,
	ORDR INT IDENTITY(1,1), 
	SPBH NVARCHAR(16) NULL , 
	GYSBH NVARCHAR(8) null, 
	KLOW DECIMAL(10,2) NULL,
	DCL DECIMAL(10,2) NULL, 
	YHSL DECIMAL(10,2) NULL, 
	jhj DECIMAL(14,4) NULL,
    LSJ DECIMAL(10,2) NULL, 
    FGSKC DECIMAL(10,2) NULL, 
    FLAG INT NULL, 
    BZ NVARCHAR(32) NULL
	)
	
	create table #tt
	(	 
	SPBH NVARCHAR(16),	
	YHSL DECIMAL(10,2),
	ordr INT
	)
	
	insert into #t
	select @yhdbh, YHDW, YHRQ, SPBH, GYSBH, KLOW, DCL, YHSL, jhj,
            LSJ, FGSKC, FLAG, BZ
	from t_yhjhmx e
	JOIN fn_SplitToTable(@hbyhdbh,',') e1 ON e.YHDBH=e1.value
	
	INSERT INTO #tt(spbh,yhsl,ordr)
	SELECT spbh,SUM(yhsl) yhsl ,MIN(ordr) ordr
	FROM #t
	GROUP BY SPBH
		
	DECLARE @yhrq DATETIME
	
	--��ȡҪ������
	SELECT TOP 1 @yhrq = yhrq 
	FROM t_yhjhzb e
	JOIN fn_SplitToTable(@hbyhdbh,',') e1 ON e.YHDBH=e1.value
	
	INSERT INTO t_yhjhzb(YHDBH, YHRQ, BZ, ZBR, JSBZ, YHDW)
	VALUES(@yhdbh,@yhrq,@hbyhdbh,@zbr,0,'000')
	
	INSERT INTO t_yhjhmx(YHDBH, YHDW, YHRQ, ORDR, SPBH, GYSBH, KLOW, DCL, YHSL,
	            jhj, LSJ, FGSKC, FLAG, BZ)
	SELECT e.YHDBH, e.YHDW, e.YHRQ, e.ORDR, e.SPBH, e.GYSBH, e.KLOW, e.DCL, e1.YHSL,
	       e.jhj, e.LSJ, e.FGSKC, e.FLAG, e.BZ
	from #t e
	JOIN #tt e1 ON e.ORDR=e1.ordr
	
		
	drop table #t
end 
GO

ALTER TABLE t_yhjhmx
ADD dhsl DECIMAL(10,2) NULL DEFAULT 0
GO

