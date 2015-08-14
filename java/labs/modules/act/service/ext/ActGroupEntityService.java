/**
 * 
 */
package labs.modules.act.service.ext;

import java.util.List;
import java.util.Map;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.GroupQuery;
import org.activiti.engine.impl.GroupQueryImpl;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.persistence.entity.GroupEntity;
import org.activiti.engine.impl.persistence.entity.GroupEntityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;

import labs.common.utils.SpringContextHolder;
import labs.modules.act.utils.ActUtils;
import labs.modules.sys.entity.Role;
import labs.modules.sys.entity.User;
import labs.modules.sys.service.SystemService;

/**
 * Activiti Group Entity Service
 * @author labs
 * @version 2013-12-05
 */
@Service
public class ActGroupEntityService extends GroupEntityManager {

	private SystemService systemService;

	public SystemService getSystemService() {
		if (systemService == null){
			systemService = SpringContextHolder.getBean(SystemService.class);
		}
		return systemService;
	}

	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	public Group createNewGroup(String groupId) {
		return new GroupEntity(groupId);
	}

	public void insertGroup(Group group) {
		/*Role role = new Role();
		//role.setId(group.getId());
		role.setName(group.getName());
		role.setRoleType(group.getType());
		systemService.saveRole(role);*/
		super.insertGroup(group);
	}

	public void updateGroup(GroupEntity updatedGroup) {
		/*Role role = systemService.getRole(updatedGroup.getId());
		if(null == role || null==role.getId()) {
			logger.error("ActGroupEntityService。updateGroup 错误，没有找到组,传入的组id="+updatedGroup.getId());
			return;
		}
		role.setName(updatedGroup.getName());
		role.setRoleType(updatedGroup.getType());
		systemService.saveRole(role);*/
		super.insertGroup(updatedGroup);
	}

	public void deleteGroup(String groupId) {
	/*	Role role = new Role();
		role.setId(groupId);
		systemService.deleteRole(role);*/
		super.deleteGroup(groupId);
	}

	public GroupQuery createNewGroupQuery() {
		//FIXME:关注
		return super.createNewGroupQuery();
	}

	public List<Group> findGroupByQueryCriteria(GroupQueryImpl query, Page page) {
		//FIXME:关注
		System.out.println("GroupManager:findGroupByQueryCriteria：：：：：：：：：：：");
		return super.findGroupByQueryCriteria(query, page);
	}

	public long findGroupCountByQueryCriteria(GroupQueryImpl query) {
		//FIXME:关注
		System.out.println("GroupManager:findGroupCountByQueryCriteria：：：：：：：：：：：");
		return super.findGroupCountByQueryCriteria(query);
//		return (Long) getDbSqlSession().selectOne("selectGroupCountByQueryCriteria", query);
	}

	public List<Group> findGroupsByUser(String userId) {
//		return getDbSqlSession().selectList("selectGroupsByUserId", userId);
		System.out.println("GroupManager:findGroupsByUser：：：：：：：：：：：");
		List<Group> list = Lists.newArrayList();
		User user = getSystemService().getUserByLoginName(userId);
		if (user != null && user.getRoleList() != null){
			for (Role role : user.getRoleList()){
				list.add(ActUtils.toActivitiGroup(role));
			}
		}
		return list;
	}

	public List<Group> findGroupsByNativeQuery(Map<String, Object> parameterMap, int firstResult, int maxResults) {
//		return getDbSqlSession().selectListWithRawParameter("selectGroupByNativeQuery", parameterMap, firstResult, maxResults);
//		throw new RuntimeException("not implement method.");
		//FIXME:关注
		System.out.println("GroupManager:findGroupsByNativeQuery：：：：：：：：：：：");
		return super.findGroupsByNativeQuery(parameterMap, firstResult, maxResults);
	}

	public long findGroupCountByNativeQuery(Map<String, Object> parameterMap) {
//		return (Long) getDbSqlSession().selectOne("selectGroupCountByNativeQuery", parameterMap);
		//FIXME:关注
		System.out.println("GroupManager:findGroupCountByNativeQuery：：：：：：：：：：：");
		return super.findGroupCountByNativeQuery(parameterMap);
	}

}