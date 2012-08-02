describe "Pet tests", ->

  view = null

  beforeEach ->
    $('body').append '
      <div id="test-container">
        <ul id="pets"></ul>
        <script type="text/template" id="pet-template">
          <li><%= m.get("name") %>, the <%= m.get("type") %></li>
        </script>
      </div>'

    pets = new Pets(
      [
        {name:'Snoopy', type:'Dog', legs:4},
        {name:'Mickey', type:'Mouse', legs:4}
      ]
    )
	  
    view = new PetsView(pets)

  afterEach ->
     $('#test-container').remove()
     view = null

  it "should have a view", ->
    expect(view).toBeDefined()

  it "should displays pets", ->
    expect( $('#pets li').size() ).toBe 2