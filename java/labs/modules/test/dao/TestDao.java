/**
 * 
 */
package labs.modules.test.dao;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.test.entity.Test;

/**
 * 测试DAO接口
 * @author labs
 * @version 2013-10-17
 */
@MyBatisDao
public interface TestDao extends CrudDao<Test> {
	
}
