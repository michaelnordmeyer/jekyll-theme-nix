---
title: Markdown to HTML Test
date: 2023-01-01 00:00:00 +0100
permalink: /markdown-to-html-test
layout: post
---
## HTML5 Tags Supported by Markdown

These are the supported HTML tags, which will be generated from Markdown.

# Heading One
## Heading Two
### Heading Three
#### Heading Four
##### Heading Five
###### Heading Six

### Paragraphs

An ordinary paragraph with some text.

Another paragraph with more text to show, how the paragraph spacing is done. Note: Paragraphs with proper line height are mandatory for a good reading experience. Too little or too large makes a webpage unattractive.

### Lists

#### Unordered Lists (Nested)

- List item one
  - List item one
    - List item one
    - List item two
    - List item three
    - List item four
  - List item two
  - List item three
  - List item four
- List item two
- List item three
- List item four

#### Ordered List (Nested)

1. List item one
   1. List item one
      1. List item one
      2. List item two
      3. List item three
      4. List item four
   2. List item two
   3. List item three
   4. List item four
2. List item two
3. List item three
4. List item four

### Anchor Tag (aka Link)

This is a [link](https://example.com).

### Block-Quote Tag

Single-line block-quote:

> The most complicated skill is to be simple.

Multi-line block-quote with a cite reference:

> That’s been one of my mantras – focus and simplicity. Simple can be harder than complex. You have to work hard to get your thinking clean to make it simple. But it’s worth it in the end because once you get there, you can move mountains. —<cite>Steve Jobs</cite>

### Code Tag

A code tag markups code `print("Hello World")` for better separation from the text around it.

### Emphasize Tag

The emphasize tag should *italicize* text.

### Image Tag

The image tag will show the image of `icon.webp`, if it exists:

![Image Alt Text](icon.webp "Image Title Text")

### Pre-Formatted Tag

This tag was generated from Markdown's code fencing (```) with no specific syntax:

```
.header {
  margin: 2em 0;
  font-size: 36px;
  font-weight: bold;
  line-height: 1.5;
}
```

### Strong Tag

This tag shows **bold** text.

---

## HTML5 Tags Supported by Github-Flavored Markdown

### Tables (But Without the Caption)

| Character                                                                      | Appearance |
| ------------------------------------------------------------------------------ | ----------:|
| [Donald Duck](https://en.wikipedia.org/wiki/Donald_Duck)                       |       1934 |
| [Huey, Dewey, and Louie](https://en.wikipedia.org/wiki/Huey,_Dewey,_and_Louie) |       1937 |
| [Scrooge McDuck](https://en.wikipedia.org/wiki/Scrooge_McDuck)                 |       1947 |

### Delete Tag

This tag will let you ~~strikeout~~ text.

### Footnotes

Footnotes[^1] are not tags and therefore don’t belong to the HTML standard.

---

[^1]: You can go back to the place, where the `footnote` was made.
