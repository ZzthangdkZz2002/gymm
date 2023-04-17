package swp12.gym.service;

import swp12.gym.dto.LogUserDto;
import swp12.gym.model.entity.LogUser;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface LogUserService {

    public List<LogUserDto> getAllLogOfUser();

    public List<LogUser> getAnLogOfAnUser(int u_id);

    void saveLog(int u_id, int type, int time, String content);
}
