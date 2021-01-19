# Chess Mining

Analysing Chess Games with Process Mining.

## Outline

Although chess games do not necessarily have timestamps they are neatly ordered and can be expressed as sequence of moves. In the following we suggest modeling chess games using process mining tools. We consider the following attributes:

* Case ID: The match number.
* Activity: The move e.g. "e4".
* Resource: White or Black.
* Timestamp: The current turn iteration.

The goal is to compare openings - which we define as the first 10 turns - of different users and look for patterns in the generated process model as well as conformance between players.

## Contributors

* Micha Birklbauer [:octocat: t0xic-m](https://github.com/t0xic-m)
* Dorian Karaban [:octocat: Dorian1000](https://github.com/dorian1000)
