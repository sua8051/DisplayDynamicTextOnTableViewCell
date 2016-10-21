# DisplayDynamicTextOnTableViewCell

Use to display cell on table view with different height 

1. Compute height of text
2. overried heightForRowAtIndexPath func
3. Add height constraint >= for label with different line


```swift
 func heightForView(text:String, font: UIFont, width: CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.bounds.height
    }
```
