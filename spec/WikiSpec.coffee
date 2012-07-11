describe 'SpinalWiki.Collections.Wiki', ->
  it 'should be defined', ->
    expect(SpinalWiki.Collections.Wiki).toBeDefined()

  beforeEach ->
    @wiki = new SpinalWiki.Collections.Wiki

  it 'should be instantiable', ->
    expect(@wiki).not.toBeNull()

  it 'should use SpinalWiki.Models.Page as a model', ->
    expect(@wiki.model).toEqual SpinalWiki.Models.Page