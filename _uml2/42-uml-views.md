---
title: UML Views
excerpt: Structural classification, dynamic behaviour, physical layout, model management.
classes: wide
image: &image /assets/images/uml2/uml-views.drawio.svg
permalink: /uml2/uml-views.html
categories: Architecture
tags: UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
At the top level, UML views can be divided into the following major areas:

* **Structural Classification**: The things in the system and their relationship to other things.
* **Dynamic Behaviour**: The behaviour of the system or other classifiers over time.
* **Physical Layout**:	The computational resources in the system and the deployment of artifacts on them.
* **Model Management**:	The organisation of the models themselves into hierarchical units.

<table>
  <thead>
    <tr>
      <th>Major Area</th>
      <th>View</th>
      <th>Diagram</th>
      <th>Main Concepts</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td rowspan=5>Structural Classification</td>
        <td>Static View</td>
        <td>Class Diagram</td>
        <td>Association, Class, Dependency, Generalisation, Interface, Realisation.</td>
    </tr>
    <tr>
        <td rowspan=3>Design View</td>
        <td>Internal Structure</td>
        <td>Connector, Interface, Part, Port, provided interface, Role, Required Interface.</td>
    </tr>
    <tr>
        <td>Collaboration Diagram</td>
        <td>Connector, Collaboration, Collaboration Use, Role.</td>
    </tr>
    <tr>
        <td>Component Diagram</td>
        <td>Component, Dependency, Port, Provided Interface, Realisation, Required Interface, Subsystem.</td>
    </tr>
    <tr>
        <td>Use Case View</td>
        <td>Use Case Diagram</td>
        <td>Actor, Association, Extend, Include, Use Case, Use Case Generalisation.</td>
    </tr>
    <tr>
        <td rowspan=4>Dynamic Behaviour</td>
        <td>State Machine View</td>
        <td>State Machine Diagram</td>
        <td>Completion Transition, Do Activity, Effect, Event, Region, State, Transition, Trigger.</td>
    </tr>
    <tr>
        <td>Activity View</td>
        <td>Activity Diagram</td>
        <td>Action, Activity, Control Flow, Control Node, Data Flow, Exception, Expansion Region, Fork, Join, Object Node, Pin.</td>
    </tr>
    <tr>
        <td rowspan=2>Interaction View</td>
        <td>Sequence Diagram</td>
        <td>Occurrence Specification, Execution Specification, Interaction, Interaction Fragment, Interaction Operand, Lifeline, Message, Signal.</td>
    </tr>
    <tr>
        <td>Communication Diagram</td>
        <td>Collaboration, Guard Condition, Message, Role, Sequence Number.</td>
    </tr>
    <tr>
        <td>Physical Layout</td>
        <td>Deployment View</td>
        <td>Deployment Diagram</td>
        <td>Artifact, Dependency, Manifestation, Node.</td>
    </tr>
    <tr>
        <td rowspan=2>Model Management</td>
        <td>Model Management View</td>
        <td>Package Diagram</td>
        <td>Import, Model, Package.</td>
    </tr>
    <tr>
        <td>Profile View</td>
        <td>Package Diagram</td>
        <td>Constraint, Profile, Stereotype, Tagged Value.</td>
    </tr>
  </tbody>
</table>
