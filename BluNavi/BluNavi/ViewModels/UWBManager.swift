//
//  UWBManager.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import Foundation
import EstimoteUWB

class UWBManager {
    private var uwbManager: EstimoteUWBManager?
    
    init() {
        setupUWB()
    }
    
    private func setupUWB() {
        uwbManager = EstimoteUWBManager(positioningObserver: self, discoveryObserver: self, beaconRangingObserver: self)
        uwbManager?.startScanning()
    }
}

// REQUIRED PROTOCOL
extension UWBManager: UWBPositioningObserver {
    func didUpdatePosition(for device: UWBDevice) {
        print("position updated for device: \(device)")
        print("Distance: " + String(device.distance))
//        print(device.vector ?? "Vector Not Known")
    }
}

// OPTIONAL PROTOCOL FOR BEACON BLE RANGING
extension UWBManager: BeaconRangingObserver {
    func didRange(for beacon: BLEDevice) {
//        print("beacon did range: \(beacon)")
    }
}

// OPTIONAL PROTOCOL FOR DISCOVERY AND CONNECTIVITY CONTROL
extension UWBManager: UWBDiscoveryObserver {
    var shouldConnectAutomatically: Bool {
        return true // set this to false if you want to manage when and what devices to connect to for positioning updates
    }
    
    func didDiscover(device: UWBIdentifable, with rssi: NSNumber, from manager: EstimoteUWBManager) {
        print("Discovered Device: \(device.publicId) rssi: \(rssi)")
        
        // if shouldConnectAutomatically is set to false - then you could call manager.connect(to: device)
        // additionally you can globally call discoonect from the scope where you have inititated EstimoteUWBManager -> disconnect(from: device) or disconnect(from: publicId)
    }
    
    func didConnect(to device: UWBIdentifable) {
        print("Successfully Connected to: \(device.publicId)")
    }
    
    func didDisconnect(from device: UWBIdentifable, error: Error?) {
        print("Disconnected from device: \(device.publicId)- error: \(String(describing: error))")
    }
    
    func didFailToConnect(to device: UWBIdentifable, error: Error?) {
        print("Failed to conenct to: \(device.publicId) - error: \(String(describing: error))")
    }
}
