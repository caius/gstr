Namespace current: GSTR [
  Error subclass: TestMatchFailed [
  
  ]
  
  Object subclass: Matcher [
    failureMessageFor: value [
      ^(self class displayString) , ' did not match ' , (value displayString).
    ]
    matches: value [
      ^false.
    ]
  ] 
]

TestSuite class extend [
  | global | 
  global [
    (global isNil) ifTrue: [
      global := TestSuite named: 'global'.
    ].
    ^global.
  ]
]

BlockClosure extend [

  shouldBe: expected [
    | value |
    value:= self value.
    self if: (value == expected) then: [^true] else: [^GSTR.TestMatchFailed signal: ('expected ' , expected displayString , ' but got ' , value displayString) ].
  ]
  
  should: matcher [
    | value instance | 
    value:= self value.
    self if: (matcher isKindOf: Class) then: [instance:= matcher new] else: [instance:= matcher].
    self if: (instance matches: value) then: [^true] else: [GSTR.TestMatchFailed signal: (instance failureMessageFor: value)]. 
  ]

]
