//
//  Bag.swift
//  Swift_AGDS
//
//  Created by MacBook on 24.07.2023.
//

import Foundation

public final class Bag<E>: Sequence {
  private var first: Node<E>? = nil
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
  
  func add(_ item: E) {
    let oldFirst = first
    first = Node<E>(item: item, next: oldFirst)
    count += 1
  }
  
  func isEmpty() -> Bool {
    return first == nil
  }
  
  public struct BagIterator<E> : IteratorProtocol {
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
  
  public func makeIterator() -> BagIterator<E> {
    return BagIterator(current: first)
  }
}


