module ApplicationHelper
  def remove_child_link(name)
    content_tag(:div,"<span>#{name}</span>".html_safe,
      :class => "remove_child")
  end

  def add_child_link(name, association, target)
    content_tag(:button,"<span>#{name}</span>".html_safe,
      :class => "add_child",
      :"data-association" => association,
      :target => target)
  end

  def new_fields_template(f,association,options={})
    options[:object] ||= f.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= association.to_s.singularize+"_fields"
    options[:template] ||= association.to_s+"_fields"
    options[:f] ||= :f

    tmpl = content_tag(:div,:id =>"#{options[:template]}") do
    tmpl = f.fields_for(association,options[:object], :child_index => "new_#{association}") do |b|
          render(:partial=>options[:partial],:locals =>{:f => b})
     end
    end
    tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, ' '
    return "<script> var #{options[:template]} = '#{tmpl.to_s}' </script>".html_safe
  end
end
