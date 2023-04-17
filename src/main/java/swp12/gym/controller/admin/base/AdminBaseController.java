package swp12.gym.controller.admin.base;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import swp12.gym.dto.ClassDto;
import swp12.gym.dto.TicketDto;
import swp12.gym.dto.UserDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.Time;
import swp12.gym.model.entity.User;
import swp12.gym.service.ClassService;
import swp12.gym.service.TicketService;
import swp12.gym.service.TimeService;
import swp12.gym.service.UserService;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/dashboard")
public class AdminBaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private TimeService timeService;
    @Autowired
    private ClassService classService;

    @RequestMapping(value = "/change-pass",method = RequestMethod.GET)
    public String goChangePassForAdmin() {
        return "layouts/change_pass";
    }

    @RequestMapping(value = "/activity-log",method = RequestMethod.GET)
    public String goActivityAdmin() {
        return "layouts/change_pass";
    }

    @RequestMapping(value = "/your-profile",method = RequestMethod.GET)
    public String profileAdmin(Model model, Authentication authentication) {
        UserDto user = userService.getUserByEmail(((UserDetails) authentication.getPrincipal()).getUsername());
        model.addAttribute("user",user);
        return "base/profile_user";
    }

    //Xem tất cả các vé vào cửa - done
    @RequestMapping(value = "/ticket",method = RequestMethod.GET)
    public String goTicketDoor(Model model){
        int count = ticketService.getNumberTicketInSystem();
        List<User> trainer = userService.findAllTrainer();
        List<TicketDto> tickets = ticketService.findAllOfAdmin();
        List<Time> times = timeService.findAll();

        model.addAttribute("trainer", trainer);
        model.addAttribute("count", count);
        model.addAttribute("times", times);
        model.addAttribute("tickets", tickets);

        return "admin/ticket/list_ticket";
    }

    @RequestMapping(value = "/ticket-detail/{id}", method = RequestMethod.GET)
    public ModelAndView goDetailTicket(@PathVariable int id)
    {
        ModelAndView view = new ModelAndView("admin/ticket/detail_ticket");


        int number_order = 0;
        int number_order_today = 0;
        List<Map<Integer, Integer>> data = null;
        Ticket ticket = ticketService.findAnTicket(id);
        if(ticket.getTt_id() == 1){
            data = ticketService.getDataOfAnTicket(id);
            number_order = ticketService.getTotalNumberOrderOfTicket(id);
            number_order_today = ticketService.getTotalNumberOrderOfTicketToday(id);

        }
        if(ticket.getTt_id() == 2){
            number_order = ticketService.getTotalNumberOrderOfPersonalTrainerDetail(id);
            number_order_today = ticketService.getTotalNumberOrderOfPersonalTrainerDetailToday(id);
        }
        if(ticket.getTt_id() == 3){
            number_order = ticketService.getTotalNumberOrderOfTicketClass(id);
            number_order_today = ticketService.getTotalNumberOrderOfTicketClasslToday(id);
        }

        String jsonData = new Gson().toJson(data); // chuyển đổi sang chuỗi JSON

        view.addObject("chartData",jsonData);
        view.addObject("number_order_today",number_order_today);
        view.addObject("number_order",number_order);
        view.addObject("ticket",ticket);

        return view;
    }

    @RequestMapping(value = "/products/save",method = RequestMethod.GET)
    public String addProduct(Model model){
        return "admin/product/list_product";
    }


    // ----------------------------------------------------------------
    @RequestMapping(value = "/class",method = RequestMethod.GET)
    public String goCLassPage(Model model) {
        List<ClassDto> class_list = classService.findAll();

        model.addAttribute("class_list", class_list);
        return "admin/class/class_list";
    }
}
