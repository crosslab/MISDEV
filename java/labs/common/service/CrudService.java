/**
 * 
 */
package labs.common.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;

import labs.common.persistence.CrudDao;
import labs.common.persistence.DataEntity;
import labs.common.persistence.Page;
import labs.common.utils.StringUtils;
import labs.modules.sys.dao.SequenceDao;
import labs.modules.sys.entity.Sequence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service基类
 * @author labs
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends DataEntity<T>> extends BaseService {
	
	/**
	 * 持久层对象
	 */
	@Autowired
	protected D dao;

	@Autowired
	protected SequenceDao seqDao;
	
	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(String id) {
		return dao.get(id);
	}
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	@Transactional(readOnly=true)
	public T get(T entity) {
		return dao.get(entity);
	}
	
	/**
	 * 查询列表数据
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}
	
	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Page<T> findPage(Page<T> page, T entity) {
		entity.setPage(page);
		page.setList(dao.findList(entity));
		return page;
	}

	/**
	 * 保存数据（插入或更新）
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void save(T entity) {
		if (entity.getIsNewRecord()){
			entity.preInsert();
			entity.setId(genId(entity.getClass().getSimpleName()));
			dao.insert(entity);
		}else{
			entity.preUpdate();
			dao.update(entity);
		}
	}	
	/**
	 * 删除数据
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void delete(T entity) {
		entity.preUpdate();
		dao.delete(entity);
	}

	//序列对象缓存
	static Hashtable<String,Sequence> htSequence = new Hashtable<String, Sequence>();
	//序列值缓存长度
	final long STEP = 100;
	/**
	 * 根据key获取序列值
	 * @param placeHolder
	 * @return
	 */
	@Transactional(readOnly=false)
	protected String genSeq(String m_key){
		if(m_key==null) return null;
		synchronized(htSequence){
			Sequence seq = htSequence.get(m_key);
			if(null == seq){//没有缓存
				seq = new Sequence();
				seq.setName(m_key);
				seq = seqDao.get(seq);
				if (null == seq) {//没有缓存，且数据库中没有记录
					seq = new Sequence();
					seq.setName(m_key);
					seq.setValue(STEP);
					seq.setStep(STEP);
					seq.setMax(STEP);
					seq.setInit(0);
					seqDao.insert(seq);
					System.out.println("创建KEY:"+m_key);
				}else{//没有缓存，数据库中有记录，更新初始值、Value和max
					seq.setInit(seq.getValue());
					seq.setValue(STEP + seq.getValue());
					seq.setMax(seq.getValue());
					seqDao.update(seq);
					System.out.println("更新KEY:"+m_key+":"+seq.getValue());
				}
				htSequence.put(m_key, seq);
				logger.info("放入KEY:"+m_key);
			}
			
			if(seq.getInit() >= seq.getMax()){
				seq.setInit(seq.getValue());
				seq.setValue(STEP + seq.getValue());
				seq.setMax(seq.getValue());
				seqDao.update(seq);
				logger.info("更新KEY:"+m_key+":"+seq.getValue());
			}
			seq.setInit(seq.getInit()+1);
			return seq.getInit()+"";
		}
	}
	/**
	 * 生成主键 ，格式：日期+序号,如果需要定制主键，值具体服务类里面覆盖此方法
	 * @param seq
	 * @return
	 */
	protected String genId(String key){
		String seq = genSeq(key);
		String date = new SimpleDateFormat("MMdd").format(new Date());
		return date + StringUtils.leftPad(seq, 10, '0');
	}
}
