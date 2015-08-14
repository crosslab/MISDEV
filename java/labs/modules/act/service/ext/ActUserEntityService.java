/**
 * 
 */
package labs.modules.act.service.ext;

import java.util.List;
import java.util.Map;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.identity.UserQuery;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.UserQueryImpl;
import org.activiti.engine.impl.persistence.entity.IdentityInfoEntity;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.activiti.engine.impl.persistence.entity.UserEntityManager;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;

import labs.common.utils.SpringContextHolder;
import labs.modules.act.utils.ActUtils;
import labs.modules.sys.entity.Role;
import labs.modules.sys.service.SystemService;

/**
 * Activiti User Entity Service
 * @author labs
 * @version 2013-11-03
 */
@Service
public class ActUserEntityService extends UserEntityManager {

	private SystemService systemService;

	public SystemService getSystemService() {
		if (systemService == null){
			systemService = SpringContextHolder.getBean(SystemService.class);
		}
		return systemService;
	}

	public User createNewUser(String userId) {
		return new UserEntity(userId);
	}

	public void insertUser(User user) {
		super.insertUser(user);
	}

	public void updateUser(UserEntity updatedUser) {
		super.updateUser(updatedUser);
	}

	public UserEntity findUserById(String userId) {
		System.out.println("UserManager:findUserById：：：：：：：：：：：");
//		return (UserEntity) getDbSqlSession().selectOne("selectUserById", userId);
		return ActUtils.toActivitiUser(getSystemService().getUserByLoginName(userId));
	}

	public void deleteUser(String userId) {
		/*User user = findUserById(userId);
		if (user != null) {
			getSystemService().deleteUser(new labs.modules.sys.entity.User(user.getId()));
		}*/
		super.deleteUser(userId);
	}

	public List<User> findUserByQueryCriteria(UserQueryImpl query, Page page) {
//		return getDbSqlSession().selectList("selectUserByQueryCriteria", query, page);
		return super.findUserByQueryCriteria(query, page);
	}

	public long findUserCountByQueryCriteria(UserQueryImpl query) {
//		return (Long) getDbSqlSession().selectOne("selectUserCountByQueryCriteria", query);
		return super.findUserCountByQueryCriteria(query);
	}

	public List<Group> findGroupsByUser(String userId) {
		System.out.println("UserManager:findGroupsByUser：：：：：：：：：：：");
//		return getDbSqlSession().selectList("selectGroupsByUserId", userId);
		List<Group> list = Lists.newArrayList();
		for (Role role : getSystemService().findRole(new Role(new labs.modules.sys.entity.User(null, userId)))){
			list.add(ActUtils.toActivitiGroup(role));
		}
		return list;
	}

	public UserQuery createNewUserQuery() {
//		return new UserQueryImpl(Context.getProcessEngineConfiguration().getCommandExecutorTxRequired());
//		throw new RuntimeException("not implement method.");
		return super.createNewUserQuery();
	}

	public IdentityInfoEntity findUserInfoByUserIdAndKey(String userId, String key) {
//		Map<String, String> parameters = new HashMap<String, String>();
//		parameters.put("userId", userId);
//		parameters.put("key", key);
//		return (IdentityInfoEntity) getDbSqlSession().selectOne("selectIdentityInfoByUserIdAndKey", parameters);
		return super.findUserInfoByUserIdAndKey(userId, key);
	}

	public List<String> findUserInfoKeysByUserIdAndType(String userId, String type) {
//		Map<String, String> parameters = new HashMap<String, String>();
//		parameters.put("userId", userId);
//		parameters.put("type", type);
//		return (List) getDbSqlSession().getSqlSession().selectList("selectIdentityInfoKeysByUserIdAndType", parameters);
		return super.findUserInfoKeysByUserIdAndType(userId,type);
	}

	public Boolean checkPassword(String userId, String password) {
//		User user = findUserById(userId);
//		if ((user != null) && (password != null) && (password.equals(user.getPassword()))) {
//			return true;
//		}
		//FIXME:关注
		return true;
	}

	public List<User> findPotentialStarterUsers(String proceDefId) {
		System.out.println("UserManager:findPotentialStarterUsers：：：：：：：：：：：");
		return super.findPotentialStarterUsers(proceDefId);

	}

	public List<User> findUsersByNativeQuery(Map<String, Object> parameterMap, int firstResult, int maxResults) {
//		return getDbSqlSession().selectListWithRawParameter("selectUserByNativeQuery", parameterMap, firstResult, maxResults);
		return super.findUsersByNativeQuery(parameterMap, firstResult, maxResults);
	}

	public long findUserCountByNativeQuery(Map<String, Object> parameterMap) {
//		return (Long) getDbSqlSession().selectOne("selectUserCountByNativeQuery", parameterMap);
		return findUserCountByNativeQuery(parameterMap);
	}
	
}
