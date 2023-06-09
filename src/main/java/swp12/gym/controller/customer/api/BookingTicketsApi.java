package swp12.gym.controller.customer.api;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import swp12.gym.common.DataUtil;
import swp12.gym.dao.UsersDao;
import swp12.gym.service.TicketUserService;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

@RestController
public class BookingTicketsApi {

    private final String URL_API = "/customer/booking";
//    @PostMapping(value = "/ticket_user",  produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
//    public String bookingTicketsUser(){
//        //book suscess
//        //Username
//        //
//        return "true";
//    }

    @Autowired
    private UsersDao userDao;

    @Autowired
    private TicketUserService ticketUserService;

    @GetMapping(value = URL_API + "/checkEndDateTicket")
    public ResponseEntity<String> check_end_date(@RequestParam(value = "ticket_type_id") int ticket_type_id, RedirectAttributes redirectAttributes, HttpServletRequest request, Authentication authentication){
        try{
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            long userID = userDao.findIdByUsername(userName);
//            boolean check = ticketUserService.checkTicketUser(userID);
            LocalDateTime date = LocalDateTime.now();
            if (ticket_type_id == 1){                                                    // find end date của vé vào cửa
                date = ticketUserService.findEndDateTicket(userID);
            }else if (ticket_type_id == 2){                                              // find end date của vé thuê PT
                date = ticketUserService.findEndDateTicketTrainerPersonal(userID);
            }else if (ticket_type_id == 3){                                              //find end date của vé class
                date = ticketUserService.findEndDateTicketClass(userID);
            }
            String result = null;
            if(date != null){
                System.out.println("date: "  + result);
                result = new DataUtil().convertLocalDateTimeToString(date);
                return ResponseEntity.status(HttpStatus.OK).body(result);
            }else{
                System.out.println("date: "  + result);
                return ResponseEntity.status(HttpStatus.OK).body(result);
            }
//            redirectAttributes.addFlashAttribute("check_end_date", check);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = URL_API + "/delete")
    public ResponseEntity<String> deleteTicketUser(HttpServletRequest request, Authentication authentication){
        try{

            System.out.println("ticket user id: " + request.getParameter("_ticketUserID"));
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            String userName = userDetails.getUsername();
            int userID = userDao.findIdByUsername(userName);

            String id = request.getParameter("_ticketUserID");
            ticketUserService.deleteUserPersonal(id);
            ticketUserService.deleteUserClass(id);
            ticketUserService.deleteTicketUser(id);
            return new ResponseEntity<String>(HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }
    }

//    //check hội viên có ticket Trainer personal hay chưa
//    @GetMapping(value = URL_API + "/checkEndDateTicketTrainerPersonal")
//    public ResponseEntity<String> check_end_date_ticket_trainer_personal(RedirectAttributes redirectAttributes, HttpServletRequest request, Authentication authentication){
//        try{
//            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//            String userName = userDetails.getUsername();
//            long userID = userDao.findIdByUsername(userName);
//            LocalDateTime date = ticketUserService.findEndDateTicketTrainerPersonal(userID);
//
//            String result = null;
//            if(date != null){
//                result = new DataUtil().convertLocalDateTimeToString(date);
//                return ResponseEntity.status(HttpStatus.OK).body(result);
//            }else{
//                return ResponseEntity.status(HttpStatus.OK).body(result);
//            }
//        }catch (Exception e){
//            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//        }
//
//    }
//
//
//    //check hội viên có ticket class hay chưa
//    @GetMapping(value = URL_API + "/checkEndDateTicketClass")
//    public ResponseEntity<String> check_end_date_ticket_class(RedirectAttributes redirectAttributes, HttpServletRequest request, Authentication authentication){
//        try{
//            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//            String userName = userDetails.getUsername();
//            System.out.println("userName: " + userName);
//            long userID = userDao.findIdByUsername(userName);
//            System.out.println("userID: " + userID);
//
//            LocalDateTime date = ticketUserService.findEndDateTicketClass(userID);
//
//            String result = null;
//            if(date != null){
//                result = new DataUtil().convertLocalDateTimeToString(date);
//                return ResponseEntity.status(HttpStatus.OK).body(result);
//            }else{
//                return ResponseEntity.status(HttpStatus.OK).body(result);
//            }
//        }catch (Exception e){
//            return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//        }
//
//    }

}
