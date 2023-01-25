package documents;

import java.util.Set;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.event.TransactionalEventListener;

import employee.Employee;
import jakarta.transaction.Transactional;

@Repository
public interface DocumentsRepository extends JpaRepository<Documents,Integer> 
{
    Set<Documents> findByEmployee(Employee employee);
    
    Documents findByDocId(int docId);


 
}
