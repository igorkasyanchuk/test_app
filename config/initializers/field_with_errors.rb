ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /^<label/ || html_tag =~ /type="hidden"/
    # Leave labels and hidden inputs untouched
    html_tag.html_safe
  else
    # Check if 'class' attribute already exists
    class_attribute_exists = html_tag =~ /class=['"]/
    if class_attribute_exists
      # Add 'error' class within existing class attribute
      html_tag.sub(/(class=['"])/, '\1is-invalid ').html_safe
    else
      # Add 'class' attribute if it does not exist
      html_tag.sub(/<(\w+)(.+?>)/, '<\1 class="is-invalid" \2').html_safe
    end
  end
end
