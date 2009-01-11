TestCase subclass: TestMockObject [
  | mock | 
  
  setUp [
    mock := Mock called: 'Test Mock'.
  ]

  testInstanceCreationViaCalled [
    self should: [ mock name = 'Test Mock' ].
  ]
  
  testName [
    mock name: 'poop'.
    self should: [ mock name == 'poop'].
  ]
  
  testSingleMethodCall [
    mock someMessage.
    self should: [ mock shouldHaveReceived: #someMessage].
  ]
]

TestSuite global addTest: TestMockObject buildSuite.

