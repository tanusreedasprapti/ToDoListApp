import Foundation
// Made by Nayan Das
// Follow ME: https://socialportal.nayanchandradas.com

// Define Task Structure
struct Task: Codable {
    var title: String
    var deadline: Date
    var priority: Int
    
    // Custom description for each task
    func description() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return "\(title) | Deadline: \(dateFormatter.string(from: deadline)) | Priority: \(priority)"
    }
}

// ToDoListManager Class to manage tasks
class ToDoListManager {
    private var tasks: [Task] = []
    private let storageFile = "tasks.json"
    
    init() {
        loadTasks()
    }
    
    // Add a task
    func addTask(title: String, deadline: Date, priority: Int) {
        let task = Task(title: title, deadline: deadline, priority: priority)
        tasks.append(task)
        saveTasks()
    }
    
    // Remove a task
    func removeTask(index: Int) {
        if index < tasks.count {
            tasks.remove(at: index)
            saveTasks()
        } else {
            print("Invalid task index")
        }
    }
    
    // Edit a task
    func editTask(index: Int, newTitle: String? = nil, newDeadline: Date? = nil, newPriority: Int? = nil) {
        if index < tasks.count {
            if let title = newTitle {
                tasks[index].title = title
            }
            if let deadline = newDeadline {
                tasks[index].deadline = deadline
            }
            if let priority = newPriority {
                tasks[index].priority = priority
            }
            saveTasks()
        } else {
            print("Invalid task index")
        }
    }
    
    // List all tasks
    func listTasks() {
        for (index, task) in tasks.enumerated() {
            print("\(index): \(task.description())")
        }
    }
    
    // Save tasks to JSON file
    private func saveTasks() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        
        do {
            let data = try encoder.encode(tasks)
            try data.write(to: URL(fileURLWithPath: storageFile))
        } catch {
            print("Error saving tasks: \(error)")
        }
    }
    
    // Load tasks from JSON file
    private func loadTasks() {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        if FileManager.default.fileExists(atPath: storageFile) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: storageFile))
                tasks = try decoder.decode([Task].self, from: data)
            } catch {
                print("Error loading tasks: \(error)")
            }
        }
    }
}

// Date helper function
func dateFromString(_ string: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    return dateFormatter.date(from: string)
}

// Main program flow
let manager = ToDoListManager()

while true {
    print("""
        \nTo-Do List Manager
        1. Add Task
        2. Remove Task
        3. Edit Task
        4. List Tasks
        5. Exit
        Enter your choice:
        """)
    
    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            print("Enter task title:")
            if let title = readLine() {
                print("Enter deadline (yyyy-MM-dd HH:mm):")
                if let deadlineInput = readLine(), let deadline = dateFromString(deadlineInput) {
                    print("Enter priority (1-5):")
                    if let priorityInput = readLine(), let priority = Int(priorityInput) {
                        manager.addTask(title: title, deadline: deadline, priority: priority)
                        print("Task added successfully.")
                    }
                }
            }
        case 2:
            manager.listTasks()
            print("Enter task index to remove:")
            if let indexInput = readLine(), let index = Int(indexInput) {
                manager.removeTask(index: index)
                print("Task removed successfully.")
            }
        case 3:
            manager.listTasks()
            print("Enter task index to edit:")
            if let indexInput = readLine(), let index = Int(indexInput) {
                print("Enter new title (or press Enter to skip):")
                let newTitle = readLine()
                
                print("Enter new deadline (yyyy-MM-dd HH:mm) (or press Enter to skip):")
                let newDeadlineInput = readLine()
                let newDeadline = dateFromString(newDeadlineInput ?? "")
                
                print("Enter new priority (1-5) (or press Enter to skip):")
                let newPriorityInput = readLine()
                let newPriority = Int(newPriorityInput ?? "")
                
                manager.editTask(index: index, newTitle: newTitle, newDeadline: newDeadline, newPriority: newPriority)
                print("Task edited successfully.")
            }
        case 4:
            manager.listTasks()
        case 5:
            print("Exiting...")
            exit(0)
        default:
            print("Invalid choice. Try again.")
        }
    }
}
