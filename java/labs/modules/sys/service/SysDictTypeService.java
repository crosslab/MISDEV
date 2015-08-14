/**
 * 
 */
package labs.modules.sys.service;

import java.io.FileNotFoundException;
import java.util.List;

import labs.common.persistence.Page;
import labs.common.service.CrudService;
import labs.modules.sys.dao.SysDictTypeDao;
import labs.modules.sys.entity.SysDictType;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 数据字典类型Service
 * @author 数据字典类型
 * @version 2015-05-12
 */
@Service
@Transactional(readOnly = true)
public class SysDictTypeService extends CrudService<SysDictTypeDao, SysDictType> {

	public SysDictType get(String id) {
		return super.get(id);
	}
	
	public List<SysDictType> findList(SysDictType sysDictType) {
		return super.findList(sysDictType);
	}
	
	public Page<SysDictType> findPage(Page<SysDictType> page, SysDictType sysDictType){
		return super.findPage(page, sysDictType);
	}
	
	@Transactional(readOnly = false)
	public void save(SysDictType sysDictType) {
		super.save(sysDictType);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysDictType sysDictType) {
		super.delete(sysDictType);
	}
	
	@Override
	public String getServiceName() {
		return "获得数据字典类型服务";
	}

	public Page<SysDictType> findPage2(Page<SysDictType> page, SysDictType param) throws FileNotFoundException {
		throw new FileNotFoundException("证据没找到！");
	}
}