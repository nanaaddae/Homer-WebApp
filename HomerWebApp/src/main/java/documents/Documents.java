package documents;

import employee.Employee;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
@Entity
@Table(name = "documents" )
public class Documents 
{
 
	public Documents() {
		super();
	}


    @Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int docId;

	@Column(name = "document_name")
	private String docName;

	@Column(name = "document_type")
	private String docType;

	
	@Column(name = "status")
	private String status;
	
	@Column(name = "url")
	private String url;
	

	@ManyToOne
	@JoinColumn(name = "employee_id")
	private Employee employee;

	
    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getDocId() {
        return docId;
    }

    public void setDocId(int docId) {
        this.docId = docId;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getDocType() {
        return docType;
    }

    public void setDocType(String docType) {
        this.docType = docType;
    }
    
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
