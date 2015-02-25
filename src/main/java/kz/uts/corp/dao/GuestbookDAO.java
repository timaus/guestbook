package kz.uts.corp.dao;

import java.util.List;
import kz.uts.corp.domain.Guestbook;

public interface GuestbookDAO {

	public void addGuestbook(Guestbook guestbook);

	public List<Guestbook> listGuestbook();	
}