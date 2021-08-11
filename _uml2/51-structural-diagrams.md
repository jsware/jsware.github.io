---
title: Structural Diagrams
excerpt: Class, object, composite structure, component, deployment, artifact and package diagrams.
toc: true
toc_sticky: true
image: &image /assets/images/uml2/classes.drawio.svg
permalink: /uml2/structural-diagrams.html
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
The UML's structural diagrams exist to visualise, specify, construct and document the static aspects of a system. They are roughly organised around the major groups of things you'll find when modelling a system:

| Class Diagram                | Classes, interfaces and collaborations |
| Object Diagram               | Objects                                |
| Composite Structure Diagram  | Internal structure                     |
| Component Diagram            | Components                             |
| Deployment Diagram           | Nodes                                  |
| Artifact Diagram<sup>1</sup> | Artifacts                              |
| Package Diagrams             | UML model management                   |

<sup>1</sup> The UML considers Artifact Diagrams as types of Deployment Diagrams.

Package Diagrams are used to organise the design itself, rather than classes that organise the implementation constructs of the design. Unlike components, which exist at run-time, a package is purely conceptual and exists only at development time.

## Class Diagrams

A class diagram shows the set of classes, interfaces and collaborations along with their relationships. These are the most common diagram in object-oriented systems. Class diagrams illustrate the static design view of a system illustrating the conceptual elements that exist in the system.

## Object Diagrams

Object diagrams show a set of objects (instances of classes) and their relationships. Object diagrams represent a snapshot of the instances of the things found in class diagrams. They address the static design view of a system as do class diagrams but illustrate concrete instances of the things in class diagrams.

## Composite Structure Diagrams

A composite structure diagram shows the internal structure of a class or collaboration. The difference between a component and composite structure diagram is small.

## Component Diagrams

A component diagram shows the logical, replaceable parts of the system, the interfaces they conform to and the dependencies between them. Component diagrams often illustrate the composite structure of one or more of these components. Component diagrams address the static design implementation view of a system. They are important for building larger systems from smaller parts.

## Deployment Diagrams

A deployment diagram shows the configuration of run-time processing nodes and the components that live on them. Deployment diagrams address the static deployment view of a system.

## Artifact Diagrams

The UML treats an artifact diagram as a type of deployment diagram that illustrates the physical parts of a system. Artifacts include files, databases and similar physical collections of things. Artifacts can also show the classes and components that they implement.

## Package Diagrams

A package diagram shows the decomposition of the model itself into organisational units. Package diagrams are used to organise the design itself, rather than classes that organise the implementation constructs of the design. Unlike components, which exist at run-time, a package is purely conceptual and exists only at development time.
