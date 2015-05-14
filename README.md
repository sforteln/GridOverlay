#GridOverlay
### This swift class will overlay a grid over your UI to help make sure UI elements align to redlines.

![Example screen](/exampleScreen.png)


### Installation: 
  Copy the GridOverlay.swift class to your project
### Usage:
#### In code:
```
override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        GridOverlay.gridColor = UIColor.redColor()
        GridOverlay.gridSize = CGSizeMake(30, 30)
        GridOverlay.show()
    }
```
#### In the debugger:
You can also show, hide, or configure the GridOverlay at runtime but setting a breakpoint and executing the commands in the debugger. 

```
expr GridOverlay.show()
```
You will need to let the app process the main thread's runloop so the UI can be updated after executing the command in the debugger.

_Note: you may need to import UIKit in the debugger session to use UIColor, etc_
```
expr @import UIKit
```

