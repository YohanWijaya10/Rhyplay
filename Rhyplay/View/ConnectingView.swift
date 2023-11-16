//
//  ConnectingView.swift
//  Rhyplay
//
//  Created by Brian Putrantio on 13/11/23.
//

import SwiftUI
import Foundation
import CoreBluetooth
import AVFoundation
import Combine


enum ConnectionStatus: String {
    case connected
    case disconnected
    case scanning
    case connecting
    case error
}
enum ConnectionStatus2: String {
    case connected
    case disconnected
    case scanning
    case connecting
    case error
}

let hallSensorService: CBUUID = CBUUID(string: "30585118-5628-47bf-b50b-3b66189e194d")
let hallSensorCharacteristic: CBUUID = CBUUID(string: "beb5483e-36e1-4688-b7f5-ea07361b26a8")


let hallSensorService2: CBUUID = CBUUID(string: "439a61ce-9270-48dd-8ab5-9ef92c3e5969")
let hallSensorCharacteristic2: CBUUID = CBUUID(string: "ab90b28e-c31e-4bbe-b0a8-5673ab1c898d")




class BluetoothService: NSObject, ObservableObject {
    @Published var characteristicValue: String = "Waiting for data..."
    private var centralManager: CBCentralManager!
    
    var hallSensorPeripheral: CBPeripheral?
    var hallSensorPeripheral2: CBPeripheral?
    @Published var peripheralStatus: ConnectionStatus = .disconnected
    @Published var peripheralStatus2: ConnectionStatus2 = .disconnected
    
    
    @Published var XValue: Int = 0
    @Published var AccelValueY: Double = 0
    @Published var AccelValueX: Double = 0
    @Published var AccelValueZ: Double = 0
    @Published var gyroValueY: Double = 0
    @Published var gyroValueX: Double = 0
    @Published var gyroValueZ: Double = 0
    
    @Published var AccelValueY2: Double = 0
    @Published var AccelValueX2: Double = 0
    @Published var AccelValueZ2: Double = 0
    @Published var gyroValueY2: Double = 0
    @Published var gyroValueX2: Double = 0
    @Published var gyroValueZ2: Double = 0
    
    
    @Published var SnareV: Double = 0
    @Published var Bass1: Double = 0
    @Published var KickV: Double = 0
    
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    var isScanning: Bool = false
    var isScanning2: Bool = false
    
    func scanForPeripherals() {
        if isScanning == true {
            peripheralStatus = .scanning
            centralManager.scanForPeripherals(withServices: [hallSensorService])
        }
    }
    func scanForPeripherals2() {
        if isScanning2 == true {
            peripheralStatus2 = .scanning
            centralManager.scanForPeripherals(withServices: [hallSensorService])
        }
    }
    
    func connectToPeripheral() {
        if let peripheral = hallSensorPeripheral {
            centralManager.connect(peripheral)
            peripheralStatus = .connecting
        }
    }
    func connectToPeripheral2() {
        if let peripheral = hallSensorPeripheral2 {
            centralManager.connect(peripheral)
            peripheralStatus2 = .connecting
        }
    }
}

extension BluetoothService: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("CB Powered On")
            scanForPeripherals()
            scanForPeripherals2()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if peripheral.name == "BleEsp32" {
            print("Discovered \(peripheral.name ?? "no name")")
            hallSensorPeripheral = peripheral
            centralManager.connect(hallSensorPeripheral!)
            peripheralStatus = .connecting
        }else if peripheral.name == "BleEsp322" {
            print("Discovered \(peripheral.name ?? "no name")")
            hallSensorPeripheral2 = peripheral
            centralManager.connect(hallSensorPeripheral2!)
            peripheralStatus2 = .connecting
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        if peripheral == hallSensorPeripheral {
            peripheralStatus = .connected
        } else if peripheral == hallSensorPeripheral2 {
            peripheralStatus2 = .connected
        }
        
        peripheral.delegate = self
        peripheral.discoverServices([hallSensorService])
        peripheral.discoverServices([hallSensorService2])
        
        if peripheralStatus == .connected && peripheralStatus2 == .connected {
            centralManager.stopScan()
        }
    }
    //
    
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        
        if peripheral == hallSensorPeripheral {
            peripheralStatus = .disconnected
        } else if peripheral == hallSensorPeripheral2{
            peripheralStatus2 = .disconnected
        }
        
        
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        peripheralStatus = .error
        print(error?.localizedDescription ?? "no error")
    }
    
}

extension BluetoothService: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        for service in peripheral.services ?? [] {
            if service.uuid == hallSensorService {
                print("found service for \(hallSensorService)")
                peripheral.discoverCharacteristics([hallSensorCharacteristic], for: service)
            } else if service.uuid ==  hallSensorService  {
                print("found Service for \(hallSensorService)")
                peripheral.discoverCharacteristics([hallSensorCharacteristic], for: service)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if peripheral == hallSensorPeripheral {
            // Ini adalah karakteristik dari ESP32 pertama (hallSensorPeripheral)
            for characteristic in service.characteristics ?? [] {
                peripheral.setNotifyValue(true, for: characteristic)
                print("Found characteristic for hallSensorPeripheral, waiting for values.")
            }
        } else if peripheral == hallSensorPeripheral2 {
            // Ini adalah karakteristik dari ESP32 kedua (hallSensorPeripheral2)
            for characteristic2 in service.characteristics ?? [] {
                peripheral.setNotifyValue(true, for: characteristic2)
                print("Found characteristic for hallSensorPeripheral2, waiting for values.")
            }
        }
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if characteristic.uuid == hallSensorCharacteristic {
            guard let data = characteristic.value else {
                print("No data received for \(characteristic.uuid.uuidString)")
                return
            }
            guard let dataValue = try? JSONDecoder().decode(TestJSON.self, from: data) else { return }
            //            let dataValue = String(decoding: data, as: UTF8.self)
            //            let newData = TestJSON(accelX: dataValue.accelX)
            //            guard let dataValue = String(data: data, encoding: String.Encoding) else { return }
            //            let sensorData: Int = data.withUnsafeBytes { $0.pointee }
            
            //            XValue = sensorData
            //            print(XValue)
            //            print("Snare Y = \(dataValue.accelY)  X = \(dataValue.accelX) Z =  \(dataValue.accelZ)")
            
            //            AccelValueY = Double(dataValue.accelY) ?? 0
            //            AccelValueX = Double(dataValue.accelX) ?? 0
            //            AccelValueZ = Double(dataValue.accelZ) ?? 0
            //            gyroValueY = Double(dataValue.gyroY) ?? 0
            //            gyroValueX = Double(dataValue.gyroX) ?? 0
            //            gyroValueZ = Double(dataValue.gyroZ) ?? 0
            
            AccelValueY = Double(dataValue.gyroY) ?? 0
            AccelValueX = Double(dataValue.gyroX) ?? 0
            AccelValueZ = Double(dataValue.gyroZ) ?? 0
            gyroValueY = Double(dataValue.accelY) ?? 0
            gyroValueX = Double(dataValue.accelX) ?? 0
            gyroValueZ = Double(dataValue.accelZ) ?? 0
            SnareV = Double(dataValue.Snare1) ?? 0
            Bass1 = Double(dataValue.Bass) ?? 0
            
            
            
        } else  if characteristic.uuid == hallSensorCharacteristic2 {
            guard let data = characteristic.value else {
                print("No data received for \(characteristic.uuid.uuidString)")
                return
            }
            guard let dataValue2 = try? JSONDecoder().decode(TestJSON2.self, from: data) else { return }
            //            let dataValue = String(decoding: data, as: UTF8.self)
            //            let newData = TestJSON(accelX: dataValue.accelX)
            //            guard let dataValue = String(data: data, encoding: String.Encoding) else { return }
            //            let sensorData: Int = data.withUnsafeBytes { $0.pointee }
            
            //            XValue = sensorData
            //            print(XValue)
            //            print("Bass Y = \(dataValue2.accelY2)  X = \(dataValue2.accelX2) Z =  \(dataValue2.accelZ2)")
            //
            //            AccelValueY2 = Double(dataValue2.accelY2) ?? 0
            //            AccelValueX2 = Double(dataValue2.accelX2) ?? 0
            //            AccelValueZ2 = Double(dataValue2.accelZ2) ?? 0
            //            gyroValueY2 = Double(dataValue2.gyroY2) ?? 0
            //            gyroValueX2 = Double(dataValue2.gyroX2) ?? 0
            //            gyroValueZ2 = Double(dataValue2.gyroZ2) ?? 0
            
            AccelValueY2 = Double(dataValue2.gyroZ2) ?? 0
            AccelValueX2 = Double(dataValue2.gyroX2) ?? 0
            AccelValueZ2 = Double(dataValue2.gyroZ2) ?? 0
            gyroValueY2 = Double(dataValue2.accelY2) ?? 0
            gyroValueX2 = Double(dataValue2.accelX2) ?? 0
            gyroValueZ2 = Double(dataValue2.accelZ2) ?? 0
            KickV = Double(dataValue2.Kick1) ?? 0
            print("\(KickV) : \(SnareV) ")
            
        }
        
    }
    
}

struct TestJSON: Codable {
    var accelY: String
    var accelX: String
    var accelZ: String
    var gyroY: String
    var gyroX: String
    var gyroZ: String
    var Snare1: String
    var Bass: String
    
}

struct TestJSON2: Codable {
    var accelY2: String
    var accelX2: String
    var accelZ2: String
    var gyroY2: String
    var gyroX2: String
    var gyroZ2: String
    var Kick1: String
    
    
    
}


struct ConnectingView: View {
    @StateObject var service = BluetoothService()
    @State private var isButtonHidden = false
    @State private var buttonoutlineColor_left: Color = Color("Pink")
    @State private var buttonoutlineColor_right: Color = Color("Pink")
    @State private var isFlashing_left = true
    @State private var isFlashing_right = true
    @State var kedip: CGFloat = 10
    @State var connectOK: Bool = false
    @State var blink: Double = 0.0
    @State private var audioPlayer: AVAudioPlayer?
    
    
    @State var bunyi = false
    @State private var isLeftConnected = false
    @State private var isRightConnected = false
    
    @State private var isFreeplayView = false
    
    @State private var isMainPageView = false
    
    // Properti AVAudioPlayer
    @State private var audioPlayer1: AVAudioPlayer?
    @State private var audioPlayer2: AVAudioPlayer?
    @State private var audioPlayer3: AVAudioPlayer?
    
    @State private var snareMinY: Double = 0.0
    @State private var snareMaxY: Double = 0.0
    @State private var snareDeltaY: Double = 0.0
    
    @State private var kickMinY: Double = 0.0
    @State private var kickMaxY: Double = 0.0
    @State private var kickDeltaY: Double = 0.0
    
    @State private var snareAvgY: Double = 0.0
    @State private var iterateY: Int = 0
    @State private var snare: String = "Snare1"
    @State private var kick: String = "Kick1"
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("Maroon").edgesIgnoringSafeArea(.all)
                
                Group {
                    Circle()
                        .fill(Color("Pink")).opacity(0.2)
                        .frame(width: 950, height: 950)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 945, height: 945)
                    
                    Circle()
                        .fill(Color("Pink")).opacity(0.4)
                        .frame(width: 750, height: 750)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 745, height: 745)
                    
                    Circle()
                        .fill(Color("Pink")).opacity(0.6)
                        .frame(width: 550, height: 550)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 545, height: 545)
                    
                    Circle()
                        .fill(Color("Pink")).opacity(0.8)
                        .frame(width: 350, height: 350)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 345, height: 345)
                    
                    Circle()
                        .fill(Color("Pink"))
                        .frame(width: 150, height: 150)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 145, height: 145)
                    
                } //Tampilan Lingkaran2 //Background
                
                VStack{
                    
                    Spacer()
                        .frame(height: 240)
                    
                    // Button Tangan Kiri
                    HStack{
                        if !isButtonHidden{
                            Button(action: {
                                isLeftConnected = true
                                service.connectToPeripheral2()
                                if isLeftConnected{
                                    print("Left Button Connected")
                                    
                                    
                                    //isFlashing_right.toggle()
                                    kedip = 20
                                }
                                else{
                                    print("Left Button DisConnected")
                                    buttonoutlineColor_left = Color.red
                                    
                                    
                                    
                                    isFlashing_left.toggle()
                                }
                            }) {
                                VStack{
                                    ZStack{
                                        if service.peripheralStatus2 !=  .connected{
                                            Image("Left Hand Icon")
                                                .resizable()
                                                .frame(width: 65, height: 65) //size gambar tangan
                                                .frame(width: 115, height: 115) // size button lingkaran
                                                .foregroundColor(Color.black)
                                                .background(Color("Pink"))
                                                .clipShape(Circle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 115)
                                                        .stroke(Color("Pink"), lineWidth: kedip)
                                                        .opacity(blink)
                                                        .task(){
                                                            let baseAnimation = Animation.easeInOut(duration: 2)
                                                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                                                            
                                                            withAnimation(repeated) {
                                                                blink = 1
                                                            }
                                                            blink = 1
                                                        }
                                                )
                                            
                                        } else{
                                            ///Connect jadi ijo
                                            Image("Left Hand Icon")
                                                .resizable()
                                                .frame(width: 65, height: 65) //size gambar tangan
                                                .frame(width: 115, height: 115) // size button lingkaran
                                                .foregroundColor(Color.black)
                                                .background(Color("Pink"))
                                                .clipShape(Circle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 115)
                                                        .stroke(Color.green, lineWidth: 10)
                                                        .opacity(blink)
                                                        .task(){
                                                            let baseAnimation = Animation.easeInOut(duration: 2)
                                                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                                                            
                                                            withAnimation(repeated) {
                                                                blink = 1
                                                            }
                                                            blink = 1
                                                        }
                                                )
                                        }
                                        
                                    }
                                    
                                    if service.peripheralStatus2 != .connected {
                                        if isLeftConnected == true{
                                            Text("Connecting...")
                                                .foregroundColor(.white)
                                        }
                                        else{
                                            Text("Left Gloves")
                                                .foregroundColor(.white)
                                        }
                                    }else{
                                        Text("Connected")
                                            .foregroundColor(.white)
                                        
                                        
                                        
                                    }
                                    if service.peripheralStatus == .connected {
                                        
                                    }
                                }
                            }
                        }
                        else{
                            Spacer()
                        }
                        
                        Spacer().frame(width: 150)
                    }
                    
                    Spacer()
                    
                    //Icon Bluetooth di tengah
                    VStack{
                        Image("Bluetooth Icon")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .foregroundColor(Color("Pink"))
                    }
                    
                    Spacer()
                    
                    // Button Tangan Kanan
                    HStack{
                        Spacer().frame(width: 150)
                        
                        if !isButtonHidden{
                            Button(action: {
                                isRightConnected = true
                                service.connectToPeripheral()
                                if isRightConnected{
                                    print("right Button Connected")
                                    
                                    
                                    //isFlashing_right.toggle()
                                    kedip = 20
                                }
                                else{
                                    print("right Button DisConnected")
                                    buttonoutlineColor_right = Color.red
                                    
                                    
                                    
                                    isFlashing_right.toggle()
                                }
                            }) {
                                VStack{
                                    ZStack{
                                        if service.peripheralStatus !=  .connected{
                                            Image("Right Hand Icon")
                                                .resizable()
                                                .frame(width: 65, height: 65) //size gambar tangan
                                                .frame(width: 115, height: 115) // size button lingkaran
                                                .foregroundColor(Color.black)
                                                .background(Color("Pink"))
                                                .clipShape(Circle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 115)
                                                        .stroke(Color("Pink"), lineWidth: kedip)
                                                        .opacity(blink)
                                                        .task(){
                                                            let baseAnimation = Animation.easeInOut(duration: 2)
                                                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                                                            
                                                            withAnimation(repeated) {
                                                                blink = 1
                                                            }
                                                            blink = 1
                                                        }
                                                )
                                            
                                        } else{
                                            Image("Right Hand Icon")
                                                .resizable()
                                                .frame(width: 65, height: 65) //size gambar tangan
                                                .frame(width: 115, height: 115) // size button lingkaran
                                                .foregroundColor(Color.black)
                                                .background(Color("Pink"))
                                                .clipShape(Circle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 115)
                                                        .stroke(Color.green, lineWidth: 10)
                                                        .opacity(blink)
                                                        .task(){
                                                            let baseAnimation = Animation.easeInOut(duration: 2)
                                                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                                                            
                                                            withAnimation(repeated) {
                                                                blink = 1
                                                            }
                                                            blink = 1
                                                        }
                                                )
                                            
                                        }
                                        
                                    }
                                    if service.peripheralStatus != .connected {
                                        if isRightConnected == true{
                                            Text("Connecting...")
                                                .foregroundColor(.white)
                                        }
                                        else{
                                            Text("Right Gloves")
                                                .foregroundColor(.white)
                                        }
                                    }else{
                                        Text("Connected")
                                            .foregroundColor(.white)
                                        
                                        
                                        
                                    }
                                    if service.peripheralStatus == .connected {
                                        
                                    }
                                    
                                }
                            }
                        }
                        else{
                            Spacer()
                        }
                    }
                    
                    Spacer()
                        .frame(height: 240)
                    
                }
                
                VStack {
                    Spacer()
                        .frame(height: 785)
                    
                    
                    // button next buat ke halaman selanjutnya setelah connect
                    if service.peripheralStatus == .connected {
                        //MARK: Button ke Pattern
                        NavigationLink(destination: MainPageView(bunyi: $bunyi).navigationBarHidden(true)) {
                            ZStack{
                                Text("Continue")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 350, height: 40)
                                    .background(Color("Pink"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                                    .cornerRadius(10)
                            }
                        }
                        
                        .padding()
                        
                        
                    }
                    
                    Spacer()
                }
                
                
            }.onAppear(){
                service.isScanning = true
                service.isScanning2 = true
            }
            .onReceive(Just(service.SnareV)) { snareVal in
                
                if bunyi ==  true {
                    if snareVal == 1{
                        playSound(fileName: "CajoonSnare", fileExtension: "mp3")
                    } else if snareVal == 2{
                        playSound1(fileName: "CajoonKick", fileExtension: "mp3")
                    } else{
                        
                    }
                }
            }
            .onReceive(Just(service.Bass1)) { snare in
                if bunyi == true{
                    if snare == 1{
                        playSound2(fileName: "CajoonSnare", fileExtension: "mp3")
                    } else if snare == 2{
                        playSound3(fileName: "CajoonKick", fileExtension: "mp3")
                    } else{
                        
                    }
                }
            }
        }
    }
    
    func playSound(fileName: String, fileExtension: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    func playSound1(fileName: String, fileExtension: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                audioPlayer1 = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer1?.volume = 1
                audioPlayer1?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    func playSound2(fileName: String, fileExtension: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                audioPlayer2 = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer2?.volume = 1
                audioPlayer2?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    func playSound3(fileName: String, fileExtension: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                audioPlayer3 = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer3?.volume = 1
                audioPlayer3?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ConnectingView()
}
