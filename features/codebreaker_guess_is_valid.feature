Feature: code-breaker submits valid guess

  The code-breaker must submit a guess that is 4 digits, with no repetitions. So 1234 is valid, but 123 or 1223 are not.

  Scenario Outline: submit valid guess
    When I provide an invalid "<guess>"
    Then the response should be "<error>"

    Scenarios: not exactly 4 digits
      | guess | error |
      | 1      | "Guess must be exactly 4 digits" |
      | 1     | "Guess must be exactly 4 digits" |
      | 12    | "Guess must be exactly 4 digits" |
      | 123   | "Guess must be exactly 4 digits" |
      | 12345 | "Guess must be exactly 4 digits" |

    Scenarios: no letters allowed
      | guess | error |
      | 1Z34  | "Guess must be only 4 digits, no letters" |
      | A     | "Guess must be only 4 digits, no letters" |
      | 1234G | "Guess must be only 4 digits, no letters" |

    Scenarios: no embedded whitespace
      | guess | error |
      | 1 234 | "Guess must be 4 digits, no whitespace" |
