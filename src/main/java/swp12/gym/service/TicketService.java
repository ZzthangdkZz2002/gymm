package swp12.gym.service;

import org.springframework.stereotype.Service;

import swp12.gym.dto.TicketDto;
import swp12.gym.dto.TicketTrainerDto;
import swp12.gym.model.entity.Ticket;
import swp12.gym.model.entity.TicketUser;
import swp12.gym.model.entity.UserClass;

import java.util.List;
import java.util.Map;

@Service
public interface TicketService {

    List<Ticket> findAll();

    List<TicketDto> findAllOfAdmin();

    List<Ticket> findAllGymTicket();

    List<Ticket> findAllTicketDoor();

    List<TicketTrainerDto> findAllTicketTrainer();

    List<TicketTrainerDto> findAllTicketClassForCustomer();


    Boolean checkClassExist(int userID, int class_id);

    List<Ticket> findAllTicketClass();

    //Create an tickets
    public void createTicket(String name, String price, String day, String type_id, int status, int ids);

    //Create an have trainer
    void createTicketForTrainer(String ticketName, String ticketDay, int i);

    public void createTicketClass(int ids_class, String name, int id_trainer, int ids, int _id_time, int state,
                                  String start_date, String end_date, int _max_member, int _price);

    //Create an tickets personal
    void createPersonalTicket(int id_trainer, int price, int ids);

    int getNumberTicketTrainerInSystem();

    int getNumberTicketInSystem();

    void deleteTickets(String id);

    List<Ticket> findAddTicketOfAnCustomer(int ticket_type_id, int id_customer);

    List<Map<Integer, Integer>> getDataOfAnTicket(int id);

    Ticket findAnTicket(int id);

    int getTotalNumberOrderOfTicket(int id);

    int getTotalNumberOrderOfTicketToday(int id);

    void updateStatusTicket(String ticket_id);
}
