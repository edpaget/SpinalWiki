describe 'SpinalWiki.Models.Page', ->
  it 'should be defined', ->
    expect(SpinalWiki.Models.Page).toBeDefined()

  it 'should be instantiable', ->
    page = new SpinalWiki.Models.Page
    expect(page).not.toBeNull()