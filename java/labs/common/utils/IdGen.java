/**
 * 
 */
package labs.common.utils;

import java.io.Serializable;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.UUID;

import labs.modules.sys.dao.SequenceDao;
import labs.modules.sys.entity.Sequence;
import labs.modules.sys.service.SequenceService;

import org.activiti.engine.impl.cfg.IdGenerator;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionIdGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 封装各种生成唯一性ID算法的工具类.
 * 
 * @author labs
 * @version 2013-01-15
 */
@Service
@Lazy(true)
@Scope("prototype")
public class IdGen implements IdGenerator, SessionIdGenerator {

	@Autowired
	protected SequenceDao dao;

	static Hashtable<String, SequenceService> htSequenceService = new Hashtable<String, SequenceService>();

	private static SecureRandom random = new SecureRandom();

	private static IdGen idGen;

	public static IdGen getInstance() {
		if (null == idGen)
			return SpringContextHolder.getBean(IdGen.class);
		return idGen;
	}

	/**
	 * 封装JDK自带的UUID, 通过Random数字生成, 中间无-分割.
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 使用SecureRandom随机生成Long.
	 */
	public static long randomLong() {
		return Math.abs(random.nextLong());
	}

	/**
	 * 基于Base62编码的SecureRandom随机生成bytes.
	 */
	public static String randomBase62(int length) {
		byte[] randomBytes = new byte[length];
		random.nextBytes(randomBytes);
		return Encodes.encodeBase62(randomBytes);
	}

	/**
	 * Activiti ID 生成
	 */
	@Override
	public String getNextId() {
		return getId("ACTIVITI",dao);
		// return IdGen.uuid();
	}

	@Override
	public Serializable generateId(Session session) {
		return IdGen.uuid();
	}
	
	@Transactional(readOnly=false)
	public String getId(String key,SequenceDao seqDao) {
		
		Sequence seq = new Sequence();
		seq.setName(key);
		seq = seqDao.get(seq);
		if(null == seq || seq.getValue() == 0){
			seq = new Sequence();
			seq.setName(key);
			seq.setValue(0);
			seqDao.insert(seq);
		}
		long value = seq.getValue() + 1;
		seq.setValue(value);
		seqDao.update(seq);
		
		String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
		return date + value + "";
	}
	
	
}
