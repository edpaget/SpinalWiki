describe 'SpinalWiki.Routers.Router', ->
  beforeEach ->
    @routes = new SpinalWiki.Routers.Router
    @router = @routes, pushStateSpy

    describe 'index', ->
      it 'should have an index route', ->
        expect(@router.routes['']).toEqual 'index'

      it 'should trigger the index function', ->
        index = spyOn(@router, 'index').andCallThrough()
        pushStateSpy = spyOn(window.history, 'pushState').andCallFake (date, title, url) ->
          expect(url).toEqual 'page/0'
          @router.index()
        @router.navigate ''
        expect(pushStateSpy).toHaveBeenCalled()
        expect(index).toHaveBeenCalled()

    describe 'page', ->
      it 'should have a page route', ->
        expect(@router.routes['page/:id']).toEqual 'page'

      it 'should trigger the page function', ->
        page = spyOn(@router, 'page').andCallTrhough()
        pushStateSpy = spyOn(window.history, 'pushState').anddCallFake (date, title, url) ->
          expect(url).toEqual 'page/10'
          @router.page()
        @router.navigate 'page/10'
        expect(pushStateSpy).toHaveBeenCalled()
        expect(page).toHaveBeenCalled()