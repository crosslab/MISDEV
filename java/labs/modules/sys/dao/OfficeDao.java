/**
 * 
 */
package labs.modules.sys.dao;

import labs.common.persistence.TreeDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.sys.entity.Office;

/**
 * 机构DAO接口
 * @author labs
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
}
