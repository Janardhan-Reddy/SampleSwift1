//
//  AppDelegate.swift
//  SampleSwift
//
//  Created by apple on 03/11/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
//        let vegetable = "red pepper"
//        switch vegetable {
//        case "celery":
//            print("Add some raisins and make ants on a log.")
//        case "cucumber", "watercress":
//            print("That would make a good tea sandwich.")
//        case let x where x.hasSuffix("pepper"):
//            print("Is it a spicy \(x)?")
//        default:
//            print("Everything tastes good in soup.")
//        }
//
        
       let interestingNumbers = [
            "Prime": [2, 3, 5, 7, 11, 13,17,19,23,29],
            "Fibonacci": [1, 1, 2, 3, 5, 8],
            "Square": [1, 4, 9, 16, 25],
        ]
        var largest = 0
        for (kind, numbers) in interestingNumbers {
              print(numbers)
            for number in numbers {
                if number > largest {
                    largest = number
                    print(largest)
                      print(kind)
                }
            }
        }
        
        return true
           }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

