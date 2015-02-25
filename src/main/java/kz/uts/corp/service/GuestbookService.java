package kz.uts.corp.service;

import java.util.List;
import kz.uts.corp.domain.Guestbook;

public interface GuestbookService {

	public void addGuestbook(Guestbook guestbook);

	public List<Guestbook> listGuestbook();
}
