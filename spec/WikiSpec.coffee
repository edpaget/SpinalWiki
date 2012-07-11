describe 'SpinalWiki.Collections.Wiki', ->
  it 'should be defined', ->
    expect(SpinalWiki.Collections.Wiki).toBeDefined()

  beforeEach ->
    @wiki = new SpinalWiki.Collections.Wiki [{ id: 12, text: "Stuff", category: "stuff"},
                                             { id: 13, text: "Other Stuff", category: "things"}]

  it 'should be instantiable', ->
    expect(@wiki).not.toBeNull()

  it 'should use SpinalWiki.Models.Page as a model', ->
    expect(@wiki.model).toEqual SpinalWiki.Models.Page

  it 'should filter pages by category', ->
    page = @wiki.category('stuff')[0]
    expect(page.id).toEqual 12