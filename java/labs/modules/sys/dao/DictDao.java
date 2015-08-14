/**
 * 
 */
package labs.modules.sys.dao;

import java.util.List;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * @author labs
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
