---
title: UML Diagrams
excerpt: "Thirteen diagram types in two main classes: structural and behavioural diagrams."
classes: wide
image: &image /assets/images/uml2/uml-diagrams.drawio.svg
permalink: /uml2/uml-diagrams.html
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
When you create something new or provide a new relationship, it is added to the model. The model is the repository of all things and relationships that you have created to help describe the required behaviour of the system you are trying to design.

Diagrams are windows or views into the model. The diagram is not the model itself. This is an important distinction. Something may be deleted from a diagram, but it still exists in the model. It may form part of the model, but just not shown on any diagram. Some modelling tools maintain a repository for the model. Thus, when modelling elements are deleted from all diagrams, they remain in the model. These tools require that modelling elements be explicitly deleted from the model.

{% include pop src="/assets/images/uml2/diagram-frame.drawio.svg" alt="Diagram Frame" class="align-right" width="300" %}

UML 2 contains syntax for diagrams. Each diagram has a frame, heading area and contents area. The heading area is an irregular pentagon that contains the diagram's `<kind>`, name and `<parameters>`. The `<kind>` and `<parameters>` are optional. The name of the diagram should convey its semantics. Some modelling tools may omit the frame because it is implied by the diagram area in the tool itself.

The UML defines 13 diagram types, as represented in the diagram below:

{% include pop src="/assets/images/uml2/uml-diagrams.drawio.svg" alt="UML Diagrams" caption="The UML Diagrams" %}

Each diagram has a contents area and an optional frame with a header. The frame is a rectangle. The frame is primarily used in cases where the diagrammed element has graphical border elements, like ports for classes and components (in connection with composite structures) and entry/exit points on state machines. In cases where not needed, the frame may be omitted and implied by the border of the diagram area provided by a tool. In case the frame is omitted, the heading is also omitted.