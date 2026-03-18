<div align="center">
  <h1>Learning Ruby</h1>
</div>
<br>

## What is this?

Those are some projects I did while learning ruby but are not good/big enough to get their own repo.

## Table of contents

- [What is this](#what-is-this)
- [Prerequisites](#prerequisites)
- [illegal name guesser](#illegal-name-guesser)
- [Imposter ask](#imposter-ask)
- [User Maker](#user-maker)

## Prerequisites

Just install [ruby](https://www.ruby-lang.org/en/documentation/installation/) lol

## Illegal Name Guesser

Run with:

```bash
ruby illegal_name_guesser.rb
```

Enter your username, if your username contains any of the illegal names on the list It'll tell you  
(psss! This is the illegal list: [linus linux nvim arch])

## Imposter ask

Run with:

```bash
ruby imposter_ask.rb
```

Well... you basically snitch on your self. You'll get asked `Are you the imposter? (y/n)`. It'll not let you until you get tired and snitch on yourself.

## User Maker

Run with:

```bash
ruby user_maker.rb
```

It'll ask you a serious of questions, run checks on each entry (check for input validity), then make post processing (i.e entry "m" on status questions becomes "Married").

A question is of type

```ruby
Question = Struct.new(:title, :property_name, :format_check, :post_processing)
```

Add a new question by pushing a `Question.new` to questions array. ABSOLUTE MODULARITY.
