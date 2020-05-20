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


//todo 
* Комментарии
* Тесты
* Асинхронная загрузка из API
* Фильтр\поиск для контейнера

