#let zylith_whitepaper(
  body,
  title_text: "Zylith Whitepaper",
  title: [Zylith Whitepaper],
  version: [Protocol Specification v1.0-rc1],
  author_text: "Tanya Arora",
  author: [Tanya Arora],
  email: "tanya@zylith.fi",
  date: [May 2026],
  abstract: none,
) = {
  set document(title: title_text, author: (author_text,))
  set page(
    paper: "us-letter",
    fill: white,
    margin: (left: 0.72in, right: 0.72in, top: 0.62in, bottom: 0.72in),
    numbering: "1",
    number-align: center,
  )
  set text(font: "TeX Gyre Termes", size: 10pt, lang: "en")
  set par(justify: true, leading: 0.54em, spacing: 0.52em, first-line-indent: 0.95em)
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)
  set table(inset: (x: 4pt, y: 3.5pt), stroke: 0.35pt + rgb("#c9c3b8"))
  set figure.caption(separator: [. ])

  show link: set text(fill: rgb("#172d44"))
  show raw.where(block: false): set text(font: "TeX Gyre Termes", size: 9.2pt, weight: "bold", style: "italic")
  show raw.where(block: true): it => block(
    width: 100%,
    inset: (x: 0pt, y: 3pt),
    fill: none,
    stroke: none,
    above: 5pt,
    below: 7pt,
  )[
    #set text(font: "TeX Gyre Termes", size: 8.4pt, weight: "bold", style: "italic")
    #set par(justify: false, first-line-indent: 0pt, leading: 0.48em)
    #it
  ]
  show table: set text(size: 7.6pt)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.caption: set text(size: 8pt)

  show heading: it => {
    set par(first-line-indent: 0pt)
    if it.level == 1 {
      block(above: 17pt, below: 8pt, sticky: true)[
        #text(size: 12pt, weight: "bold", tracking: 0.015em)[#it.body]
      ]
    } else if it.level == 2 {
      block(above: 11pt, below: 5pt, sticky: true)[
        #text(size: 10.2pt, weight: "bold")[#it.body]
      ]
    } else {
      block(above: 8pt, below: 3pt, sticky: true)[
        #text(size: 9.5pt, weight: "semibold")[#it.body]
      ]
    }
  }

  align(center)[
    #v(4pt)
    #text(size: 18pt, weight: "bold", tracking: -0.01em)[#title]
    #v(2pt)
    #text(size: 9pt, weight: "bold")[#version]
    #v(7pt)
    #text(size: 10.3pt)[#author]
    #v(1pt)
    #text(size: 9.3pt)[#link("mailto:" + email)[#email]]
    #v(7pt)
    #text(size: 9pt, fill: rgb("#55504a"))[#date]
  ]

  v(13pt)
  line(length: 100%, stroke: 0.65pt + rgb("#1d1b18"))
  v(7pt)
  if abstract != none {
    block(width: 100%, inset: (x: 7pt, y: 4pt))[
      #set text(size: 10pt)
      #set par(justify: true, first-line-indent: 0pt, leading: 0.54em, spacing: 0.52em)
      #block(below: 6.2pt)[#text(size: 12pt, weight: "bold")[Abstract]]
      #abstract
    ]
  }
  v(6pt)
  line(length: 100%, stroke: 0.35pt + rgb("#c9c3b8"))
  v(10pt)

  columns(2, gutter: 16pt)[
    #body
  ]
}
