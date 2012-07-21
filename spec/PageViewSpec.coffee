describe 'SpinalWiki.Views.Page', ->
  it 'should be defined', ->
    expect(SpinalWiki.Views.Page).toBeDefined

  beforeEach ->
    @wiki = new SpinalWiki.Collections.Wiki [{ id: 12, title: "Test", body: "This is only a test", parsedBody: "<p>This is only a test</p>"}]
    @pageView = new SpinalWiki.Views.Page { model: @wiki.get(12) }
  
  it 'should be instantiable', ->
    expect(@pageView).not.toBeNull

  describe '#render', ->
    beforeEach ->
      @pageView.render()

    it 'should have the model\'s title in the h1 tag', ->
      title = $(@pageView.el).find('h1')
      expect(title.text()).toEqual "Test"

    it 'should have the model\'s body in the p tag', ->
      body = $(@pageView.el).find('p')
      expect(body.text()).toEqual "This is only a test"

  describe '#edit', ->
    it 'should add the class editing', ->
      @pageView.render()
      @pageView.edit()
      expect($(@pageView.el).attr('class')).toEqual 'editing'

  describe '#close', ->
    beforeEach ->
      @pageView.render()
      @pageView.edit()
      @pageView.input.val('test')
      @pageView.close()

    it 'should update the model from captured text', ->
      expect(@pageView.model.get('body')).toEqual 'test'

    it 'should remove the editing class', ->
      expect($(@pageView.el).attr('class')).not.toEqual 'editing'

  describe '#saveText', ->
    beforeEach ->
      @pageView.render()
      @pageView.edit()
      @pageView.input.val('test')
      @pageView.saveText()

    it 'should updat the model from captured text', ->
      expect(@pageView.model.get('body')).toEqual 'test'
