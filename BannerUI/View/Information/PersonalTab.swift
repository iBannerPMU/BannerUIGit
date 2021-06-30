//
//  PersonalView.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

//class personalInfoModel: ObservableObject {
//
//    private var db = Firestore.firestore()
//    private var authRef = (Auth.auth().currentUser?.uid)!
//
//}

struct PersonalTab: View {
    
    @ObservedObject var dataRepo: dbRepo
    
    var body: some View {
        //List(viewModel.studentInfo) { studentInformation in
            VStack {
                
                if((dataRepo.student) != nil){
                    let user = dataRepo.student! as Student
                    Text(user.fullName)
                    Text(user.nationalID)
                    Text(user.dateOfBirth)
                    Text(user.email)
                    Text(user.phoneNumber)
                } else if ((dataRepo.admin) != nil){
                    let user = dataRepo.admin! as Admin
                    Text(user.fullName)
//                    Text(user.nationalID)
//                    Text(user.dateOfBirth)
//                    Text(user.email)
//                    Text(user.phoneNumber)
                }
                

                
            }
        }
        
    }
