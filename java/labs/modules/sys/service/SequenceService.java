package labs.modules.sys.service;

import java.util.Hashtable;

import labs.modules.sys.dao.SequenceDao;
import labs.modules.sys.entity.Sequence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 自增长序号提供类。
 * 
 */
@Service
@Scope("prototype")
public class SequenceService {

	@Autowired
	protected SequenceDao dao;

	private final long NUM = 100;// 序列缓存数量
	private long increase = 0;//记录序列缓存使用个数
	private long base = 0;//序列基数，序列值=基数+缓存使用个数
	
	private static Hashtable<String,Sequence> hsCache = new Hashtable<String, Sequence>();
	
	/**
	 * 缺省构造器。
	 */
	public SequenceService() {
	}

	private String m_key = null;
	private long m_initialization = 1;

	/**
	 * getInitialization
	 * 
	 */
	public long getInitialization() {
		return this.m_initialization;
	}

	/**
	 * getKey
	 * 
	 */
	public String getKey() {
		return this.m_key;
	}

	/**
	 * getPreviewSequence
	 * 
	 */
	public synchronized long getPreviewSequence() {
		if (this.m_key == null || this.m_key.length() == 0)
			return -1;
		Sequence seq = new Sequence();
		seq.setName(m_key);
		Sequence result = dao.get(seq);
		return result.getValue();
	}

	/**
	 * getSequence
	 * 序列值=基数+缓存使用个数
	 */
	@Transactional(readOnly=false)
	public synchronized long getSequence() {
		if (this.m_key == null || this.m_key.length() == 0)
			return -1;
		//synchronized(hsCache){
			if(!hsCache.containsKey(m_key) || increase >= NUM){
				Sequence seq = new Sequence();
				seq.setName(m_key);
				seq = dao.get(seq);
				hsCache.put(m_key, seq);

				long value = seq.getValue();
				increase = 0;
				base = value;
				
				seq.setValue(value + NUM);
				dao.update(seq);
				//FIXME:DEL
				System.out.println("查询数据库："+m_key+":"+value);
			}
			return base + increase++ + 1;
		//}
		
	}

	/**
	 * getSequence
	 * 
	 */
	public synchronized long getSequence(long step) {
		if (this.m_key == null || this.m_key.length() == 0)
			return -1;
		Sequence seq = new Sequence();
		seq.setName(m_key);
		Sequence result = dao.get(seq);
		result.setValue(result.getValue() + 1 + step);
		dao.update(result);
		return result.getValue();
	}

	/**
	 * setInitialization
	 * 
	 */
	public synchronized void setInitialization(long initialization) {
		this.m_initialization = initialization;
	}
	
	/**
	 * setKey
	 * 
	 */
	public synchronized void setKey(String key) {
		this.m_key = key;
		this.autoCreateSequence();
	}

	/**
	 * 判断key对应的记录是否存在，不存在则自动创建。
	 */
	private  void autoCreateSequence() {
		synchronized(hsCache){
			Sequence seq = new Sequence();
			seq.setName(m_key);
			Sequence result = dao.get(seq);
			if (null == result) {
				dao.insert(seq);
				System.out.println("自动创建KEY:"+m_key);
			}
		}
	}

	/**
	 * setSequence
	 * 
	 */
	public synchronized void setSequence(long sequence) {
		if (this.m_key == null || this.m_key.length() == 0)
			return;
		Sequence seq = new Sequence();
		seq.setName(m_key);
		seq.setValue(sequence);
		dao.updateValue(seq);
	}

	public void save(Sequence entity) {
		if (entity.getIsNewRecord()) {
			entity.preInsert();
			dao.insert(entity);
		} else {
			entity.preUpdate();
			dao.update(entity);
		}
	}
}
