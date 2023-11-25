package com.w.DevsOnDeck.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "devs")
public class Developer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "First name is required!")
    @Size(min = 3, message = "First name must have at least 3 characters")
    private String firstName;

    @NotEmpty(message = "Last name is required!")
    @Size(min = 3, message = "Last name must have at least 3 characters")
    private String lastName;

    @NotEmpty(message = "Email is required!")
    @Email(message = "Please enter a valid email!")
    private String email;

    @NotEmpty(message = "Address is required!")
    private String address;

    @NotEmpty(message = "City is required!")
    private String city;

    @NotEmpty(message = "State is required!")
    private String state;

    private String bio;

    @ElementCollection
    private List<String> languages;

    @ElementCollection
    private List<String> frameworks;

    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
    private String password;

    @Transient
    @NotEmpty(message = "Confirm Password is required!")
    @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
    private String confirm;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @OneToMany(mappedBy = "receiver", fetch = FetchType.LAZY)
    private List<Message> receivedMessages;

    public Developer() {

    }

    // getters and setters

    @PrePersist
    protected void onCreate() {
	this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
	this.updatedAt = new Date();
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getFirstName() {
	return firstName;
    }

    public void setFirstName(String firstName) {
	this.firstName = firstName;
    }

    public String getLastName() {
	return lastName;
    }

    public void setLastName(String lastName) {
	this.lastName = lastName;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getAddress() {
	return address;
    }

    public void setAddress(String adress) {
	this.address = adress;
    }

    public String getCity() {
	return city;
    }

    public void setCity(String city) {
	this.city = city;
    }

    public String getState() {
	return state;
    }

    public void setState(String state) {
	this.state = state;
    }

    public String getPassword() {
	return password;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    public String getConfirm() {
	return confirm;
    }

    public void setConfirm(String confirm) {
	this.confirm = confirm;
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

    public List<String> getLanguages() {
	return languages;
    }

    public void setLanguages(List<String> languages) {
	this.languages = languages;
    }

    public List<String> getFrameworks() {
	return frameworks;
    }

    public void setFrameworks(List<String> frameworks) {
	this.frameworks = frameworks;
    }

    public String getBio() {
	return bio;
    }

    public void setBio(String bio) {
	this.bio = bio;
    }

    public List<Message> getReceivedMessages() {
	return receivedMessages;
    }

    public void setReceivedMessages(List<Message> receivedMessages) {
	this.receivedMessages = receivedMessages;
    }

}