describe 'SpinalWiki.Models.Page', ->
  it 'should be defined', ->
    expect(SpinalWiki.Models.Page).toBeDefined()

  it 'should be instantiable', ->
    page = new SpinalWiki.Models.Page
    expect(page).not.toBeNull()

  describe "#markdown", ->
    it 'should parse the body text when there is a change in the text', ->
      page = new SpinalWiki.Models.Page { id:12, title:"Test", body:"testing again" }
      page.set "body", "this is changed"
      expect(page.get('parsedBody')).not.toBeNull()
