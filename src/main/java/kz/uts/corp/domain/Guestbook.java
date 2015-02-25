package kz.uts.corp.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.support.AbstractMultipartHttpServletRequest;

@Entity
@Table(name = "BOOKS")
public class Guestbook {

	@Id
	@Column(name = "ID")
	@GeneratedValue
	private Integer id;

	@Column(name = "username")
	private String username;

	@Column(name = "email")
	private String email;

	@Column(name = "homepage")
	private String homepage;

	@Column(name = "text")
	private String text;
        
        @Column(name = "ip")
	private String ip;
        
        @Column(name = "browser")
	private String browser;
        
        @Column(name = "created")
	private Date created;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
        
        public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
        
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
        
        public String getIp() {
		return ip;
	}
        
        public void setIp(String ip) {
		this.ip = ip;
	}
        
         public String getBrowser() {
		return browser;
	}
        
        public void setBrowser(String browser) {
		this.browser = browser;
	}
        
        public void setCreated(Date created) {
		this.created = created;
	}
         public Date getCreated() {
		return created;
	}
	
	
}
