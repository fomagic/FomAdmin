# FomAdmin

#### 项目介绍

1. 自我学习过程中一套Java后台管理系统
2. 参考了网上优秀开源框架，自己做了部分调整
3. 还有很多问题待修改，目前仅用作小项目的单机部署

#### 技术选型
1. 后端

	
	- 核心框架：	Spring Framework
	- WEB框架：	Spring MVC
	- 安全框架：	Apache Shiro
	- 持久层框架：	Mybatis
	- 任务调度：	Quartz
	- 数据库连接池：	Alibaba Druid
	- 模板引擎：	Jsp
	- 日志框架：	Log4J、SLF4J

2. 前端

	- Js框架：	jQuery
	- 表格：	free-jqGrid
	- 树插件:	zTree
	- 后台模板：	AdminLte(含Bootstrap)
	- 弹窗插件： Layer
	
3. Other
	
	- 数据库：目前仅在MySQL中开发
	- 项目环境：Maven、Eclipse Java EE
	


#### 使用说明

1. 导入数据库文件 doc/fomagic.sql 到 MySQL 中
2. 修改 src/main/resources/config.properties 中jdbc参数值
3. 运行： 在项目根目录执行 mvn clean tomcat7:run 或 导入 Eclipse中直接运行服务
4. 访问 https://localhost:8899 测试账密： admin/admin



