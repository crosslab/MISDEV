/**
 * 
 */
package labs.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import labs.common.config.Global;
import labs.common.persistence.Page;
import labs.common.web.BaseController;
import labs.common.utils.StringUtils;
import labs.modules.sys.entity.SysDictType;
import labs.modules.sys.service.SysDictTypeService;

/**
 * 数据字典类型Controller
 * @author 数据字典类型
 * @version 2015-05-12
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysDictType")
public class SysDictTypeController extends BaseController {

	@Autowired
	private SysDictTypeService sysDictTypeService;
	
	@ModelAttribute
	public SysDictType get(@RequestParam(required=false) String id) {
		SysDictType entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysDictTypeService.get(id);
		}
		if (entity == null){
			entity = new SysDictType();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:sysDictType:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysDictType sysDictType, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysDictType> page = sysDictTypeService.findPage(new Page<SysDictType>(request, response), sysDictType); 
		model.addAttribute("page", page);
		return "modules/sys/sysDictTypeList";
	}

	@RequiresPermissions("sys:sysDictType:view")
	@RequestMapping(value = "form")
	public String form(SysDictType sysDictType, Model model) {
		model.addAttribute("sysDictType", sysDictType);
		return "modules/sys/sysDictTypeForm";
	}

	@RequiresPermissions("sys:sysDictType:edit")
	@RequestMapping(value = "save")
	public String save(SysDictType sysDictType, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysDictType)){
			return form(sysDictType, model);
		}
		sysDictTypeService.save(sysDictType);
		addMessage(redirectAttributes, "保存数据字典类型成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysDictType/?repage";
	}
	
	@RequiresPermissions("sys:sysDictType:edit")
	@RequestMapping(value = "delete")
	public String delete(SysDictType sysDictType, RedirectAttributes redirectAttributes) {
		sysDictTypeService.delete(sysDictType);
		addMessage(redirectAttributes, "删除数据字典类型成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysDictType/?repage";
	}
	
}