//
//  Student.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class studentInfoModel: ObservableObject {
    
    private var db = Firestore.firestore()
    private var authRef = (Auth.auth().currentUser?.uid)!
    
}

struct CollegeTab: View {
    
    @ObservedObject var dataRepo: dbRepo
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            if((dataRepo.student) != nil){
                let user = dataRepo.student! as Student
                Text("Full Name: " + user.fullName).bold()
                Text("University ID: " + user.universityID).bold()
                Text("University Email: " + user.universityEmail).bold()
                Text("Start Level: " + user.startLevel).bold()
                Text("Start Major: " + user.startMajor).bold()
                Text("Starting Year: " + user.startingYear).bold()
            } else if ((dataRepo.admin) != nil) {
                let user = dataRepo.admin! as Admin
                Text("Full Name: " + user.fullName).bold()
                Text("University ID: " + user.universityID).bold()
                Text("University Email: " + user.universityEmail).bold()
            }
            else {
                let user = dataRepo.faculty! as Faculty
                Text("Full Name: " + user.fullName).bold()
                Text("Email: " + user.email).bold()
                Text("Date Of Birth: " + user.dateOfBirth).bold()
                Text("Phone Number: " + user.phoneNumber).bold()
                Text("University Email: " + user.universityEmail).bold()
                
            }
        }.font(.system(size: 22))
    }
}
