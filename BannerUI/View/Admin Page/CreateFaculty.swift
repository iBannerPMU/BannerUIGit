//
//  CreateFaculty.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 10/07/2021.
//

import SwiftUI

struct CreateFaculty: View {
        
    @ObservedObject var repo: dbRepo
    
    @State var fullName : String = ""
    @State var email : String = ""
    @State var dateOfBirth : String = ""
    @State var ID : String = ""
    @State var phoneNumber : String = ""
    @State var universityEmail : String = ""
    @State var major : String = ""
    

    var body: some View {
        
        VStack {
            Form {
                TextField("Full name", text: $fullName)
                TextField("Date of birth", text: $dateOfBirth)
                TextField("ID", text: $ID)
                TextField("Phone Number", text: $phoneNumber)
                TextField("Email", text: $email)
                TextField("University Email", text: $universityEmail)
                TextField("University Email", text: $major)
                
            }
        }.padding()
        Button(action: {
            
            let user = Faculty(fullName: fullName, email: email, dateOfBirth: dateOfBirth, phoneNumber: phoneNumber, ID: ID, universityEmail: universityEmail, major: major)
            repo.addFacultyData(user: user)
        }) {
            
            Text("Register")
            
        }
    }
    
}
