package training;

import java.io.Serializable;
import java.util.Objects;

import employee.Employee;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;


@Embeddable
public class TrainingId implements Serializable 
{
	
	private int employee_id;
	  
	   @Column(name = "training_id")
	    private int trainingId;

	   
	   
	   
	   
	   
	   @Override
	public int hashCode() {
		return Objects.hash(employee_id, trainingId);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TrainingId other = (TrainingId) obj;
		return employee_id == other.employee_id && trainingId == other.trainingId;
	}


	public int getEmployee_id() {
		return employee_id;
	}


	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}


	public void setTrainingId(int trainingId) {
		this.trainingId = trainingId;
	}


	@Override
	    public String toString() {
	        return Integer.toString(trainingId);
	    }
	   
	
		public Integer getTrainingId() {
			return trainingId;
		}

		public void setTrainingId(Integer trainingId) {
			this.trainingId = trainingId;
		}
}
