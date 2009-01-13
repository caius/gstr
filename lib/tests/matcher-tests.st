GSTR.Matcher subclass: MatchTwentyFive [
  matches: value [
    self if: value = 25 then: [^true].
    GSTR.TestMatchFailed signal: (self failureMessageFor: value).
  ]
]

TestCase subclass: TestMatchers [
  testShouldBeTrue [
    | value |
    value:= ([25] shouldBe: 25).
    self should: [value = true].
  ]
  testShouldBeFalse [
    | value | 
    value:= false.
    [ [25] shouldBe: 20000 ]
      on: GSTR.TestMatchFailed do: [ :ex | value:= #ErrorRaised ].
    self should: [value = #ErrorRaised].
  ]
  testShouldMatchAClass [
    [25] should: MatchTwentyFive
  ]
  testShouldNotMatchAClass [
    | value | 
    value:= true.
    [ [22] should: MatchTwentyFive ]
      on: GSTR.TestMatchFailed do: [ :ex | value:= #ErrorRaised ].
    self should: [value = #ErrorRaised].
  ]
] 


TestSuite global addTest: TestMatchers buildSuite.