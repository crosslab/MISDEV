/**
 * 
 */
package labs.modules.cms.dao;

import labs.common.persistence.CrudDao;
import labs.common.persistence.annotation.MyBatisDao;
import labs.modules.cms.entity.Guestbook;

/**
 * 留言DAO接口
 * @author labs
 * @version 2013-8-23
 */
@MyBatisDao
public interface GuestbookDao extends CrudDao<Guestbook> {

}
