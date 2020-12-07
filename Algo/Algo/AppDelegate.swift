//
//  AppDelegate.swift
//  Algo
//
//  Created by Jerry Ren on 6/6/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let queueForThreadTrouble = DispatchQueue(label: "queueForThreadTrouble")
    
    let serialism = DispatchQueue(label: "come.queue.serial")
    var dataRaceStr = "starter _"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

//        var imageryies = [String]()
//        var mutatingCount = 0
//
//        queueForThreadTrouble.async { // this async purposely crashes the app hah
//            for _ in 0...1001 {
//                imageryies.append("ImageQueueOne")
//                mutatingCount += 1
//            }
//        }
//        for _ in 0...1001 {
//            imageryies.append("ImageMainThread") // fatal-erroed hahaha, good sh*t
//            mutatingCount += 1
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
//            print("Mutating count is  ", mutatingCount)
//            print("Imagery count is:  ", imageryies.count )
//        }
        
       //  MARK: -
        
        //        DispatchQueue.global().async {
        //            self.dataRaceStr += "dataRace "   // enable thread sanitizer to see the purple warning.
        //        }
        //        print(dataRaceStr)
        
        serialism.async {
          print("3")
      }; serialism.sync {
          print("1")
      }; serialism.async {
          print("4")
      };
             
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

