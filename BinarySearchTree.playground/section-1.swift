// Playground - noun: a place where people can play

import UIKit

class Tree {
    var value: Int!
    var leftChild: Tree?
    var rightChild: Tree?
    
    init (value: Int) {
        self.value = value
    }
    
    func setValue (value: Int) {
        if value == self.value {
            return
        } else if value < self.value {
            if self.leftChild == nil {
                self.leftChild = Tree(value: value)
            } else {
                self.leftChild!.setValue(value)
            }
        } else if value > self.value {
            if self.rightChild == nil {
                self.rightChild = Tree(value: value)
            } else {
                self.rightChild!.setValue(value)
            }
        }
    }
    
    func removeValue (value: Int) {
        var parent = Tree(value: 0)
        if value > self.value {
            if self.rightChild != nil {
                parent = self
                self.rightChild?.removeValue(value)
            } else {
                return
            }
        } else if value < self.value {
            if self.leftChild != nil {
                parent = self
                self.leftChild?.removeValue(value)
            } else {
                return
            }
        } else if value == self.value {
            
        }
    }
}

var searchTree = Tree(value: 100)
searchTree.setValue(50)
searchTree.setValue(150)
searchTree.setValue(70)
searchTree.setValue(45)
searchTree.setValue(30)
searchTree.setValue(200)
searchTree.setValue(135)
searchTree.setValue(400)

