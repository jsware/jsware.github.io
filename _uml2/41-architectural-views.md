---
title: Architectural Views
excerpt: Use case scenarios, logical designs, process interactions, development & implementation and physical deployment views.
toc: true
toc_sticky: true
image: &image /assets/images/uml2/architectural-views.drawio.svg
permalink: /uml2/architectural-views.html
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
The architecture of a software-intensive system can be best described by five interlocking views: the use case (or scenario) view, design (or logical) view, interaction (or process) view, implementation (or development) view and deployment (or physical) view. Each view is a projection into the organisation and structure of the system from a particular vantage point.

{% include figure popup=true image_path="/assets/images/uml2/architectural-views.drawio.svg" alt="Architectural Views" caption="Capturing a system's architecture" %}

The UML architectural view model is based on the ["4+1 Architectural View Model"](https://www.cs.ubc.ca/~gregor/teaching/papers/4+1view-architecture.pdf) designed by Philippe Krutchen. The 4+1 model uses different terms than UML / UP for identifying the same view.

| UML Architectural Views | 4+1 Architectural Views |
| ----------------------- | ----------------------- |
| Use Case View           | Scenarios               |
| Design View             | Logical View            |
| Interaction View        | Process View            |
| Implementation View     | Development View        |
| Deployment View         | Physical View           |

## Use Case (Scenarios) View

The use case view of a system encompasses behaviour of the system as seen by its end users, analysts and testers. This view doesn't specify the organisation of a software-intensive system. Rather, it exists to specify the forces that shape the system's architecture and design. With the UML, static aspects are expressed as use cases in use case diagrams while the dynamic aspects are expressed in interaction, state and activity diagrams.

The following diagram illustrates a ficticious Click & Collect system:

{% include figure popup=true image_path="/assets/images/uml2/use-case-view.drawio.svg" alt="Use Case (Scenarios) View" caption="Capturing a system's use-case scenarios" %}

## Design (Logical) View

The design view of a system encompasses the classes, interfaces and collaborations that form the vocabulary of the problem and its solution. This view primarily supports the functional requirements of the system; the services the system would provide to its end users. With the UML, static aspects are captured in class and object diagrams while dynamic aspects are expressed in interaction, state and activity diagrams. The internal structure diagram of a class is particularly useful.

The following example shows systems involved in Click & Collect and a composite structure for the Store Systems.

{% include figure popup=true image_path="/assets/images/uml2/logical-design-view.drawio.svg" alt="Logical (Design) View" caption="Capturing a system's logical design" %}

{% include figure popup=true image_path="/assets/images/uml2/composite-structure.drawio.svg" alt="Logical (Design) View" caption="Capturing a system's compsoite structure" %}

## Interaction (Process) View

The interaction view of a system shows the flow of control among its various parts, including possible concurrency and synchronisation mechanisms. It primarily addresses the performance, scalability and throughput of the system. With the UML, the static and dynamic aspects of the system are expressed using the same diagram types as for the design view, except with focus on the active classes that control the system and the messages that flow between them.

Interactions may also use sequence diagrams, for example:

{% include figure popup=true image_path="http://www.plantuml.com/plantuml/svg/TLB1IWCn5BpdAmO4RpruBIAjsme5iM0fdjzcNzkmRvEQJHRzUxDja0tLmovaPZBpvf557yY7s8aA9WYZ4gDRtADo8go3wbjZp-IfGqswFNeNRPCuvt7tyh1UhvxLoJICWtEXTb-AT4ZKlcUlL4V67j9Dneu_8rlDM1aw9aID0ioUyC7r7E-SJWDZ4xXJ2Hc9NRBXEQeJwtOywFR2FCvccRg2UEM1fLSa8GFBWOnGBQo0qYl7P3VWJxyiQXGk9KR1T4WAnbcynQvchr9mTiFUqYItlBcD0UwGXMlldKyITqu3draR4cnzmoC656kfOXzSn_vMLnQxuh-rS8KlDkJvv6B_hoRDE1MjMCp0_ZiNBCros5B4QGgCZQt7jp3nB1UQ8oTMvLfkwvLwjeqQlqNwnKv-0000" alt="Sequence Diagrams" caption="An example PlantUML sequence diagram" %}

## Deployment (Physical) View

The deployment view of a system encompasses the nodes which form the hardware topology on which the system executes. This view primarily addresses the distribution, delivery and installation of the parts that make up the physical system. With the UML, the static aspects of this view are captured in deployment diagrams while the dynamic aspects are captured in interaction, state and activity diagrams.
