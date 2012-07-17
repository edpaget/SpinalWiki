describe 'SpinalWiki.Views.Page', ->
  it 'should be defined', ->
    expect(SpinalWiki.Views.Page).toBeDefined

  beforeEach ->
    @pageView = new SpinalWiki.Views.Page
  
  it 'should be instantiable', ->
    expect(@pageView).not.toBeNull
