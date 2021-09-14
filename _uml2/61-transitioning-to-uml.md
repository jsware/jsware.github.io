---
title: Transitioning to The UML
excerpt: You can model 80% of most problems using 20% of the UML.
toc: true
toc_sticky: true
image: &image /assets/images/uml2/transition-to-uml.drawio.svg
permalink: /uml2/transitioning-to-uml.html
categories: Architecture
tags: UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
You can model 80% of most problems using 20% of The UML.

A good place to start is to model some of the basic abstractions or behaviour that already exists in a system. Develop a conceptual model of the UML around which you can grow your understanding of the UML.

## New to Object Orientation

If you are new to object orientation:

* Start by getting comfortable with the idea of abstraction.

* Model a simple static part of a system using classes, dependency, generalisation and association

* Use simple sequence or communication diagrams to model a dynamic part of the system. Building a model of user interaction with the system is a good starting place and will give you immediate payback by helping you reason through some of the system's more important use cases.

## New to Modelling

If you are new to modelling:

* Start by taking a part of the system you've already built and build a UML model of the classes (types of things) involved and their relationships.

* Use the UML to try to capture some details of programming idioms or mechanisms you used in that system. These may be "in your head" but not directly in the code. Try taking part of a system and model the "general" case by abstracting from your physical observations to the conceptual that could be deployed in different ways.

* If you have a non-trivial system, try to reconstruct a model of its architecture by using components (including subsystems) to represent its major structural elements. Use packages to organise the model itself.

* After you have become comfortable with the vocabulary of the UML, before you start "cutting code" for your next project, try to build a UML model of that part of the system first. Think about the structure or behaviour you've specified. When you are happy with its size, shape and semantics, use that model as a framework for your implementation.

## Experienced Modeller

If you are already experienced with another modelling method:

* Look at your current modelling language and construct a mapping from its elements to the elements of the UML.

* Consider some difficult modelling problem that you found clumsy or impossible to model. Look at some of the advanced UML features that might address that problem with greater clarity or simplicity.
If you are a power user:

* First develop a conceptual model of the UML. You may miss its harmony if you dive into the most sophisticated parts of the UML.

* Pay particular attentions to the UML's features for modelling internal structure, collaboration, concurrency, distribution and patterns.

* Look at the extensibility mechanisms that enable you to tailor the UML to directly speak the vocabulary of your domain. Take care to resist the temptation to go to extremes that produce UML models that only other "power users" can understand.
