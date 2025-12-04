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
