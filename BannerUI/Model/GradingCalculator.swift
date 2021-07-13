////
////  GradingCalculator.swift
////  BannerUI
////
////  Created by Rayan Alhindi on 10/07/2021.
//
//
//import Foundation
//
//func toGrade(percentage : Int) -> String {
//
//    var totalHours : Int
//    var prevQb : Double
//    var totalQb : Double
//    var currentPassedHours : Int
//    var currentHours : Int
//    var cumulativeHours : Int
//
//
//    if percentage >= 95 {
//        return "A+"
//    } else if percentage >= 90 {
//        return "A"
//    } else if percentage >= 85 {
//        return "B+"
//    } else if percentage >= 80 {
//        return "A"
//    } else if percentage >= 75 {
//        return "C+"
//    } else if percentage >= 70 {
//        return "A"
//    } else if percentage >= 65 {
//        return "D+"
//    } else if percentage >= 60 {
//        return "D"
//    } else {
//        return "F"
//    }
//
//    var gradesPoints = [
//        "A+": 4,
//        "A": 3.75,
//        "B+": 3.5,
//        "B": 3,
//        "C+": 2.5,
//        "C": 2,
//        "D+": 1.5,
//        "D": 1,
//        "F": 0,
//        "WF": 0,
//        "P": 0,
//        "IP": 0,
//        "AU": 0,
//        "EX": 0,
//        "TR": 0,
//        "W": 0,
//    ]
//
//    func getPoints(hours: Double, grade: String) -> Double {
//        do {
//            return Double(gradesPoints[grade.uppercased()]! * hours)
//        } catch {
//            print("grade value is not valid")
//        }
//    }
//
//    func calculateGPA(courses : [Course], prevGpa : Double = 0.0, prevHours : Int = 0) -> Double {
//        totalHours = prevHours
//        prevQb = Double(totalHours) * prevGpa
//        totalQb = prevQb
//        for course in courses {
//            totalQb += getPoints(hours: course.CreditHour, grade: course[1])
//            totalHours += course.CreditHour
//        }
//        GPA = totalQb / totalHours
//
//        return (GPA)
//
//    }
//
//    func calculateAttemptHours(course: Course, prevHours : Int) {
//        currentHours = 0
//        cumulativeHours = prevHours
//        for course in course {
//            currentHours += course[0]
//        }
//    }
//}
