/**
 * 
 */
package labs.modules.test.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import labs.common.service.CrudService;
import labs.modules.test.entity.Test;
import labs.modules.test.dao.TestDao;

/**
 * 测试Service
 * @author labs
 * @version 2013-10-17
 */
@Service
@Transactional(readOnly = true)
public class TestService extends CrudService<TestDao, Test> {

}
