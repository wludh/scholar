#require work and author name to be passed
def make_names(name_string_data)
  names = name_string_data.first(3).collect do |datum|
    name, id = NameString.parse_solr_data(datum)
    #This line keeps the whole name --> h("#{name.gsub(",", ", ")}")
    h("#{name.split(",")[0]}")
  end
  return names.join("; ")
end

xml.item do
  xml.title make_names(work['authors_data']) + " - " + work['title'][0,40] + "..."

  xml.description {
    xml.cdata!(work['type'])
    xml.cdata!(render(subclass_partial_for(work) + ".html.haml", :work => work))
    xml.cdata!(work['abstract']) if work['abstract']
  }

  xml.guid work_path(:only_path => false, :id => work['id'].split("-")[1], :script_name => "/scholar")
  xml.link work_path(:only_path => false, :id => work['id'].split("-")[1], :script_name => "/scholar")

  xml.author h(author_name)
end
