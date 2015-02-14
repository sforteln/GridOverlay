//
//  GridOverlay.swift
//  GridExample
//
//  Created by Simon Fortelny on 5/13/15.
//  Copyright (c) 2015 Simon Fortelny. All rights reserved.
//
import Foundation
import UIKit

private let _sharedInstance : GridOverlay = GridOverlay()

class GridOverlay : UIWindow{
    private weak var gridLayer : CALayer?
    private var gridColor : UIColor = UIColor.redColor()
    private var gridLineWidth : CGFloat = 1
    private var gridSize : CGSize = CGSizeMake(20, 20)
    private var gridOrigin : CGPoint = CGPointMake(0, 0)
    
    override func drawRect(rect: CGRect) {
        if let gridLayer = self.gridLayer{
            gridLayer.removeFromSuperlayer()
        }
        
        let grid = UIBezierPath()
        
        let numberOfColumns = Int(rect.size.width/gridSize.width)
        for index in 1...numberOfColumns {
            let xPos = gridOrigin.x + (gridSize.width * CGFloat(index))
            let startPoint = CGPointMake(xPos, gridOrigin.y)
            let endPoint = CGPointMake(xPos, self.frame.size.height)
            grid.moveToPoint(startPoint)
            grid.addLineToPoint(endPoint)
        }
        
        let numberOfRows = Int(rect.size.height/gridSize.height)
        for index in 1...numberOfRows {
            let yPos = gridOrigin.y + (gridSize.height * CGFloat(index))
            let startPoint = CGPointMake(gridOrigin.x, yPos)
            let endPoint = CGPointMake(self.frame.size.width, yPos)
            grid.moveToPoint(startPoint)
            grid.addLineToPoint(endPoint)
        }
        
        let gridLayer = CAShapeLayer()
        gridLayer.frame = rect
        gridLayer.path = grid.CGPath
        gridLayer.strokeColor = gridColor.CGColor
        gridLayer.lineWidth = gridLineWidth
        self.layer.addSublayer(gridLayer)
        self.gridLayer = gridLayer
        
    }
    
    //Class methods to make using in the debugger simpler
    class var gridColor : UIColor  {
        get {
        return _sharedInstance.gridColor
        }
        set(newValue) {
            _sharedInstance.gridColor = newValue
            _sharedInstance.setNeedsDisplay()
        }
    }
    
    class var gridLineWidth : CGFloat {
        get {
        return _sharedInstance.gridLineWidth
        }
        set(newValue) {
            _sharedInstance.gridLineWidth = newValue
            _sharedInstance.setNeedsDisplay()
        }
    }
    
    class var gridOrigin : CGPoint {
        get {
        return _sharedInstance.gridOrigin
        }
        set(newValue) {
            _sharedInstance.gridOrigin = newValue
            _sharedInstance.setNeedsDisplay()
        }
    }
    
    class var gridSize : CGSize {
        get {
        return _sharedInstance.gridSize
        }
        set(newValue) {
            _sharedInstance.gridSize = newValue
            _sharedInstance.setNeedsDisplay()
        }
    }
    
    class func show(){
        _sharedInstance.frame = UIScreen.mainScreen().bounds
        _sharedInstance.backgroundColor = UIColor.clearColor()
        _sharedInstance.windowLevel = UIWindowLevelAlert
        _sharedInstance.makeKeyAndVisible()
        _sharedInstance.userInteractionEnabled = false
    }
    
    class func hide(){
        _sharedInstance.hidden = true
    }
    
    class func moveX(points: CGFloat) {
        gridOrigin = CGPointMake(_sharedInstance.gridOrigin.x + points, _sharedInstance.gridOrigin.y)
    }
    
    class func moveY(points: CGFloat) {
        gridOrigin = CGPointMake(_sharedInstance.gridOrigin.x, _sharedInstance.gridOrigin.y + points)
    }
    
}