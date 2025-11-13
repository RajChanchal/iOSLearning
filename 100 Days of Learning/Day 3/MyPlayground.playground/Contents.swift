import Foundation

let urlSession = URLSession.shared
urlSession.configuration.allowsCellularAccess
urlSession.configuration.allowsConstrainedNetworkAccess
urlSession.configuration.allowsExpensiveNetworkAccess


let defaultConfiguraiton = URLSessionConfiguration.default
defaultConfiguraiton.allowsCellularAccess = false
let ephemeralConfiguraiton = URLSessionConfiguration.ephemeral
let backgroundConfiguration = URLSessionConfiguration.background(withIdentifier: "com.test.background")

let defaultSession = URLSession(configuration: defaultConfiguraiton)
defaultSession.configuration.allowsCellularAccess
