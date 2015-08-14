/**
 * 
 */
package labs.modules.cms.dao;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.cms.entity.Site;

/**
 * 站点DAO接口
 * @author labs
 * @version 2013-8-23
 */
@MyBatisDao
public interface SiteDao extends CrudDao<Site> {

}
