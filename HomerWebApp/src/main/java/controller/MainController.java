package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import documents.Documents;
import documents.DocumentsRepository;
import employee.Employee;
import employee.EmployeeRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import training.Training;
import training.TrainingRepository;
@Controller
public class MainController 
{	
	@Autowired
	private EmployeeRepository employeeRepository;
	
	
	@Autowired
	 DocumentsRepository documentsRepository;
	 
		
		  @Autowired 
		  TrainingRepository trainingRepository;
		 
		  @Autowired
		  private ObjectMapper objectMapper;
	
	
	

    @PostMapping("/updateEmployee")
    public String updateEmployee(@RequestParam(value = "employeeId") int employeeId,
                                 @RequestParam(value = "fname", required = false) String fname,
                                 @RequestParam(value = "lname", required = false) String lname,
                                 @RequestParam(value = "email", required = false) String email,
                                 @RequestParam(value = "salary", required = false) float salary,
                                 @RequestParam(value = "role", required = false) String role) {

        Employee employee = employeeRepository.findById(employeeId);

        if (fname != null) {
            employee.setFname(fname);
        }

        if (lname != null) {
            employee.setLname(lname);
        }

        if (email != null) {
            employee.setEmail(email);
        }

        if(salary != 0f) {
            employee.setSalary(salary);
        }

        if (role != null) {
            employee.setRole(role);
        }

        employeeRepository.save(employee);
        

        return "redirect:/hr_home";
    }
	
	
    @GetMapping("/info")
	@ResponseBody
	   public Employee getEmployeeInfo(@RequestParam("employeeId") int
	  employeeId)
	  {
	  Employee employee = employeeRepository.findById(employeeId);
	  

	  
	    if(employee == null) 
	    {
	    	System.out.println("Not Found !");
	    }
	  
	  return employee;
	  }
	 
    
    @GetMapping("/documents")
    public Set<Documents> getEmployeeDocuments(@RequestParam("employeeId")int employeeId) {
        // Retrieve the employee from the database using the provided ID
        Employee employee = employeeRepository.findById(employeeId);

        // Retrieve the employee's documents from the database
        Set<Documents> documents = documentsRepository.findByEmployee(employee);

        return documents;
    }
    
	@PostMapping("/add-employee")
	public ModelAndView addEmployee(@RequestParam("email") String email,
	                                @RequestParam("fname") String fname,
	                                @RequestParam("lname") String lname,
	                                @RequestParam("role") String role,
	                                @RequestParam("salary") float salary,
	                                @RequestParam("address") String address,
	                                @RequestParam("phone_number") String phone_number,

	                                @RequestParam("password") String password) 
	{
	 
	    // Check if the email address is already in use
	    if (employeeRepository.existsByEmail(email)) {
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.addObject("error", "A user with this email address already exists");
	        modelAndView.setViewName("add_user");
	        return modelAndView;
	    }
	    // Check if the salary is a positive number
	    if (salary <= 0) {
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.addObject("error", "Salary must be a positive number");
	        modelAndView.setViewName("add_user"); 
	        return modelAndView;
	    }
	    // Create the new employee
	    Employee newEmployee = new Employee();
	    newEmployee.setEmail(email);
	    newEmployee.setFname(fname);
	    newEmployee.setLname(lname);
	    newEmployee.setRole(role);
	    newEmployee.setSalary(salary);
	    newEmployee.setAddress(address);
	    newEmployee.setPhone_number(phone_number);
	   newEmployee.setPassword(password);
	    
	    Documents newDocument = new Documents();
	    newDocument.setDocName("Training Agreement");
	    newDocument.setDocType("Contract");
	    newDocument.setStatus("PENDING");
	    newDocument.setEmployee(newEmployee);
	    
	    newEmployee.getDocuments().add(newDocument);
	    
	    Documents newDocument2 = new Documents();
	    newDocument2.setDocName("Confidentiality Agreement");
	    newDocument2.setDocType("Contract");
	    newDocument2.setStatus("PENDING");
	    newDocument2.setEmployee(newEmployee);
	    
	    newEmployee.getDocuments().add(newDocument2);

	    
	    Documents newDocument3= new Documents();
	    newDocument3.setDocName("Non Disclosure Agreement");
	    newDocument3.setDocType("Contract");
	    newDocument3.setStatus("PENDING");
	    newDocument3.setEmployee(newEmployee);
	    
	    newEmployee.getDocuments().add(newDocument3);

	    
	    Documents newDocument4= new Documents();
	    newDocument4.setDocName("Direct Deposit Form");
	    newDocument4.setDocType("Financial");
	    newDocument4.setStatus("PENDING");

	    newDocument4.setEmployee(newEmployee);
	    
	    newEmployee.getDocuments().add(newDocument4);

	    
	    // Save the new employee
	    employeeRepository.save(newEmployee);
		
		 documentsRepository.save(newDocument); // saves the documents
		  documentsRepository.save(newDocument2);
		  documentsRepository.save(newDocument3);
		  documentsRepository.save(newDocument4);
		 

	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.setViewName("admin_home");
	    return modelAndView;
	}
	
	 // Used for logging out 
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public ModelAndView logout(HttpSession session) {
	    // invalidate the session
	    session.invalidate();
	    
	    // create a new ModelAndView object and set the view to the login page
	    ModelAndView modelAndView = new ModelAndView();
	    modelAndView.setViewName("index");
	    
	    // return the ModelAndView object to the client
	    return modelAndView;
	}
	
	  @GetMapping("/hero_home")
	    public String heroHome(Model model, HttpServletRequest request) 
	  {

		  System.out.println("Hello");
		  Employee user = (Employee) request.getAttribute("user");
		  
		  if (user == null) {
	            System.out.println("User is null!");
	 }
		  
		  
	        System.out.println("User: " + user);
	        Set<Documents> documents = documentsRepository.findByEmployee(user);
	      //  request.setAttribute("documents", (Set<Documents>) user.getDocuments());

	        

	        request.setAttribute("documents", documents);


	        model.addAttribute("documents", documents);
	        return "hero_home";
	    }
	
	  
	  @PostMapping("/add-training-to-employee")
	  public ModelAndView addTrainingToEmployee(@RequestParam("trainingId") int trainingId,
			  
			  @RequestParam("employeeId") int employeeId) {
	     
	        ModelAndView modelAndView = new ModelAndView();
	        
	        
	        Employee employee = employeeRepository.findById(employeeId);
	        
	       Training training = trainingRepository.findById(trainingId);
	       
	       if(employee.getTrainings().contains(training))
	       {
	    	   modelAndView.addObject("error","It looks like you signed up for this training already");
	    	   modelAndView.setViewName("hero_home");
	       }
	        
	        
	        employee.getTrainings().add(training);
	        employeeRepository.save(employee);
	        
	        
	        
	        
	        
	        
	        
	        modelAndView.setViewName("hero_home");
	        
	        
	        
	        
	        
	        
	        return modelAndView;

		  
		  
	  }
	  
	  @GetMapping("/hr_home")
	    public ModelAndView home(HttpSession session) {
	        ModelAndView modelAndView = new ModelAndView();
	        Employee employee = (Employee) session.getAttribute("employee");
	        if (employee == null || !employee.getRole().equals("hr")) {
	            modelAndView.setViewName("index");
	            return modelAndView;
	        }
	        List<Employee> heroes = employeeRepository.findByRole("Hero");
	        List<Documents> allHeroDocuments = new ArrayList<>();
	        for (Employee hero : heroes) {
	            allHeroDocuments.addAll(documentsRepository.findByEmployee(hero));
	        }
	        modelAndView.setViewName("hr_home");
	        modelAndView.addObject("heroDocuments", allHeroDocuments);
	        
	        modelAndView.addObject("employeeRepository",employeeRepository);
	        return modelAndView;
	    }
	  
	  

	
	
	@PostMapping("/employee/search")
	public String searchEmployee(@RequestParam(value = "employeeId", required = false) int employeeId,
	                             @RequestParam(value = "firstName", required = false) String firstName,
	                             @RequestParam(value = "lastName", required = false) String lastName,
	                             Model model) {
		

		
	    List<Employee> employees = new ArrayList<>();
	    if (employeeId !=0) {
	        Employee employee = employeeRepository.findById(employeeId);
	        if (employee != null) {
	            employees.add(employee);
	        }
	    } 
	    
	    else if (firstName != null && lastName != null) {
	         employees = employeeRepository.findByFnameAndLname (firstName, lastName);
	    }
	    model.addAttribute("employees", employees);
	    return "hr_home";
	}

	
	
    @PostMapping("/login")
    public ModelAndView login(@RequestParam("email") String email,
                              @RequestParam("password") String password,
                              @RequestParam("role") String role
                           
    		) {
    	
    	ModelAndView modelAndView = new ModelAndView();
        Employee employee = employeeRepository.findByEmail(email);
        
        
        System.out.println("Looking for employee with email " + email);
        
        Set<Documents> documents = documentsRepository.findByEmployee(employee);

        Set<Training> trainings = trainingRepository.findByEmployee(employee);
        
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            modelAndView.setViewName("index");
            modelAndView.addObject("error", "Email and password must not be empty");
            return modelAndView;
        }

        if (employee == null || !password.equals(employee.getPassword())) {
            modelAndView.setViewName("index");
            modelAndView.addObject("error", "Invalid email or password");
           System.out.println("Invalid email or password");

            return modelAndView;
        }
        
        
     // Check if the selected role matches the employee's actual role

		/*
		 * if (!role.equals(employee.getRole())) { modelAndView.setViewName("index");
		 * modelAndView.addObject("error", "Invalid role"); return modelAndView;
		 * 
		 * }
		 */
        
        System.out.println("Found employee with email " + email);

        System.out.println( employee.getEmployee_id());
        
      
		/*
		 * System.out.println(employee.getRole());
		 * System.out.println(employee.getPassword());
		 * System.out.println(employee.getSalary());
		 * System.out.println(employee.getID());
		 */
        
        
        
       
        // login successful
	
       
        
		  modelAndView.addObject("user", employee);
		  
		  modelAndView.addObject("documents", documents);

		  modelAndView.addObject("documentsRepository",documentsRepository);
		  
		  modelAndView.addObject("employeeRepository",employeeRepository);
		  
		  modelAndView.addObject("trainings",trainings);
        
		  
		  
		  
        switch (employee.getRole().toLowerCase()) {
        case "admin":
            System.out.println("Welcome admin");
            modelAndView.setViewName("admin_home");
            break;
        case "hr":
            modelAndView.setViewName("hr_home");
            break;
        case "hero":
            modelAndView.setViewName("hero_home");
            break;
        default:
            modelAndView.setViewName("index");
            break;
    }
        return modelAndView;
    }
    
    
    
    @PostMapping("/upload")
    public String handleMultipleFileUpload(@RequestParam("file") MultipartFile[] files, @RequestParam("documentIds") int[] documentIds)    
    {
    	
    	for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            int documentId = documentIds[i];
            try {
                // Perform S3 file upload
            	AmazonS3 s3client = AmazonS3ClientBuilder.standard()
                        .withCredentials(new 
					 StaticCredentialsProvider(new BasicAWSCredentials("*********************", "***********************************")))
                        .withRegion(Regions.US_EAST_1)
                        .build();
            	

                String fileName = documentId + "-" + file.getOriginalFilename();
                String fileUrl = s3client.getUrl("ths3bucketnana", fileName).toString();

                InputStream is = file.getInputStream();
                ObjectMetadata meta = new ObjectMetadata();
                meta.setContentLength(file.getSize());
                PutObjectRequest putObjectRequest = new PutObjectRequest("ths3bucketnana", fileName, is, meta);
                s3client.putObject(putObjectRequest);
                
                Documents document = documentsRepository.findByDocId(documentId);
                // Update the status and url of the document
                document.setStatus("SIGNED");
                document.setUrl(fileUrl);
                // Save the updated document to the database
                documentsRepository.save(document);
            } 
            
            catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "uploadSuccess";
    	
    	
    }
  
    @DeleteMapping("/delete-employee")
    public ResponseEntity<Void> deleteEmployee(@PathVariable int id) 
    {
        employeeRepository.deleteById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
    
    


}




    
    

	
	
