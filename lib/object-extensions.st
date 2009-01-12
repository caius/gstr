Object extend [
  if: aCondition then: whenTrue else: whenFalse [
    ^aCondition ifTrue: [ whenTrue value ] ifFalse: [ whenFalse isNil ifTrue: [ nil ] ifFalse: [ whenFalse value] ].
  ]
  if: aCondition then: whenTrue [
    ^(self if: aCondition then: whenTrue else: nil).
  ]
]

BlockClosure extend [
  if: aCondition [
    ^aCondition ifTrue: [ self value ] ifFalse: [ nil ].
  ]
  unless: aCondition [
    ^self if: (aCondition not).
  ]
]