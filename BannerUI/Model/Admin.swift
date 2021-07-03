
import Foundation

class Admin: ObservableObject, Identifiable, Codable {
    
    var fullName: String = ""
    var firstName : String = ""
    var universityID : String = ""
    var universityEmail : String = ""
    var phoneNumber : String = ""
    var email : String = ""
    
    
    init(firstName: String) {
        
        self.firstName = firstName
        
    }
    
    init(fullName: String, universityID: String, universityEmail: String, phoneNumber: String, email: String) {
        
        self.fullName = fullName
        self.universityID = universityID
        self.universityEmail = universityEmail
        self.phoneNumber = phoneNumber
        self.email = email
    }

}
