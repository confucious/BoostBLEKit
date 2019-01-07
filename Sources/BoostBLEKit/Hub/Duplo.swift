//
//  Duplo.swift
//  BoostBLEKit
//
//  Created by Shinichiro Oba on 08/01/2019.
//  Copyright © 2019 bricklife.com. All rights reserved.
//

import Foundation

public final class Duplo {
    
    public final class TrainBase: Hub {
        
        public init() {}
        
        public var connectedIOs: [PortId : IOType] = [
            0x00: .trainBaseMotor,
            0x01: .trainBaseSpeaker,
            0x11: .rgbLight,
            0x12: .trainBaseSensor,
            0x13: .trainBaseSpeedometer,
            0x14: .voltageSensor,
            ]
        
        public let portMap: [Port: PortId] = [
            .A:     0x00,
            ]
        
        public func canSupportAsMotor(ioType: IOType) -> Bool {
            switch ioType {
            case .trainBaseMotor:
                return true
            default:
                return false
            }
        }
        
        public func motorPowerCommand(port: Port, power: Int8) -> Command? {
            guard let portId = portId(for: port) else { return nil }
            guard let ioType = connectedIOs[portId] else { return nil }
            
            switch ioType {
            case .trainBaseMotor:
                return MotorPowerCommand(portId: portId, power: power)
            default:
                return nil
            }
        }
    }
}