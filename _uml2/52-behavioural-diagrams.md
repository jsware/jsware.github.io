---
title: Behavioural Diagrams
excerpt: The UML’s behavioural diagrams document the dynamic aspects of a system.
toc: true
toc_sticky: true
image: &image 'http://www.plantuml.com/plantuml/svg/TLB1QiCm3BtxAmI3tNeOx5J6Q4bRA8mLDihEIgAk9hPL53jiVpybDIEcsw45l_Vqdfx8geyeCNbd-iw62mfwgB7fFeLJQ2jsB72tUzmzRBRcR5k24tEi-SjW4vKwzYJ6UBJXf9C4bRDD1_UWWuwQQ4OU5i_mGVKItaXV0y4-aZUAZCIxkj0IgZFfd3wQRcAU5ejCNK5ueO5SRz353Am7j0vhHmQWzCensGtWJxyiQWrC7IR1R4cCbWEy9b-J60tERd0CECij9myf0f-oS2l2eXA-wC8NQYmwE4XB8mPGdALAVMHFSgihYrtntrfmXISR53fpwl_Lw8vpqOQS7KY-Sy7IB8UjdUC68y4-rEEdCFCi3veZPrRbMMxhbNeAhHb_A_rBtlq0'
permalink: /uml2/behavioural-diagrams.html
categories: Architecture
tags: UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
The UML's behavioural diagrams are used to visualise, specify, construct and document the dynamic aspects of a system. The dynamic aspects of a system represent its changing parts. The UML's behavioural diagrams are roughly organised around the major ways the dynamic aspects of a system are modelled:

| Use Case Diagram             | Organises the behaviours of the system. |
| Sequence Diagram             | Focuses on the time ordering of messages. |
| Communication Diagram        | Focuses on the structure of objects exchanging messages. |
| State Machine Diagram        | Focuses on the changing state of a system, driven by events. |
| Activity Diagram             | Focuses on the flow of control from activity to activity. |
| Interaction Overview Diagram | Hybrid of Activity and Sequence Diagrams. |
| Timing Diagram               | Focuses on actual times across different objects or roles. |

The Interaction Overview and Timing Diagrams are advanced diagram types, not discussed in detail in this document. See the [UML Reference Manual](https://dl.acm.org/doi/10.5555/993859) for further details.

## Use Case Diagrams

A use case diagram shows a set of use cases and actors (special kinds of classes) and their relationships. Use case diagrams address the static use case view of a system and are especially important in organising and modelling the behaviours of the system.

## Sequence Diagrams

A sequence diagram is a kind of interaction diagram. Interaction diagrams show the interaction of a set of objects or roles including the messages that may be dispatched among them. A sequence diagram is an interaction diagram that emphasises the time-ordering of messages. Sequence diagrams and communication diagrams represent the same basic concepts, but with a different view of these concepts.

An example Sequence diagram is shown below, generated using [PlantUML](using-platuml.html):

{% include figure popup=true image_path="http://www.plantuml.com/plantuml/svg/TP31QiCm44Jl-eevzPOV2AKaE3q4IWCDeMVPtZGYAsqghqpxzvKJKIpI7cpGxEYDPbU3sgZ9ir6dJ6ZOTMSye15cwjISN4yuYcWhNyPsAX67WQ8nthfmZDOJzlIPA7I4ZRCVMJ6J0Oidl5Exn1lbqqZOAdcJbMcmpnXQeZbHpig7xdoTF2uMPNGJyK8ZyM0iQn7MetLiMoO3rAmIKsZ0dxnYwWsk9IR3_95MdGIy9jzID3cuq708TfPRtzmbXHoByJb6YTaY5yN-GfspZ5tiQTA0QYrD6bGynNjVNUoc_zR2JRvYRAIJfE5VJtxZtBGXTYF5xrAmXfMmDRDqLWdRq4eA_OnPBRH4pb7rMkxhrNuAlPc-LVubppy0" alt="Sequence Diagram" caption="An example sequence diagram" %}

## Communication Diagrams

A communication diagram is an interaction diagram that emphasises the structural organisation of the objects or roles that send and receive messages. Sequence diagrams and communication diagrams represent similar basic concepts, but with different view of these concepts.

## State Machine Diagrams

A state machine diagram shows the state machine for part of a system, illustrating the states, transitions, events and activities involved. A state machine diagram shows the dynamic view of a system, illustrating the flow of control from state to state within a single object.

{% include figure popup=true image_path="/assets/images/uml2/state.drawio.svg" alt="State Machine" caption="A simple state machine" %}

## Activity Diagrams

An activity diagram shows the flow of control from activity to activity within a system. They are the flowcharts of the UML. Unlike traditional flowcharts, and activity diagram can show concurrency as well as branches of control. Activity diagrams address the dynamic view of a system. They are useful in modelling the function of a system, emphasising the flow of control among elements in the system.

## Interaction Overview Diagrams

An interaction overview diagram is a hybrid of an activity diagram and sequence diagram. These diagrams have specialised uses and are not discussed in this guide. See the [UML Reference Manual](https://dl.acm.org/doi/10.5555/993859) for more details.

## Timing Diagrams

An advanced interaction diagram type, called timing diagrams are also available in the UML, but are not discussed in this guide. See the [UML Reference Manual](https://dl.acm.org/doi/10.5555/993859) for further information on timing diagrams.
