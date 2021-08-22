---
title: "Overview"
excerpt: What is a model? Why we model. UML, Architecture and SDLC. Systems, models and views.
toc: true
toc_sticky: true
image: &image /assets/images/uml2/unified-process.drawio.svg
tags:
  - UML
permalink: /uml2/overview.html
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---

## Why Model

### The Importance of Modelling

> A model is the simplification of reality.

A good model includes those elements that are important and omits (or hides) those elements that are not relevant to the chosen level of abstraction.

We build models so we can better understand the system we are developing. Multiple models of complex systems help us because we cannot comprehend such a system in its entirety.

### Modelling Principles

The choice of what models to create has a profound influence on how a problem is attacked and how a solution is shaped.

Every model may be expressed at different levels of precision. Sometimes you need a "30,000ft" view while others need to get down to the ones-and-zeros of it all.

The best models are connected to reality. As all models are simplifications of reality, the trick is ensure you do not mask important details.

No single model or view is sufficient. Every nontrivial system is best approached through a small set of nearly independent models, each with multiple viewpoints. No single diagram is able to convey all information necessary to all stakeholders.

### What are Models for?

Models capture and state requirements and domain knowledge so stakeholders may understand and agree on them.

Models enable stakeholders to think about the design of a system. They capture design decisions in a flexible form separate from the requirements. Models enable the production of usable working products.

Modelling allows us to organise, filter, retrieve, examine and maintain information about large systems. It enables us to explore multiple solutions economically, ultimately allowing us to master complex systems.

Models provide guides to the thought processes involved in systems design. They capture the abstract specifications of a system's essential structure. This approach eventually provides a useful specification of the final system.

Models may also present exemplars of typical or possible solutions. Additionally, they may be used to provide partial descriptions of systems.

### What is in a Model?

Models have two major aspects: meaningful information (semantics) and visual presentation (notation).

The semantic aspect captures the meaning of a system while the visual presentation shows this semantic information in a form that can be seen, browsed and edited by humans.

## Introducing the UML

The UML is a language for visualising, specifying, constructing and documenting the artifacts of a software-intensive system.

The UML is more than a collection of graphical symbols. Behind each symbol are well defined semantics. One person can express a model in The UML and another person can interpret the model using this common visual notation.

The UML enables designers to specify models that are precise, unambiguous and complete.

The UML is not a visual programming language, but its models can be directly connected to a variety of programming languages. It is possible to map from a model in The UML to a programming language or even to tables in a relational database.

The UML is a language for documenting. It can be used to document many artifacts produced during a software development lifecycle; requirements, architecture, design, source code, project plans, tests, prototypes, releases etc.

> If you can think it, The UML can model it.

### Architecture

In The UML, software architecture is the organisational structure of a system, including decomposition into its parts, their connectivity, interaction mechanisms and the principles that guide the design of the system.

The architecture of a software-intensive system can be best described by five interlocking views; the Use Case View, Design View, Interaction View, Implementation View and Deployment View.  Each view is a projection into the organisation, structure and behaviour of the system from a particular vantage point.

{% include figure popup=true image_path="/assets/images/uml2/architectural-views.drawio.svg" alt="Architectural Views" caption="Capturing a system's architecture" %}

The UML architectural views align with the [4+1 Architectural View Model](https://en.wikipedia.org/wiki/4%2B1_architectural_view_model) by Philippe Krutchen:

| UML Architecture View | 4+1 View         |
|-----------------------|------------------|
| Use Case View         | Scenarios View   |
| Design View           | Logical View     |
| Interaction View      | Process View     |
| Deployment View       | Physical View    |
| Implementation View   | Development View |

[Views](/uml2/views.html) and [Diagrams](/uml2/diagrams.html) elaborate on a system's views and the diagrams used to represent those views.

### Software Development Lifecycle

The UML is largely process independent - not being tied to any particular lifecycle. However, The UML achieves most benefit through a lifecycle process that is use case & risk driven, architecture-centric, iterative & incremental.

Use case driven means that use cases are the primary means by which a system's desired behaviour is established. Risk is the other driver because if you do not actively attack risks, they will actively attack you! Architecture-centric means that architecture is the primary method for conceptualising, constructing, managing and evolving a system. An iterative process is one where a stream of executable releases is produced. An incremental process is one where each new release embodies improvements over previous releases. Where an iterative and incremental process is risk-driven, each new release is focussed on reducing the most significant risks to the success of the system.

The Unified Process is one such lifecycle that meets the above criteria.

{% include figure popup=true image_path="/assets/images/uml2/unified-process.drawio.svg" alt="The Unified Process" caption="The Unified Process phases and workflows" %}

The Unified Process can be broken down into phases. Each phase represents a span of time between two major milestones of the process that meet a well-defined set of objectives. There are four phases in the Unified Process: *inception*, *elaboration*, *construction* and *transition*.

* **Inception** is the first phase when the seed idea for the development is brought to a point of being sufficiently well-founded to warrant entering the elaboration phase.

* **Elaboration** is where the product requirements and architecture are defined. Requirements are articulated, prioritised and baselined. They may range from general visions to precise criteria, including functional and non-functional behaviour providing a basis for testing.

* **Construction** is the phase where the majority of the "build" work is performed to bring the product to a point ready for transitioning to the user community. This does not imply that no deployments of early versions occur until the "end of construction". The process is incremental, meaning that deployment occurs iteratively, possibly starting in the elaboration phase (e.g., where prototypes or proof-of-concepts are deployed). During construction, the system's requirements are continuously evaluated against business needs and resources allocated to actively address risks to the project.

* **Transition** is where software is delivered to the user community. Rarely does the process end here; the system is continuously improved, bugs eradicated, features not making earlier releases are added.

One element that distinguishes this process, cutting across all phases, is iterations. Iterations have a distinct set of planned work tasks that result in an executable system that can be run, tested and evaluated. It need not result in an external release. Since iterations yield an executable product, progress can be judged and risks re-evaluated as the project progresses. The process results in a "building the ship while sailing" approach that enables mid-course corrections and a focus on highest-risk mitigation to avoid the "ship from sinking".

It is the emphasis on a system's architecture as an important artifact that drives The UML to focus on modelling the different views of a system's architecture.

Within The Unified Process, there are five core workflows, each of which is progressed as part of an iteration within one of the phases. These core workflows are Requirements, Analysis, Design, Implementation and Test. The following diagram illustrates the indicative effort applied to each workflow during the different phases and iterations of a project:

* The **Requirements** workflow aims to elicit stakeholder requests and transform them into a set of requirements. This scopes the system to be built and provide detailed requirements for what the system must do.

* The **Analysis** workflow aims to build the analysis model. This helps refine and structure the functional requirements captured within the use case model. This model contains realisations of use cases that lend themselves to the design and implementation workflows better than the use cases themselves.

* The **Design** workflow aims to build the design model. This describes the physical realisations of the use cases from the use case model and also the contents of the analysis model. The design model serves as an abstraction of the implementation model. This workflow also focuses on the deployment model, which defines the physical organization of the system in terms of computational nodes.

* The **Implementation** workflow aims to define the organization of the code, in terms of implementation subsystems organized in layers. It implements things in terms of components - source files, binaries, executables, and others. Implementation includes unit-testing developed components and integrating elements produced by individual implementers (or teams), into an executable system.

* The **Test** workflow aims to verify the system works as required. This includes the interaction between the elements of the system, proper integration of all components and that all requirements have been correctly implemented. Testing identifies and ensures defects are addressed prior to the deployment of the software and ensures all the defects are fixed, retested and closed.

## Systems & Models

### Systems & Subsystems

A system (possibly decomposed into a collection of subsystems) is a set of elements organised to accomplish a purpose. A system is described by a set of models, possibly from different viewpoints. A system is the thing you are developing for which you build models to better understand it. A subsystem is simply part of a system and is used to decompose a complex system into nearly independent parts. A system at one level of abstraction may be a subsystem of a system at a higher level of abstraction.

The primary relationship between a system and its subsystems is composition. The whole system is made up of parts; each part being a subsystem. You can also model families of systems using generalisation relationships. Some models represent general systems and others represent specific specialisations of them. The subsystems can have various relationships among themselves.

A system represents the highest-level thing in a given context with its subsystems making up the partitioning of the system as a whole. A system is simply a "top-level" subsystem.

### Models & Views

A model is a simplification of reality, providing an abstraction of a system. Models partition a system's abstractions so that the system can be better understood. Compare this to a subsystem which is a partition of a system so that it can be developed and deployed somewhat independently.

This difference between systems and models may be subtle, but important.

A model may encompass so many elements that in complex systems or systems of scale, it is not possible to embrace them all at once. A view is a projection of a model from a particular vantage point that omits details not relevant to this point of view. For each model, there will be a number of diagrams that present a view of things contained in the model.

The (Rational) Unified Process defines a number of models:

*	A **business use case model** establishes an abstraction of the organisation.
*	A **business analysis model** establishes the context of the system.
*	A **system use case model** establishes the system's functional requirements.
*	An **analysis model** establishes a conceptual design.
*	A **design model** establishes the vocabulary of the problem and its solution.
*	A **data model** establishes the representation of data for databases and other repositories.
*	A **deployment model** establishes the hardware topology on which the system is executed as well as the system's concurrency and synchronisation mechanisms.
*	An **implementation model** establishes the parts used to assemble and release the physical system.
