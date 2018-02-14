# `ggplot2`: An Introduction

This repository contains materials which provide a brief overview of Hadley Whickham's `ggplot2` capabilites.

## Graphics in base R

Base R has extensive capabilities, which will (mostly) give you what you want - if you're willing to work for it! Base R is particularly useful for quick and dirty exploratory plots, but it leaves a lot to be desired for publication quality figures. In particular, the command structure (i.e. argument order) is decentralized, so to get the most out of base R  means to have to memorize differing structures for different functions. Additionally, base R is not flexible with how data are stuctured. Essentially, using base R graphics is consigning yourself to dealing with the detritus of 30+ years of R development!

## Graphics in `ggplot2`

`ggplot2` overcomes several of these difficulties. First, it uses Wilkinson's (1999) Grammar of Graphics, which allows the user to understand and break down the needs of each graphic into manipulable parts. Through this, `ggplot2` standardizes input format, is highly extensible, and has almost endless options. At the same time, it can be bewildering, especially in complex usage situations. It's a pain in the beginning, but it's well worth the effort to sort out.

## The Grammar of Graphics
* Data
* Geometries (`geom_`)
* Aesthetics (`aes()`)
* Scales (`scale_`)
* Statistics ('`stat_`)
* Coordinate systems (`coord_`)
* Facets (`facet_`)
* Visual Themes (`theme`)
