////
////  AddCourseToFaculty.swift
////  BannerUI
////
////  Created by Rayan Alhindi on 10/07/2021.
////
//
//import SwiftUI
//
////show list of faculty based on major
////Add courses to them
//
//struct facultyName: Identifiable, Hashable {
//    var id: String
//    var name: String
//}
//
//struct AddCourseToFaculty: View {
//
//    @ObservedObject var repo : dbRepo
//    @State var selectedFaculty: facultyName?
//
//    var body: some View {
//        Picker(selection: $selectedFaculty, label: Text("Pick Faculty member")) {
//            ForEach(self.repo.faculty!.fullName) { i in
//                Text(self.repo.faculty!.fullName)
//            }
//        }
//    }
//}
