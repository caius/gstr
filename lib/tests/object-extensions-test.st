TestCase subclass: TestObjectExtensions [
  | object | 
  
  setUp [
    object := Object new.
  ]
  
  testIf [
    | value | 
    value := false.
    object if: (1 = 1) then: [ value:= true ].
    self should: [ value = true ].
  ]
  
  testElse [
    | value | 
    value := true.
    object if: (1 = 2) then: [ value:= true ] else: [ value:= false ].
    self should: [ value = false].
  ]
]

TestCase subclass: TestBlockExtensions [
  testIfTrue [
    | value | 
    value := false.
    [ value := true ] if: (1 = 1).
    self should: [ value = true ].
  ]
  
  testIfFalse [
    | value | 
    value := false.
    [ value := true ] if: (1 = 2).
    self should: [ value = false ].
  ]

  testUnlessTrue [
    | value | 
    value := false.
    [ value := true ] unless: (1 = 2).
    self should: [ value = true ].
  ]
  
  testIfFalse [
    | value | 
    value := false.
    [ value := true ] unless: (1 = 1).
    self should: [ value = false ].
  ]
]

TestSuite global addTest: TestObjectExtensions buildSuite.
TestSuite global addTest: TestBlockExtensions buildSuite.