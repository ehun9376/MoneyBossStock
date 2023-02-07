//
//  URLSessionWebSocket.swift
//  MoneyBossStack
//
//  Created by 陳逸煌 on 2023/2/1.
//

import Foundation

class URLSessionWebSocket: NSObject {
    
    var webSocketTask: URLSessionWebSocketTask?
    var receviedContent: ((String) -> ())? = nil
    var getError: ((Error) -> ())? = nil
    var roomID: String?
    
    init(receviedContent:((String) -> ())? = nil, getError: ((Error) -> ())? = nil, roomID: String?) {
        super.init()
        self.receviedContent = receviedContent
        self.getError = getError
        self.roomID = roomID
    }

    func connect() {
        //遠端的IP    ws://web-socket-ehun.herokuapp.com/
        //冠之的local IP    ws://192.168.20.75:1337/
        guard let url = URL(string: "ws://web-socket-ehun.herokuapp.com/") else {
            print("Error: can not create URL")
            return
        }

        let urlSession = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: .main)

        webSocketTask = urlSession.webSocketTask(with: url, protocols: ["chat"])
        receive()
        webSocketTask?.resume()
    }

    private func receive() {
        webSocketTask?.receive { result in
            switch result {
            case .success(let message):
                switch message {
                case .string(let text):
                    print("Received string: \(text)")
                    self.receviedContent?(text)
                case .data(let data):
                    print("Received data: \(data)")
                @unknown default:
                    fatalError()
                }

            case .failure(let error):
                print(error)
                self.getError?(error)
            }

            self.receive()
        }
    }

    func send(message: String) {
        let message = URLSessionWebSocketTask.Message.string(message + "+" + (self.roomID ?? ""))
        webSocketTask?.send(message) { error in
            if let error = error {
                print(error)
            }
        }
    }
    func firstSend(name: String, ID: String) {
        let message = URLSessionWebSocketTask.Message.string(name + "+" + ID)
        webSocketTask?.send(message) { error in
            if let error = error {
                print(error)
            }
        }
    }

    func disconnect() {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
    }
    
    func deCodeToModel(str: String?) -> Any {
        
        guard let str = str else {
            return ""
        }
        
        return ""
        
    }
    
}
extension URLSessionWebSocket: URLSessionWebSocketDelegate {
    public func urlSession(_ session: URLSession,
                           webSocketTask: URLSessionWebSocketTask,
                           didOpenWithProtocol protocol: String?) {
        print("URLSessionWebSocketTask is connected")
    }

    public func urlSession(_ session: URLSession,
                           webSocketTask: URLSessionWebSocketTask,
                           didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
                           reason: Data?) {
        let reasonString: String
        if let reason = reason, let string = String(data: reason, encoding: .utf8) {
            reasonString = string
        } else {
            reasonString = ""
        }

        print("URLSessionWebSocketTask is closed: code=\(closeCode), reason=\(reasonString)")
    }
}

extension URLSessionWebSocket: URLSessionDelegate {
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
       //Trust the certificate even if not valid
       let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)

       completionHandler(.useCredential, urlCredential)
    }
}
extension Dictionary {
    
    func toJsonString() -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: self,
                                                     options: []) else {
            return nil
        }
        guard let str = String(data: data, encoding: .utf8) else {
            return nil
        }
        return str
     }
    
}
