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

struct StudentTab: View {
    
    @ObservedObject var user: Student

    var body: some View {
        
        VStack {
            
            Text(user.fullName)
            Text(user.universityID)
            Text(user.universityEmail)
            Text(user.startLevel)
            Text(user.startMajor)
            Text(user.startingYear)
            
        }
    }
}
