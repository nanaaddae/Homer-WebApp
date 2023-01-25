package training;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import employee.Employee;

public interface TrainingRepository extends JpaRepository<Training, Integer>
{

	Set<Training> findByEmployee(Employee employee);
	
	Training  findById (int Id);

}