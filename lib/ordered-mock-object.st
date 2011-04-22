Mock subclass: OrderedMock [
  | name receivedMessages |
  <comment: 'a proxy you can use within testing which retains the order of messages received'>
]

OrderedMock class extend [
  new [
    | i |
    <category: 'instance creation'>
    i := super new.
    i initialize.
    ^i.
  ]
]

OrderedMock extend [
  initialize [
    <category: 'initialization'>
    receivedMessages := OrderedCollection new.
  ]

  lastMessage [
    | msg |
    msg := receivedMessages first.
    receivedMessages := receivedMessages allButFirst.
    ^msg.
  ]

  shouldHaveReceived: aMessage [
    ^lastMessage = aMessage.
  ]

  doesNotUnderstand: aMessage [
    receivedMessages addLast: (aMessage selector).
  ]

]
