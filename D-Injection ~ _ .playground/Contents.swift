import UIKit
         
// MARK: - Tightly-coupled / coupled / loosely-coupled / de-coupled /
 
protocol SessionManagerProtocol {
    func loggingOut()
    func loggingIn()
}

class LosselyCoupledClass {
    let sessionManager: SessionManagerProtocol
    
    init(sessionManager: SessionManagerProtocol) {
        self.sessionManager = sessionManager
    }
}

// incompletet yet ...



// MARK: - Constructor injection vs Property injection vs Method injection

struct LibrStruct { var title: String } // the injectable service for the below clients

protocol LibrManager {
    func destroyingAllBooks(in library: LibrStruct)  //method injection
}

class LibrViewModel {
    var libr: LibrStruct?  //property injection
    init(libr: LibrStruct) {   //constructor injection
        self.libr = libr
    }
}

// _____________________________________________
// MARK: - d-injection with protoc vs no d-injection

enum Result {
    case Success(confirmation: String)
    case Failure(erro: NSError)
}

protocol RestaurInjectableProtocol {
    func prepIngred()
    func prepLunchi()
}

class ChukaryoriChef: RestaurInjectableProtocol  {
    func prepIngred() {
        print("prep complete")
    }
    
    func prepLunchi() {
        fryingEggie()
        print("preping lunqi")
    }
    
    func fryingEggie() {
        print("eggie fried")
    }
}

class ItaliCuisineChef: RestaurInjectableProtocol  {
    func prepIngred() {
        print("prep complete")
    }
    
    func prepLunchi() {
        cookSpaghetti()
        print("preping lunqi")
    }
    
    func cookSpaghetti() {
        print("spaghetti cooked")
    }
}

// __________________________

class GiantBankGateway {
    func processingSale(amount: Double, onComplete: (_ result: Result) -> Void) {
    }
}
// vs
protocol GatewayProtocol {
    func processingSale(amount: Double, onComplete: (_ result: Result) -> Void)
}

class InjectedRestau {
    let chefer: RestaurInjectableProtocol
    let gateway: GatewayProtocol       // let gateway: GiantBankGateway
    
    init(chefer: RestaurInjectableProtocol, gtway: GatewayProtocol) {   // gtway: GiantBankGateway ) {
        self.chefer = chefer
        self.gateway = gtway
    }
    
    func open() {
        chefer.prepIngred()
    }
    func prepaForLunchi() {
        chefer.prepLunchi()
    }
    
    func selling(item: String, amount: Double) {
        gateway.processingSale(amount: amount) { (result) in
            switch result {
            case .Failure(let erro):
                print(erro.description)
            case .Success(let confirmation):
                print(confirmation)
            }
        }
    }
}


// ________________________________
// dependency-injection-less

class DominicanCuisineChef {
    func prepIngredients() {
        print("prepas complete")
    }
    func cookStew() {
        print("stew cooked")
    }
}

class UninjectedRestau {
    let chefer: DominicanCuisineChef
    init(chefer: DominicanCuisineChef) {
        self.chefer = chefer
    }
    
    func open() {
        chefer.prepIngredients()
    }
    func prepaForLunchi() {
        chefer.cookStew()
    }
}





