describe 'SpinalWiki.Views.AppView', ->
  it 'should be defined', ->
    expect(SpinalWiki.Views.AppView).toBeDefined()

  it 'should be instantiable', ->
    appView = new SpinalWiki.Views.AppView
    expect(appView).not.toBeNull()

  beforeEach ->
    @wiki = new SpinalWiki.Collections.Wiki 
    @wiki.create {id:12, title:'Test', body:'This is only a test.', parsedBody:'<p>This is only a test.</p>'}
    @appView = new SpinalWiki.Views.AppView { collection: @wiki }
    @page = new SpinalWiki.Views.Page { model: @wiki.get(12) }

  describe '#showPage', ->
    beforeEach ->
      @appView.showPage 'Test'

    it 'should render the page into an instance variable', ->
      expect(@appView.page.model.get('title')).toEqual @page.model.get('title')

    it 'should attach page view to the AppView\'s div', ->
      pageTitle = $(@appView.el).find('h1')
      expect(pageTitle.text()).toEqual 'Test'

    it 'should open with the editor if the title is not in the wiki', ->
      @appView.removePage()
      @appView.showPage "Test 12"
      expect($(@appView.el).find('div').attr('class')).toEqual 'editing'

  describe '#removePage', ->
    beforeEach ->
      @appView.showPage "Test"
      @appView.removePage()

    it 'should set the page instance variable to NULL', ->
      expect(@appView.page).toBeNull()

    it 'should remove the page view from the AppView', ->
      pageTitle = $(@appView.el).find('h1')
      expect(pageTitle.text()).toEqual ''


      

