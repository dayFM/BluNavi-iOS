//
//  SessionManager.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import Foundation
import Alamofire
import SwiftyJSON


class SessionManager: ObservableObject {
    @Published var selectedDestinationTag: Tag?
    @Published var sessionStarted: Bool
    @Published var ssidToDistances: [String: Float]
    @Published var selectedTagDirection: String
    @Published var destinationFound: Bool
    
    init() {
        self.selectedDestinationTag = nil
        self.sessionStarted = false
        self.destinationFound = false
        self.selectedTagDirection = "Unknown"
        
        self.ssidToDistances = [String: Float]()
        TagForDemo.TAGS_ID_FOR_DEMO.forEach { tagID in
            self.ssidToDistances[tagID] = 10.0
        }
    }
    
    func startLocationing(selectedTag: Tag) {
        self.selectedDestinationTag = selectedTag
        self.sessionStarted = true
    }
    
    func stopLocationing() {
        self.selectedDestinationTag = nil
        self.sessionStarted = false
        self.destinationFound = false
    }
    
    func checkDestinationFound() {
        guard let tagSsid = self.selectedDestinationTag?.ssid else { return }
        
        if self.sessionStarted && self.ssidToDistances[tagSsid]! <= 0.1 {
            self.destinationFound = true
        }
    }
    
    func updateTagDirection() {
        guard let tagSsid = self.selectedDestinationTag?.ssid else { return }
        
        self.requestTagDirection(tagSsid: tagSsid) { direction in
            self.selectedTagDirection = direction
        }
    }
    
    func requestTagDirection(tagSsid: String, completion: @escaping(String) -> Void) {
        let baseURL = "http://10.155.234.210:4999"

        // JSON Body
        let body: [[String : Any]] = [
            [
                "distance": String(self.ssidToDistances["99a8c3e5fd7b5ecbe61e91969cfc5605"] ?? 10.0),
                "ssid": "99a8c3e5fd7b5ecbe61e91969cfc5605"
            ],
            [
                "distance": String(self.ssidToDistances["827239f64378a06c4aacf9a7b286ed30"] ?? 10.0),
                "ssid": "827239f64378a06c4aacf9a7b286ed30"
            ],
            [
                "distance": String(self.ssidToDistances["4fdff8d27d4e2c70d274b781710a1000"] ?? 10.0),
                "ssid": "4fdff8d27d4e2c70d274b781710a1000"
            ]
        ]

        var request = URLRequest(url: URL(string: baseURL + "/direction/" + tagSsid)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: body)
        
        AF.request(request)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: JSON.self) { response in
                switch response.result {
                case .success(let value):
                    print("Server Response Value: \(value)")
                    completion(value["description"].stringValue)  // right, left, ...
                case .failure(let error):
                    print(error)
                }
                
            }.resume()
        
        
    }
    
    
}
