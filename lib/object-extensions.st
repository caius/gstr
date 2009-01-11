Object extend [
  if: condition then: whenTrue else: whenFalse [
    ^condition ifTrue: [ whenTrue value ] ifFalse: [ whenFalse isNil ifTrue: [ nil ] ifFalse: [ whenFalse value] ].
  ]
  if: condition then: whenTrue [
    ^(self if: condition then: whenTrue else: nil).
  ]
]