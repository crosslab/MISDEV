/**
 * 
 */
package labs.modules.gen.dao;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.gen.entity.GenTable;
import labs.modules.gen.entity.GenTableColumn;

/**
 * 业务表字段DAO接口
 * @author labs
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenTableColumnDao extends CrudDao<GenTableColumn> {
	
	public void deleteByGenTable(GenTable genTable);
}
