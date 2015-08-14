package labs.modules.sys.dao;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.sys.entity.Sequence;

@MyBatisDao
public interface SequenceDao extends CrudDao<Sequence>{

	public void updateValue(Sequence sequence);
}
