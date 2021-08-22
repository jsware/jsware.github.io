---
title: Common Mechanisms
excerpt: Specifications, adornments, common divisions and extensibility mechanisms.
toc: true
toc_sticky: true
image: &image /assets/images/uml2/common-mechanisms.drawio.svg
permalink: /uml2/common-mechanisms.html
tags:
  - UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
The UML has four common mechanisms that apply consistently throughout the UML: specifications, adornments, common divisions and extensibility mechanisms. Each describes a strategy for approaching modelling that can be applied repeatedly in different contexts.

See the referenced books for full details. The following subsections discuss some particularly important common mechanisms.

## Classifiers & Instances

The UML considers that there are types of things (such as an order) and concrete instances of things (such as order number 1234). The abstract notion of a type of thing is called a classifier while the concrete things themselves are called instances.

This is a very important concept that is easy to grasp. Classifiers and instances surround us, for example Cars and the Car with registration AB12 CDE; Products and children's play sand; Suppliers and Sony. The notion of classifier and instance is a key concept that permeates the UML.

In the UML an instance usually has the same symbol as its corresponding classifier, but the name of the instance is underlined. The UML has a rich taxonomy of 33 classifiers. The most common of these are discussed throughout these pages.

## Interfaces & Implementations

The key mechanism here is to separate what something does (its interface) from how it does it (its implementation). For example, when you drive a car, you are interacting with a very simple, but well-defined interface. Different cars implement this interface in significantly different ways.

Example of interfaces and implementation are everywhere, for example the simple interface to the lift hiding a significantly complex mechanism; the interface to the drinks machine hiding another internal mechanism and a similar interface to the vending machine hiding a significantly *different* internal mechanism. These interfaces shield the internal complexity by hiding it.

## Constraints

A constraint is simply a text string in `{ }` braces that specifies a condition or rule about the modelling element that must be maintained as true. It constrains one or more features of the element in some way. You will encounter instances of constraints throughout UML models.

## Stereotypes

In the UML, a stereotype represents a variation of an existing model element. Stereotypes allow you to introduce new modelling elements based on *existing* elements. This is done by enclosing the stereotype name in guillemets (`<<` … `>>`).

As stereotypes introduce new modelling elements with different intent, they must be defined somewhere. The UML provides a number of predefined stereotypes for common situations. Care should be taken in adding your own. If necessary, the most common mechanism for defining their meaning is to put a note on the model or insert a reference to an external document.
