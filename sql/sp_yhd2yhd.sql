if object_id('SP_YHD2YHD') is not null
	DROP PROCEDURE SP_YHD2YHD
GO
/******************* ����˵�� *****************************************************************
  ��Ҫ�����������������ڲ�ֳ�2��Ҫ����,��ֳ����ĵ�������@dt���ں��淢����������
  ����	@dh   ԭҪ�������
        @yhdbh   ��Ҫ������ţ����ؿ�ֵ��ʾ����Ҫ��
		@dt	 ��Ʒ����������
  ���	��������Ҫ����
**********************************************************************************************/
CREATE PROCEDURE SP_YHD2YHD @dh varchar(15),@yhdbh varchar(15) OUTPUT,@dt DATETIME AS
begin

DECLARE @i INT,@k INT
--SELECT @dh = 'YH16000166',@dt = '2016-01-01',@yhdbh = 'YH16000167'

CREATE TABLE #t
(
	spbh NVARCHAR(32),
	ordr int
)

INSERT INTO #t(spbh,ordr)
SELECT ym.spbh,ym.ORDR
FROM t_yhjhmx ym
JOIN t_jhdmxb jm ON ym.spbh = jm.SPBh
JOIN t_jhdzb jz ON jm.JHDBH=jz.JHDBH
WHERE ym.YHDBH = @dh
GROUP BY ym.SPBH,ym.ORDR
HAVING MAX(jz.jhrq) >= @dt

SELECT @k = COUNT(1) FROM t_yhjhmx WHERE yhdbh = @dh
SELECT @i = COUNT(1) FROM #t
IF @i>0	AND @i <> @k	
	BEGIN
		--����Ҫ��ֵ�Ҫ������
		INSERT INTO t_yhjhzb(YHDBH, YHRQ, BZ, ZBR, JSBZ, YHDW)
		SELECT @yhdbh,e.YHRQ, e.BZ+' ['+CONVERT(NVARCHAR(100),@dt,111)+'(��)֮�����Ʒ��]', e.ZBR, e.JSBZ, e.YHDW
		FROM t_yhjhzb e
		WHERE e.yhdbh = @dh

		UPDATE e1
		SET e1.yhdbh = @yhdbh
		FROM #t e
		JOIN t_yhjhmx e1 ON e.spbh=e1.spbh AND e.ordr=e1.ORDR
		WHERE e1.YHDBH = @dh
	END
ELSE IF @i = @k
	BEGIN
		--ȫ����@dt���ں������������ݣ�Ҳ����Ҫ��
		select @yhdbh = '0'
	END
ELSE
	BEGIN
		select @yhdbh = ''
	END
	


DROP TABLE #t

END

