---
title: Structural Classification
excerpt: Class diagrams, internal structure diagrams, collaboration diagrams, component diagrams and use case diagrams.
toc: true
toc_sticky: true
image: &image /assets/images/uml2/classes.drawio.svg
permalink: /uml2/structural-classification.html
tags:
  - UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---

## Static View

The static view models concepts in the system domain as well as internal concepts invented as part of the implementation of the system. The static view does not describe the time-dependent behaviour of the system, which is described in other views. The main constituents of the static view are classes and their relationships, associations, generalisation, dependencies and realisations.

### Class Diagrams

A class is the description of a concept from the application domain or the application solution. Classes are the centre around which the class view is organised.

## Design View

The static view models the concepts of the system from a logical viewpoint. The design view models the design structure of the system itself, such as its expansion into structured classifiers, the collaborations that provide functionality and its assembly from components with well defined interfaces.

### Internal Structure Diagrams

Once the design process begins, classes must be decomposed into collections of connected parts that may be further decomposed in turn. A structured classifier models the parts and their connectors, encapsulating them by forcing communications from outside to pass through ports (windows into an encapsulated classifier). An internal structure diagram shows this decomposition of a class.

### Collaboration Diagrams

Collaborations are contextual relationships among sets of objects that work together to fulfil some purpose. It contains a collection of roles within a generic pattern that can be played by individual objects. A collaboration diagram may show connectors between the roles to describe the contextual relationship.

### Component Diagrams

A component is a kind of structured classifier, so its internal structure may be defined on an internal structure diagram. A component diagram shows the components in a system – the software units from which the system is constructed. It also shows the dependencies between components so that the impact of a proposed change can be assessed.

## Use Case View

The Use Case View models the functionality of a system as perceived by outside agents (known as actors) that interact with the system in particular ways. A use case is a unit of functionality expressed as a transaction among actors and the system. The purpose of the use case view is to list the actors and use cases and to show which actors participate in each use case.

### Use Case Diagram

A use case diagram shows a set of use cases and actors (special kinds of classes) and their relationships. Use case diagrams address the static use case view of a system and are especially important in organising and modelling the behaviours of the system.
