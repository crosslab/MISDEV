/**
 * 
 */
package labs.modules.sys.dao;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.sys.entity.SysDictType;

/**
 * 数据字典类型DAO接口
 * @author 数据字典类型
 * @version 2015-05-12
 */
@MyBatisDao
public interface SysDictTypeDao extends CrudDao<SysDictType> {
	
}