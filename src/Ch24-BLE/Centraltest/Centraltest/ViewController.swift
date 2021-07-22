//
//  ViewController.swift
//  Centraltest
//
//  Created by 井民全 on 2021/7/7.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    //自訂一個錯誤型態
    enum SendDataError: Error {
        case CharacteristicNotFound
    }
    
    //GATT
    let C001_CHARACTERISTIC = "C001"
    
    var centralManager: CBCentralManager!
    //儲存連上的peripheral，此變數議定要宣告為全域
    var connectPeripheral: CBPeripheral!
    //記錄所有的characteristic
    var charDictionary = [String: CBCharacteristic]()
    
    /* 當 central 端重新執行後，嘗試取回 peripheral */
    func isPaired() -> Bool {
        let user = UserDefaults.standard
        if let uuidString = user.string(forKey: "KEY_PERIPHERAL_UUID") {
            let uuid = UUID(uuidString: uuidString)
            let list = centralManager.retrievePeripherals(withIdentifiers: [uuid!])
            if list.count > 0 {
                connectPeripheral = list.first!
                connectPeripheral.delegate = self
                return true
            }
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let queue = DispatchQueue.global()
        // 觸發No.1
        centralManager = CBCentralManager(delegate: self, queue: queue/*nil*/)
//        // 背景顏色
//        textView.backgroundColor = UIColor.darkGray
//
//        // 文字顏色
//        textView.textColor = UIColor.white
//
//        // 文字字型及大小
//        textView.font = UIFont(name: "Helvetica-Light", size: 20)
//
//        // 文字向左對齊
//        textView.textAlignment = .left
//
//        // 預設文字內容
//        textView.text = "Swift BLE 起步走"
//
//        // 適用的鍵盤樣式 這邊選擇預設的
//        textView.keyboardType = .default
//
//        // 鍵盤上的 return 鍵樣式 這邊選擇預設的
//        textView.returnKeyType = .default
    }
    
    //No.1
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        //判斷藍芽是否開啟，如果不是藍芽4.X，也會傳回店員為開啟
        guard central.state == .poweredOn else {
            //iOS會出現對話框提醒使用者
            return
        }
//        //觸發No.2
//        centralManager.scanForPeripherals(withServices: nil, options: nil)//24-2
        if isPaired() {
            //觸發No.3
            centralManager.connect(connectPeripheral, options: nil)//要求該設備提供的service
        } else {
            //觸發No.2
            centralManager.scanForPeripherals(withServices: nil, options: nil)//掃描周遭
        }
    }
    
    //No.2
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        guard let deviceName = peripheral.name else {
            return
        }
        print("找到藍牙裝置: \(deviceName)")
        guard deviceName.range(of: "井民全’s MacBook Pro") != nil || deviceName.range(of: "Macbook") != nil
        else {
            return
        }
        central.stopScan()
        
        //斷線處理
        //儲存重新連線需要的周邊端UUID
        let user = UserDefaults.standard
        user.set(peripheral.identifier.uuidString, forKey: "KEY_PERIPHERAL_UUID")
        user.synchronize()

        connectPeripheral = peripheral
        connectPeripheral.delegate = self
        
        //觸發No.3
        centralManager.connect(connectPeripheral, options: nil)
    }
    
    //No.3
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        //清除上一次儲存的characteristic 資料
        charDictionary = [:]
        //觸發No.4
        peripheral.discoverServices(nil)
    }
    
    //No.4
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard error == nil else {
            print("ERROR: \(#function)")
            print(error!.localizedDescription)
            return
        }
        
        for service in peripheral.services! {
            //觸發No.5
            connectPeripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    //No.5
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard error == nil else {
            print("ERROR: \(#function)")
            print(error!.localizedDescription)
            return
        }
        
        for characteristic in service.characteristics! {
            let uuidString = characteristic.uuid.uuidString
            charDictionary[uuidString] = characteristic
            print("找到: \(uuidString)")
        }
    }
    //將資料傳送到peripheral
    func sendData(_ data: Data, uuidString: String, writeType: CBCharacteristicWriteType) throws {
        guard let characteristic = charDictionary[uuidString] else {
            throw SendDataError.CharacteristicNotFound
        }
        connectPeripheral.writeValue(
            data,
            for: characteristic,
            type: writeType
        )
    }
    //將資料傳送peripheral時如果遇到錯誤會呼叫
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        if error != nil {
            print("寫入資料錯誤: \(error!)")
        }
    }
    
    //取得peripheral送過來的資料
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        guard error == nil else {
            print("ERROR: \(#function)")
            print(error!)
            return
        }
        
        if characteristic.uuid.uuidString == C001_CHARACTERISTIC {
            let data = characteristic.value! as NSData
            let string = "> " + String(data: data as Data, encoding: .utf8)!
            print(string)
            
            DispatchQueue.main.async {
                if self.textView.text.isEmpty {
                    self.textView.text = string
                } else {
                    self.textView.text = self.textView.text + "\n" + string
                }
            }
        }
    }
    
    //Subscribe switch
    @IBAction func subscribeValue(_ sender: UISwitch) {
        connectPeripheral.setNotifyValue(sender.isOn, for: charDictionary[C001_CHARACTERISTIC]!)
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        let string = textField.text ?? ""
        if textView.text.isEmpty {
            textView.text = string
        } else {
            textView.text = textView.text + "\n" + string
        }
        do {
            let data = string.data(using: .utf8)
            //這裡必須根據characteristic的屬性設定
            //來決定使用withoutResponse或withResponse
            try sendData(data!, uuidString: C001_CHARACTERISTIC, writeType: .withResponse)
        } catch {
            print(error)
        }
    }
    @IBAction func readdataButton(_ sender: UIButton) {
        let characteristic = charDictionary[C001_CHARACTERISTIC]!
        connectPeripheral.readValue(for: characteristic)
    }
    
    //關閉鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.3) {
            self.view.endEditing(true)
        }
    }
    
    //斷線處理
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral,  error: Error?) {
        print("連線中斷")
        if isPaired() {
            //將觸發No.3
            centralManager.connect(connectPeripheral, options: nil)
        }
    }
    func unpair() {
        let user = UserDefaults.standard
        user.removeObject(forKey: "KEY_PERIPHERAL_UUID")
        user.synchronize()
        centralManager.cancelPeripheralConnection(connectPeripheral)
        //在iOS中要提醒使用者必須從系統設定中『忘記裝置』，否則無法再配對
    }
    @IBAction func unpairClick(_ sender: UIButton) {
        unpair()
    }
}
