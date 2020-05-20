# Liferay Portlet Spring MVC App

A test case project with [Liferay Portal](https://www.liferay.com/), [Spring Framework](https://spring.io/).

Using:
* Java 8
* Maven 3
* Spring Framework 4.3.5
  * Spring Core
  * Spring Transactions
  * Spring Data JPA
  * Spring Portlet MVC
* Liferay 6.2
* Project Lombok
* Portlet 2.0
* JPA 2.1 + Hibernate (as JPA provider)
* JSP + JSTL + Spring Form taglib
* Mixed XML Schema-based and annotation based Spring configuration

First-time configuration
-----
* Define Liferay properties in pom.xml
Or you can do it in your local reposytory in settings.xml like this:
```
<settings>
<profiles>
<profile>
	<id>liferay</id>
	<properties>
		<liferay.version>6.2.5</liferay.version>
		<liferay.home>C:\servers\liferay-portal-6.2-ce-ga6</liferay.home>
		<liferay.auto.deploy.dir>${liferay.home}\deploy</liferay.auto.deploy.dir>
		<liferay.app.server.deploy.dir>${liferay.home}\tomcat-7.0.62\webapps</liferay.app.server.deploy.dir>
		<liferay.app.server.lib.global.dir>${liferay.home}\tomcat-7.0.62\lib\ext</liferay.app.server.lib.global.dir>
		<liferay.app.server.portal.dir>${liferay.home}\tomcat-7.0.62\webapps\ROOT</liferay.app.server.portal.dir>
	</properties>
</profile>
</profiles>
</settings>
```
And use this profile with all maven tasks.

* Configure your liferay portal

Deploy
------
If you're using Liferay Portal with Tomcat, copy the war to the deploy directory and wait for Liferay to deploy it. 

IntelliJ IDEA setup
------
* Import project into IntelliJ IDEA
* Install [Lombok plugin](https://plugins.jetbrains.com/idea/plugin/6317-lombok-plugin) and restart
* For project deployment:
  * [Create Maven Run configuration](https://www.jetbrains.com/help/idea/2016.3/creating-and-editing-run-debug-configurations.html) with `package liferay:deploy` specified in command line.
* For running Liferay from IntelliJ
  * Create [Run configuration for Liferay's Tomcat](https://web.liferay.com/community/wiki/-/wiki/Main/Running+Liferay+from+IntelliJ/maximized#section-Running+Liferay+from+IntelliJ-Liferay+on+Tomcat).
* For debugging your application
  * Create [Remote Run configuration](https://www.jetbrains.com/help/idea/2016.3/run-debug-configuration-remote.html) for remote debug. See [this article](http://blog.trifork.com/2014/07/14/how-to-remotely-debug-application-running-on-tomcat-from-within-intellij-idea/) for details.


Тестовое задание. Портлет для портала liferay 6.2. Полное описание в файле ТЗ.pdf.


Для запуска
First-time configuration
-----
* Определите параметры Liferay в pom.xml
Или создайте профиль в settings.xml в локальном maven-репозитории и определите свойства там. Например:

```
<settings>
<profiles>
<profile>
	<id>liferay</id>
	<properties>
		<liferay.version>6.2.5</liferay.version>
		<liferay.home>C:\servers\liferay-portal-6.2-ce-ga6</liferay.home>
		<liferay.auto.deploy.dir>${liferay.home}\deploy</liferay.auto.deploy.dir>
		<liferay.app.server.deploy.dir>${liferay.home}\tomcat-7.0.62\webapps</liferay.app.server.deploy.dir>
		<liferay.app.server.lib.global.dir>${liferay.home}\tomcat-7.0.62\lib\ext</liferay.app.server.lib.global.dir>
		<liferay.app.server.portal.dir>${liferay.home}\tomcat-7.0.62\webapps\ROOT</liferay.app.server.portal.dir>
	</properties>
</profile>
</profiles>
</settings>
```
И подключайте этот профиль при выполнении задач maven.

Развертывание
------
При правильном указании параметров liferay .war файл должен скопироваться в директорию auto deploy сам.
Если этого не произошло:
Для liferay + Tomcat положите .war файл в директорию deploy в папке портала и дождитесь авто-развертывания.

//todo 
* Комментарии
* Тесты
* Асинхронная загрузка из API
* Фильтр\поиск для контейнера

