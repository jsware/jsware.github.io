---
title: UML Things
excerpt: Structural things, behavioural things, grouping things and annotation things
toc: true
toc_sticky: true
image: &image /assets/images/uml2/things.drawio.svg
permalink: /uml2/things.html
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---

## Structural Things (Classifiers)

### Classes

A *class* is a description of a set of objects that share the same attributes, operations, relationships and semantics. It may implement one or more *interfaces*. Classes are represented as a box containing its name with optional compartments for attributes and operations:

{% include figure popup=true image_path="/assets/images/uml2/classes.drawio.svg" alt="Classes" class="align-right" width="300" %}

The classes shown on the right are all different representations of the same element. The class name is the only mandatory textual part.

An optional section containing attributes of the class can be provided.

An optional section containing operations can also be provided (in this case an empty attributes section should also be shown to avoid confusion.

A class also allows an optional additional compartment for special adornments. In this example, the class responsibilities are shown. The adornments contained in this section should be entitled to clarify the additional adornments that are being provided.

### Interfaces

{% include figure popup=true image_path="/assets/images/uml2/interfaces.drawio.svg" alt="Interfaces" class="align-right" width="200" %}

An *interface* is a collection of operations that specify one or more services a class or component can provide. It describes an externally visible behaviour of that element: embodying the specification of that behaviour, without specifying its implementation. An interface declaration looks like a class, but with the stereotype `<<interface>>`. An interface provided by a class for others to use is drawn as a circle attached to the class with a line and a required interface is shown as a semicircle attached by a line, the pair making either half of a ball and socket joint.

A *use case* is a description of the sequences of actions that a system performs that result in observable results of value to a particular actor. Use cases capture the intended behaviour of a system without specifying how that behaviour is implemented. Use cases are realised by collaborations. Graphically, use cases are drawn as an ellipse with solid lines.

{% include figure popup=true image_path="/assets/images/uml2/use-cases-collaborations.drawio.svg" alt="Use Cases &amp; Collaborations" class="align-left" width="200" %}

*Collaborations* define a society of elements that work together to provide some cooperative behaviour bigger than the sum of its parts. Collaborations are drawn as an ellipse with a dashed border.

There are structural things (components, nodes and actors) that are all class-like (i.e. describe entities that share commonalities) but deserve special treatment as they are different enough and necessary for modelling certain aspects of systems.

{% include figure popup=true image_path="/assets/images/uml2/components-nodes.drawio.svg" alt="Components &amp; Nodes" class="align-right" width="200" %}

A *component* is a modular part of the system, defined by the interfaces it provides and requires. Components sharing the same interfaces can be substituted while preserving the system's logical behaviour. A component is drawn as a box with a special "plug" icon in the top right-hand corner.

A *node* represents a computational resource in the runtime, typically having at least memory and compute capacity. Most other classifiers represent conceptual things while a node represents something concrete. A set of components reside on a node and may migrate from node to node. A node is drawn as a cube; usually containing just its name.

{% include figure popup=true image_path="/assets/images/uml2/actors.drawio.svg" alt="Actors" class="align-right" width="200" %}

An *actor* is a coherent set of roles that "users" of use cases play when interacting with these use cases. Typically, an actor represents a role that a human, hardware device or other system plays with a system. For example, an employee might be a "Store Manager". That same employee may be a "Customer" if they also do their shopping at the store. Actors live outside the system within the surrounding environment. Typically, an actor is drawn as a stick figure with the actor's role underneath or nearby. Alternatively non-human actors are often drawn as boxes with the stereotype `<<actor>>`. Further graphical symbols could be used such as "clip-art" style symbols, though careful selection should be observed to avoid ambiguity.

These elements are the basic structural things of a UML model. There are variations of these providing 33 classifiers in total.

## Behavioural Things

In the UML, the behavioural things are the verbs of the model. These things are the dynamic parts of UML models representing behaviours over time and space. There are three primary behavioural things: interactions, state machines and activities.

<img src="/assets/images/uml2/message.drawio.svg" alt="Interaction" class="align-right" width="100">

* An *interaction* is a behaviour comprising a set of messages exchanged between a set of objects or roles. An interaction involves other elements including messages, actions and connectors (connections between objects). Graphically a message is drawn as a directed line with a filled arrowhead.

{% include figure popup=true image_path="/assets/images/uml2/state.drawio.svg" alt="State Machine" class="align-right" width="200" %}

* A *state machine* represents a set of states an object or interaction goes through during its lifetime. A state machine involves a number of other elements including states, transitions, events and activities. A state is drawn as a rounded rectangle.

{% include figure popup=true image_path="/assets/images/uml2/activities.drawio.svg" alt="Activity" class="align-right" width="200" %}

*	An *activity* is a behaviour that specifies the sequence of steps a computational process performs. In an interaction, the focus is on the set of objects that interact. In a state machine, the focus is on the life cycle of one object at a time. In an activity, the focus is on the flows among steps without regard to which object performs each step. A step of an activity is called an action. Actions are drawn as a rounded rectangle with a name representing its purpose. States and actions are distinguished by their different context.

## Grouping Things

<img src="/assets/images/uml2/package.drawio.svg" alt="Package" class="align-right" width="100">

Grouping things are the organisational elements of UML models. In the UML, *packages* are the general-purpose mechanism for organising the design itself, rather than the classifiers which organise implementation constructs. Structural, behavioural and even other grouping things can be placed inside a package. Unlike components that exist at runtime, a package is purely conceptual, existing only at development time. A package symbol is drawn as a tabbed folder, usually including its name and sometimes its contents.

### Nested Packages

Packages may be nested inside other packages. This is allowed to any depth; however, two or three levels should be sufficient before the model becomes difficult to understand and navigate.

The UML provides two notations to represent the nesting. The first is very visual, showing modelling elements physically contained within the package (illustrated on the left-hand-side of the diagram below).

{% include figure popup=true image_path="/assets/images/uml2/package-diagrams.drawio.svg" alt="Nested Packages" caption="Alternative nested package diagrams" %}

An alternative notation is shown on the right-hand-side above. It uses the containment relationship; a line from the containing element to the contained element with a quartered circle anchored to the containing element. This is useful when there is a lot of nesting, or complex nesting, which might be confusing if drawn physically nested.

## Annotation Things

<img src="/assets/images/uml2/note.drawio.svg" alt="Annotations" class="align-right" width="100">

Annotation things are the explanatory parts of UML models. These are comments you may apply to describe, illuminate and remark about any element in a model. A *note* is simply a symbol for drawing constraints and comments attached to an element or collection of elements. A note is drawn as a rectangle with a folded top-right corner.

### Guard Conditions

*Guard conditions* are expressions that must be satisfied in order to enable an associated transition to "fire". Guard conditions generally occur on interaction diagrams. They are expressions, enclosed in square brackets that evaluate to either true or false. For example, `[order quantity >= 10]`

### Constraints

A *constraint* is an assertion or restriction generally represented as text in natural language, but formal languages are also available. A constraint indicates a restriction that must be enforced by correct design of the system. Constraints are shown as text enclosed in braces, for example `{quantity > 0}`