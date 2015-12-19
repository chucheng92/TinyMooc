# pom config version1

如果在maven仓库中下载不到最新版本的依赖，请添加maven snapshots仓库
```xml
<repositories>
 <repository>
   <id>oss-snapshots</id>
   <url>https://oss.sonatype.org/content/repositories/snapshots</url>
   <releases>
     <enabled>false</enabled>
   </releases>
   <snapshots>
     <enabled>true</enabled>
   </snapshots>
 </repository>
</repositories>
```
和`dependencies`相同级别


## pom config
```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.lab301</groupId>
	<artifactId>tinymooc</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<packaging>war</packaging>


	<properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
	</properties>

	<dependencies>
		<!-- MySQL database driver -->
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>5.1.25</version>
		</dependency>

		<!-- Spring framework -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-web</artifactId>
			<version>3.1.1.RELEASE</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-jdbc</artifactId>
			<version>3.1.1.RELEASE</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-orm</artifactId>
			<version>3.1.1.RELEASE</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>3.1.1.RELEASE</version>
		</dependency>
		<!-- Hibernate core -->
		<dependency>
			<groupId>org.hibernate</groupId>
			<artifactId>hibernate-core</artifactId>
			<version>4.2.3.Final</version>
		</dependency>
		<dependency>
			<groupId>org.hibernate.common</groupId>
			<artifactId>hibernate-commons-annotations</artifactId>
			<version>4.0.2.Final</version>
		</dependency>

		<!-- Hibernate core library dependency start -->
		<dependency>
			<groupId>dom4j</groupId>
			<artifactId>dom4j</artifactId>
			<version>1.6.1</version>
		</dependency>

		<!-- <dependency> <groupId>commons-logging</groupId> <artifactId>commons-logging</artifactId> 
			<version>1.1.1</version> </dependency> -->

		<dependency>
			<groupId>commons-collections</groupId>
			<artifactId>commons-collections</artifactId>
			<version>3.2.1</version>
		</dependency>
		<dependency>
			<groupId>commons-beanutils</groupId>
			<artifactId>commons-beanutils</artifactId>
			<version>1.8.3</version>
		</dependency>
		<dependency>
			<groupId>commons-dbcp</groupId>
			<artifactId>commons-dbcp</artifactId>
			<version>1.4</version>
		</dependency>
		<dependency>
			<groupId>commons-fileupload</groupId>
			<artifactId>commons-fileupload</artifactId>
			<version>1.3</version>
		</dependency>
		<dependency>
			<groupId>commons-io</groupId>
			<artifactId>commons-io</artifactId>
			<version>2.4</version>
		</dependency>
		<dependency>
			<groupId>commons-lang</groupId>
			<artifactId>commons-lang</artifactId>
			<version>2.6</version>
		</dependency>
		<dependency>
			<groupId>commons-logging</groupId>
			<artifactId>commons-logging</artifactId>
			<version>1.1.3</version>
		</dependency>
		<dependency>
			<groupId>javax.transaction</groupId>
			<artifactId>jta</artifactId>
			<version>1.1</version>
		</dependency>
		<!-- Hibernate core library dependency end -->

		<dependency>
			<groupId>antlr</groupId>
			<artifactId>antlr</artifactId>
			<version>2.7.7</version>
		</dependency>
		<dependency>
			<groupId>aopalliance</groupId>
			<artifactId>aopalliance</artifactId>
			<version>1.0</version>
		</dependency>
		<dependency>
			<groupId>asm</groupId>
			<artifactId>asm</artifactId>
			<version>3.3</version>
		</dependency>
		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjweaver</artifactId>
			<version>1.7.3</version>
		</dependency>
		<dependency>
			<groupId>cglib</groupId>
			<artifactId>cglib</artifactId>
			<version>2.2</version>
		</dependency>
		<dependency>
			<groupId>net.sf.ezmorph</groupId>
			<artifactId>ezmorph</artifactId>
			<version>1.0.6</version>
		</dependency>
		<dependency>
			<groupId>net.sf.json-lib</groupId>
			<artifactId>json-lib</artifactId>
			<version>2.4</version>
		</dependency>

		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
			<version>1.2</version>
		</dependency>

		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jsp-api</artifactId>
			<version>2.0</version>
			<scope>provided</scope>
		</dependency>
		<dependency>
			<groupId>javax.mail</groupId>
			<artifactId>mail</artifactId>
			<version>1.4.7</version>
		</dependency>


		<!-- lucene part -->
		<dependency>
			<groupId>org.apache.lucene</groupId>
			<artifactId>lucene-core</artifactId>
			<version>4.3.0</version>
		</dependency>

		<dependency>
			<groupId>org.apache.lucene</groupId>
			<artifactId>lucene-demo</artifactId>
			<version>4.3.0</version>
		</dependency>

		<dependency>
			<groupId>org.apache.lucene</groupId>
			<artifactId>lucene-memory</artifactId>
			<version>4.3.0</version>
		</dependency>

		<dependency>
			<groupId>org.apache.lucene</groupId>
			<artifactId>lucene-queryparser</artifactId>
			<version>4.3.0</version>
		</dependency>

		<dependency>
			<groupId>org.apache.lucene</groupId>
			<artifactId>lucene-analyzers-common</artifactId>
			<version>4.3.0</version>
		</dependency>

		<dependency>
			<groupId>org.wltea</groupId>
			<artifactId>analyzer</artifactId>
			<version>2012FF_u1</version>
		</dependency>

		<dependency>
			<groupId>commons-codec</groupId>
			<artifactId>commons-codec</artifactId>
			<version>1.8</version>
		</dependency>

		<dependency>
			<groupId>com.marswork</groupId>
			<artifactId>marswork-core</artifactId>
			<version>1.0.0</version>
		</dependency>
		<dependency>
			<groupId>com.marswork</groupId>
			<artifactId>marswork-dataaccess</artifactId>
			<version>1.0.0</version>
		</dependency>
		
		<!--  
		<dependency>
			<groupId>com.marswork</groupId>
			<artifactId>marswork-websupport</artifactId>
			<version>1.0.0</version>
		</dependency>
		-->

	</dependencies>


	<build>
		<finalName>entrepreneur_platform</finalName>

		<plugins>
		
			<plugin>
				<groupId>org.apache.tomcat.maven</groupId>
				<artifactId>tomcat7-maven-plugin</artifactId>
				<version>2.2</version>
				<configuration>
        			<url>http://localhost:8888/manager/text</url>
        			<username>admin</username>  
					<password>admin</password> 
        			<server>tomcat7</server>
        			<path>/microlecture</path>
				</configuration>
			</plugin>

			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>2.3.2</version>
				<configuration>
					<source>1.7</source>
					<target>1.7</target>
				</configuration>
			</plugin>
		</plugins>
		
	</build>

	<repositories>
		<repository>
			<id>ibiblio.org</id>
			<name>ibiblio.org</name>
			<url>http://mirrors.ibiblio.org/pub/mirrors/maven2</url>
		</repository>
	</repositories>

</project>
```