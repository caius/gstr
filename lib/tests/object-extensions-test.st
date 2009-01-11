TestCase subclass: TestObjectExtensions [
  | object value | 
  
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

TestSuite global addTest: TestObjectExtensions buildSuite.