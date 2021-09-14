---
title: Physical Layout
excerpt: Deployment diagrams.
classes: wide
image: &image /assets/images/uml2/components-nodes.drawio.svg
permalink: /uml2/physical-layout.html
categories: Architecture
tags: UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---

## Deployment View

The deployment view shows the physical arrangement of nodes. A node is a runtime computational resource, such as a computer or other device. The deployment view may highlight performance bottlenecks due to placement of artifacts manifesting interdependent components on different nodes.

### Deployment Diagram

A deployment diagram shows the configuration of run-time processing nodes and the components that live on them. Deployment diagrams address the static deployment view of a system.

The UML treats an artifact diagram as a type of deployment diagram that illustrates the physical parts of a system. Artifacts include files, databases and similar physical collections of things. Artifacts can also show the classes and components that they implement.
