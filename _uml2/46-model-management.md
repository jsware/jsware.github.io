---
title: Model Management
excerpt: Package diagrams and profiles.
classes: wide
image: &image /assets/images/uml2/package-diagrams.drawio.svg
permalink: /uml2/model-management.html
tags:
  - UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.6
---

## Model Management View

Any large system must be divided into smaller units so that people can work with a limited amount of information at one time and so that teams do not interfere with one-another. Model management consists of packages and dependency relationships among packages.

A package is a piece of a model, with every part of a model belonging to one package. A modeller may allocate the contents of the model to a set of packages, but to be workable, allocation must follow some rational principle. A good decomposition into packages with greatly enhance model maintainability.

### Package Diagram

A package diagram shows the decomposition of the model itself into organisational units. Package diagrams are used to organise the design itself, rather than classes that organise the implementation constructs of the design. Unlike components, which exist at run-time, a package is purely conceptual and exists only at development time.

## Profile View

UML provides several extension mechanisms to allow modellers to make some common extensions in a consistent manner. This extension mechanism has been design so that UML modelling tools can store and manipulate the extensions without understanding them.

UML profiles are and advanced topic that is beyond the scope of this abridged document. Please see the [UML User Guide](https://dl.acm.org/doi/book/10.5555/1088874) and [UML Reference Manual](https://dl.acm.org/doi/10.5555/993859) for further details.
