//
//  AppDelegate.swift
//  Task-23
//
//  Created by Егор Бадмаев on 21.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        testQueue()
//        testSerialQueue()
//        testQueueFixDeadLock()
        testConcurrentToSerialQueue()
        
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

// MARK: - Home Work

private extension AppDelegate {
    
    /// # Задание 1
    /// Исследуйте код ниже и напишите, какие цифры должны вывестись в консоль,
    /// обьясните своими словами, почему именно такая последовательность по шагам.
    ///
    /// Output: `1, 9, 2, 3`
    func testQueue() {
        /// 1. "1" выводится в консоль первым, т.к выполняется синхронно.
        print("1")
        
        DispatchQueue.main.async {
            /// 3. "2" выводится после "1" и "9", т.к. выполняется асинхронно.
            print("2")
            
            DispatchQueue.global(qos: .background).sync {
                
                /// 4. "3" выведется после "2", т.к выполняется синхронно.
                print("3")
                
                /// 5. Вызов `sync` на главном потоке приводит к dead-lock'у => код после него выполняться не будет.
                DispatchQueue.main.sync {
                    print("4")
                    
                    DispatchQueue.global(qos: .background).async {
                        print("5")
                    }
                    print("6")
                }
                print("7")
            }
            print("8")
        }
        
        /// 2. "9" выполняется после "1", т.к выполняется синхронно после асинхронного блока.
        print("9")
    }
    
    /// # Задание 2
    /// 1. Создайте свою серийную очередь и замените в примере ею `DispatchQueue.main`.
    /// 2. Создайте свою конкурентную очередь и заменить ей `DispatchQueue.global(qos: .background)`.
    /// Какой будет результат? Всегда ли будет одинаковым. И почему?
    func testSerialQueue() {
        let serialQueue = DispatchQueue(label: "serialQueue")
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", qos: .userInitiated, attributes: .concurrent)
        
        print("1")
        
        serialQueue.async {
            print("2")
            
            concurrentQueue.sync {
                print("3")
                
                /// Dead-lock остался, потому что последовательная очередь имеет только один поток. и у нас больше нет потоков, чтобы запустить этот код.
                serialQueue.sync {
                    print("4")
                    
                    concurrentQueue.async {
                        print("5")
                    }
                    print("6")
                }
                
                print("7")
            }
            
            print("8")
        }
        
        print("9")
    }
    
    /// При выполнении первого пункта, результат изменился и стал `1 2 3 9`, поскольку мы ставим задачу асинхронно к главному потоку в другую серийную очередь, таким образом быстрее сработает тот вывод, поток для которого будет быстрее.
    /// После выполнения второго пункта, результат ещё раз изменился и стал `1 9 2 3`. Это происходит потому, что кокуреная очередь отличается приоритетом.
    /// Оба результат выше постоянные.
    
    /// # Задание 3
    /// Какой по номеру надо поменять sync/sync чтобы не возникало дедлока в обоих случаях
    func testQueueFixDeadLock() {
        print("1")
        
        DispatchQueue.main.async {
            print("2")
            
            DispatchQueue.global(qos: .background).sync {
                print("3")
                
                /// Замена `sync` на `async`.
                DispatchQueue.main.async {
                    print("4")
                    
                    DispatchQueue.global(qos: .background).async {
                        print("5")
                    }
                    print("6")
                }
                print("7")
            }
            print("8")
        }
        
        print("9")
    }
    
    /// # Задание 4
    /// Как можно сделать в примере, чтобы очередь превратилась **из конкурентной в серийную**, подправте пример не исправляя создания самой очереди?
    ///
    /// Для этого воспользуемся механизмом Barrier, предоставляемом Grand Central Dispatch.
    func testConcurrentToSerialQueue() {
        let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
        
        print("1")
        
        DispatchQueue.main.async {
            print("2")
            
            concurrentQueue.async(flags: .barrier) {
                print("3")
                
                DispatchQueue.main.sync {
                    print("4")
                    
                    DispatchQueue.global(qos: .background).async {
                        print("5")
                    }
                    print("6")
                }
                print("7")
            }
            print("8")
        }
        print("9")
    }
}
