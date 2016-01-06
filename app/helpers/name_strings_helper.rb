module NameStringsHelper
  def person_image(person)
    image_tag(person.image_url, :class => 'person-image', 
              :alt => person.display_name, :title => person.display_name)
  end
end
