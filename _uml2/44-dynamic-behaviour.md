---
title: Dynamic Behaviour
excerpt: Class diagram, activity diagrams, sequence diagrams and communication diagrams.
toc: true
toc_sticky: true
image: &image 'http://www.plantuml.com/plantuml/svg/TLB1IWCn5BpdAmO4RpruBIAjsme5iM0fdjzcNzkmRvEQJHRzUxDja0tLmovaPZBpvf557yY7s8aA9WYZ4gDRtADo8go3wbjZp-IfGqswFNeNRPCuvt7tyh1UhvxLoJICWtEXTb-AT4ZKlcUlL4V67j9Dneu_8rlDM1aw9aID0ioUyC7r7E-SJWDZ4xXJ2Hc9NRBXEQeJwtOywFR2FCvccRg2UEM1fLSa8GFBWOnGBQo0qYl7P3VWJxyiQXGk9KR1T4WAnbcynQvchr9mTiFUqYItlBcD0UwGXMlldKyITqu3draR4cnzmoC656kfOXzSn_vMLnQxuh-rS8KlDkJvv6B_hoRDE1MjMCp0_ZiNBCros5B4QGgCZQt7jp3nB1UQ8oTMvLfkwvLwjeqQlqNwnKv-0000'
permalink: /uml2/dynamic-behaviour.html
categories: Architecture
tags: UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---

## State Machine View

A state machine models the possible lifecycle of states for an object of a class. A state machine contains states connected by transactions. Each state models a period of time during the life of an object during which it satisfies certain conditions. When an event occurs, it may cause the object to transition to a new state as a result. When the transition from one state to another occurs, this may have an effect (action or activity).

### State Machine Diagram

A state machine diagram shows the state machine for part of a system, illustrating the states, transitions, events and activities involved. A state machine diagram shows the dynamic view of a system, illustrating the flow of control from state to state within a single object.

## Activity View

An activity shows the flow of control among the activities involved in performing a calculation or workflow. An action is a primitive computational step, and an activity node is a group of actions or sub-activities. An activity describes both sequential and concurrent computation. Activities are shown using activity diagrams.

### Activity Diagram

An activity diagram shows the flow of control from activity to activity within a system. They are the flowcharts of the UML. Unlike traditional flowcharts, and activity diagram can show concurrency as well as branches of control. Activity diagrams address the dynamic view of a system. They are useful in modelling the function of a system, emphasising the flow of control among elements in the system.

## Interaction View

The interaction view describes sequences of message exchanges among the parts of a system. An interaction is based on a structured classifier, or collaboration with roles in the interaction filled with objects in a particular use of an interaction. This shows the flow of control across many objects.

The interaction view is shown using two diagrams that focus on different aspects; sequence diagrams and communication diagrams.

### Sequence Diagram

A sequence diagram is an interaction diagram that emphasises the time-ordering of messages.

{% include figure popup=true image_path="http://www.plantuml.com/plantuml/svg/TLB1IWCn5BpdAmO4RpruBIAjsme5iM0fdjzcNzkmRvEQJHRzUxDja0tLmovaPZBpvf557yY7s8aA9WYZ4gDRtADo8go3wbjZp-IfGqswFNeNRPCuvt7tyh1UhvxLoJICWtEXTb-AT4ZKlcUlL4V67j9Dneu_8rlDM1aw9aID0ioUyC7r7E-SJWDZ4xXJ2Hc9NRBXEQeJwtOywFR2FCvccRg2UEM1fLSa8GFBWOnGBQo0qYl7P3VWJxyiQXGk9KR1T4WAnbcynQvchr9mTiFUqYItlBcD0UwGXMlldKyITqu3draR4cnzmoC656kfOXzSn_vMLnQxuh-rS8KlDkJvv6B_hoRDE1MjMCp0_ZiNBCros5B4QGgCZQt7jp3nB1UQ8oTMvLfkwvLwjeqQlqNwnKv-0000" alt="Sequence Diagrams" caption="Example sequence diagram using PlantUML" %}

Each role is shown as a vertical lifeline representing the role over time through the entire interaction. Messages are shown as arrows between the lifelines. Sequence diagrams can show control constructs such as loops, conditionals and parallel execution.

### Communication Diagram

A communication diagram emphasises the structural organisation of the objects or roles that send and receive messages. This diagram shows the roles as a geometric arrangement with messages among these roles represented as arrows attached to links between the roles. The sequencing of messages is indicated by sequence numbers prefixed to the message descriptions.

Sequence diagrams and communication diagrams represent similar basic concepts, but with different view of these concepts.
