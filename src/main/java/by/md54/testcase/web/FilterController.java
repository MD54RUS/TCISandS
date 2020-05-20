package by.md54.testcase.web;

import by.md54.testcase.entity.Area;
import by.md54.testcase.entity.Specialisation;
import by.md54.testcase.service.AreaService;
import by.md54.testcase.service.SpecialisationService;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import javax.portlet.RenderRequest;

@Controller
@RequestMapping("VIEW")
@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
public class FilterController {

    private static final long DEFAULT_AREA_ID = 4L;
    private static final long DEFAULT_SPECIALISATION_ID = 1L;
    private final AreaService areaService;
    private final SpecialisationService specialisationService;


    private static final Log logger = LogFactoryUtil.getLog("portlet=test-cate");


    @RenderMapping(params = "act=changeFilter")
    public String showFilteringForm(RenderRequest request, Model model) {
        long areaId = ParamUtil.getLong(request, "areaId", DEFAULT_AREA_ID);
        Area area = areaService.getArea(areaId);
        logger.info(area);

        long specId = ParamUtil.getLong(request, "specId", DEFAULT_SPECIALISATION_ID);
        Specialisation spec = specialisationService.getSpecById(specId);

        logger.info("specId = " + specId);

        Area root = null;
        Area parent = null;
        Area child = null;
        if (area.getParentId() == null) {
            root = area;
            parent = new Area(0, "", 0L);
            child = new Area(0, "", 0L);
        } else if (areaService.getArea(area.getParentId()).getParentId() == null) {
            root = areaService.getArea(area.getParentId());
            parent = area;
            child = new Area(0, "", 0L);
        } else {
            child = area;
            parent = areaService.getArea(area.getParentId());
            root = areaService.getArea(parent.getParentId());
        }

        logger.info("root, parent, child");
        logger.info(root);
        logger.info(parent);
        logger.info(child);


        //todo переделать на Id?
        //todo убрать null-значения
        model.addAttribute("root", root);
        model.addAttribute("parent", parent);
        model.addAttribute("child", child);
        model.addAttribute("areaList", areaService.getAreas());
        model.addAttribute("rootList", areaService.findByParent(null));
        model.addAttribute("parentList", areaService.findByParent(root.getId()));
        model.addAttribute("childList", parent == null ? null : areaService.findByParent(parent.getId()));
        model.addAttribute("specialisationList", specialisationService.getAll());
        model.addAttribute("area", area);
        model.addAttribute("specialisation", spec);

        return "portlet-test-case/changeFilter";
    }
//
//    @ModelAttribute("are_a")
//    public Area populateArea() {
//
//        return new Area(1, "Moscow", null);
//    }

//
//    @ActionMapping(params = "act=configRequest")
//    public void changeFilter(ActionRequest request, Model model, ActionResponse response, SessionStatus sessionStatus) {
//        sessionStatus.setComplete();
//
//        response.setRenderParameter("act", "changePagination");
//        long areaId = ParamUtil.getLong(request, "areaId", DEFAULT_AREA_ID);
//        long specId = ParamUtil.getLong(request, "specId", DEFAULT_SPECIALISATION_ID);
//        logger.info("Change filter, areaId = " + areaId);
//        vacancyService.loadVacancy(specId, areaId);
//        model.addAttribute("specId", specId);
//        model.addAttribute("areaId", areaId);
//    }

}
