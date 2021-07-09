
//  StudentRecords.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 28/07/1442 AH.
//

import SwiftUI

struct StudentRecords: View {
    var dataRepo: dbRepo
    @State var selection = 0
    private let items: [String] = ["ViewHolds", "AcademicTranscript", "Class Schedule", "Finished Courses"]

    var body: some View {
        ZStack {
            VStack {
                Picker(selection: $selection, label: Text("")) {
                    ForEach(0..<items.count, id: \.self) { index in
                        Text(self.items[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                if selection == 0 {
                    //ViewHolds(dataRepo: dataRepo)
                } else if selection == 1 {
                    //AcademicTranscript(dataRepo: dataRepo)
                } else if selection == 2 {
                    //ClassSchedule(user: dataRepo.student!)
                    ClassSchedule(courses: dataRepo.regcourse, stringArray: dataRepo.emptyRegisteredArray, dataRepo: dataRepo)
                } else {
                    //FinishedCourses(user: dataRepo.student!)
                    FinishedCourses(courses: dataRepo.finishedcourse, stringArray: dataRepo.emptyFinishedArray, dataRepo: dataRepo)
                }
                Spacer(minLength: 0)
            }
            .padding()
        }//.navigationBarHidden(true)
    }
}
