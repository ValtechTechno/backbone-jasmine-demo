describe "Pet tests", ->

  view = null

  beforeEach ->
    $('body').append '
      <div id="test-container">
        <ul id="pets"></ul>
        <script type="text/template" id="pet-template">
          <li data-cid="<%= m.cid %>" class="<%= m.has("selected") ? m.get("selected") : "" %>"><%= m.get("name") %>, the <%= m.get("type") %></li>
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

  it "should select first element when clicking on it", ->
    $('#pets li').first().trigger 'click'
    expect($('#pets li').first().hasClass 'selected').toBe true