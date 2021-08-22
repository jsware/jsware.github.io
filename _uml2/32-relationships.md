---
title: UML Relationships
excerpt: "Dependencies, associations, generalisations and realisations."
toc: true
toc_sticky: true
image: &image /assets/images/uml2/associations.drawio.svg
permalink: /uml2/relationships.html
tags:
  - UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
There are four kinds of relationships in the UML: associations, dependencies, generalisations and realisations.

<img src="/assets/images/uml2/association.drawio.svg" alt="Association" class="align-right" width="100">

* An *association* is a structural relationship among classes that describe a set of links. A link is a connection among objects that are instances of the classes. An association is drawn as a solid line.

<img src="/assets/images/uml2/dependency.drawio.svg" alt="Dependency" class="align-right" width="100">

*	A *dependency* is a semantic relationship between two model elements in which a change to one element (the independent one) may affect the semantics of the other element (the dependent one). A dependency is drawn as a dashed, open headed arrow, pointing from the dependent to independent element which can be read as "From" is dependent on "To".

<img src="/assets/images/uml2/generalisation.drawio.svg" alt="Generalisation" class="align-right" width="100">

* A *generalisation* is a specialisation/generalisation relationship in which the specialised element builds on the generalised element. A generalisation is drawn as a solid line with a closed arrowhead, pointing from the specialised to general element.

<img src="/assets/images/uml2/realisation.drawio.svg" alt="Realisation" class="align-right" width="100">

* A *realisation* is a semantic relationship between classifiers, wherein one classifier specifies a contract that another classifier guarantees to carry out. A realisation relationship is drawn as a dashed line with a closed arrowhead from the implementation element to the interface element.

## Associations

<img src="/assets/images/uml2/association.drawio.svg" alt="Association" class="align-right" width="100">

An *association* is a structural relationship among classes that describe a set of links. A link is a connection among objects that are instances of the classes. In the same way that an object is an instance of a class, a link is an instance of an association. Aggregation is a special kind of association between a whole and its parts. An association is drawn as a solid line.

{% include figure popup=true image_path="/assets/images/uml2/associations.drawio.svg" alt="Associations" class="align-left" width="300" %}

In this diagram an order is made up of 1 or more order lines. A whole order is made up of order line parts in a composition (part-whole) association. This means that an order line cannot exist without an associated order and can be part of only one order.

Each order line is for a single product. A product can exist on more than 1 order line but may also not be part of any order.

### Association Names

Associations can be given names, each end can be assigned a role and, in some circumstances, the number of instances of objects in a relationship needs to be specified.

* The association can be given a **name** used to describe the nature of the relationship. To avoid ambiguity, a direction triangle can be used to illustrate the direction of the relationship.

### Roles and Multiplicity

* When classes participate in an association, it plays a specific **role** which can be identified near its end of the association line. This is called the *end name* (formerly the role name in UML1).

* An association represents a structural relationship among objects. In many situations it is important to state how many objects may be associated across a link (an instance of an association is called a link). This "how many" is known as the **multiplicity** of the association's role. It represents a range of integers, written as an expression of the minimum and maximum values. For example exactly one (1), zero to one (0..1), zero to many (0..* or just *), or m to n (e.g. 3..5) or an exact number (e.g. 3 or 3..3).

{% include figure popup=true image_path="/assets/images/uml2/association-adornments.drawio.svg" alt="Association Adornments" class="align-right" width="300" %}

If the association end names are specified, or the nature of the association is unambiguous, it is not always necessary to specify the association name. The direction triangle does not denote any form of navigation (see [navigability](#navigability)) or data flow.

In the first example, it can be seen that a person works for a company. The second example shows that a company has 1 or more employees. Additionally, it can be seen that a person may be employed by more than one company or may be unemployed.

### Aggregation & Composition

A plain association between two classes represents a structural relationship between peers, where each class is conceptually at the same "level", with neither class treated more important than the others. Sometimes, a "whole/part" relationship needs to be modelled where one class represents a larger thing (the whole) and the other represents the smaller things (the parts).

Aggregation and composition are used to represent these special kinds of associations. They are denoted with hollow or solid diamonds anchored to the element representing the whole and the line connecting to the element representing the part(s).

{% include figure popup=true image_path="/assets/images/uml2/aggregation-composition.drawio.svg" alt="Aggregation &amp; Composition" class="align-right" width="300" %}

For example, a football team has a number of players. The aggregation relationship represents a "has-a" relationship in that a football team has a number of players in it. Each player may be part of multiple teams such as their local and national teams. A football player may not be a member of any team.

Composition represents a stronger form of aggregation where the lifecycle of the parts is controlled by its owner. For example, a pitch is composed of a playing surface and two goalposts. Without these elements, it is not a pitch. Additionally, the goalposts can only be part of one pitch at any one time, though they could be explicitly removed from one pitch and used to create another.

### Navigability

Given a plain association between two classes, it is possible to conceptually navigate from objects of one kind to objects of another kind. Unless otherwise specified, navigation across an association is bidirectional.

{% include figure popup=true image_path="/assets/images/uml2/navigation.drawio.svg" alt="Navigation" class="align-right" width="300" %}

There are circumstances in which you'll want to limit navigation to just one direction. For example, given a user, you'll want to be able to find corresponding Passwords. However, from a Password, you don't want to be able to identify the corresponding User. Navigation can be explicitly shown using an open arrowhead pointing in the direction of the intended navigability.

It should be noted that navigability does not represent any form of data flow and data could still flow in either direction. For example, the user object may invoke a "check password" operation on the Password object which returns a "correct" or "incorrect" response. In this scenario, data flows in both directions (the password to check and the response indicator). To model data flow, you should use one of the behavioural diagrams depending on the information you wish to convey and the focus you want to promote.

## Dependencies

<img src="/assets/images/uml2/dependency.drawio.svg" alt="Dependency" class="align-right" width="100">

A *dependency* is a semantic relationship between two model elements in which a change to one element (the independent one) may affect the semantics of the other element (the dependent one). A dependency is drawn as a dashed, open headed arrow.

{% include figure image_path="/assets/images/uml2/dependencies.drawio.svg" alt="Dependencies" caption="Dependencies amongst artifacts" %}

In the above diagram, the Web is dependent upon the store's "ClickNCollect" interface. A change to the store's "ClickNCollect" interface may have an effect on the dependent Web element. Similarly, the store is dependent on the Warehouse's "StockOrdering" interface.

The dependency relationship represents a using relationship, in that the Web uses the Store's "ClickNCollect" interface. A change to the Store's interface may affect the web's use of it, but a change to the web should not affect the provision by the Store of a "ClickNCollect" interface.

## Generalisations

<img src="/assets/images/uml2/generalisation.drawio.svg" alt="Generalisation" class="align-right" width="100">

A *generalisation* is a specialisation/generalisation relationship in which the specialised element (the child) builds on the generalised element (the parent). A generalisation is drawn as a solid line with a closed arrowhead.

{% include figure popup=true image_path="/assets/images/uml2/class-hierarchy.drawio.svg" caption="Example Generalisations and Realisation" alt="Generalisation & Realisation" %}

## Realisations

<img src="/assets/images/uml2/realisation.drawio.svg" alt="Realisations" class="align-right" width="100">

A *realisation* is a semantic relationship between classifiers, wherein one classifier specifies a contract that another classifier guarantees to carry out. There are two places where you will encounter realisations; between interfaces and the classes or components that provide implementations for them and between use cases and the collaborations that realise them.

In the above Java class hierarchy, the class `Thread` realises `Runnable`. The `Runnable` interface is implemented by the `Thread` class.

{% include figure popup=true image_path="/assets/images/uml2/use-cases-collaborations.drawio.svg" caption="Example Use Case Realisations" alt="Realisation" %}
