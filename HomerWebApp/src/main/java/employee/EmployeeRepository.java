package employee;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

    Employee findByEmail (String email);

	boolean existsByEmail(String email);
	
    List<Employee> findByRole( String role);

    List<Employee>  findByFnameAndLname (String fname,String lname);
    
    Employee findById (int Id);


}


