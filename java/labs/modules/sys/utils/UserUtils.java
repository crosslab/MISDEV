/**
 * 
 */
package labs.modules.sys.utils;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import labs.common.service.BaseService;
import labs.common.utils.CacheUtils;
import labs.common.utils.SpringContextHolder;
import labs.modules.sys.dao.AreaDao;
import labs.modules.sys.dao.MenuDao;
import labs.modules.sys.dao.OfficeDao;
import labs.modules.sys.dao.RoleDao;
import labs.modules.sys.dao.UserDao;
import labs.modules.sys.entity.Area;
import labs.modules.sys.entity.Menu;
import labs.modules.sys.entity.Office;
import labs.modules.sys.entity.Role;
import labs.modules.sys.entity.User;
import labs.modules.sys.security.SystemAuthorizingRealm.Principal;

/**
 * 用户工具类
 * @author labs
 * @version 2013-12-05
 */
public class UserUtils {

	protected static Logger logger = LoggerFactory.getLogger(UserUtils.class);
	private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);
	private static RoleDao roleDao = SpringContextHolder.getBean(RoleDao.class);
	private static MenuDao menuDao = SpringContextHolder.getBean(MenuDao.class);
	private static AreaDao areaDao = SpringContextHolder.getBean(AreaDao.class);
	private static OfficeDao officeDao = SpringContextHolder.getBean(OfficeDao.class);

	//cache 
	public static final String USER_CACHE = "userCache";
	public static final String USER_CACHE_ID_ = "id_";
	public static final String USER_CACHE_LOGIN_NAME_ = "ln_";
	public static final String USER_CACHE_LIST_BY_OFFICE_ID_ = "oid_";
	//临时缓存，主要存放公共数据，比如菜单、组织机构，区别于系统缓存，此缓存可以移除。针对于不同用户修改菜单、组织机构同步问题
	public static final String TMP_CACHE = "TMP_CACHE";
	
	//cache key
	public static final String CACHE_ROLE_LIST = "roleList_";
	public static final String CACHE_MENU_LIST = "menuList_";
	public static final String CACHE_AREA_LIST = "areaList_";
	public static final String CACHE_OFFICE_LIST = "officeList_";
	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList_";
	
	/**
	 * 根据ID获取用户
	 * @param id
	 * @return 取不到返回null
	 */
	public static User get(String id){
		User user = (User)CacheUtils.get(USER_CACHE, USER_CACHE_ID_ + id);
		if (user ==  null){
			user = userDao.get(id);
			if (user == null){
				return null;
			}
			user.setRoleList(roleDao.findList(new Role(user)));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}
	
	/**
	 * 根据登录名获取用户
	 * @param loginName
	 * @return 取不到返回null
	 */
	public static User getByLoginName(String loginName){
		User user = (User)CacheUtils.get(USER_CACHE, USER_CACHE_LOGIN_NAME_ + loginName);
		if (user == null){
			user = userDao.getByLoginName(new User(null, loginName));
			if (user == null){
				return null;
			}
			user.setRoleList(roleDao.findList(new Role(user)));
			CacheUtils.put(USER_CACHE, USER_CACHE_ID_ + user.getId(), user);
			CacheUtils.put(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName(), user);
		}
		return user;
	}
	
	/**
	 * 清除当前用户缓存
	 */
	public static void clearCache(){
		/*removeCache(CACHE_ROLE_LIST);
		removeCache(CACHE_MENU_LIST);
		removeCache(CACHE_AREA_LIST);
		removeCache(CACHE_OFFICE_LIST);
		removeCache(CACHE_OFFICE_ALL_LIST);*/
		removeTmpCache();
		UserUtils.clearCache(getUser());
	}
	
	public static void removeTmpCache(){
		CacheUtils.getCacheManager().removeCache(TMP_CACHE);
		logger.info("移除TMP缓存");
	}
	
	/**
	 * 清除指定用户缓存
	 * @param user
	 */
	public static void clearCache(User user){
		CacheUtils.remove(USER_CACHE, USER_CACHE_ID_ + user.getId());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getOldLoginName());
		if (user.getOffice() != null && user.getOffice().getId() != null){
			CacheUtils.remove(USER_CACHE, USER_CACHE_LIST_BY_OFFICE_ID_ + user.getOffice().getId());
		}
	}
	
	/**
	 * 获取当前用户
	 * @return 取不到返回 new User()
	 */
	public static User getUser(){
		Principal principal = getPrincipal();
		if (principal!=null){
			User user = get(principal.getId());
			if (user != null){
				return user;
			}
			return new User();
		}
		// 如果没有登录，则返回实例化空的User对象。
		return new User();
	}

	/**
	 * 获取当前用户角色列表
	 * @return
	 */
	public static List<Role> getRoleList(){
		@SuppressWarnings("unchecked")
		List<Role> roleList = (List<Role>)getTmpCache(CACHE_ROLE_LIST);
		if (roleList == null){
			User user = getUser();
			if (user.isAdmin()){
				roleList = roleDao.findAllList(new Role());
			}else{
				Role role = new Role();
				role.getSqlMap().put("dsf", BaseService.dataScopeFilter(user.getCurrentUser(), "o", "u"));
				roleList = roleDao.findList(role);
			}
			putTmpCache(CACHE_ROLE_LIST, roleList);
			logger.info("getRoleList 缓存");
		}
		return roleList;
	}
	
	/**
	 * 获取当前用户授权菜单
	 * @return
	 */
	public static List<Menu> getMenuList(){
		@SuppressWarnings("unchecked")
		List<Menu> menuList = (List<Menu>)getTmpCache(CACHE_MENU_LIST);
		if (menuList == null){
			User user = getUser();
			if (user.isAdmin()){
				menuList = menuDao.findAllList(new Menu());
			}else{
				Menu m = new Menu();
				m.setUserId(user.getId());
				menuList = menuDao.findByUserId(m);
			}
			putTmpCache(CACHE_MENU_LIST, menuList);
		}
		return menuList;
	}
	
	/**
	 * 获取当前用户授权的区域
	 * @return
	 */
	public static List<Area> getAreaList(){
		@SuppressWarnings("unchecked")
		//全局缓存中
		List<Area> areaList = (List<Area>)getTmpCache(CACHE_AREA_LIST);
		if (areaList == null){
			areaList = areaDao.findAllList(new Area());
			putTmpCache(CACHE_AREA_LIST, areaList);
		}
		return areaList;
	}
	
	/**
	 * 获取当前用户有权限访问的部门
	 * @return
	 */
	public static List<Office> getOfficeList(){
		@SuppressWarnings("unchecked")
		//用户缓存中
		List<Office> officeList = (List<Office>)getTmpCache(CACHE_OFFICE_LIST);
		if (officeList == null){
			User user = getUser();
			if (user.isAdmin()){
				officeList = officeDao.findAllList(new Office());
			}else{
				Office office = new Office();
				office.getSqlMap().put("dsf", BaseService.dataScopeFilter(user, "a", ""));
				officeList = officeDao.findList(office);
			}
			putTmpCache(CACHE_OFFICE_LIST, officeList);
			logger.info("getOfficeList 缓存");
		}
		return officeList;
	}

	/**
	 * 获取当前用户有权限访问的部门
	 * @return
	 */
	public static List<Office> getOfficeAllList(){
		@SuppressWarnings("unchecked")
		//全局cache中取
		List<Office> officeList = (List<Office>)getTmpCache(CACHE_OFFICE_ALL_LIST);
		if (officeList == null){
			officeList = officeDao.findAllList(new Office());
			putTmpCache(CACHE_OFFICE_ALL_LIST, officeList);
		}
		return officeList;
	}
	
	/**
	 * 获取授权主要对象
	 */
	public static Subject getSubject(){
		return SecurityUtils.getSubject();
	}
	
	/**
	 * 获取当前登录者对象
	 */
	public static Principal getPrincipal(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Principal principal = (Principal)subject.getPrincipal();
			if (principal != null){
				return principal;
			}
		}catch (UnavailableSecurityManagerException e) {
			
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	public static Session getSession(){
		try{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession(false);
			if (session == null){
				session = subject.getSession();
			}
			if (session != null){
				return session;
			}
		}catch (InvalidSessionException e){
			
		}
		return null;
	}
	
	// ============== User Cache ==============
	
	public static Object getCache(String key) {
		return getCache(key, null);
	}
	
	public static Object getCache(String key, Object defaultValue) {
		String sid = getUser().getLoginName();
		Object obj = CacheUtils.get(USER_CACHE, key+"_"+sid);
		return obj==null?defaultValue:obj;
	}

	public static void putCache(String key, Object value) {
		String sid = getUser().getLoginName();
		CacheUtils.put(USER_CACHE,key+"_"+sid, value);
	}

	public static void removeCache(String key) {
		String sid = getUser().getLoginName();
		CacheUtils.remove(USER_CACHE,key+"_"+sid);
	}
	
	// ============== tmp Cache ==============
	
		public static Object getTmpCache(String key) {
			return getTmpCache(key, null);
		}
		
		public static Object getTmpCache(String key, Object defaultValue) {
			String sid = getUser().getLoginName();
			Object obj = CacheUtils.get(TMP_CACHE, key+"_"+sid);
			return obj==null?defaultValue:obj;
		}

		public static void putTmpCache(String key, Object value) {
			String sid = getUser().getLoginName();
			CacheUtils.put(TMP_CACHE,key+"_"+sid, value);
		}

}
