import UIKit

protocol ChatManageable{
    associatedtype Message
    func send(message: Message)
}

struct OneToOneMessage {
    let id: String
    let message: String
    let senderId: String
}

struct GroupMessage {
    let id: String
    let message: String
    let groupId: String
}

struct BroadcastMessage {
    let id: String
    let message: String
    let broadcastId: String
}

struct OneToOneChat: ChatManageable {
    typealias Message = OneToOneMessage
    func send(message: OneToOneMessage) {
        print("Send message")
    }
}

struct GroupChat: ChatManageable {
    func send(message: GroupMessage) {
        print("Send Group Message")
    }
}

struct BroadcastChat {
    func announced() {
        
    }
}

//Confirming to ChatManageable in extension
extension BroadcastChat: ChatManageable {
    typealias Message = BroadcastMessage
    func send(message: BroadcastMessage) {
        print("Send Broadcast Message")
    }
}


