
# App Development with Swift

- [App Development with Swift](#app-development-with-swift)
  * [Loops](#loops)
    + [For Loops](#for-loops)
  * [Segues and Navigation Controllers](#segues-and-navigation-controllers)
    + [Unwind to Segue](#unwind-to-segue)
    + [Pass Information](#pass-information)
    + [Programatic Segues](#programatic-segues)
  * [Tab Bar Controllers](#tab-bar-controllers)
    + [Programmatic Customization](#programmatic-customization)
  * [Protocols](#protocols)
    + [CustomStringConvertible](#customstringconvertible)
    + [Equatable](#equatable)
    + [Comparable](#comparable)
    + [Codable](#codable)
    + [Creating a Protocol](#creating-a-protocol)
  * [Scroll Views](#scroll-views)
    + [Keyboard Issues](#keyboard-issues)
    + [Content Insets & Scroll Indicator Insets](#content-insets---scroll-indicator-insets)
    + [Zooming](#zooming)
  * [Table Views](#table-views)
    + [Table View Data Source](#table-view-data-source)
      - [Number of Sections](#number-of-sections)
      - [Number of Rows in a Section](#number-of-rows-in-a-section)
      - [Cell for Row at Index Path](#cell-for-row-at-index-path)
    + [Table View Delegate](#table-view-delegate)
      - [Responding to Accessory View Interaction](#responding-to-accessory-view-interaction)
      - [Responding to User Interaction](#responding-to-user-interaction)
    + [Edit the Table View](#edit-the-table-view)
      - [Move Rows](#move-rows)
      - [Remove the delete indicator](#remove-the-delete-indicator)
    + [Reload Data](#reload-data)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

## Loops
### For Loops
Input:
```
  for index in 1 ... 5 {
    print(index)
  }
```
Console Output: 
```
1
2
3
4
5
```
 ---
Input:
```
  for _ in 1..3 {
    print ("Hello!")
  }
```
Console Output: 
```
Hello!
Hello!
Hello!
```
---
Input:
```
  let names = ["Joseph", "Cathy", "Winston"]
  for names in name {
    print ("Hello! \(name)")
  }
```
Console Output: 
```
Hello Joseph
Hello Cathy
Hello Winston
```
---
Input:
```
  for letter in "ABCD" {
    print (letter)
  }
```
Console Output: 
```
A
B
C
D
```
---
Input:
```
  for (index, letter) in "ABCD".enumerated() {
    print ("\(index) : \(letter)")
  }
```
Console Output: 
```
0: A
1: B
2: C
3: D
```
---
Input:
```
  let vehicles = [("unicycle" : 1, "bicycle" : 2, "tricycle" : 3, "quad bike" : 4)]
  for (vehicleName, wheelCount) in vehicles {
    print ("A \(vehicleName) has \(wheelCount) wheels")
  }
```
Console Output: 
```
A bicycle has 2 wheels
A unicycle has 1 wheels
A tricycle has 3 wheels
A quad bike has 4 wheels
```

## Segues and Navigation Controllers 
### Unwind to Segue
```
@IBAction func unwindToMyView(unwindSegue: UIStoryboardSegue) {

}
```
### Pass Information 
```
  override func prepare(for segue: UIStoryboardSegue, sender: nameoftheButton) {
    segue.destination.navigationItem.title = textField.text  
  }
```

### Programatic Segues
```
  @IBAction func buttonTapped(_ sender: Any) {
    perfomSegue(withIdentifier: "mySegue", sender: nameoftheButton)  
  }
```
## Tab Bar Controllers
### Programmatic Customization
```
tabBarItem.badgeValue = "!"  
```
To remove the badge:
 ```
tabBarItem.badgeValue = nil
```
## Protocols
### CustomStringConvertible
```
  class MyClass: CustomStringConvertible {  
    // ...  
    var description: String {  
      return "Whatever you want" 
    }
  }
```
### Equatable
```
  class Employee: Equatable {  
    // ...  
    static func == (lhs: MyObj, rhs: MyObj) {
      //Logic that determines whether the Value on the left hand side and right hand side are equal.  
      return lhs.firstname == rhs.firstname && lhs.lastname == rhs.lastname  
    }  
  }
```
### Comparable 
```
  class Employee: Equatable, Comparable {  
    // ...  
    static func < (lhs: Employee, rhs: Employee) -> Bool {
      return lhs.name < rhs.name
    } 
}
```
 > You can use the `sorted(by: )` function to return the sorted array: 
```
  let employees = [employee1, employee2, employee3]
  let sortedEmployees = employees.sorted(by: <)
```

### Codable 
```
  import Foundation
  
  class Employee: Equatable, Comparable, Codable {  
    // ...  
    } 
    let ben = Employee (firstName: "Ben, lastName: "Aktins". jobTitle: "Front Desk", phoneNumber: "415-555-7767")
    
    let jsonEncoder = JSONEncoder()
    if let jsonData = try? sconEncoder.encode(ben), 
    let jsonString = String (data: jsonData, encoding: .utf8)
```
### Creating a Protocol
 > Protocols place requirements on object's interface, but do not restrict implementation from providing more operations than that.
```
  protocol FullyNamed {
  var fullName: String { get }
  func sayFullName()
  }
```
 > The `{ get }` following the fullName property indicates that it is read-only, meaning that the value of the property can be viewed, but never changed.  

```
  struct Person: FullyNamed {
    var fullName: String
    var age: Int
    func sayFullName() {
      print("My Full Name is \(fullName)")
    }
  }
  var john: FullyNamed = Person(fullName: "John Lennon", age: 24)
  john.fullName = "newValue" //Not allowed!
```
## Scroll Views
### Keyboard Issues
To adjust the size of the content view, you'll need to create an outlet from the scroll view to its view controller. Then you can add the following code to the ViewController class to fix the keyboard issues:
```
  func registerForKeyboardNotifications() {
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: .UIResponder.keyboardDidShowNotification, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWasShown(_ notificiation: NSNotification) {
      guard let info = notificiation.userInfo,
            let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
      else { return } 
          
      let keyboardFrame = keyboardFrameValue.cgRectValue
      let keyboardSize = keyboardFrame.size
 
      let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
      scrollView.contentInset = contentInsets
      scrollView.scrollIndicatorInsets = contentInsets
  }
 
  @objc func keyboardWillBeHidden(_ notification: NSNotification) {
      let contentInsets = UIEdgeInsets.zero
      scrollView.contentInset = contentInsets
      scrollView.scrollIndicatorInsets = contentInsets
  }
```
Then add the following line to viewDidLoad():
```
registerForKeyboardNotifications()
```
### Content Insets & Scroll Indicator Insets

```
  let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
  scrollView.contentInset = contentInsets
  scrollView.scrollIndicatorInsets = contentInsets
```
### Zooming
 > (p. 602)
```
class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageVIew
        }
    
    func updateZoomFor (size: CGSize){
        let widthScale = size.width / imageVIew.bounds.width
        let heightScale = size.height / imageVIew.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateZoomFor(size: view.bounds.size)
    }
}
```


## Table Views
### Table View Data Source
#### Number of Sections 
In the number of sections you return as an Int the number of sections you wish the table view to display
```
  optional func numberOfSections(in tableView: UITableView) -> Int 
  
```
 > If you choose not to write this functions, the table view will assume it should only display one section. 
 
#### Number of Rows in a Section 
The method has two parameters: the table view requesting the information and the 'section' in question. Based on these parameters, your job is to return an Int representing the number of rows for the given section,
```
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  
```
#### Cell for Row at Index Path
```
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  
```
  Steps for implementation (most of cases):
1. Fetch the correct cell type by dequeueing a cell.  

```
  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
  
```

2. Fetch the model object to be displayed.

```
  let object = objects[indexPath.row]

```

3. Configure the cell's properties with the model object properties; i.e., set views (label, image views, etc.) based on model object.

```
  cell.textLabel?.text = "titleText"
  cell.detailTextLabel?.text = "descriptionText"
```

4. Return fully configured cell.

```
return cell
```
 
### Table View Delegate
#### Responding to Accessory View Interaction
```
  tableView(_:accessoryButtonTappedForRowWith:)
  
```
#### Responding to User Interaction 
```
  override func tableView(_ tableView: UITableView, :didSelectRowAt: indexPath: IndexPath) {
  // ...
  }
 
```
 > The currently selected indexPath is accessible through the table view property `indexPathForSelectedRow`. Once the selection is completed, `tableView(_didSelectRowAt: )` is called and you're provided with the indexPath of the selected Row.

### Edit the Table View
#### Move Rows
1. Add following line to the method `tableView(_:cellForRowAt:)` just before the `return` statment:

```
cell.showsReorderControl = true

```
 2. Put the table view into edditing mode using the `setEditing(_:animated:)` function

```
  @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
    let tableViewEditingMode = tableView.isEditing
 
    tableView.setEditing(!tableViewEditingMode, animated: true)
}

```

  - Alternatively, in `viewDidLoad` set the `leftBarButtonItem` to `editButtonItem`, an already-defined button that switches the table view's editing mode on and off.
  
```
  navigationItem.leftBarButtonItem = editButtonItem
  
```

3. Next, implement the `tableView(_:, moveRowAt fromIndexPath:, to:)` method.

```
  let movedEmoji = emojis.remove(at: fromIndexPath.row)
  emojis.insert(movedEmoji, at: to.row)
  tableView.reloadData()
```
#### Remove the delete indicator 
```
  override func tableView(_ tableView: UITableView, 
  editingStyleForRowAt indexPath: IndexPath) -> 
  UITableViewCell.EditingStyle {
    return .none
}
```

### Reload Data
```
  override func viewWillAppear(_ animated: Bool) {
    tableView.reloadData()
  }
```
