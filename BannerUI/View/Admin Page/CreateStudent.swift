

import SwiftUI

struct CreateStudent: View {
    
    @ObservedObject var repo: dbRepo
    
    @State var fullName : String = ""
    @State var email : String = ""
    @State var dateOfBirth : String = ""
    @State var nationalID : String = ""
    @State var phoneNumber : String = ""
    @State var universityID : String = ""
    @State var startLevel : String = ""
    @State var startMajor : String = ""
    @State var startingYear : String = ""
    @State var universityEmail : String = ""
    
    
    var body: some View {
        
        VStack {
            Form {
                TextField("Full name", text: $fullName)
                TextField("Date of birth", text: $dateOfBirth)
                TextField("ID", text: $nationalID)
                TextField("Phone Number", text: $phoneNumber)
                TextField("Email", text: $email)
                TextField("University Email", text: $universityEmail)
                TextField("University ID", text: $universityID)
                TextField("Starting Level", text: $startLevel)
                TextField("Starting Major", text: $startMajor)
                TextField("Starting Year", text: $startingYear)
            }
        }.padding()
        Button(action: {
            
            let user = Student(fullName: fullName, email: email, dateOfBirth: dateOfBirth, phoneNumber: phoneNumber, nationalID: nationalID, startLevel: startLevel, startMajor: startMajor, startingYear: startingYear, universityID: universityID, universityEmail: universityEmail)
            repo.addStudentData(user: user)
        }) {
            
            Text("Register")
            
        }
    }
}
