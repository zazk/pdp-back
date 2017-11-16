package pe.com.pdp.thread;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Component;


@Component
public class AdminColaHilos {
	
	Logger logger = Logger.getLogger(this.getClass());

	private TaskExecutor poolThreadTaskExecutor;
	
	@Autowired
	public AdminColaHilos(TaskExecutor poolThreadTaskExecutor) {
		this.poolThreadTaskExecutor = poolThreadTaskExecutor;
	}

	public void executeThread(HiloProceso hiloProceso) {
		try{
			poolThreadTaskExecutor.execute(hiloProceso);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}

