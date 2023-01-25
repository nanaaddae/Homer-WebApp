package employee;

import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import documents.Documents;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.JoinColumn;

import training.Training;

@Entity
@Table(name = "employee")
public class Employee 
{
	

	public Employee() {
		super();
		
        this.documents = new HashSet<>();

	}

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int employee_id;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "fname")
	private String fname;
	
	

	@Column(name = "lname")
	private String lname;
	
	@Column(name = "role")
	private String role;
	
	@Column(name = "salary")
	private float salary;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "phone_number")
	private String phone_number;
	
	@Column(name = "address")
	private String address;
	

	@OneToMany(mappedBy = "employee",  fetch = FetchType.EAGER)
	@JsonIgnore 
	private Set<Documents> documents;
	

	
	@OneToMany(mappedBy = "employee")
	@JsonIgnore
	private Set<Training> trainings;
 

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public Set<Documents> getDocuments() {
	    return this.documents;
	}
	
	public Set<Training> getTrainings() {
		return trainings;
	}

	public void setTrainings(Set<Training> trainings) {
		this.trainings = trainings;
	}

	public void setDocuments(Set<Documents> documents) {
		this.documents = documents;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
 
}
