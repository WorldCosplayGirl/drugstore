SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

ALTER  PROCEDURE SP_ZGSCKMX @sspbh varchar(10), @spcbh varchar(20), @sdjhm varchar(15), @ywrq datetime, @yxrq datetime , 
  @iywtp int, @decjg decimal(8,2), @decsl decimal(8,2), @decjine decimal(10,2), @skw varchar(6) AS
DECLARE @iordrmax int, @icount int
declare @chsl decimal(10,4)
declare @sl int 

--�ж��Ƿ��д��
if @iywtp < 0
  BEGIN
    SELECT @chsl = isnull(chsl,0) FROM T_CHXX_HW WHERE SPBH = @sspbh AND PCBH = @spcbh
    SELECT @chsl = ISNULL(@chsl,0)
		
    IF @chsl < @decsl
		
      BEGIN
	select @sl = cast(@chsl as int)
        RAISERROR ( '���Ϊ:%s����Ʒ�Ĵ������(%d)!', 16, 1, @sspbh,@sl)
        --ROLLBACK TRANSACTION
        RETURN
      END
  END

SELECT @yxrq = isnull(@yxrq,getdate())
SELECT @iordrmax = ISNULL(MAX(ISNULL(ORDR,0)),0) + 1 FROM T_CKMX WHERE SPBH = @sspbh   --ȡ���˳���
INSERT INTO T_CKMX VALUES (@sspbh, @spcbh, @sdjhm, @iordrmax, @ywrq, @iywtp, @decjg, @decsl, @decjine, @skw)   --д������-T_CKMX
SELECT @icount = ISNULL(COUNT(*),0) FROM T_CHXX_PC WHERE SPBH = @sspbh AND PCBH = @spcbh  --T_CHXX_PC�����Ƿ�����Ӧ����
IF @icount > 0    --������Ӧ������ (���α��,��Ʒ���)
BEGIN
  IF @iywtp >= 0   --������
    BEGIN
      IF @iywtp = 1
        UPDATE T_CHXX_PC SET YXRQ = @yxrq, SHUL = ISNUll(SHUL,0) + @decsl, JINE = JINE + @decjine WHERE  SPBH = @sspbh AND PCBH = @spcbh

      ELSE
        UPDATE T_CHXX_PC SET SHUL = ISNULL(SHUL,0) + @decsl, JINE = JINE + @decjine WHERE  SPBH = @sspbh AND PCBH = @spcbh

      UPDATE T_CHXX_HW SET chsl = isnull(chsl,0) + @decsl WHERE  SPBH = @sspbh AND PCBH = @spcbh	
    END 
  ELSE   --�������
    BEGIN
      UPDATE T_CHXX_PC SET YXSL = YXSL + @decsl, YXHK = YXHK + @decjine WHERE  SPBH = @sspbh AND PCBH = @spcbh
      UPDATE T_CHXX_HW SET chsl = chsl - @decsl WHERE  SPBH = @sspbh AND PCBH = @spcbh
    END
END
ELSE   --û����Ӧ���� 
BEGIN
  IF @iywtp >= 0  ---������
    BEGIN
      INSERT INTO T_CHXX_PC(spbh,pcbh,djhm,yxrq,shul,jine,yxsl,yxhk,flag) VALUES ( @sspbh, @spcbh, @sdjhm, @yxrq, @decsl, @decjine, 0, 0,1)
      INSERT INTO T_CHXX_HW(spbh,pcbh,hwbh,chsl,flag) VALUES(@sspbh, @spcbh,@skw,@decsl,1)
    END
  ELSE   ---�������
    BEGIN
      RAISERROR ( '���Ϊ:%s����Ʒ�Ĵ������!', 16, 1, @sspbh )
      --ROLLBACK TRANSACTION
      RETURN
      --INSERT INTO T_CHXX_PC(spbh,pcbh,djhm,yxrq,shul,jine,yxsl,yxhk,flag) VALUES ( @sspbh, @spcbh, @sdjhm, @yxrq, 0, 0, @decsl, @decsl,1 )
    END
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 

GO


IF EXISTS (SELECT name FROM sysobjects
      WHERE name = 'TRI_CKMX_IN' AND type = 'TR')
   DROP TRIGGER TRI_CKMX_IN
GO



