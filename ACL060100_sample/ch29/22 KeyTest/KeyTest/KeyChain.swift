//
//  KeyChain.swift
//  KeyTest
//
//  Created by 朱克剛 on 2020/9/17.
//

import Foundation
import CryptoKit

struct KeyChain {
    static let access = SecAccessControlCreateWithFlags(
        nil,
        kSecAttrAccessibleAfterFirstUnlock,
        SecAccessControlCreateFlags.userPresence,
        nil
    )

    static func save(_ data: Data, forKey key: String) -> OSStatus {
        let query = [
            kSecAttrAccessControl: access!,
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ] as CFDictionary

        return SecItemAdd(query, nil)
    }
    
    static func load(forKey key: String) -> Data? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne,
            kSecUseOperationPrompt: "請授權取得鑰匙圈中資料"
        ] as CFDictionary

        var dataRef: CFTypeRef?
        let status: OSStatus = SecItemCopyMatching(query, &dataRef)

        if status == errSecSuccess {
            return dataRef as? Data
        } else {
            return nil
        }
    }
    
    static func update(_ data: Data, forKey key: String) -> OSStatus {
        let query = [
            kSecAttrAccessControl: access!,
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecUseOperationPrompt: "將存取鑰匙圈資料"
        ] as CFDictionary
        
        let updateAttr = [
            kSecValueData: data
        ] as CFDictionary
        
        return SecItemUpdate(query, updateAttr)
    }
    
    static func remove(forKey key: String) -> OSStatus {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ] as CFDictionary

        return SecItemDelete(query)
    }
}
