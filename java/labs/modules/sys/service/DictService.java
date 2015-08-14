/**
 * 
 */
package labs.modules.sys.service;

import java.util.List;

import labs.common.service.CrudService;
import labs.common.utils.CacheUtils;
import labs.modules.sys.dao.DictDao;
import labs.modules.sys.entity.Dict;
import labs.modules.sys.utils.DictUtils;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 字典Service
 * @author labs
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class DictService extends CrudService<DictDao, Dict> {
	
	/**
	 * 查询字段类型列表
	 * @return
	 */
	public List<String> findTypeList(){
		return dao.findTypeList(new Dict());
	}

	@Transactional(readOnly = false)
	public void save(Dict dict) {
		super.save(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

	@Transactional(readOnly = false)
	public void delete(Dict dict) {
		super.delete(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

	//设置服务名
	public String getServiceName() {
		return "数据字典服务";
	};
}
