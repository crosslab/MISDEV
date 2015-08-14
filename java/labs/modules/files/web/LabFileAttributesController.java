/**
 * 
 */
package labs.modules.files.web;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import labs.common.config.Global;
import labs.common.persistence.Page;
import labs.common.utils.DateUtils;
import labs.common.utils.StringUtils;
import labs.common.web.BaseController;
import labs.modules.files.entity.LabFileAttributes;
import labs.modules.files.entity.LabFileBorrow;
import labs.modules.files.service.LabFileAttributesService;
import labs.modules.files.service.LabFileBorrowService;
import labs.modules.sys.utils.DictUtils;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRMapCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import freemarker.template.utility.DateUtil;

/**
 * 文件资料管理Controller
 * @author YL
 * @version 2015-05-30
 */
@Controller
@RequestMapping(value = "${adminPath}/files/labFileAttributes")
public class LabFileAttributesController extends BaseController {

	@Autowired
	private LabFileAttributesService labFileAttributesService;
	
	@Autowired
	LabFileBorrowService labFileBorrowService;
	
	@ModelAttribute
	public LabFileAttributes get(@RequestParam(required=false) String id) {
		LabFileAttributes entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = labFileAttributesService.get(id);
		}
		if (entity == null){
			entity = new LabFileAttributes();
		}
		return entity;
	}
	
	@RequiresPermissions("files:labFileAttributes:view")
	@RequestMapping(value = {"list", ""})
	public String list(LabFileAttributes labFileAttributes, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LabFileAttributes> page = labFileAttributesService.findPage(new Page<LabFileAttributes>(request, response), labFileAttributes); 
		model.addAttribute("page", page);
		model.addAttribute("abc", new LabFileBorrow());
		return "modules/files/labFileAttributesList";
	}

	@RequiresPermissions("files:labFileAttributes:view")
	@RequestMapping(value = "form")
	public String form(LabFileAttributes labFileAttributes, Model model) {
		model.addAttribute("labFileAttributes", labFileAttributes);
		return "modules/files/labFileAttributesForm";
	}

	@RequiresPermissions("files:labFileAttributes:view")
	@RequestMapping(value = "view")
	public String view(LabFileAttributes labFileAttributes, Model model) {
		//基本信息
		model.addAttribute("labFileAttributes", labFileAttributes);
		//借用记录，根据文件id关联“关联表”查询借用记录
		List<LabFileBorrow> listBorrow = labFileBorrowService.findByFileId(labFileAttributes.getFileid());
		model.addAttribute("labFileBorrowList", listBorrow);
		return "modules/files/labFileAttributesView";
	}
	
	@RequiresPermissions("files:labFileAttributes:edit")
	@RequestMapping(value = "save")
	public String save(LabFileAttributes labFileAttributes, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, labFileAttributes)){
			return form(labFileAttributes, model);
		}
		labFileAttributesService.save(labFileAttributes);
		addMessage(redirectAttributes, "保存文件资料成功");
		return "redirect:"+Global.getAdminPath()+"/files/labFileAttributes/?repage";
	}
	
	@RequiresPermissions("files:labFileAttributes:edit")
	@RequestMapping(value = "delete")
	public String delete(LabFileAttributes labFileAttributes, RedirectAttributes redirectAttributes) {
		labFileAttributesService.delete(labFileAttributes);
		addMessage(redirectAttributes, "删除文件资料成功");
		return "redirect:"+Global.getAdminPath()+"/files/labFileAttributes/?repage";
	}

    @RequiresPermissions("files:labFileAttributes:view")
    @RequestMapping(value = "viewPrint")
    public void viewPrint(LabFileAttributes labFileAttributes, HttpServletRequest req, HttpServletResponse resp) {
        //借用记录，根据文件id关联“关联表”查询借用记录
        List<LabFileBorrow> listBorrow = labFileBorrowService.findByFileId(labFileAttributes.getFileid());
        try {
            String jrpath = req.getSession().getServletContext().getRealPath("") + "/WEB-INF/report/files/";

            System.out.println("jrpath = " + jrpath);
            JasperReport jasperReport = (JasperReport) JRLoader.loadObject(new File(jrpath
                    + "labFileAttributesView.jasper"));
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("fileid", labFileAttributes.getFileid());
            map.put("filename", labFileAttributes.getFilename());
            map.put("filecontrolid", labFileAttributes.getFilecontrolid());
            map.put("filestandard", labFileAttributes.getFilestandard());
            map.put("filetype",
                    DictUtils.getDictLabel(String.valueOf(labFileAttributes.getFiletype()), "file_standard_type", ""));
            map.put("filearchivedate", DateUtils.formatDate(labFileAttributes.getFilearchivedate()));
            map.put("usedate", DateUtils.formatDate(labFileAttributes.getUsedate()));
            map.put("placeaddress", labFileAttributes.getPlaceaddress());
            map.put("filestatus",
                    DictUtils.getDictLabel(String.valueOf(labFileAttributes.getFilestatus()), "file_borrow_status", ""));
            map.put("remarks", labFileAttributes.getRemarks());

            Map<String, Object> subMap = new HashMap<String, Object>();
            map.put("SUBREPORT_DIR", jrpath);
            List<Map<String, ?>> lfbList = new ArrayList<Map<String, ?>>();

            for (LabFileBorrow labFileBorrow : listBorrow) {
                Map<String, Object> m = new HashMap<String, Object>();
                m.put("fileborrowid", labFileBorrow.getFileborrowid());
                m.put("reqname", labFileBorrow.getReqname());
                m.put("reqdepartment", labFileBorrow.getReqdepartment());
                m.put("fileborrowstatus", DictUtils.getDictLabel(String.valueOf(labFileBorrow.getFileborrowstatus()),
                        "file_borrow_status", ""));
                m.put("reqstartdate", DateUtils.formatDate(labFileBorrow.getReqstartdate()));
                m.put("reqenddate", DateUtils.formatDate(labFileBorrow.getReqenddate()));
                lfbList.add(m);
            }

            JRDataSource subds = new JRMapCollectionDataSource(lfbList);
            map.put("subds", subds);
            map.put("subMap", subMap);

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, new JREmptyDataSource());
            //JasperExportManager.exportReportToPdfFile(jasperPrint, "D:/ireport/lab/labFileAttributesView.pdf");

            byte[] pdfByte = JasperExportManager.exportReportToPdf(jasperPrint);

            ServletOutputStream out = resp.getOutputStream();
            resp.setContentType("application/pdf");
            resp.setContentLength(pdfByte.length);
            out.write(pdfByte);
            out.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}