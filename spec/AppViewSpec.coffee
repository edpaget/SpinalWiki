describe 'SpinalWiki.Views.AppView', ->
  it 'should be defined', ->
    expect(SpinalWiki.Views.AppView).toBeDefined

  it 'should be instantiable', ->
    appView = new SpinalWiki.Views.AppView
    expect(appView).not.toBeNull