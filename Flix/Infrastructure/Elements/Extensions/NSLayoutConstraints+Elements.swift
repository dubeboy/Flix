//
//  NSLayoutConstraints+Elements.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/04.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

// DISCLAIMER - COPIED FROM ONE OF MY SIDE PROJECTS still need to turned it into a library 😅

import UIKit

precedencegroup NSLayoutPrecedence {
    higherThan: AdditionPrecedence
    associativity: left
}

infix operator -->: NSLayoutPrecedence
infix operator ->=: NSLayoutPrecedence
infix operator -<=: NSLayoutPrecedence
infix operator +: AdditionPrecedence

@discardableResult
func -->(lhs: UIView, rhs: UIView) -> (NSLayoutConstraint, NSLayoutConstraint, NSLayoutConstraint, NSLayoutConstraint) {
    lhs.translatesAutoresizingMaskIntoConstraints = false
    let leading = lhs.leadingAnchor --> rhs.leadingAnchor
    let trailing = lhs.trailingAnchor --> rhs.trailingAnchor
    let top = lhs.topAnchor --> rhs.topAnchor
    let bottom = lhs.bottomAnchor --> rhs.bottomAnchor
    return (top, leading, bottom, trailing)
}


@discardableResult
func -->(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    let contraint = lhs.constraint(equalTo: rhs)
    contraint.isActive = true
    return contraint
}

@discardableResult
func ->=(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    let contraint = lhs.constraint(greaterThanOrEqualTo: rhs)
    contraint.isActive = true
    return contraint
}

@discardableResult
func ->=(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    let contraint = lhs.constraint(greaterThanOrEqualTo: rhs)
    contraint.isActive = true
    return contraint
}


@discardableResult
func -<=(lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
    let contraint = lhs.constraint(lessThanOrEqualTo: rhs)
    contraint.isActive = true
    return contraint
}

@discardableResult
func -<=(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    let contraint = lhs.constraint(lessThanOrEqualTo: rhs)
    contraint.isActive = true
    return contraint
}


@discardableResult
func -->(lhs: NSLayoutYAxisAnchor, rhs: NSLayoutYAxisAnchor) -> NSLayoutConstraint {
    let contraint = lhs.constraint(equalTo: rhs)
    contraint.isActive = true
    return contraint
}

func -->(lhs: NSLayoutDimension, rhs: CGFloat) {
    lhs.constraint(equalToConstant: rhs).isActive = true
}

func ->=(lhs: NSLayoutDimension, rhs: CGFloat) {
    lhs.constraint(greaterThanOrEqualToConstant: rhs).isActive = true
}


func -->(lhs: NSLayoutDimension, rhs: NSLayoutDimension) {
    lhs.constraint(equalTo: rhs).isActive = true
}

@discardableResult
func +(lhs: NSLayoutConstraint, rhs: CGFloat) -> NSLayoutConstraint  {
    lhs.constant = rhs
    return lhs
}


