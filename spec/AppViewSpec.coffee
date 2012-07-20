describe 'SpinalWiki.Views.AppView', ->
  it 'should be defined', ->
    expect(SpinalWiki.Views.AppView).toBeDefined()

  it 'should be instantiable', ->
    appView = new SpinalWiki.Views.AppView
    expect(appView).not.toBeNull()

  beforeEach ->
    @wiki = new SpinalWiki.Collections.Wiki [{id:12, title:'Test', body:'This is only a test.'}]
    @appView = new SpinalWiki.Views.AppView { collection: @wiki }
    @page = new SpinalWiki.Views.Page { model: @wiki.get(12) }

  describe '#showPage', ->
    beforeEach ->
      @appView.showPage 12

    it 'should render the page into an instance variable', ->
      expect(@appView.page.model.get('title')).toEqual @page.model.get('title')

    it 'should attach page view to the AppView\'s div', ->
      pageTitle = $(@appView.el).find('h1')
      expect(pageTitle.text()).toEqual 'Test'

  describe '#removePage', ->
    beforeEach ->
      @appView.showPage 12
      @appView.removePage()

    it 'should set the page instance variable to NULL', ->
      expect(@appView.page).toBeNull()

    it 'should remove the page view from the AppView', ->
      pageTitle = $(@appView.el).find('h1')
      expect(pageTitle.text()).toEqual ''


      

