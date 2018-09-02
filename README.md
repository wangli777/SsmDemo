# SsmDemo
## 一个简单的SSM整合小案例
这是我学习完SSM框架后做的一个SSM整合的小案例，其中包含的技术点主要有:<br>
  * 基础框架-SSM(SpringMVC+Spring+Mybatis)<br>
  * 数据库-MySQL<br>
  * 前端框架-使用BootStrap快速搭建简洁美观的界面<br>
  * 项目管理-Maven<br>
  * 分页-使用PageHelper<br>
  * 使用Mybatis Generator自动生成Java POJO及Mapper文件<br>
  * 使用REST风格的URI<br>
  ## 项目中遇到的一些问题
  * 项目使用的是REST风格的URI，在前台页面提交PUT类型的ajax请求时，SpringMVC的前端控制器并不能收到PUT方式的请求，<br>
  原因是Tomcat服务器默认并不支持PUT方式的请求,此时需要在web.xml中加一个对PUT请求支持的过滤器:<br>
  ```xml
  <filter>
    <filter-name>HttpPutFormContentFilter</filter-name>
    <filter-class>org.springframework.web.filter.HttpPutFormContentFilter</filter-class>
  </filter>
  <filter-mapping>
    <filter-name>HttpPutFormContentFilter</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>
  ```
