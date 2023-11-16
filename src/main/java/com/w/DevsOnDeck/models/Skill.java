package com.w.DevsOnDeck.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "skills")
public class Skill {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Max(value = 5, message = "You can add up to 5 languages")
	private String Language;

	@NotNull
	@Max(value = 5, message = "You can add up to 5 framworks/ libraries")
	private String framwork;

	@NotNull
	private String bio;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	@ManyToMany
	@JoinTable(name = "developer_skill", 
	           joinColumns = @JoinColumn(name = "skill_id"),
	           inverseJoinColumns = @JoinColumn(name = "developer_id")
	  )
	private List<Developer> devs;

	@ManyToMany
	@JoinTable(name = "position_skill",
	           joinColumns = @JoinColumn(name = "skill_id"),
	           inverseJoinColumns = @JoinColumn(name = "postion_id")
	)
	private List<Position> postions;

//Constructor
	private Skill() {
	}

	// getters and setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLanguage() {
		return Language;
	}

	public void setLanguage(String language) {
		Language = language;
	}

	public String getFramwork() {
		return framwork;
	}

	public void setFramwork(String framwork) {
		this.framwork = framwork;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Developer> getDevs() {
		return devs;
	}

	public void setDevs(List<Developer> devs) {
		this.devs = devs;
	}

	public List<Position> getPostions() {
		return postions;
	}

	public void setPostions(List<Position> postions) {
		this.postions = postions;
	}

}
