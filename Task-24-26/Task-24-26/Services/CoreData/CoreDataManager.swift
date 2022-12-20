//
//  CoreDataManager.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import CoreData

protocol CoreDataManagerProtocol {
    func fetchTodos() -> [CDTodo]?
    func fetchTodos(by text: String) -> [CDTodo]?
    func createRecipe(with data: Todo)
    func delete(todo: CDTodo)
}

/// Responsible for CRUD operations with CoreData.
public final class CoreDataManager: CoreDataManagerProtocol {
    
    // MARK: - Private Properties
    
    private let managedObjectContext: NSManagedObjectContext
    private let persistentContainer: NSPersistentContainer
    
    // MARK: - Init
    
    /// Common init.
    init(containerName: String) {
        persistentContainer = NSPersistentContainer(name: containerName)
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        managedObjectContext = persistentContainer.newBackgroundContext()
    }
    
    /// Saves managed object contexts.
    private func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createRecipe(with data: Todo) {
        let todo = CDTodo(context: managedObjectContext)
        todo.userID = Int32(data.userID)
        todo.id = Int32(data.id)
        todo.title = data.title
        todo.completed = data.completed
        saveContext()
    }
    
    func fetchTodos() -> [CDTodo]? {
        try? managedObjectContext.fetch(CDTodo.fetchRequest())
    }
    
    func fetchTodos(by text: String) -> [CDTodo]? {
        let fetchRequest = CDTodo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title = %@", text)
        return try? managedObjectContext.fetch(fetchRequest)
    }
    
    func delete(todo: CDTodo) {
        managedObjectContext.delete(todo)
        saveContext()
    }
}
