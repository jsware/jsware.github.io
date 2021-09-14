---
title: "From Ring & Reserve to Click & Collect"
image: &image /assets/images/click-collect.jpg
classes: wide
categories: General
tags: Reviews
header:
  teaser: *image
  overlay_image: *image
  overlay_filter: 0.5
---
10 years on I am reminded of [an article I read](https://internetretailing.net/guest-comment/guest-comment/guest-column-click-and-collect---10-years-on) from 2011 about Click & Collect.

Sophie Albizua's article began with

> We are in 2011 and Argos is still winning “Multi-Channel Retailer of the Year” Awards ten years after it launched the first Click and Collect service in the UK. Let’s take this anniversary as an opportunity to review the state of one of the most successful retail inventions of the 21st century’s first decade. No need to speak to the experts - a trip to one of Sainsbury’s trial Click and Collect stores with “Collect in Store” placarded on giant banners, leaflets and staff T-shirts seems enough to suggest that the concept that seemed so revolutionary in the early 2000s has finally become mainstream.

It’s now 20 years since Argos invented Click & Collect in 2000 and I am still proud to have been involved in that effort and to have played a hand in naming such a game changing capability.

Click & Collect was built on the back of a stock enquiry, reservation and store opening hours [IVR](https://en.wikipedia.org/wiki/Interactive_voice_response_) system I designed. This IVR system got its name when I provided the text in the recording script for the opening message: “Welcome to Argos Ring & Reserve”. I did not want to say anything like "Welcome to the Argos Stock Enquiry, Reservation and Store Opening Hours system". I needed something punchy.

The IVR system was primarily a stock reservation system you telephoned - you ring up and reserve stock to pick up.

The opening message makes homage to a ground-breaking film - Jurassic Park - and based on one of its immortal lines  "Welcome to Jurassic Park" (played by the in-car interactive CD ROM). So, I avoided "Welcome to the Argos {insert list of capabilities here} service", using just "Welcome to Argos Ring & Reserve" instead.

Thankfully, the service did not eat the customers.

I was reminded by an Argos colleague: when we first released Ring & Reserve, it was so quick that the "Please wait while I check stock in store for you. Your item is (not) in stock." sounded fake. Even when the network link to the store was over a 9600 baud modem.

We had to introduce silence at the end of the please wait message as the stock check to the store back-office was performed in parallel. The store response completed before the please wait message finished playing. So we added about half-a-second silence:

> Please wait while we check stock in store for you. (silence...)<br/>
> Your item is (not) in stock.

You may joke that "Your item is not in stock" was more often played. In the words of [Francis Urquhart](https://en.wikipedia.org/wiki/Francis_Urquhart) - you might very well think that, but I couldn't possibly comment.

Ring & Reserve used services before SOA/microservices were a thing. This allowed Argos to re-use the capability across multiple channels - phone, SMS and the web. We built Ring & Reserve 25 years ago in 1996 and Text & Take Home (the SMS version) next before releasing Click & Collect in 2000.

Each channel re-used the same network transaction calls to the store back-office systems. Transactions were null-terminated C strings with a fixed header of transaction identifier and store number. Enquiries began `IV01`, reservations `IV02`. They were routed to the correct back-office by a message broker (called a WAN server at the time) using the store number found in the fixed header.

All three channels' services were named as alliterations. Of the three names - "Ring & Reserve", "Text & Take Home" and "Click & Collect" - only Click & Collect made it into the Oxford English Dictionary when they [added it](https://public.oed.com/updates/new-words-list-september-2016/) in 2016.

Over the years, when I have told this story, people have suggested we should have patented it. I am however, more pleased to have been involved in something so copied that the name Click & Collect became synonymous with that game changing capability.

Only because it was so copied in name and function did "Click & Collect" make it into the dictionary. Had we patented the name - or the functionality - Click & Collect may not have had the impact it has had on our lives.

20 years on and [Argos](https://en.wikipedia.org/wiki/Argos_%28retailer%29) has changed a great deal. Now a part of Sainsbury's who, along with many others, also adopted the name Click & Collect for their reservation and collection service.

Some of the people involved are still at Argos. Everyone involved should be proud of the impact we had on UK retailing.

How little did we know at the time.
