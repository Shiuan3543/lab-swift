//
//  Data.swift
//  Nav
//
//  Created by 朱克剛 on 2020/9/12.
//

import SwiftUI
import CoreLocation

struct City: Identifiable {
    let id = UUID()
    var name: String
    var imageName: String {
        return name
    }
    var lat: Double
    var lon: Double
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}

let cityData = [
    City(name: "台北", lat: 25.037717, lon: 121.564411),
    City(name: "新北", lat: 25.012513, lon: 121.465446),
    City(name: "桃園", lat: 24.993361, lon: 121.301006),
    City(name: "台中", lat: 24.162148, lon: 120.646859),
    City(name: "台南", lat: 22.992538, lon: 120.185129),
    City(name: "高雄", lat: 22.621217, lon: 120.311808),
]
