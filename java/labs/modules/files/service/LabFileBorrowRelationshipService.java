/**
 * 
 */
package labs.modules.files.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import labs.common.persistence.Page;
import labs.common.service.CrudService;
import labs.modules.files.entity.LabFileBorrowRelationship;
import labs.modules.files.dao.LabFileBorrowRelationshipDao;

/**
 * 文件资料与借阅单号关联Service
 * @author YL
 * @version 2015-05-30
 */
@Service
@Transactional(readOnly = true)
public class LabFileBorrowRelationshipService extends CrudService<LabFileBorrowRelationshipDao, LabFileBorrowRelationship> {

	public LabFileBorrowRelationship get(String id) {
		return super.get(id);
	}
	
	public List<LabFileBorrowRelationship> findList(LabFileBorrowRelationship labFileBorrowRelationship) {
		return super.findList(labFileBorrowRelationship);
	}
	
	public Page<LabFileBorrowRelationship> findPage(Page<LabFileBorrowRelationship> page, LabFileBorrowRelationship labFileBorrowRelationship) {
		return super.findPage(page, labFileBorrowRelationship);
	}
	
	@Transactional(readOnly = false)
	public void save(LabFileBorrowRelationship labFileBorrowRelationship) {
		super.save(labFileBorrowRelationship);
	}
	
	@Transactional(readOnly = false)
	public void delete(LabFileBorrowRelationship labFileBorrowRelationship) {
		super.delete(labFileBorrowRelationship);
	}
	
}