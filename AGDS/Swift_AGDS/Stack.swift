//
//  Stack.swift
//  Swift_AGDS
//
//  Created by MacBook on 24.07.2023.
//

import Foundation

public final class Stack<E>: Sequence {
  private var top: Node<E>? = nil
  private(set) var count: Int = 0
  
  fileprivate class Node<E> {
    fileprivate var item: E
    fileprivate var next: Node<E>?
    
    fileprivate init(item: E, next: Node<E>? = nil) {
      self.item = item
      self.next = next
    }
  }
  
  init() {}
  
  func push(_ item: E) {
    let oldTop = top
    top = Node<E>(item: item, next: oldTop)
    count += 1
  }
  
  func pop() -> E? {
    if let item = top?.item {
      top = top?.next
      count -= 1
      return item
    }
    return nil
  }
  
  func peek() -> E? {
    return top?.item
  }
  
  func isEmpty() -> Bool {
    return top == nil
  }
  
  public struct StackIterator<E> : IteratorProtocol {
    private var current: Node<E>?
    
    fileprivate init(current: Node<E>?) {
      self.current = current
    }
    
    public mutating func next() -> E? {
      if let item = current?.item {
        current = current?.next
        return item
      }
      return nil
    }
  }
  
  public func makeIterator() -> StackIterator<E> {
    return StackIterator(current: top)
  }
}
