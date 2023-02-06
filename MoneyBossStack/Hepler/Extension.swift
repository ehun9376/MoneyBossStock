//
//  Extension.swift
//  BlackSreenVideo
//
//  Created by yihuang on 2022/11/23.
//

import Foundation
import UIKit
import AudioToolbox
import AVFoundation

enum SessionSetupResult {
    case success
    case notAuthorized
    case configurationFailed
}

extension UIImage {
    func resize(targetSize: CGSize, isAspect: Bool = true) -> UIImage {
        var newSize: CGSize = targetSize
        if isAspect {
            // Figure out what our orientation is, and use that to form the rectangle
            let widthRatio  = targetSize.width  / self.size.width
            let heightRatio = targetSize.height / self.size.height
            
            if(widthRatio > heightRatio) {
                newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
            } else {
                newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
            }
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 10.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
extension NSObject {
    
    func systemVibration(sender: AnyObject, complete: (()->())?) {
        AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate), complete)
    }
    
    func sendLocalNotication(title: String? = nil, subTitle: String? = nil, body: String? = nil) {
        
        let content = UNMutableNotificationContent()
        content.title = title ?? ""
        content.subtitle = subTitle ?? ""
        content.body = body ?? ""
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            
        }
    }
}
extension UIColor: NameSpaceProtocol { }
extension NameSpaceWrapper where T: UIColor {
    
    public static func color(rgba: String) -> UIColor {
        var red: CGFloat   = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat  = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            var hexStr = (rgba as NSString).substring(from: 1) as NSString
            if hexStr.length == 8 {
                let alphaHexStr = hexStr.substring(from: 6)
                hexStr = hexStr.substring(to: 6) as NSString
                var alphaHexValue: UInt32 = 0
                let alphaScanner = Scanner(string: alphaHexStr)
                if alphaScanner.scanHexInt32(&alphaHexValue) {
                    let alphaHex = Int(alphaHexValue)
                    alpha = CGFloat(alphaHex & 0x000000FF) / 255.0
                } else {
                    print("scan alphaHex error")
                }
            }
            
            let rgbScanner = Scanner(string: hexStr as String)
            var hexValue: UInt32 = 0
            if rgbScanner.scanHexInt32(&hexValue) {
                if hexStr.length == 6 {
                    let hex = Int(hexValue)
                    red   = CGFloat((hex & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hex & 0x00FF00) >> 8)  / 255.0
                    blue  = CGFloat(hex & 0x0000FF) / 255.0
                } else {
                    print("invalid rgb string, length should be 6")
                }
            } else {
                print("scan hex error")
            }
            
        } else {
            print("invalid rgb string, missing '#' as prefix")
        }
        
        return UIColor(red:red, green:green, blue:blue, alpha:alpha)
    }
}


// MARK: - CGFloat Extension

extension CGFloat: NameSpaceProtocol { }
extension NameSpaceWrapper where T == CGFloat {
    
    /// 输出格式化的String
    ///
    /// - Parameter format: eg: ".2" 保留两位小数
    /// - Returns: Formated String
    public func toStringWithFormat(_ format: String) -> String {
        return String(format: "%\(format)f", wrappedValue)
    }
    
    /// 输出为百分数
    ///
    /// - Returns: 以%结尾的 百分数输出
    public func toPercentFormat() -> String {
        return String(format: "%.2f", wrappedValue) + "%"
    }
}


// MARK: - String Extension

extension String: NameSpaceProtocol { }
extension NameSpaceWrapper where T == String {
    
    public func toDate(_ format: String) -> Date? {
        let dateformatter = DateFormatter.hschart.cached(withFormat: format)
        dateformatter.timeZone = TimeZone.autoupdatingCurrent
        
        return dateformatter.date(from: wrappedValue)
    }
}


// MARK: - DateFormatter Extension

private var cachedFormatters = [String: DateFormatter]()
extension DateFormatter: NameSpaceProtocol {}
extension NameSpaceWrapper where T: DateFormatter {
    
    public static func cached(withFormat format: String) -> DateFormatter {
        if let cachedFormatter = cachedFormatters[format] { return cachedFormatter }
        let formatter = DateFormatter()
        formatter.dateFormat = format
        cachedFormatters[format] = formatter
        
        return formatter
    }
}


// MARK: - Date Extension

extension Date: NameSpaceProtocol { }
extension NameSpaceWrapper where T == Date {
    
    public func toString(_ format: String) -> String {
        let dateformatter = DateFormatter.hschart.cached(withFormat: format)
        dateformatter.timeZone = TimeZone.autoupdatingCurrent

        return dateformatter.string(from: wrappedValue)
    }
    
    public static func toDate(_ dateString: String, format: String) -> Date {
        let dateformatter = DateFormatter.hschart.cached(withFormat: format)
        dateformatter.locale = Locale(identifier: "en_US")
        let date = dateformatter.date(from: dateString) ?? Date()
        
        return date
    }
}


// MARK: - Double Extension

extension Double: NameSpaceProtocol { }
extension NameSpaceWrapper where T == Double {
    
    /// %.2f 不带科学计数
    public func toStringWithFormat(_ format:String) -> String! {
        return NSString(format: format as NSString, wrappedValue) as String
    }
}
