/**
 * 
 */
package labs.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import labs.common.service.CrudService;
import labs.modules.cms.dao.ArticleDataDao;
import labs.modules.cms.entity.ArticleData;

/**
 * 站点Service
 * @author labs
 * @version 2013-01-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleDataService extends CrudService<ArticleDataDao, ArticleData> {

}
