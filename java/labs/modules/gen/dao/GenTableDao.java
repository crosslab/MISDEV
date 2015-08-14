/**
 * 
 */
package labs.modules.gen.dao;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.gen.entity.GenTable;

/**
 * 业务表DAO接口
 * @author labs
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenTableDao extends CrudDao<GenTable> {
	
}
