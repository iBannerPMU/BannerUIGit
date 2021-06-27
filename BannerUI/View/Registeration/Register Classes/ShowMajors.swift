//
//  ShowMajors.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 17/08/1442 AH.
//

import SwiftUI

struct ShowMajors: View {
    
    var dataRepo: dbRepo

    var body: some View {
        
        //Change the majors to pulled dynamicially from an array
        
        List {
            NavigationLink(destination: RegisterClasses(courses: dataRepo.registerArray, stringArray: dataRepo.emptyRegisterArray, dataRepo: dataRepo)) {
                Text("Computer Science")
            }
//            NavigationLink(destination: RegisterClasses(courses: dataRepo.registerArray, stringArray: dataRepo.emptyRegisterArray, dataRepo: dataRepo)) {
//                Text("Computer Engineering")
//            }
//            NavigationLink(destination: RegisterClasses(courses: dataRepo.registerArray, stringArray: dataRepo.emptyRegisterArray, dataRepo: dataRepo)) {
//                Text("Information Technology")
//            }
        }
    }
}
