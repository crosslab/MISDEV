
package labs.common.utils.seq;

/**
 * 按不同关键字提供对应自增长累计序列号的接口申明。
 * 
 */
public interface SequenceGenerator {

	/**
	 * 获取绑定的关键字，必须。
	 * 
	 * @return String
	 */
	public String getKey();

	/**
	 * 设置绑定的关键字，必须。
	 * 
	 * @param key void
	 */
	public void setKey(String key);

	/**
	 * 获取初始值，默认为1。
	 * 
	 * @return long
	 */
	public long getInitialization();

	/**
	 * 设置初始值，默认为1。
	 */
	public void setInitialization(long initialization);

	/**
	 * 获取下一个可用的序列号。
	 * 
	 * <p>
	 * 此方法要确保能够持久记录住最近获取到的值到数据库系统中以便下一次再次调用此方法时能够得到正常累计的值。
	 * </p>
	 * 
	 * @return long 返回可用序列号。
	 */
	public long getSequence();

	/**
	 * 获取下一个可用的序列号，其返回结果会再加上step的值。
	 * 
	 * @param step 步长值。
	 * @return long 返回可用序列号。
	 */
	public long getSequence(long step);

	/**
	 * 设置下一次获取的可用值（即getSequence的返回值）从sequence参数开始累计。
	 * 
	 * <p>
	 * 用于重置自增长序列号的初始值为sequence参数指定的值。
	 * </p>
	 * 
	 * @param sequence void
	 */
	public void setSequence(long sequence);

	/**
	 * 获取下一个可用的序列号。
	 * 
	 * <p>
	 * 此方法与getSequence的区别在于，这个方法不会导致数据库中记录的下一个可用值被永久更改，只是一个预获取的结果。
	 * </p>
	 * 
	 * @return long
	 */
	public long getPreviewSequence();

}

