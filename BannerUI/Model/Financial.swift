//
//  Financial.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import Foundation

class Financial : ObservableObject, Identifiable, Codable {
    
    var semesterPayment : String = ""
    var Locker : String = ""
    var copyCenter : String = ""
    
    init(semesterPayment : String) {
        self.semesterPayment = semesterPayment
    }
    
    init(Locker : String) {
        self.Locker = Locker
    }
    
    init(copyCenter : String) {
        self.copyCenter = copyCenter
    }
    init(semesterPayment : String, Locker : String, copyCenter : String) {
        self.semesterPayment = semesterPayment
        self.Locker = Locker
        self.copyCenter = copyCenter
    }
}
