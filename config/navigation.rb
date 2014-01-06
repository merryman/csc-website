require 'bootstrap_topbar_list'
# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  navigation.renderer = SimpleNavigationRenderers::Bootstrap3

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  #  navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #
    primary.item :about_us, 'About Us', '/'

    # Add an item which has a sub navigation (same params, but with block)
    primary.item :grantees, 'Grantees', url_for(:action => 'criteria', :controller => 'grantees') do |sub_nav|
      # Add an item to the sub navigation (same params again)
      sub_nav.item :training, 'Grant Training', url_for(:action => 'training', :controller => 'grantees')
      sub_nav.item :proposal, 'Submitting Proposals', url_for(:action => 'proposal', :controller => 'grantees')
      sub_nav.item :criteria, 'Funding Criteria', url_for(:action => 'criteria', :controller => 'grantees')
    end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    primary.item :members, 'Members', url_for(:action => 'index', :controller => 'voting_members')
    primary.item :transparency, 'Transparency', url_for(:action => 'constitution', :controller => 'transparency') do |sub_nav|
      sub_nav.item :agendas, 'Agendas', url_for(:action => 'agendas', :controller => 'transparency')
      sub_nav.item :minutes, 'Minutes', url_for(:action => 'minutes', :controller => 'transparency')
      sub_nav.item :budgets, 'Budgets', url_for(:action => 'budgets', :controller => 'transparency')
      sub_nav.item :constitution, 'Constitution', url_for(:action => 'constitution', :controller => 'transparency')
      sub_nav.item :history, 'Historical Allocations', url_for(:action => 'history', :controller => 'transparency')
    end
    
    primary.item :resources, 'Resources', url_for(:action => 'index', :controller => 'resources') do |sub_nav|
      sub_nav.item :blueprint, 'Blueprint for a Sustainable Campus', url_for(:action => 'blueprint', :controller => 'resources')
      sub_nav.item :links, 'Links', url_for(:action => 'links', :controller => 'resources')
    end
    
    primary.item :join, 'Why Join?', url_for(:action => 'join', :controller => 'application')
    primary.item :contact, 'Contact', 'mailto:csc@ucsc.edu'

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
