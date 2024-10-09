# To-Do List Application

This is a simple command-line To-Do List application written in Swift, designed to help you manage tasks with deadlines and priorities. The tasks are stored in a JSON file (`tasks.json`) to ensure persistence between application runs.

## Features

- **Add Task**: Add a task with a title, deadline, and priority.
- **Remove Task**: Delete a task by its index.
- **Edit Task**: Modify the details of a task (title, deadline, or priority).
- **List Tasks**: View all tasks along with their details such as deadline and priority.
- **Data Persistence**: Tasks are saved in a JSON file for future use.

## Project Structure

```bash
ToDoListApp/
├── Sources/
│   └── ToDoListApp.swift    # Main application logic
└── tasks.json            # JSON file to store tasks
```

## Prerequisites

1. **Swift**: Install the Swift toolchain for Windows from the official Swift website [Swift Downloads](https://www.swift.org/download/#releases).
2. **Visual Studio Code**: A lightweight editor, combined with extensions like **Swift Language** for Swift support and **CodeLLDB** for debugging.
   
   - Install **Swift Language** extension: for syntax highlighting and autocompletion.
   - Install **CodeLLDB** extension: for debugging Swift code in VS Code.

## Installation and Setup

1. Clone this repository or download the project files.
2. Open the project folder in Visual Studio Code.
3. Open a terminal in the project directory and run the following command to initialize the Swift package:
    ```bash
    swift package init --type executable
    ```
    This will generate the necessary package files, including `Package.swift`.

4. Ensure your project structure matches the one provided above.

5. Run the following command to compile and execute the project:
    ```bash
    swift run
    ```

## Usage

Upon running the application, you'll be prompted with the following menu:

```
To-Do List Manager
1. Add Task
2. Remove Task
3. Edit Task
4. List Tasks
5. Exit
Enter your choice:
```

- **Add Task**: Follow the prompts to add a task by providing its title, deadline (in `yyyy-MM-dd HH:mm` format), and priority (between 1 and 5).
- **Remove Task**: Provide the task's index to remove it from the list.
- **Edit Task**: Edit an existing task by selecting its index and modifying the title, deadline, or priority.
- **List Tasks**: Displays all the tasks along with their details.
- **Exit**: Exit the application.

### Sample Commands

1. To add a task:
    ```
    Enter task title: Complete Swift Project
    Enter deadline (yyyy-MM-dd HH:mm): 2024-10-12 18:00
    Enter priority (1-5): 3
    ```

2. To remove a task:
    ```
    Enter task index to remove: 1
    ```

3. To edit a task:
    ```
    Enter task index to edit: 2
    Enter new title (or press Enter to skip): Write README
    Enter new deadline (yyyy-MM-dd HH:mm) (or press Enter to skip): 2024-10-10 12:00
    Enter new priority (1-5) (or press Enter to skip): 4
    ```

## Data Persistence

- All tasks are saved in the `tasks.json` file located in the root directory of the project. This ensures that tasks are not lost after closing the application. The file is automatically updated whenever a task is added, edited, or removed.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Swift.org team for bringing Swift to multiple platforms, including Windows.

