//
//  ViewController.swift
//  SocketExample
//
//  Created by no one on 19/08/2021.
//

import UIKit
import SocketIO
class ViewController: UIViewController {
    let manager:SocketManager = SocketManager(socketURL: URL(string: "ws://localhost:800")!, config: [.log(true), .compress])
    var socket:SocketIOClient!
    
    @IBOutlet weak var messageLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        socket = manager.defaultSocket
        socket.on(clientEvent: .connect){(data,ack) in
            print("Connected")
            self.socket.emit("server port", "hi server...")
            
        }
        socket.on("ios port"){(data,ack) in
            if let data = data[0] as? [String: String],
               let message = data["msg"]{
                DispatchQueue.main.async {
                    self.messageLbl.text = message
                }
            }
            
        }
        socket.connect()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

