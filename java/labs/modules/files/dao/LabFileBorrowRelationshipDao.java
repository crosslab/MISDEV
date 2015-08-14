/**
 * 
 */
package labs.modules.files.dao;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.files.entity.LabFileBorrowRelationship;

/**
 * 文件资料与借阅单号关联DAO接口
 * @author YL
 * @version 2015-05-30
 */
@MyBatisDao
public interface LabFileBorrowRelationshipDao extends CrudDao<LabFileBorrowRelationship> {
	
}