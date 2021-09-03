---
title: Using PlantUML
excerpt: Quickly describe UML diagrams in text and PlantUML will convert them into diagrams.
classes: wide
image: &image https://upload.wikimedia.org/wikipedia/commons/3/30/Plantuml_Logo.svg
permalink: /uml2/using-platuml.html
tags:
  - UML
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
[PlantUML](https://plantuml.com/) is another excellent UML drawing tool. With a text description of your UML, it will provide a diagram.

Really useful for sequence diagrams. For example the following easy-to-read code ...
```yaml
@startuml
title Click & Collect
hide footbox
actor User

mainframe Sequence Diagram
User -> Web: Reserve Item
Web -> Store: Check Stock
Web <-- Store: Stock Levels
alt Stock Available
  Web -> Store: Reserve Stock
  Web <-- Store: Stock Reserved
  User <-- Web: Reservation Number
else Stock Unavailable
  User <-- Web: Out of Stock Error
  opt Special Order
    User -> Web: Customer Special Order
    Web -> Store: Order Stock
    Store -> Warehouse: Order Stock
    Store <-- Warehouse: Delivery Number
    Store -> Store: Allocate Inbound Stock
    Web <-- Store: Order Number
    User <-- Web: Customer Special Order Number
  end
end
@enduml
```
... produces a sequence diagram:
{% include figure image_path="http://www.plantuml.com/plantuml/svg/TP31QiCm44Jl-eevzPOV2AKaE3q4IWCDeMVPtZGYAsqghqpxzvKJKIpI7cpGxEYDPbU3sgZ9ir6dJ6ZOTMSye15cwjISN4yuYcWhNyPsAX67WQ8nthfmZDOJzlIPA7I4ZRCVMJ6J0Oidl5Exn1lbqqZOAdcJbMcmpnXQeZbHpig7xdoTF2uMPNGJyK8ZyM0iQn7MetLiMoO3rAmIKsZ0dxnYwWsk9IR3_95MdGIy9jzID3cuq708TfPRtzmbXHoByJb6YTaY5yN-GfspZ5tiQTA0QYrD6bGynNjVNUoc_zR2JRvYRAIJfE5VJtxZtBGXTYF5xrAmXfMmDRDqLWdRq4eA_OnPBRH4pb7rMkxhrNuAlPc-LVubppy0" alt="PlantUML Diagrams" caption="An example PlantUML diagram from code" %}

Just copy the above code into [http://www.plantuml.com/plantuml](http://www.plantuml.com/plantuml). There are various ways to use PlantUML - not just via an online server.
