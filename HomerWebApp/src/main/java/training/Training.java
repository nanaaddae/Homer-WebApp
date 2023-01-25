package training;

import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;

import java.util.Set;

import employee.Employee;
import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;


@Entity
@Table(name = "training")
public class Training 
{
       @EmbeddedId
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	    //@Column(name = "training_id")
       private TrainingId id;

       

		@Column(name = "title")
	    private String title;

	    @Column(name = "description")
	    private String description;

	    @Column(name = "instructor")
	    private String instructor;

	    @Column(name = "status")
	    private String status;
	    
	    @ManyToOne
		@JoinColumn(name = "employee_id",insertable = false,updatable = false)
		private Employee employee;

	

		public TrainingId getId() {
			return id;
		}

		public void setId(TrainingId id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getInstructor() {
			return instructor;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public Employee getEmployee() {
			return employee;
		}

		public void setEmployee(Employee employee) {
			this.employee = employee;
		}

		public void setInstructor(String instructor) {
			this.instructor = instructor;
		}


		@Override
	    public String toString() {
	        return id.toString();
	    }
		
}
