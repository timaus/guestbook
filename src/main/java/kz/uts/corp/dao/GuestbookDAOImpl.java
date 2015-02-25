package kz.uts.corp.dao;

import java.util.List;

import kz.uts.corp.domain.Guestbook;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestbookDAOImpl implements GuestbookDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addGuestbook(Guestbook guestbook) {
		sessionFactory.getCurrentSession().save(guestbook);
	}

	@SuppressWarnings("unchecked")
	public List<Guestbook> listGuestbook() {
		return sessionFactory.getCurrentSession().createQuery("from Guestbook ORDER BY created desc")
			.list();
	}
}
