package by.md54.testcase.web;

import by.md54.testcase.service.VacancyService;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.ReleaseInfo;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.theme.ThemeDisplay;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import javax.portlet.RenderRequest;

/**
 * ViewRecordController renders the portlet; shows the records from the database in html table.
 *
 * @author phomal
 */
@Controller
@RequestMapping("VIEW")
@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
public class IndexController {

    private final VacancyService vacancyService;

    @RenderMapping
    public String showContainer(RenderRequest request, Model model) {

        model.addAttribute("releaseInfo", ReleaseInfo.getReleaseInfo());

        ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
        User loggedUser = themeDisplay.getUser();
        try {
            loggedUser.getGroup();
        } catch (PortalException | SystemException e) {
            e.printStackTrace();
        }


        int pageCount, perPage;
        perPage = ParamUtil.getInteger(request, "perPage", 20);
        pageCount = ParamUtil.getInteger(request, "page", 0);

        Pageable page = new PageRequest(pageCount, perPage);

        model.addAttribute("vacancies", vacancyService.getVacancyPerPage(page));

        model.addAttribute("userName", loggedUser.getFullName());

        return "portlet-test-case/view";
    }


    @ActionMapping(params = "act=addRecord")
    public void loadVacancy() {
        vacancyService.loadVacancy();
    }

    @RenderMapping(params = {"action=reload"})
    public String reload(RenderRequest request, Model model) {

        int pageCount, perPage;
        perPage = ParamUtil.getInteger(request, "perPage", 20);
        pageCount = ParamUtil.getInteger(request, "page", 0);

        Pageable page = new PageRequest(pageCount, perPage);

        model.addAttribute("vacancies", vacancyService.getVacancyPerPage(page));

        return "portlet-test-case/view";
    }

    @RenderMapping(params = "act=editRecordForm")
    public String showEditRecordForm() {
        return "portlet-demo/editForm";
    }

}