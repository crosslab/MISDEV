package labs;

import javax.sql.DataSource;

import labs.common.utils.IdGen;
import labs.modules.sys.dao.DictDao;
import labs.modules.sys.entity.Log;
import labs.modules.sys.service.LogService;
import labs.modules.sys.service.SequenceService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 * Spring 单元测试基类
 * @author labs
 * @version 2013-05-15
 */
@ContextConfiguration(locations = {"/spring-context.xml","/spring-context-shiro.xml","/spring-context-activiti.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class SequenceTest extends AbstractTransactionalJUnit4SpringContextTests {

	@Autowired
	protected DataSource dataSource;

	@Autowired
	protected LogService logService;
	
	@Autowired
	protected SequenceService sequenceService;
	
	@Autowired
	protected DictDao dictDao;

	public void setDataSource(DataSource dataSource) {
		super.setDataSource(dataSource);
		this.dataSource = dataSource;
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}
 

	@Test
	@Transactional(readOnly=false)
	public void test() {
		System.out.println("序列号测试");
		for(int i = 1;i<10;i++){
			Log log = new Log();
			log.setTitle("测试日志"+i);
			System.out.println("测试日志"+i);
			logService.save(log);
		}
		System.out.println("over");
	}
	
	@Test
	public void testActivitiSeq(){
		String id = IdGen.getInstance().getNextId();
		System.out.println(id+"@TEst");
	}
}
