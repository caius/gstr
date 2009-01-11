Object subclass: Mock [
   | name receivedMessages | 
   <comment: 'a proxy you can use within testing'>
].

Mock class extend [
  called: aName [
    | instance | 
    <category: 'instance creation'>
    instance:= super new.
    instance init.
    instance name: aName.
    ^instance.
  ]
]

Mock extend [
  init [
    receivedMessages:= Set new.
  ]
  name [
    <category: 'accessing'>
    ^name.
  ]
  name: aValue [
    <category: 'accessing'>
    name:= aValue.
  ]
  shouldHaveReceived: aMessage [
    ^receivedMessages includes: aMessage.
  ]
  doesNotUnderstand: aMessage [
    receivedMessages add: (aMessage selector).
  ]
]

