package swp12.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import swp12.gym.dao.TimeDao;
import swp12.gym.model.entity.Time;

import java.util.List;

@Service
public class TimeServiceImpl implements TimeService {

    @Autowired
    private TimeDao timeDao;

    public List<Time> findAll() {
        return timeDao.findAll();
    }
}
