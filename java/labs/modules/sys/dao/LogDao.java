/**
 * 
 */
package labs.modules.sys.dao;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.sys.entity.Log;

/**
 * 日志DAO接口
 * @author labs
 * @version 2014-05-16
 */
@MyBatisDao
public interface LogDao extends CrudDao<Log> {

}
