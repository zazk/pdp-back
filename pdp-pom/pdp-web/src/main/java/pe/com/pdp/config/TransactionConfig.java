package pe.com.pdp.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

@Configuration
@EnableTransactionManagement
public class TransactionConfig implements TransactionManagementConfigurer{

	@Autowired
	private DataSource dataSourcePostgres;
	
	     @Bean
	     public PlatformTransactionManager txManager() {
	         return new DataSourceTransactionManager(dataSourcePostgres);
	     }

	     @Override
	     public PlatformTransactionManager annotationDrivenTransactionManager() {
	         return txManager();
	     }
	
}

