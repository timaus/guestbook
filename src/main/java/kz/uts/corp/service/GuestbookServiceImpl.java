package kz.uts.corp.service;
 
import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import kz.uts.corp.dao.GuestbookDAO;
import kz.uts.corp.domain.Guestbook;
 
@Service
public class GuestbookServiceImpl implements GuestbookService {
 
    @Autowired
    private GuestbookDAO guestbookDAO;
 
    @Transactional
    public void addGuestbook(Guestbook guestbook) {
        guestbookDAO.addGuestbook(guestbook);
    }
 
    @Transactional
    public List<Guestbook> listGuestbook() {
 
        return guestbookDAO.listGuestbook();
    }
    
}
