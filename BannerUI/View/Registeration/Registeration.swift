//
//  Registeration.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 28/07/1442 AH.
//

import SwiftUI

struct Registeration: View {
    
    var dataRepo: dbRepo
    @State var selection = 0
    private let items: [String] = ["Browse Classes", "Register Classes", "Registeration Cart"]
    
    var body: some View {
        ZStack {
            VStack {
                Picker(selection: $selection, label: Text("")) {
                    ForEach(0..<items.count, id: \.self) { index in
                        Text(self.items[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                if selection == 0 {
                    //BrowseClasses(courses: dataRepo.course!)
                    BrowseClasses(courses: dataRepo.courseArray, stringArray: dataRepo.emptyCourseArray, dataRepo: dataRepo)
                } else if selection == 1 {
                    ShowMajors(dataRepo: dataRepo)
                } else {
                    RegisterCart(courses: dataRepo.cartArray, tempArray: dataRepo.emptyCartArray, dataRepo: dataRepo)
                }
                Spacer(minLength: 0)
            }
            .padding()
        }//.navigationBarHidden(true)
    }
}



        
        
//        NavigationView{
//            VStack (alignment: .center, spacing: 40) {
//                NavigationLink(destination: RegisterClasses()){
//                    Text("Register Classes")
//                }
//                NavigationLink(destination: BrowseClasses(courses: dataRepo.course!)){
//                    Text("Browse Classes")
//                }
//            }.padding()
//
//        }.navigationBarTitle(Text("Registration"), displayMode: .inline)

        
        // optional {
        // either which field you want to search in? (math, physics, etc)
        // or which major courses you want?
        // search by preplanned schedule
        // }

/*
 @ObservedObject var repo: dbRepo
 @State private var Index = 0
 var years = ["2018/2019", "2019/2020", "2020/2021"]
 var semesters = ["Fall 2018", "Spring 2018/2019", "Fall 2019", "Spring 2019/2020", "Fall 2020", "Spring 2020/2021"]
 var majors = ["Computer Science", "Computer Engineering", "IT"]
 
 Section {
     Text("Choose Year")
     Picker(selection: $Index, label: Text("Year"), content: {
         ForEach(0 ..< years.count) {
             // which year?
             Text(self.years[$0]).tag($0)
         }
     })
 }
 Section {
     Text("Choose Semester")
     Picker(selection: $Index, label: Text("Semester"), content: {
         ForEach(0 ..< semesters.count) {
             // which semester?
             Text(self.semesters[$0]).tag($0)
         }
     })
 }
 Section {
     Text("What is your major?")
     Picker(selection: $Index, label: Text("Major"), content: {
         ForEach(0 ..< majors.count) {
             // which major?
             Text(self.majors[$0]).tag($0)
         }
     })
 }
 */
