----------------2017年4月30日 17:48:29--------------
----退款单增加生产日期
--ALTER TABLE t_tkdmxb 
--ADD scrq DATETIME NULL

----进货单转出库单增加生产日期、产地
--ALTER TABLE t_ckdmxb_temp
--ADD  scrq DATETIME NULL,cd NVARCHAR(16) NULL

----------------2017年3月30日 18:32:14-----------------------------------------
----进货单增加产地字段，记录饮片的产地
--ALTER TABLE t_jhdmxb 
--ADD cd NVARCHAR(16) NULL

----要货计划增加产地
--ALTER TABLE t_yhjhmx 
--ADD cd NVARCHAR(16) NULL


----供应商增加业务员、财务人员信息
--ALTER TABLE T_GYSXX
--ADD ywyxm NVARCHAR(16) NULL,	--业务员姓名
--	ywydh VARCHAR(16) NULL,		--业务员电话
--	ywysfzh VARCHAR(18) NULL,	--业务员身份证
--	ywyyxq	DATETIME NULL,		--业务员有效期
--	cwxm NVARCHAR(16) NULL,		--财务姓名
--	cwdh VARCHAR(16) NULL,		--财务电话
--	cwsfzh VARCHAR(18) NULL,	--财务身份证
--	cwyxq DATETIME null   		--财务有效期

----------------2017年3月7日 18:33:44-----------------------------------------
----增加付款记录查询
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES('07','付款记录查询',3,1,'付款记录查询','image\tom_wap.gif','w_fkjl_cx',1,1,1,0)

----首营品种增加生产标准、生产地址
--ALTER TABLE T_SYPZSPB 
--ADD scbz NVARCHAR(64) NULL, --生产标准
--    scdz NVARCHAR(64) NULL  --生产地址

----首营企业增加业务员、财务人员信息
--ALTER TABLE T_SYQYSPB
--ADD ywyxm NVARCHAR(16) NULL,	--业务员姓名
--	ywydh VARCHAR(16) NULL,		--业务员电话
--	ywysfzh VARCHAR(18) NULL,	--业务员身份证
--	ywyyxq	DATETIME NULL,		--业务员有效期
--	cwxm NVARCHAR(16) NULL,		--财务姓名
--	cwdh VARCHAR(16) NULL,		--财务电话
--	cwsfzh VARCHAR(18) NULL,	--财务身份证
--	cwyxq DATETIME null   		--财务有效期

----出库单增加产地，饮片需要增加产地录入字段
--ALTER TABLE t_ckdmxb 
--ADD cd NVARCHAR(16) NULL		--饮片产地

----商品信息增加功能主治
--ALTER TABLE T_SPXX
--ADD gnzz NVARCHAR(64) NULL



---------------2016年11月19日 16:25:07----------------------
-----增加医保药品目录
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(21,'医保药品目录',6,0,'医保药品目录','image\tom_wap.gif','w_yb_spxx_main',1,1,1,0)


--------2016.10.15-----------------
-----修改库存增加药品生产日期,到货日期
--ALTER TABLE t_chxx 
--ADD scrq DATETIME NULL,dhrq DATETIME

-----修改出库单增加药品生产日期
--ALTER TABLE t_ckdmxb
--ADD scrq DATETIME NULL

------反药商品增加数量，用来记录超剂量限制
--ALTER TABLE T_FYSP
--ADD sl INT NULL,	--单剂限制数量		
--lx TINYINT NULL		--类型 1-反药记录 2-饮片单剂限制数量记录
--GO
--UPDATE T_FYSP
--SET lx = 1



--------2016.9.29-----------------
-----修改全部单据审批三步走
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(28,'保管员确认出库',1,0,'保管员确认出库','image\tom_wap.gif','w_ckdrk',1,1,1,0)

--ALTER TABLE t_thdzb
--ADD shr NVARCHAR(3) NULL
--GO

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(29,'保管员确认退货',1,0,'保管员确认退货','image\tom_wap.gif','w_thdrk',1,1,1,0)




--------2016.8.27----------------------------------
-----1、所有单据三步审批 2、所有单据增加生产日期 3、人员岗位

-------取消总店饮片装斗记录
--ALTER table t_options
--ADD flag TINYINT NULL DEFAULT 1
--GO
--UPDATE t_options SET flag = 1
--GO
--UPDATE t_options SET flag = 0 WHERE id = 115
--GO

--INSERT INTO t_options(pid,code, name, note, sort,flag)
--VALUES(3,16,N'销后退回记录','',0,1)
--GO


-------  2016.7.31 start   ---------------------
-------  增加销量排名 
--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(27,'综合查询',4,0,'综合查询','image\tom_wap.gif','w_zh_report',1,1,0,0)

----询价单维护
--DROP TABLE T_xjdzb
--CREATE TABLE t_xjdzb
--(
--	xjdbh NVARCHAR(16) NOT NULL,
--	gysbh NVARCHAR(10) NOT NULL,
--	rq DATETIME NOT NULL,
--	bz NVARCHAR(32) NULL,
--	flag TINYINT NULL DEFAULT 0,
--	PRIMARY KEY(xjdbh)
--)

--CREATE TABLE t_xjdmxb
--(
--	xjdbh NVARCHAR(16) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	jg	DECIMAL(14,4) NULL DEFAULT 0,
--	bz NVARCHAR(32),
--	PRIMARY KEY(xjdbh,spbh)
--)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(23,'询价单录入',1,0,'询价单录入','image\tom_wap.gif','w_xjdlr',1,1,0,0)





----2016.7.3 start------------------------------------
----增加商品供应商限制，主要用于麻黄碱类药品控制，要货计划中需要验证受供应商限制的商品，进货单也要验证
--CREATE TABLE T_R_SP_GYS
--(
--	id INT IDENTITY(1,1) NOT NULL,
--	spbh NVARCHAR(16) NOT NULL,
--	gysbh NVARCHAR(16) NOT NULL,
--	PRIMARY KEY(id)
--)

--INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
--            fdbz, parameter)
--VALUES(20,'药品限定供应商维护',6,0,'药品限定供应商维护','image\tom_wap.gif','w_sp_gys',1,1,0,0)

-----选择供应商脚本
----SELECT z.GYSBH,min(m.jhj) AS jhj ,(select top 1 e.jhj from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
----where e.spbh = '10114' and e1.gysbh=z.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
----g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq
----FROM  T_JHDZB z
----join t_jhdmxb m ON m.JHDBH = z.JHDBH
----join t_gysxx g ON z.GYSBH=g.GYSBH
----WHERE m.spbh = '10114' and
----		z.jhrq > dateadd(month,-24,getdate())
----group by z.gysbh,g.gsyzrq,g.jyxkzrq,g.gsprq,g.frrq,g.xyrq

----UNION

----SELECT r.GYSBH,min(a.jhj) AS jhj ,(select top 1 e.jhj from t_jhdmxb e join t_jhdzb e1 on e.jhdbh = e1.jhdbh 
----where e.spbh = '10114' and e1.gysbh=r.gysbh and e1.jhrq > dateadd(month,-6,getdate()) order by e1.jhrq desc ) as zhjj,
----a.gsyzrq,a.jyxkzrq,a.gsprq,a.frrq,a.xyrq
----FROM t_r_sp_gys r
----left join (
----	select z.gysbh,z.JHRQ,m.jhj,m.spbh,g.gsyzrq, g.jyxkzrq, g.gsprq, g.xyrq,g.frrq
----    from T_JHDZB z
----	join t_jhdmxb m ON m.JHDBH = z.JHDBH AND m.spbh = '10114'
----	join t_gysxx g ON z.GYSBH=g.GYSBH
----) a ON r.gysbh = a.gysbh AND r.spbh = a.spbh and a.jhrq > dateadd(month,-24,getdate())
----WHERE r.spbh = '10114' 
----group by r.gysbh,a.gsyzrq,a.jyxkzrq,a.gsprq,a.frrq,a.xyrq
----order by jhj





-----------------2016.7.3 end--------------------------------

----ALTER TABLE t_jhdzb 
----ADD zpflag TINYINT

----ALTER TABLE t_ckdzb 
----ADD zpflag TINYINT

----------2016.6.18
------增加进货明细表复核标志，1复核通过 0复核未通过 null 未复核
----ALTER TABLE t_jhdmxb 
----ADD fhflag TINYINT

-------增加进货单入库功能，单独列出
----INSERT INTO t_funcs(FUNCID, FUNNM, FUNTP, GRPID, FUNMS, TPLJ, FUNFM, FLAG, UFLAG,
----            fdbz, parameter)
----VALUES('03','保管员确认入库',1,0,'保管员确认入库','image\tom_wap.gif','w_jhdrk',1,1,1,0)

--------2016.06.27----------------------
------总店进货单增加到货时间，默认当天
----ALTER TABLE t_jhdzb 
----ADD dhrq DATETIME NULL




