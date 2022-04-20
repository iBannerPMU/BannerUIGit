//
//  Registeration.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 28/07/1442 AH.
//

import SwiftUI

struct Registeration: View {
    
    var dataRepo: dbRepo
    @State var sections: [String: section?] = [:]
    @State var tempArray: [String] = []
    @State var selection = 0
    @State var Globalcourse: [String: Course] = [:]
    
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
                    BrowseClasses(courses: dataRepo.courseArray, stringArray: dataRepo.emptyCourseArray, dataRepo: dataRepo, sections: $sections, tempArray: $tempArray)
                } else if selection == 1 {
                    RegisterClasses(courses: dataRepo.courseArray, stringArray: dataRepo.emptyCourseArray, dataRepo: dataRepo, Globalcourse: $Globalcourse, sections: $sections, tempArray: $tempArray)
                } else {
                    RegisterCart(sections: $sections, tempArray: $tempArray, dataRepo: dataRepo, Globalcourse: $Globalcourse)
                }
                Spacer(minLength: 0)
            }.navigationTitle("Registeration")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }//.navigationBarHidden(true)
    }
}
