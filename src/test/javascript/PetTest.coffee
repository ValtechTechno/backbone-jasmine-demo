describe "Pet tests", ->
  it "should be able to create a Pet", ->
    expect(new Pet()).toBeDefined()