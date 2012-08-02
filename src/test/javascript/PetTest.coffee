describe "Pet tests", ->
  it "should be able to create a Pet", ->
    expect(new Pet()).toBeDefined()

  it "should be able to define a pet", ->
    pet = new Pet({name:'Snoopy', type:'Dog', legs:4})
    expect(pet.has('name')).toBe true
    expect(pet.get('name')).toBe 'Snoopy'
    expect(pet.get('type')).toBe 'Dog'
    expect(pet.get('legs')).toBe 4

  it "should be able to create a Pet collection", ->
    pets = new Pets(
      [
        {name:'Snoopy', type:'Dog', legs:4},
        {name:'Mickey', type:'Mouse', legs:4}
      ]
    )
    expect(pets).toBeDefined()
    expect(pets.size()).toBe 2