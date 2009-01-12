= gstr

A totally pointless exercise in adding stuff to GNU Smalltalk to make it look more like Ruby.  

The system expects a folder structure with a lib folder and then a tests folder within that.  

== scripts

There are two runner scripts - st-run and st-test.  

=== st-test

st-test loads all the files in lib, then all the files in lib/tests, creating a global TestSuite (accessible via `TestSuite global.`).  

Each file in lib/tests is expected to add itself to this global TestSuite - for example, if your TestCase is called MyTestCase do the following: 

    TestSuite global addTest: MyTestCase buildSuite.

=== st-run

st-run loads all the files in lib, then passes your arguments to st-run.st.  The idea is that this will be something similar to rake, but I'm not quite sure how it works.  

=== Images

Currently, st-run and st-test just use the global image (and I have mine pre-loaded with SUnit, DBI and DBD-MySQL).  Eventually I will add commands to generate an image into lib, and if found it will use that one by default.  There will probably be two stages to this; a working image and an output image.  The idea here is that you can work on all your source files, test and run them with the scripts against your working image (with SUnit and other packages pre-loaded).  Then, when you want to do a release, you generate an output image, which loads all your lib files into the working image and then saves that.  So your output image has all your code frozen into it, meaning edits are harder but it should be faster to startup (as well as easier to deploy).  

== Object Extensions

Object has a more traditional if statement: 

    self if: someCondition then: [ do this ] else: [ do that ].

BlockClosure gains if: and unless: methods: 

    [ do something ] if: someCondition.
    [ do something ] unless: someCondition.

== Mock Objects

There is a mock object that works differently to the mocha/RSpec style mocks.  

You create the mock object, send it messages and then test what was sent.  

    mock:= Mock new.
    mock doSomething.
    mock doSomethingElse.
    
    mock shouldHaveReceived: #doSomething "answers true"
    mock shouldHaveReceived: #someOtherMessage "answers false"

== Story Driven Development

Port RSpec, Cucumber and Watir over?