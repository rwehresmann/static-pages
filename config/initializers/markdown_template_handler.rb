class MarkdownTemplateHandler
  def call(template, source)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

    # Not working as expected. More infos in https://stackoverflow.com/questions/59488568/erb-isnt-interpreting-variables-correctly
    # compiled_source = erb.call(template, source)

    markdown.render(source).inspect.html_safe
  end

  private

  def erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end
end

ActionView::Template.register_template_handler(:md, MarkdownTemplateHandler.new)