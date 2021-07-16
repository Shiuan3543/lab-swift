//
//  ViewController.swift
//  Peripheraltest
//
//  Created by 井民全 on 2021/7/5.
//

import Cocoa
import CoreBluetooth

class ViewController: NSViewController, CBPeripheralManagerDelegate {
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var textField: NSTextField!
    
    enum SendDataError: Error {
        case CharacteristicNotFound
    }// 自訂一個錯誤型態
    
    let A001_SERVICE = "A001"
    let C001_CHARACTERISTIC = "C001"
    //GATT
    
    var peripheralManager: CBPeripheralManager!
    //記錄所有的characteristic
    var charDictionary = [String: CBMutableCharacteristic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let queue = DispatchQueue.global()
        //將觸發No.1 method
        peripheralManager = CBPeripheralManager(delegate: self, queue: queue)
    }
    
    //No.1 method
    //註冊service 與 characteristic到這個藍牙裝置中
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        //先判斷藍芽是否開啟 ,如果不是藍芽4.X,也回傳回店員未開啟
        guard peripheral.state == .poweredOn else {
            //iOS會出現對話框提醒使用者
            print(peripheral.state.rawValue)
            return
        }
        
        var service: CBMutableService
        var characteristic: CBMutableCharacteristic
        var charArray = [CBCharacteristic]()
        
        //開始設定 service 與 characteristic
        service = CBMutableService(type: CBUUID(string: A001_SERVICE), primary: true)
        characteristic = CBMutableCharacteristic(
            type: CBUUID(string: C001_CHARACTERISTIC),
            properties: [.notifyEncryptionRequired, .write, .read],
            value: nil,
            permissions: [.writeEncryptionRequired, .readEncryptionRequired]
        )
        charDictionary[C001_CHARACTERISTIC] = characteristic
        //如果有兩個以上的characteristic,用append()加到陣列中
        charArray.append(characteristic)
        
        //在service中填入characteristic陣列
        service.characteristics = charArray
        //註冊service
        //準備觸發2號method
        //peripheralManager.add(service)// book with,example without
        
        DispatchQueue.main.async {
            //book without,example with
            self.peripheralManager.add(service)
        }
    }
    
    //No.2 method tell who am I
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        guard error == nil else {
            print("ERROR:{\(#function)}\n")
            print(error!.localizedDescription)
            return
        }
        
        //為藍牙裝置取名
        let devicenameString = "我的MAC裝置"
        //開始廣播,讓central端可以找到這台裝置
        //準備觸發No.3 method
        peripheral.startAdvertising(
            [CBAdvertisementDataServiceUUIDsKey: [service.uuid],
             CBAdvertisementDataLocalNameKey: devicenameString]
        )
        
    }
    
    //No.3 method
    //central端已經可以掃描到peripheral裝置
    //peripheral端的BLE初始化程序已完成
    func peripheralManagerDidStartAdvertising(_peripheral: CBPeripheralManager, error: Error?) {
        //周邊裝置開始廣播
        print("開始廣播")
    }
    
    //送資料到central
    //uuidString:String指定要從哪個characteristic送資料出去
    //先判斷uuidString是否存在
    func sendData(_ data: Data, uuidString: String) throws {
        guard let characteristic = charDictionary[uuidString] else {
            //沒有這個uuid
            throw SendDataError.CharacteristicNotFound
        }
        
        peripheralManager!.updateValue(
            data,
            for: characteristic,
            onSubscribedCentrals: nil
        )
    }
    
    //Central 端訂閱
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        
        if peripheral.isAdvertising {
            peripheral.stopAdvertising()
            print("停止廣播")
        }
        if characteristic.uuid.uuidString == C001_CHARACTERISTIC {
            print("訂閱C001")
            do {
                let data = "Hello Central".data(using: .utf8)
                try sendData(data!, uuidString: C001_CHARACTERISTIC)
            } catch {
                print(error)
            }
        }
    }
    
    //Central 端取消訂閱
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        if characteristic.uuid.uuidString == C001_CHARACTERISTIC {
            //Central 取消訂閱C001
            print("取消訂閱C001")
        }
    }
    
    //Central 端寫資料到peripheral
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        guard let at = requests.first else {
            return
        }
        guard let data = at.value else {
            return
        }
        if at.characteristic.uuid.uuidString == C001_CHARACTERISTIC {
            //當property有write參數時,需執行下一行程式
            //來向central端回傳「成功收到」訊息
            //若參數為writeWithoutResponse時則不需要回傳訊息
            
            peripheral.respond(to: at, withResult: .success)
            //收到原始資料型態為Data
            let string = "> " + String(data: data, encoding: .utf8)!
            print(string)
            
            DispatchQueue.main.async {
                if self.textView.string.isEmpty {
                    self.textView.string = string
                } else {
                    self.textView.string = self.textView.string + "\n" + string
                }
            }
        }
    }
    
    //收到central端要求讀取資料
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        request.value = nil
        if request.characteristic.uuid.uuidString == C001_CHARACTERISTIC {
            let data = "What do you want?".data(using: .utf8)
            request.value = data
        }
        //要回傳的資料透過respond回傳
        peripheral.respond(to: request, withResult: .success)
    }
    
    @IBAction func enterButton(_ sender: NSButtonCell) {
        //按下Enter按鈕
        let string = textField.stringValue
        
        //更新Text View 畫面
        if textView.string.isEmpty {
            textView.string = string
        } else {
            textView.string = textView.string + "\n" + string
        }
        
        //將字串送到central端
        do {
            let data = string.data(using: .utf8)
            try sendData(data!, uuidString: C001_CHARACTERISTIC)
        } catch {
            print(error)
        }
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
