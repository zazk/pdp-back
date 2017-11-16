package pe.com.pdp.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

@SuppressWarnings("el-syntax")
@Configuration
@PropertySource("classpath:parametrosweb.properties")
@MapperScan(basePackages={"pe.com.pdp.dao"})
public class PostgreConfig {
  
 
  @Value("#{ environment['dataSourcePostgres.driver.class.name']?:'' }")
  private  String driverClass;
  @Value("#{ environment['dataSourcePostgres.url']?:'' }")
  private String jdbcUrl;
  @Value("#{ environment['dataSourcePostgres.username']?:'' }")
  public String userName;
  @Value("#{ environment['dataSourcePostgres.password']?:'' }")
  public String password ;

  @Bean(name = "dataSourcePostgres" , destroyMethod="close")
  @Primary
  public DataSource dataSourcePostgres() {

    BasicDataSource dataSource = new BasicDataSource();
    try {
    	dataSource.setDriverClassName(this.driverClass);
        dataSource.setUrl(this.jdbcUrl);
        dataSource.setUsername(this.userName);
        dataSource.setPassword(this.password);
        
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return dataSource;
  }

  @Bean(name="transaccionPostgres")
  @Primary
  public DataSourceTransactionManager transaccionPostgres() {
    return new DataSourceTransactionManager(dataSourcePostgres());
  }

	@Bean(name = "sqlSessionFactoryPostgress")
	@Primary
	public SqlSessionFactory sqlSessionFactoryPostgress() throws Exception {

		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSourcePostgres());
		
		sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("/META-INF/dao-config.xml"));

		return sqlSessionFactoryBean.getObject();
	}
  
}

