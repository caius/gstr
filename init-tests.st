TestSuite class extend [
  | global | 
  global [
    (global isNil) ifTrue: [
      global := TestSuite named: 'global'.
    ].
    ^global.
  ]
]
