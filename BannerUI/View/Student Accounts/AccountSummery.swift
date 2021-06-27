//
//  AccountSummery.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

struct AccountSummery: View {
    
    @ObservedObject var user: dbRepo
    
    var body: some View {
        
            VStack {
                
                Text(user.financial!.semesterPayment)
                Text(user.financial!.Locker)
                Text(user.financial!.copyCenter)
                
            }
        }
        
    }



